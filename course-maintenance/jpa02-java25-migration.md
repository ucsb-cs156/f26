# JPA02 Java 25 / Spring Boot 3.5 Migration Handoff

This file is maintenance context for future assignment updates. Like
`jpa00-java25-migration.md`, it lives in the `f26` repository under
`course-maintenance/`, which `_config.yml` excludes from the Jekyll site, so it
is not published as a course page. Read `jpa00-java25-migration.md` first; this
file only records what was different or new for JPA02.

## Scope of the JPA02 update (September 2026)

JPA02 was aligned around the following toolchain:

- Java `25.0.4`, SDKMAN distribution `25.0.4-tem`
- Maven `3.9.16`, the `maven_version` in `f26/_config.yml` (JPA01 pinned
  `3.9.14` in its wrapper and autograder a few days earlier; the site config
  moved on, so JPA02 follows the site config)
- Spring Boot `3.5.16` (latest 3.5.x; Spring Boot 4.x was considered and
  rejected for this quarter because its test starters are restructured and
  JPA01/JPA03/team projects are on 3.x)
- JaCoCo `0.8.15`, PIT `1.30.0` with `pitest-junit5-plugin` `1.2.3`,
  Surefire `3.5.6`. With the old JaCoCo 0.8.12 on Java 25, `mvn test`
  appears to pass but the agent logs
  `Unsupported class file major version 69` and coverage is wrong.

New technology surface compared with JPA00/JPA01: JaCoCo `check` rules and
the PIT `mutationThreshold` (both 100%) in the starter POM and in CI, and
autograder scripts that run `pitest:mutationCoverage` and `jacoco ... verify`
against the student submission.

## The four surfaces for JPA02

1. **Starter code:** `ucsb-cs156-f26/STARTER-jpa02`
   - `pom.xml` (parent version, `java.version`, JaCoCo, PIT, Surefire)
   - `.github/workflows/maven.yml`, `pitest.yml` (JDK 25, action versions)
   - `system.properties`, `Dockerfile` (Dokku uses the Dockerfile, so the base
     image `bellsoft/liberica-openjdk-alpine:25` matters for deployment)
   - `.java-version`, `.sdkmanrc`, `mvnw`, `mvnw.cmd`,
     `.mvn/wrapper/maven-wrapper.properties` (copied from STARTER-jpa01, Maven
     version bumped)
   - `README.md` (SDKMAN section, quarter links, jar name)
   - `Developer.java`, `DeveloperTest.java`: the `s26-xx` team placeholder and
     `bit.ly/cs156-s26-teams` links must match the `f26-xx` / `cs156-f26-teams`
     text in `lab/jpa02.md`
2. **Autograder:** `ucsb-cs156/jpa02-autograder`
   - `autograder/setup.sh`, `autograder/run_autograder` (SDKMAN, as in jpa01)
   - `.github/workflows/*.yaml` (Java 25, `if:` expression fix, action bumps)
   - `starter_code/` mirror (rsync from the starter, excluding `.git`,
     `target`, `.gitkeep`)
   - `autograder/tools/roster.csv` (see below)
   - `.github/README.md`
3. **Assignment instructions:** `f26/lab/jpa02.md`
   - Java-version reminder block before the first `mvn` command, using
     `site.jdk_distribution`, `site.java_version`, `site.maven_version`
   - Sample output literals: `jacoco:0.8.x`, `JShell -- Version x`
   - Coverage and mutant numbers quoted in prose (see "Numbers" below)
4. **Shared docs:** `ucsb-cs156/ucsb-cs156.github.io`
   - `topics/dokku/deploying_simple_app.md` sample output (`FROM ...:25`,
     `ucsb-cs156-f26` URLs). `info/software.md`, the macOS/WSL pages and
     `_config.yml` were already on 25.0.4 from the JPA00/JPA01 waves.

## Roster

`autograder/tools/roster.csv` must be replaced every quarter. The expected
format is the 13-column export
(`COURSEID,EMAIL,FIRSTNAME,GITHUBID,GITHUBLOGIN,ID,LASTNAME,ORGSTATUS,ROSTERSTATUS,SECTION,STUDENTID,TEAMS,USERID`);
the scripts use `EMAIL`, `FIRSTNAME`, `GITHUBLOGIN` and `TEAMS`. The S26 file
had extra `*-staff` rows so staff could submit and pass the team-member check;
the F26 export did not, so add staff rows by hand if staff want to test.

## Numbers quoted in `lab/jpa02.md`

Verified on the updated starter under Java 25 (macOS, Temurin 25.0.4):

- `mvn test`: 7 tests
- JaCoCo package level: 86% instructions, 90% lines, 50% branches (the old
  text and screenshot said 56% branches under Java 21 / JaCoCo 0.8.12)
- PIT: 25 mutants, 11 killed, surviving `Developer.java` mutants on lines
  44-49. Inside the Linux autograder image and on GitHub Actions PIT reported
  24 mutants / 10 killed (42%), so students may see slightly different counts
  than the page.

Screenshots in the page are GitHub `user-attachments` images and were not
regenerated.

## Validation done for this wave

1. `./mvnw test`, `./mvnw test jacoco:report verify`,
   `./mvnw test pitest:mutationCoverage` on the starter under
   `25.0.4-tem` / Maven 3.9.16 (the last two fail only on the intended 100%
   thresholds)
2. STARTER-jpa02 CI on the PR branch: Java 25 downloaded, tests pass, both
   workflows red only because of the thresholds
3. Autograder Docker image built from `gradescope/autograder-base`; inside it
   `java -version` = 25.0.4, `mvn --version` = 3.9.16, and compile / package /
   PIT / JaCoCo all run on the new starter
4. `bundle exec jekyll build` for `f26`; rendered `lab/jpa02.html` has no
   unresolved Liquid and shows `sdk use java 25.0.4-tem` / `sdk use maven 3.9.16`
5. Not done: an end-to-end Gradescope run, Dokku deployment of the new
   starter, and the live deployment checks in the autograder

## JPA02 PRs and issues from this wave

- Tracking issue: https://github.com/ucsb-cs156/jpa02-autograder/issues/4
- Starter issue: https://github.com/ucsb-cs156-f26/STARTER-jpa02/issues/2
- Starter code: https://github.com/ucsb-cs156-f26/STARTER-jpa02/pull/3
- Autograder: https://github.com/ucsb-cs156/jpa02-autograder/pull/5
- f26 instructions (this file): https://github.com/ucsb-cs156/f26/pull/8
- Shared documentation: https://github.com/ucsb-cs156/ucsb-cs156.github.io/pull/14

After merging the autograder PR, tag a release so `github-release.yaml`
produces the zip, and upload it to the F26 jpa02 Gradescope assignment.

For JPA03, repeat this pattern. JPA03 (`STARTER-jpa03`) is currently on
Spring Boot 3.4.3 / Java 21 / JaCoCo 0.8.10 / PIT 1.17.0 and adds a database
and OAuth surface, so also audit `application.properties`, any `.env`
examples, and the Dokku config commands in `lab/jpa03.md`.
