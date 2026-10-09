# team02 Node.js 24.21.0 Alignment Handoff

This file is maintenance context for future assignment updates. Like the
JPA00, JPA02, JPA03 and team01 handoffs, it lives in the `f26` repository
under `course-maintenance/`, which `_config.yml` excludes from the Jekyll
site, so it is not published as a course page. Read
`team01-java25-migration.md` first; this file only records what was done and
learned for the team02 Node.js bump.

## Scope of the team02 update (October 2026)

This wave was deliberately narrow: it moves the team02 starter from Node.js
`22.18.0` to `24.21.0` so that it matches `node_lts` in `f26/_config.yml`,
which is the version `info/software_macos.md` and `info/software_wsl.md` tell
students to install. Before this wave, a student who followed the course
setup instructions (`nvm use v24.21.0`) and then the team02 lab page
(`nvm use 22.18.0`) was told to use two different versions, and the starter's
own files disagreed with each other (`FrontendProxyController.java` said
`nvm use --lts` while everything else said `22.18.0`).

**Not in this wave:** the rest of the Java 25 / F26 alignment that was done
for JPA03 and team01. While this wave was in progress, STARTER-team02 PRs #1
and #2 (merged 2026-10-08) moved the starter's `pom.xml` to Java 25 / Spring
Boot 3.5.16, added the Maven wrapper and `.sdkmanrc`, and rewrote the
Dockerfile (`ubuntu:22.04` + apt `openjdk-25-jdk` + apt Maven, hard-coded
amd64 `JAVA_HOME`; see the team01 handoff for why that fails on Apple
Silicon). The Node branch was rebased on top of that. Still out of step after
this wave, exactly as the team01 audit found: `README.md` says `Java: 21`,
`.github/copilot-instructions.md` says Java 21 throughout, and the team02
autograder still installs Java 21 and has `GITHUB_ORG="ucsb-cs156-s26"` in
`run_autograder`. That audit still needs to be run for team02 following the
team01 pattern.

Toolchain for this wave:

- Node.js `24.21.0` (`node_lts: v24.21.0` in `f26/_config.yml`; npm 11.19.0
  comes bundled with it, matching `npm_lts`)
- `frontend-maven-plugin` 1.12.1 downloads this version itself during the
  `production` profile build, so the Maven build does not depend on `nvm`
- `actions/setup-node@v4` reads `frontend/package.json` `engines.node`
  (`node-version-file`) in the starter's own workflows (53, 55) and in the
  reusable `ucsb-cs156/workflows` frontend workflows (32–35), so bumping
  `engines` is what moves CI

## Where the Node version lives in a React starter

`docs/versions.md` in the starter now lists all of these; the earlier list
was missing items 2 and 6–9 and described the Dockerfile as if it had its
own Node setting.

1. `README.md` Versions section
2. `.nvmrc` at the repo root (new in this wave, so `nvm use` with no
   argument works at the root and in `frontend/`)
3. `frontend/package.json` `engines.node` (`^24.21.0`), and the mirrored
   entry at the top of `frontend/package-lock.json`. Running
   `npm install --package-lock-only` with npm 11.19 also dropped an optional
   peer `yaml` entry from the lockfile, which is unrelated churn; the lockfile
   `engines` line was edited by hand instead to keep the diff to the bump.
4. `pom.xml`: two `<nodeVersion>` entries for `frontend-maven-plugin` (one in
   the default build, one in the `production` profile). There is no
   `<npmVersion>`, so the npm bundled with that Node is used.
5. `Dockerfile` (Dokku deploy): **no longer has its own Node setting.** The
   pre-Java-25 Dockerfile installed Node with nvm (`ENV NODE_VERSION`); the
   Java 25 rewrite dropped that block and just runs
   `mvn -Pproduction ... clean package`, so the image gets whichever Node
   `pom.xml` names. `docs/versions.md` says so now. (The old nvm step was
   also verified on `ubuntu:22.04` amd64 before the rebase made it moot:
   nvm 0.40.1 installs 24.21.0 fine there.)
6. `NVM_USE` in `.github/workflows/99-team02.yml`,
   `91-create-one-off-issues.yml` and `92-create-issues-for-db-table.yml`.
   This text is pasted into every generated student issue, so a stale value
   here reaches every team.
