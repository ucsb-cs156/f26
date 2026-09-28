# JPA03 Java 25 / Spring Boot 3.5 Migration Handoff

This file is maintenance context for future assignment updates. Like the
JPA00 and JPA02 handoffs, it lives in the `f26` repository under
`course-maintenance/`, which `_config.yml` excludes from the Jekyll site, so it
is not published as a course page. Read `jpa00-java25-migration.md` and
`jpa02-java25-migration.md` first; this file only records what was different
or new for JPA03.

## Scope of the JPA03 update (September 2026)

JPA03 was aligned around the same toolchain as JPA02:

- Java `25.0.4`, SDKMAN distribution `25.0.4-tem`
- Maven `3.9.16` (`maven_version` in `f26/_config.yml`)
- Spring Boot `3.5.16` (from 3.4.3)
- JaCoCo `0.8.15` (from 0.8.10), Surefire `3.5.6` (from 3.5.1)
- PIT `1.22.1` (from 1.17.0) with `pitest-junit5-plugin` `1.2.3`. **Not**
  1.30.0 as in JPA02: JPA03 uses `historyInputFile`/`historyOutputFile` for
  the incremental pitest workflow (`13-backend-incremental-pitest.yml`), and
  PIT 1.23.0+ moved history into a separate plugin and fails with
  `no history plugin has been installed`. proj-courses pinned 1.22.1 for the
  same reason; the pom has a comment explaining this.
- springdoc `2.8.17` (from 2.5.0; 3.x is for Spring Boot 4) and
  `spring-cloud-gateway-mvc` `4.3.5` (from 4.2.0; Spring Cloud 2025.0 matches
  Boot 3.5). Playwright `1.41.0`, wiremock `2.35.1`, spring-dotenv `2.4.1`
  and `jakarta.validation-api` `3.1.0` were left alone; they work on Java 25.

New technology surface compared with JPA02:

- **Lombok / annotation processing.** JDK 23+ no longer runs annotation
  processors found on the classpath by default, so after the Java 25 bump the
  build failed with `cannot find symbol: variable log` / `method builder()`
  everywhere Lombok is used. The fix (same as proj-courses) is a
  `maven-compiler-plugin` configuration with `<compilerArgument>-proc:full</compilerArgument>`.
  JPA02 did not hit this because it does not use Lombok.
- **Dockerfile used by Dokku.** The old image was `ubuntu:22.04` +
  `apt-get install openjdk-21-jdk maven`; apt on 22.04 has no Java 25. It is
  now a two-stage build: `maven:3.9.16-eclipse-temurin-25-noble` builds the
  jar, `eclipse-temurin:25-jre-noble` runs it. Both are Ubuntu based on
  purpose: `startup.sh` parses `DATABASE_URL` with GNU `cut --delimiter=`,
  which BusyBox `cut` on Alpine images does not accept. A `.dockerignore`
  (`target`, `.env`) keeps the local database and secrets out of the image.
- **Database, OAuth and actuator.** `application.properties` needed no
  changes for Boot 3.5 (`management.endpoints.access.*` is the Boot 3.4+
  form). The autograder depends on `/actuator/health/db`,
  `/actuator/health/signIn` and `/actuator/health/email` (RSA-encrypted
  `ADMIN_EMAILS`, public key in `application.properties`, private key in the
  autograder), so keep those endpoints and the `app.public_key` property when
  touching the starter.
- **CI Java selection.** The starter workflows used
  `distribution: semeru` + `java-version-file: ./.java-version`. They now use
  `actions/setup-java@v5` with `java-version-file: ./.sdkmanrc` and
  `distribution: temurin`; setup-java v5 parses `java=25.0.4-tem` from
  `.sdkmanrc` (and would infer temurin from `-tem`), so `.sdkmanrc` is the
  single source of truth for local SDKMAN use and CI. `.java-version` still
  says `25.0.4-tem` for consistency with JPA00/JPA02, but `setup-java` cannot
  parse that form, so do not point `java-version-file` back at it.

## The four surfaces for JPA03

1. **Starter code:** `ucsb-cs156-f26/STARTER-jpa03`
   - `pom.xml` (parent, `java.version`, compiler `-proc:full`, JaCoCo, PIT,
     Surefire, springdoc, gateway-mvc)
   - `.java-version`, `.sdkmanrc`, `system.properties`, `mvnw`, `mvnw.cmd`,
     `.mvn/wrapper/maven-wrapper.properties` (wrapper 3.3.4 copied from
     STARTER-jpa02, Maven 3.9.16)
   - `Dockerfile`, `.dockerignore`
   - `.github/workflows/*.yml` (Java from `.sdkmanrc`, `checkout@v5`,
     `setup-java@v5`, `upload-artifact@v5`)
   - `README.md` (SDKMAN / Java 25 section, live example app
     `https://jpa03-staff.dokku-00.cs.ucsb.edu`, removed the stale
     "Storybook for the frontend" line: jpa03 has no frontend)
   - `docs/dokku.md`, `docs/oauth.md` (`dokku git:sync` URL now
     `ucsb-cs156-f26`, list numbering)
   - Not changed: `.github/modernize/java-upgrade/hooks/scripts/recordToolUse.ps1`,
     a leftover from a GitHub Copilot "app modernization" run. It is harmless
     but gets copied into every student repo; consider deleting it.
