# team01 Java 25 / F26 Alignment Handoff

This file is maintenance context for future assignment updates. Like the
JPA00, JPA02 and JPA03 handoffs, it lives in the `f26` repository under
`course-maintenance/`, which `_config.yml` excludes from the Jekyll site, so it
is not published as a course page. Read `jpa03-java25-migration.md` first; this
file only records what was different or new for team01.

## Scope of the team01 update (September 2026)

team01 was different from the earlier waves in one important way: the starter's
`pom.xml` had *already* been moved to Java 25 / Spring Boot 3.5.16 / JaCoCo
0.8.15 / PIT 1.30.0 (STARTER-team01#2, merged 2026-09-26, CI green) before the
four-surface audit ran. The audit therefore left the pom alone and found the
rest of the assignment out of step: SDKMAN files, CI vendor, the Dokku
Dockerfile, every doc file, the quarter literals, the autograder toolchain and
data, and the lab page.

Toolchain, same as JPA02/JPA03:

- Java `25.0.4`, SDKMAN distribution `25.0.4-tem`
- Maven `3.9.16` (`maven_version` in `f26/_config.yml`), Maven Wrapper 3.3.4
- Spring Boot `3.5.16`, JaCoCo `0.8.15`, Surefire `3.6.0`
- PIT `1.30.0` **with** `org.pitest:pitest-history-plugin:0.0.1` declared as a
  plugin dependency. This keeps `historyInputFile`/`historyOutputFile` working
  for `13-backend-incremental-pitest.yml` on current PIT, so it is the
  alternative to pinning PIT `1.22.1` as JPA03 did. Both approaches are
  verified; pick one per starter and say which in the pom comment.
- `maven-compiler-plugin` uses `<proc>full</proc>` (JPA03 uses
  `<compilerArgument>-proc:full</compilerArgument>`); both enable Lombok on
  JDK 23+.

What was new compared with JPA03:

- **Shared reusable workflows.** Workflows 12, 13, 14 and 18 in the starter
  call `ucsb-cs156/workflows`, which select Java with `actions/setup-java` and
  `java-version-file: ./.java-version` (default distribution `temurin`).
  `setup-java` cannot parse `25.0.4-tem`, so for team01 (and team02 and the
  legacy projects, which use the same workflows) **`.java-version` must stay
  `25`**. `.sdkmanrc` carries the SDKMAN identifier for `sdk env`. The
  starter's own workflows also read `.java-version` and were switched from
  `distribution: semeru` to `temurin` so that CI uses one vendor.
- **Dockerfile.** The old `ubuntu:22.04` + `apt-get install openjdk-25-jdk
  maven` image *does* build on amd64 (jammy now ships OpenJDK 25; verified
  with `docker build --platform linux/amd64`, giving Java 25.0.4.1 and Maven
  3.6.3), but it hard-codes `JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64`,
  so it fails on Apple Silicon, and it does not use the course Maven. It was
  replaced with the two-stage Temurin image from STARTER-jpa03 (jar name
  `team01-1.0.0.jar`). `.devcontainer.json` and `dev_environment` now target
  the `builder` stage, since the runtime stage is JRE-only.
- **Docs copied from team02.** `README.md`, `docs/versions.md`,
  `docs/github-pages.md`, `.env.SAMPLE` and `.github/copilot-instructions.md`
  all described a React frontend, Node, Storybook and Chromatic that team01
  does not have, plus Java 21 / Boot 3.4.3. Expect the same in STARTER-team02
  (there it is correct to have a frontend, but check the versions).
- **Java-based autograder.** Unlike jpa03 (shell checks only), the team01
  autograder copies the student's repo into `test_student_main`, injects
  `jgrade2` and `reflections` into the student's `pom.xml` with pom-cli, and
  runs Spring Boot tests with `failsafe -Dit.test=Autograder`. The JDK in
  `setup.sh` must therefore be at least the starter's Java version, or every
  submission fails to compile (`--release 25`). It was still installing Java
  21 from a PPA.

## The four surfaces for team01

1. **Starter code:** `ucsb-cs156-f26/STARTER-team01`
   - Added `.sdkmanrc`, `mvnw`, `mvnw.cmd`,
     `.mvn/wrapper/maven-wrapper.properties`, `.dockerignore`
   - `.github/workflows/*.yml` (`checkout@v5`, `setup-java@v5`,
     `upload-artifact@v5`, `download-artifact@v5`, temurin; `.java-version`
     kept as `25`, see above)
   - `Dockerfile`, `.devcontainer.json`, `dev_environment`
   - `README.md` (SDKMAN section, f26 links, removed frontend/team02 text),
     `docs/versions.md`, `docs/github-pages.md`, `.env.SAMPLE`,
     `.github/copilot-instructions.md`
   - `.github/workflows/99-team01.yml` (`ASN_LINK`, `SAMPLE_TEAM`,
     `STARTER_REPO_*` → f26), `82-kanban-slack-update.yml` (`START_DATE`
     2026-10-21, `END_DATE` 2026-11-04, from the lab page's assigned/due
     dates; adjust if they move), `application.properties` `app.sourceRepo`
   - Not changed: `pom.xml`, `system.properties` (`25`), `.mvn/jvm.config`
     (needed by google-java-format on JDK 16+), `lombok.config`
2. **Autograder:** `ucsb-cs156/team01-autograder`
   - `autograder/setup.sh` (SDKMAN Java 25.0.4-tem + Maven 3.9.16, `jq`,
     `openssl`, `dos2unix`, pom-cli), `autograder/run_autograder` (SDKMAN
     `JAVA_HOME`/`PATH`, `GITHUB_ORG="ucsb-cs156-f26"`)
   - `.github/workflows/autograder-meta-tests.yaml` (Java 25; still disabled,
     still the jpa00 `Hello.java` command)
   - `.github/README.md`, `autograder/tools/requirements.txt` (UTF-8)
   - `starter_code/` mirror (rsync from the starter, excluding `.git`,
     `target`); `running-example-copy/` (an F25 student repo on Java 21,
     unreferenced) was left alone pending a decision
   - **Still to do by staff:** `autograder/tools/roster.csv` (S26) and the
     `staff_emails` list at the top of `autograder/tools/verify_admin_emails.py`
     (S26). Both are data files that must be refreshed by hand each quarter;
     the jpa03 autograder already has the F26 versions. The lab page's
     `staff_emails` front matter (unused in the page body) is also stale.
3. **Assignment instructions:** `f26/lab/team01.md`
   - Java-version reminder block (same wording as jpa03) in "Getting started"
   - Fixed undefined `{{page.num}}`, `{{page.teams_link}}`,
     `{{page.demo_deployment}}`; two numbered lists; "team01, team01,
     team03"; "as you did in team01"; "five issues" → six (the personal dokku
     dev deployment issue was missing from the list); Instructor Resources
     `PRIVATE-team01` → `STARTER-team01`
   - **Not changed, needs a decision:** "There is no Gradescope autograder for
     team01; it will be graded manually." contradicts the existence of
     `ucsb-cs156/team01-autograder`. `_config.yml` still has
     `team01_project: "tbd"` for every team, and `_includes/team01_repos.md`
     hard-codes project numbers 4–19.