7. `.github/copilot-instructions.md`
8. The "On localhost, open a second terminal window ..." message in
   `src/main/java/edu/ucsb/cs156/example/controllers/FrontendProxyController.java`
   (shown when the backend runs without the frontend). It had drifted to
   `nvm use --lts`, which is not wrong today but will silently diverge the
   next time the LTS line moves; it now names the pinned version like the
   rest of the starter.
9. `f26/lab/team02.md`: the lab page used a front-matter value
   `nvm_use: "<tt>nvm use 22.18.0</tt>"`. Front matter is not Liquid-processed,
   so `{{site.node_lts}}` cannot go there. The page now does
   `{% capture nvm_use %}<tt>nvm use {{site.node_lts}}</tt>{% endcapture %}`
   right after the `<style>` block and uses `{{nvm_use}}` (not
   `{{page.nvm_use}}`) in the three places. Use the same pattern for team03.

## The four surfaces for team02

1. **Starter code:** `ucsb-cs156-f26/STARTER-team02`: items 1–8 above, plus
   `docs/versions.md`.
2. **Autograder:** `ucsb-cs156/team02-autograder`: **no change needed for
   Node.** It only runs shell checks (README deployment link, HTTP 200 and
   admin emails on the deployment, GitHub homepage URL, workflow status,
   empty PR queue, GitHub Pages, results repo); it never installs Node or
   builds the frontend. Its `starter_code/` directory is an empty `.gitkeep`.
   See "Not in this wave" above for what it does need.
3. **Assignment instructions:** `f26/lab/team02.md` (item 9) and this file.
4. **Shared docs:** `ucsb-cs156/ucsb-cs156.github.io`: the only shared pages
   linked from the team02 lab page are
   `topics/chromatic/chromatic_yellow_circle.html` (no version literals) and
   `{{site.qxx}}/info/software.html`, which is in `f26` and already uses
   `node_lts`. So no student-facing shared page changed; only the staff
   `autograders` page gained a team02 entry. Unrelated stale literals noticed
   but left alone: `topics/vite/vite_npm.md` (`v22.18.0` in a pom snippet),
   `topics/windows/windows_wsl.md` (`nvm use v22.22.2`),
   `topics/pull_requests/package_lock_json.md` (`nvm use 16.20.0`).

## Validation done for this wave

Starter (macOS arm64, after rebasing onto the Java 25 merge):

1. `frontend/` under Node 24.21.0 / npm 11.19.0 (`nvm use 24.21.0`):
   `npm ci`, `npm test` (30 files, 101 tests; 100% statements, branches,
   functions and lines), `npm run lint`, `npm run check-format`,
   `npm run build` all pass
2. `PRODUCTION=true ./mvnw -ntp -B -DskipTests clean dependency:list install`
   (workflow 40) under Java 25.0.4-tem: `frontend-maven-plugin` logs
   "Installing node version v24.21.0", `npm ci` and `npm run build` run,
   BUILD SUCCESS; `target/node/node --version` is v24.21.0
3. CI on the starter PR (including the reusable workflows, which pick up
   the new `engines` value)

Autograder: nothing to validate for Node (see above).

f26: `bundle exec jekyll build` (in a `ruby:3.3.4` container, because the
Gemfile wants Ruby 3.3.4 and bundler 4.0.12 and the local rvm rubies are
older): the rendered `lab/team02.html` shows `nvm use v24.21.0` in all
three places and has no unresolved Liquid, and it matches what
`info/software_macos.html` renders.

Not done: a `docker build` of the (new, Java 25) Dockerfile, re-deploying
`team02.dokku-00.cs.ucsb.edu` from the updated starter, and an end-to-end
Gradescope run (nothing in the autograder changed).

## team02 PRs and issues from this wave

- Starter issue: https://github.com/ucsb-cs156-f26/STARTER-team02/issues/3
- Starter code PR (master list for the wave): https://github.com/ucsb-cs156-f26/STARTER-team02/pull/4
- Autograder: no issue or PR; no Node dependency (see above)
- f26 issue: https://github.com/ucsb-cs156/f26/issues/16
- f26 PR (this file): @@F26PR@@
- Shared docs issue: https://github.com/ucsb-cs156/ucsb-cs156.github.io/issues/20
- Shared docs PR: @@SITEPR@@