2. **Autograder:** `ucsb-cs156/jpa03-autograder`
   - `autograder/setup.sh` (SDKMAN Java 25.0.4-tem + Maven 3.9.16, as in
     jpa02; also installs `openssl` explicitly since
     `correctly_set_admin_emails.sh` decrypts with it)
   - `autograder/run_autograder` (SDKMAN `JAVA_HOME`/`PATH`,
     `GITHUB_ORG="ucsb-cs156-f26"`)
   - `.github/workflows/autograder-meta-tests.yaml` (Java 25). The workflow
     is still disabled and its `meta_test.py` command is a jpa00 leftover;
     the jpa03 checks need a Gradescope `submission_metadata.json` and a live
     Dokku app, so there is no local meta test.
   - `autograder/test_student_main/pom.xml` (`java.version` 25; this Maven
     project is not used by `run_autograder` or the release zip, which only
     packages `test_student_deployment`, `test_student_readme` and
     `test_student_github`)
   - `starter_code/` mirror (rsync from the starter, excluding `.git`,
     `target`, `.gitkeep`; the old mirror still had a `frontend/` directory
     and lacked the actuator public key)
   - `autograder/tools/roster.csv` (F26 roster, copied from jpa02-autograder;
     no `*-staff` rows, see the JPA02 handoff)
   - `.github/README.md`
   - **Still to do by staff:** `staff_emails` at the top of
     `autograder/tools/verify_admin_emails.py` is the S26 list. The
     `staff_emails` front-matter value in `lab/jpa03.md` is also unverified.
     Update both once the F26 staff list is final.
3. **Assignment instructions:** `f26/lab/jpa03.md`
   - Java-version reminder block before the first `mvn` command (same block
     as jpa02, using `site.jdk_distribution`, `site.java_version`,
     `site.maven_version` and the page's `software_install_url`)
   - Fixed `{{page.office_hours_pages}}` (undefined) to
     `{{page.office_hours_page}}` and renumbered Steps 6/7 to 5/6 (there was
     no Step 5)
4. **Shared docs:** `ucsb-cs156/ucsb-cs156.github.io`
   - Audited every page linked from the starter README/docs and from
     `lab/jpa03.md`: `topics/dokku/deploying_an_app.md`,
     `postgres_database.md`, `getting_started.md`, `enabling_https.md`,
     `logging_in.md`, `deploy_app_from_private_repo.md`,
     `topics/oauth/*`. None contain Java/Maven version literals, so no
     content changes were needed. The staff `autograders` page now lists the
     JPA02 and JPA03 waves next to the JPA00 example.

## Validation done for this wave

Starter, under `25.0.4-tem` / Maven 3.9.16 via `./mvnw` (macOS arm64):

1. `./mvnw -B test`: 55 tests pass
2. `./mvnw -B test jacoco:report verify`: passes the 100% coverage rules
3. `./mvnw -B pitest:mutationCoverage -DmutationThreshold=100`: passes
4. `PRODUCTION=true ./mvnw -B -DskipTests clean dependency:list install`
   (workflow 40): passes
5. `INTEGRATION=true ./mvnw -B test-compile failsafe:integration-test failsafe:verify`
   (workflow 11, Playwright): passes
6. `docker build .` of the new Dockerfile succeeds and the image starts on
   Java 25 (this is what Dokku runs)

Autograder: Docker image built from `gradescope/autograder-base` with the new
`setup.sh`; inside it `java -version` = 25.0.4 (Temurin), `mvn --version` =
3.9.16, and `jq`, `openssl`, `base64`, `dos2unix` and the Python requirements
are present.

f26: `bundle exec jekyll build`; rendered `lab/jpa03.html` has no unresolved
Liquid and shows `sdk use java 25.0.4-tem` / `sdk use maven 3.9.16`.

Not done: an end-to-end Gradescope run, re-deploying
`jpa03-staff.dokku-00.cs.ucsb.edu` from the updated starter (see the
Instructor Resources section of `lab/jpa03.md` for the `dokku git:sync`
command; do this before the lab is released so the example app and the
starter agree), and CI results on the PR branches (check before merging).

## JPA03 PRs and issues from this wave

- Starter issue: https://github.com/ucsb-cs156-f26/STARTER-jpa03/issues/1
- Starter code PR (master list for the wave): STARTER_PR_URL
- Autograder issue: https://github.com/ucsb-cs156/jpa03-autograder/issues/8
- Autograder PR: AUTOGRADER_PR_URL
- f26 issue: https://github.com/ucsb-cs156/f26/issues/9
- f26 PR (this file): F26_PR_URL
- Shared docs issue: https://github.com/ucsb-cs156/ucsb-cs156.github.io/issues/15
- Shared docs PR: DOCS_PR_URL

After merging the autograder PR, tag a release so `github-release.yaml`
produces `jpa03-Autograder-<tag>.zip`, and upload it to the F26 jpa03
Gradescope assignment.

For JPA04 / team01, repeat this pattern. Those starters add a React frontend
(Node/npm via `frontend-maven-plugin`, Storybook, Stryker, Chromatic), so also
audit `frontend/package.json` engines, `.nvmrc`, `node_lts` / `npm_lts` in
`f26/_config.yml`, the frontend workflows, and the Dockerfile's Node install.