4. **Shared docs:** `ucsb-cs156/ucsb-cs156.github.io`
   - Audited every page linked from the lab page, the starter README/docs and
     `99-team01.yml` (`topics/dokku/*`, `topics/oauth/*`, `topics/liquibase/*`,
     `topics/pull_requests`, `topics/code_reviews`, `topics/github_actions`):
     no version literals or stale org names. Only the staff `autograders` page
     (team01 wave) and `topics/spring_react/future_work.md` (team01 autograder
     note) changed.

## Validation done for this wave

Starter, under `25.0.4-tem` / Maven 3.9.16 via `./mvnw` (macOS arm64):

1. `./mvnw -B test`: 77 tests pass
2. `./mvnw -B test jacoco:report verify`: "All coverage checks have been met"
3. `./mvnw -B pitest:mutationCoverage -DmutationThreshold=100`: passes
   (188/188 lines of mutated classes)
4. `PRODUCTION=true ./mvnw -B -DskipTests clean dependency:list install`
   (workflow 40): passes
5. `INTEGRATION=true ./mvnw -B test-compile failsafe:integration-test failsafe:verify`
   (workflow 11, Playwright): 3 tests pass
6. `docker build .` of the new Dockerfile succeeds; `java -version` in the
   image = Temurin 25.0.4.1
7. CI on the PR branch (all workflows, including the reusable ones)

Autograder: Docker image built from `gradescope/autograder-base` with the new
`setup.sh`; `java -version` = 25.0.4 (Temurin), `mvn --version` = 3.9.16;
`run_autograder` run inside the image against a zip of the updated starter
(see the autograder PR for the result).

f26: `bundle exec jekyll build`; rendered `lab/team01.html` has no unresolved
Liquid and shows `sdk use java 25.0.4-tem` / `sdk use maven 3.9.16`.

Not done: an end-to-end Gradescope run, re-deploying
`team01.dokku-00.cs.ucsb.edu` from the updated starter (Instructor Resources
in `lab/team01.md` has the `dokku git:sync` command), and creating the F26
team repos / Kanban boards.

## team01 PRs and issues from this wave

- Starter issue: https://github.com/ucsb-cs156-f26/STARTER-team01/issues/3
- Starter code PR (master list for the wave): https://github.com/ucsb-cs156-f26/STARTER-team01/pull/4
- Autograder issue: https://github.com/ucsb-cs156/team01-autograder/issues/10
- Autograder PR: https://github.com/ucsb-cs156/team01-autograder/pull/11
- f26 issue: https://github.com/ucsb-cs156/f26/issues/11
- f26 PR (this file): https://github.com/ucsb-cs156/f26/pull/12
- Shared docs issue: https://github.com/ucsb-cs156/ucsb-cs156.github.io/issues/17
- Shared docs PR: https://github.com/ucsb-cs156/ucsb-cs156.github.io/pull/18

For team02 and team03, repeat this pattern. Those starters add the React
frontend (Node/npm via `frontend-maven-plugin`, Storybook, Stryker, Chromatic,
workflows 30–36), so also audit `frontend/package.json` engines, `.nvmrc`,
`node_lts` / `npm_lts` in `f26/_config.yml`, the frontend workflows, and the
Dockerfile's Node install. Check `.java-version` stays `25` there too, since
they use the same reusable workflows.
