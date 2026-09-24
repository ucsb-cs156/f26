# JPA00 Java 25 Migration Handoff

This file is maintenance context for future assignment updates. It is stored in
the `f26` repository but the `course-maintenance/` directory is excluded from
the Jekyll site by `_config.yml`, so this document is not published as a course
page. Keep it in Git so Claude and future maintainers can find the decisions,
cross-repository dependencies, and validation steps from the JPA00 update.

## Scope of the JPA00 update

The JPA00 setup was aligned around the following toolchain:

- Java `25.0.4`, using the SDKMAN distribution `25.0.4-tem`
- Maven `3.9.14` or newer
- SDKMAN as the recommended way to install and select Java
- A Java 25 CI environment for the autograder

The important lesson is that changing the Java version in one place is not
enough. The implementation, autograder, assignment page, and installation
guides must agree, and the actual shell or CI environment must use the same
version as the project configuration.

## Four things to align for every assignment

For each assignment `xxx`, review and update all four of these surfaces as one
consolidated wave:

1. **Starter code:**
   `https://github.com/ucsb-cs156-f26/STARTER_xxx`

   Check the Maven or build configuration, Java version files such as
   `.java-version` and `.sdkmanrc`, Maven wrapper properties, README setup
   instructions, and any package or directory layout assumed by tests.

2. **Autograder code:**
   `https://github.com/ucsb-cs156/autograder_xxx`

   Check the CI workflows, setup scripts, Maven wrapper properties, test
   project POMs, fixture paths, and meta-test commands. Verify that CI selects
   the same Java version required by the POM. Be especially careful when
   sourcing SDKMAN under `set -u`; SDKMAN initialization may reference unset
   variables, so the initialization step needs an appropriate temporary guard.

3. **Assignment-specific installation instructions in f26:**
   `f26/lab/xxx.md`

   Check the assignment instructions and every setup command they contain.
   For JPA00, this is `f26/lab/jpa00.md`. Keep the assignment's commands
   consistent with the course-level values in `f26/_config.yml`, including the
   `site.jdk_distribution` spelling with an underscore.

4. **Shared installation instructions in the main documentation repository:**
   `https://github.com/ucsb-cs156/ucsb-cs156.github.io`

   Check the course-wide installation page in
   `ucsb-cs156.github.io/info/software.md` and the relevant platform pages.
   For JPA00, the WSL page is
   `ucsb-cs156.github.io/topics/windows/windows_wsl.md`; audit the macOS page
   and the high-confidence portions of the WSL page when the change affects
   platform setup. The shared docs repository has its own `_config.yml`, which
   is the source of truth for values used by its Liquid templates.

## JPA00 files and repositories changed

The JPA00 work covered these locations:

- Starter repository:
  `ucsb-cs156-f26/STARTER-jpa00`
  - `.java-version`
  - `.sdkmanrc`
  - `.mvn/wrapper/maven-wrapper.properties`
  - `README.md`
  - Java 25 compiler configuration in `pom.xml`
- Autograder repository:
  `ucsb-cs156/jpa00-autograder`
  - `autograder/setup.sh`
  - `.github/workflows/autograder-meta-tests.yaml`
  - Maven wrapper properties at the repository root, in
    `autograder/test_student_main`, and in `starter_code`
  - Java and Maven configuration in the autograder and starter POMs
  - Meta-test paths for the starter source and test project
- Fall 2026 course repository:
  `ucsb-cs156/f26`
  - `f26/_config.yml`
  - `f26/info/software.md`
  - `f26/lab/jpa00.md`
- Shared documentation repository:
  `ucsb-cs156/ucsb-cs156.github.io`
  - `_config.yml`, including `jdk_distribution` and `java_version`
  - `info/software.md`
  - `topics/windows/windows_wsl.md`

## Configuration and naming lessons

- Use `jdk_distribution` with an underscore in `_config.yml` and Liquid
  references. Do not write `site.jdk-distribution`.
- Keep the JDK distribution and the human-readable Java version separate. For
  example, `jdk_distribution: "25.0.4-tem"` and
  `java_version: "25.0.4"`.
- Prefer `{{site.jdk_distribution}}` and `{{site.java_version}}` in shared
  documentation instead of repeating version literals in commands and sample
  output.
- A page-level value such as `page.maven_version` can be useful for a platform
  page, but it should agree with the course and starter requirements.
- Check both rendered examples and commands. A stale sample such as Java 21 in
  Maven output can mislead students even when the install command is correct.

## Validation checklist for future waves

Before opening or merging an assignment wave:

1. Search all four repositories for old Java, Maven, Node, SDKMAN, and path
   references. Search both `jdk_distribution` and the incorrect
   `jdk-distribution` spelling.
2. Confirm that each POM's compiler release matches the JDK selected by local
   setup instructions and CI.
3. Run the starter project's Maven wrapper under the intended JDK.
4. Run the autograder's exact CI meta-test command locally, using the same
   relative paths from the repository root.
5. Run the documentation site's build and inspect the rendered or generated
   output for unresolved Liquid variables and stale version examples.
6. Check every repository's PR branch and CI status before merging. Merge the
   four JPA00 PRs only after the starter code, autograder, f26 instructions,
   and shared installation instructions have all been reviewed together.

## JPA00 PRs from this wave

These are the PRs created for the JPA00 update. They are recorded here so the
history of this maintenance wave remains easy to follow:

- f26: https://github.com/ucsb-cs156/f26/pull/2
- Starter code: https://github.com/ucsb-cs156-f26/STARTER-jpa00/pull/3
- Autograder: https://github.com/ucsb-cs156/jpa00-autograder/pull/3
- Shared documentation: https://github.com/ucsb-cs156/ucsb-cs156.github.io/pull/11

For the next assignment, copy this four-repository review pattern, replace the
assignment-specific paths, and account for the additional technology surface
introduced by that assignment, such as Spring Boot, Dokku, or frontend
tooling.