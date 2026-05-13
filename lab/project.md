---
title: project
desc: "Legacy Code Project instructions"
assigned: 2026-05-13 17:00
due: 2026-05-27 19:00
github_org: ucsb-cs156-s26
layout: lab
layout: default
parent: lab
num: project
nav_order: 700
jpa_create_dev: jpa05
proj_courses_slack_url: https://ucsb-cs156-s26.slack.com/archives/C0B4HRZEZ2L
proj_dining_slack_url: https://ucsb-cs156-s26.slack.com/archives/C0B3RCSPWDP
proj_frontiers_slack_url: https://ucsb-cs156-s26.slack.com/archives/C0B3T69BMEG
proj_happycows_slack_url: https://ucsb-cs156-s26.slack.com/archives/C0B3H6SBM8T
qxx: s26
githubOrgUrl: https://github.com/ucsb-cs156-s26
githubProjectsUrl: https://github.com/orgs/ucsb-cs156-s26/projects
githubPagesUrl: https://ucsb-cs156-s26.github.io
---

<style>
  td, th { min-width: auto}
</style>


# s26 Legacy Project Launch

On {{ page.assigned | date: '%A %B %d %Y at %l:%M%p' }}, in discussion, we'll launch the legacy code projects.

This page describes how that will roll out.

# Due Date

The due date for getting PRs in, green on CI, and reviewed by a member of your student team is {{ page.due | date: '%A %B %d %Y at %l:%M%p'  }}.

After that, you may only:
* Work on existing PRs to address issues raised by the staff in code review
* Add new PRs *if and only if* approved in advance by a staff member to address an issue raised during a code review of an already existing PR.

Taking on new work after that point is not permitted, since we need time for the staff to review the work already completed, and get it merged so that you can make your final release notes and final video presentation.


# Links

| Team <br ><span style="font-size:80%">Links to Slack</span>| Project <br ><span style="font-size:80%">Links to Legacy Repo</span> | Team Repo | PRs | Github Pages | Kanban | Dokku Prod | Dokku qa |
|------|----|------|-----|--------------|--------|------------|----------|{% for team in site.teams %}{% capture repoName %}proj-{{team.legacy_project}}-{{team.team}}{% endcapture %}
|  [{{team.team}}]({{team.slack}}) | [{{team.legacy_project}}](https://github.com/ucsb-cs156/proj-{{team.legacy_project}}) | [ team repo ]({{page.githubOrgUrl}}/{{repoName}}) |   [ PRs ]({{page.githubOrgUrl}}/{{repoName}}/pulls) |  [ github pages ]({{page.githubPagesUrl}}/{{repoName}}) | [ kanban ]({{page.githubProjectsUrl}}/{{team.legacy_kanban}}) | [ dokku prod ](https://{{team.legacy_project}}.dokku-{{team.dokku}}.cs.ucsb.edu) | [ dokku qa ](https://{{team.legacy_project}}-qa.dokku-{{team.dokku}}.cs.ucsb.edu) |{% endfor %}


# The Assignment, Briefly.

In this project:

* You will be assigned a legacy code base, and a set of issues
  (new features, refactorings, bug fixes)
* The list of issues contains more work than we expect you will need to complete
  in order to get a perfect score on the project, so don't worry that you have
  to finish them all; *you do not have to finish them all*.
* Some of the issues are "epics", which is a higher level than an issue: it's a group of related issues. It is the responsibility of the team members to take the epic and create smaller issues from it, copying/pasting the relevant parts and the editing the file to turn it into smaller single issues.  Each of those should usually be merged in its own separate small PR, not as one giant PR at the end.
* Each issue you complete earns points for your team after it is:
  * code reviewed and approved by a member of your team that didn't work on it
  * code reviewed and approved by a member of the course staff (instructor, TA, LA)
  * merged into the main branch of your repo.
* Issues earn different numbers of points: typically, 5, 10 or 20 depending on
  the complexity of the issue (more on this below).
* There may be a few issues that are marked as "must do".  You *must
  complete these* or their point values will be subtracted from the points you
  earn. These are assigned point values in advance.
* For other issues,
  points are assigned after completion. If you want to ask for a point
  estimate, you may do so, but keep in mind that actual points can differ
  from estimated points.
* Unlike in previous team projects, where your Issues list and
  Kanban board may have been
  pre-populated with issues by the staff,
  in the legacy code phase, populating the Kanban board
  is the responsibility of the team.  More on that below.
* The aim of the team is to earn 100 points before the deadline.  This forms the
  most important part of you project grade, which is 25% of your course grade.
* Another part of your project grade is your "CATME multiplier", which is a number
  based on your peer evaluations.  This number is typically 100 unless your team
  has rated you significantly below the team average
* Points beyond 100 can count as extra credit as explained below.

# Points beyond 100

If you accumulate more than 100 project points, the additional points may count as extra credit, at a rate of 1 extra credit point for each 10 points over 100 earned, up to a maximum project grade of 110.  For example:

| Points Earned | Project Grade |
|---------------|---------------|
|    80         |    80         |
|    90         |    90         |
|   100         |  100          |
|   105         |  100.5        |
|   110         |  101          |
|   115         |  101.5        |
|   150         |  105          |
|   180         |  108          |
|   ≥200        |  110          |

Your final project grade is maxed out at 110 total project points--any points in excess of 110 will not count towards your grade (though you'll probably learn a lot from having under taken the work to earn them.)

# Individual Grade

In addition, you'll get an individual grade for your participation on the project, 
based on your contribution to the overall effort.  As long as you made reasonable contributions the team's work, this grade will typically be similar to the overall
team grade.   

However, it may be higher or lower if your individual performance is signficantly higher or lower than the performance of the team as a whole.

*There is no mathematical formula for this*.  It will be determined by the instructor on the basis of a number of factors:
* Looking at your contributions to the team on the Slack Channel
* Looking at your contributions to the team via PRs merged to main
* Looking at your contributions to the team via code reviews
* The extent to which your PRs are mergeable on the first or second try, vs. needing many, many rounds of feedback from the staff before they are mergeable.  (That is: please actually *pay attention* to the code review guidelines and the feedback you get on code reviews.)
* etc.


# Sprint Planning for Legacy Code project

Each team already has a Kanban board setup for the legacy code project (see links above).   However unlike in your team01, team02, and team03 projects, it's up to you to populate this yourself.

Populate your Todo column with issues, start assigning them to your team, and start working.

You may not get through all of the Sprint planning today, but {{ page.assigned | date: '%A %B %d %Y at %l:%M%p' }}:
* Each of the six team members should be assigned to an issue in the ToDo column
* The previous bullet point should *remain true* until your team reaches 100 points
* This may require breaking issues out of an epic.  In some cases, you may need to assign different team members to work on backend and frontend issues from the same epic in parallel, or pair-program on some of the early issues.

## How you earn points for your Team

Teams accumulate points when PRs are merged into main
* That is only done by the course staff for these projects.
* Each PR requires at least one code review from a team member, and at least one code review from a staff member
* The staff estimate points. Most issues are 5 to 10 points.
  - 5 points for very straightforward issues addressing a single concern
  - 10 points for issues that require a bit more work, but are nevertheless reasonably straightforward application of skills from team01, team02, team03.
  - 20 points is rare, and is reserved for issues that may be more complex, and/or require students to go significantly beyond the skills from previous course assignments.
* Note that breaking down issues into smaller chunks works to your benefit in multiple ways:
  - Easy to code review and merge (fewer merge conflicts), so faster point accumulation
  - Three 10 points issues and three 5 points issues adds up to 45 points; combining all of those together might only get you 20.
  - But the aim here should not be to "game the points". It should be to "get the issues implemented", in incremental "right sized" pieces.
  - If you do that, the points will take care of themselves.

Points belong to the whole team, not to individuals
* Work as a team, and help each other.
* We do want to see every team member contribute
* Ultimately, it's a team project and a team grade.
* Having said that, really low CATME scores might result in a grade reduction.


## Where do issues come from?

For issues, you'll need to do a bit more work that in the previous team projects.

Each of your repos is populated with an issues list (see the issues tab).

* These issues come in different sizes
  - A handful of these may be small easy issues.
  - However, many (most?) of these issue *may not translate one-to-one into issues for your Kanban board*.
  - Instead, you are encouraged to try to *break the larger ones down into smaller issues*, each of which could be a single PR; more on this below.
  - This Sprint Planning meeting is where you can do some of that.
  - You may even need to add "issues about issues", e.g. an issue that says: "break issue #34 from proj-happycows into multiple issues on our team's repo".  Such an issue doesn't result in a PR, but it can still be moved across the Kanban board from `To Do`, to `In Progress`, to `In Review`, to `Done`.
* Your team's own ideas for features; these should be vetted with a staff member before you get too far into working on them, to ensure that they are aligned with user needs.   **Issues that are not aligned with customer will not be merged into main and will not earn points** so be sure that you vet your issues with staff if they are ones you came up with yourself.

Staff may add to these issues over the course of the project; when we do, we'll post an announcement in the project slack channels.

## You are encouraged to keep each PR small.

For example, implementing a new feature may require
* A new React Component (with tests and storybook entries, and perhaps fixtures to support those)
* A new React Page
  - This page might start out with a simple PR that establishes a placeholder with text "New feature coming soon", and a trivial set of tests and a storybook entry
  - It might later get data from the backend and display it using a component, and be linked to from the navigation bar.
* A new database table (or a new column in an existing database table, requiring modifications to an `@Entity` and/or `@Repository` class
* New API backend endpoints, which require controller methods and tests.

Each of these could (and arguably should be) a separate PR!  This helps to keep PRs small, which makes code review easier, and also helps the team to divide up work among the team members.

Still, you may need to document in the issues what the dependencies are (e.g. "do issue 12 and 13 before starting 14").


# Dokku prod and qa instances

There are already prod and qa instances set up for each application 
on your respective dokku machines.

* The name of your prod instance is `course`,  `dining`, `frontiers`, or `happycows` followed by your dokku address (e.g. `rec.dokku-17.cs.ucsb.edu`)
* The name of your qa instance is `course`,  `dining`, `frontiers`, or `happycows`  followed by your dokku address (e.g. `rec-qa.dokku-17.cs.ucsb.edu`)

There is a scheduled job that updates the prod instances to track the
main branch of your repo.  You want to ensure that this version is *never broken*; that is, only PRs that will keep the app running smoothly should be merged
to the main branch.  So don't ask for a PR to be merged if it will "break prod", and
if prod is broken, get it fixed before anything else.

The qa instance is available to the team
to try out other functionality; you may deploy any branch to it at any time;
but be sure to coordinate with your team.

Also: you really should have your own dev instances for doing most testing and demonstration of PRs.

## Personal dev deployments.

Each team member should also create their own dev instance or instances as needed.

You have one from your work on {{page.jpa_create_dev}} if you completed it already, and you *may create additional ones as needed*.  If you have multiple PRs outstanding, you may need on dev instance for each outstanding PR.  You can reuse these as PRs get merged to main.

It's entirely reasonable that you might end up with 12-18 dev dokku deployments of your app before it's all said and done, though it's best to not get too carried away with creating these; please *reuse* them after PRs get merged so that we
don't overload the servers too much.

# What should we do to get started?

* If you haven't yet, complete jpa05, which is to get a dev instance of this app running.  You'll need a dev instance to be able to do any dev work, so if you didn't do jpa05 yet, that's now your higher priority.
* If you *did* do jpa05 already, resync your dev instance with the main branch, which may have changed since you completed jpa05.
* Start reading through the issues
* Assign yourself a first issue on the Kanban board in the In Progress column.
* Mostly: *try out the app*.  Before you can make changes to an app, you need to understand how it works.  So once you've chosen an issue, explore the functionality of related parts of the app, using either your dev instance, the prod instance, or the qa instance.

* For Courses: do some course searches.  Set up personal schedules.
* For Dining: do some reviews (they can be fake ones).
* For Frontiers: you'll need to create some github organizations to experiment with.  Start creating classes and linking them to organizations.
* For Happycows: play the game as a team!


# Staff Information

Information in the dropdown below is intended for course staff.  Students are welcome to look at it, but it's really targetted at a different audience.

<details markdown="1">
<summary>
Staff information for legacy code phase
</summary>


## Creating the team repos

Use the scripts in <https://github.com/ucsb-cs156-s26/membership-scripts> to create the repos and set them up with branch protections, etc.

Initially, just create team repos the same way you did for STARTER-team01, STARTER-team02, etc., but with a regex for the teams.

This workflow will do it:

* <https://github.com/ucsb-cs156-s26/membership-scripts/actions/workflows/37-create-team-repos-with-regex.yml>

Be careful with the regex:

<img width="335" height="407" alt="image" src="https://github.com/user-attachments/assets/9a873308-e1a1-4bd6-a001-8bfe560dddcc" />

## Setting up Kanban boards

To set up Kanban boards for the legacy code project:

1. Make sure your github organization has a suitable template, i.e. a Kanban board set up with the
   views you want.  For example, this one: <https://github.com/orgs/ucsb-cs156-f23/projects/28/views/2>
2. Navigate to the template board so that your screen looks like this:

   <img width="1110" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/876a93c8-3561-4db3-990b-d12b9e37aee4">

3. For each team, click the `Use Template` button, and in the box that comes up, paste in the
   name of the repo for which you are creating a Kanban board; for example, pasting in `proj-happycows-f23-5pm-2` as shown here.  Also be sure that the owner is the github org for the course, e.g. `ucsb-cs156-f23`:

   <img width="608" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/7f49f240-f3c2-45b2-bb7d-8e9b0e6683e5">

   A kanban board will be created:

   <img width="663" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/579e7152-e75a-44d9-a7b8-6ea02cf41943">

   Repeat for each team.  To make this efficient, you may find that hitting the back button gets you back to the page where you can click `Use Template`; have the previous project name in your copy/paste buffer so that all you have to do is change the team number.

5. If you do these operations consecutively, in order from first to last team, you'll get a range of
   project numbers, e.g. twelve projects ranging in number from `43` to `54`.

## Add project numbers (kanban board numbers) to Front matter

Next, put these numbers in `_config.yml` file of the repo for the course website.


## Link the kanban board to the repos

Use the script: <https://github.com/ucsb-cs156-s26/membership-scripts/actions/workflows/45-link-team-projects.yml>

NOTE: This must be done separately for each project, e.g.
* Run once for proj-courses
* Run again for proj-dining
* etc.

## Preparing starter repos

Each of the starter repos needs the following preparation

### Set CODEOWNERS

Put the github ids of the instructor, TAs and LAs (anyone that can merge into main) into this file:

<img width="1094" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/1225e0ed-016d-45c7-a1ee-37b765b95a91">

* <https://github.com/ucsb-cs156/proj-courses/blob/main/.github/CODEOWNERS>
* <https://github.com/ucsb-cs156/proj-dining/blob/main/.github/CODEOWNERS>
* <https://github.com/ucsb-cs156/proj-frontiers/blob/main/.github/CODEOWNERS>
* <https://github.com/ucsb-cs156/proj-happycows/blob/main/.github/CODEOWNERS>

### Set up branch protections

This workflow sets up branch protections for legacy code repos, as well as populating the `gh-pages` branch and setting up github pages.

However, you should not run it until the repos are populated with the starter code.

* <https://github.com/ucsb-cs156-s26/membership-scripts/blob/main/.github/workflows/70-setup-project-repo.yml>

### Be sure issues you want students to work on are tagged

Check the issues list. Make a tag (e.g. `s26`) for the issues you want the students to work on.

### Set variable to used used by workflow 99

In workflow 99, the tag gets its value from the organization variable QXX which should be set to match the tag (e.g. `s26`) that's 
applied to the issues you want to bulk copy over.

* Visit: <https://github.com/organizations/ucsb-cs156-s26/settings/variables/actions> to set that value, e.g. to `s26`

It should look like this:

<img width="1065" alt="image" src="https://github.com/ucsb-cs156/s24/assets/1119017/4882662f-407a-4e8a-9ad5-a40d21957799">


# Why we don't create team repos with a fork

We don't use the `fork` approach for this reason: If we created the team repos as forks, then every time students create a PR, the default would be a PR back to the main repo.  This would be
fine if each of the teams was working on an independent set of tasks, but if the design is to have each of the teams work on the *same* set of tasks, then their PRs would clash and be redundant.

So, instead, we create independent repos in the course organization for the class offering (e.g. <https://github.com/ucsb-cs156-f23>, or <https://github.com/ucsb-cs156-s24>, etc.) that are initially populated with the `main` branch of the repo from the <https://github.com/ucsb-cs156/> organization.

# Set up project channels

In the Slack workspace, set up channels for each project:

<img width="704" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/9a856d20-24e6-4f8e-b872-a84c2f47655b">

<img width="562" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/fcb80862-6fce-45f9-9fc2-105598137e5b">

<img width="559" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/f05d35ae-1ee0-49c0-8863-1024425b8168">

You can click "Skip for Now" and add folks to the channels later, or invite the students and staff to add themselves to the channels.

Then, update the links at the top of this page to the project slack channels (in the front matter):

Copy the link to the channel:

<img width="708" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/aa9a8129-336b-4932-a995-cefb34f093bf">

And then configure in the front matter of this page:

```
proj_courses_slack_url: https://ucsb-cs156-f23.slack.com/archives/C066057BBHA
```

Repeat for every project.


## Populate repos


### Initial setup of directory

First, `cd` into an appropriate directory.  I use `~/github/ucsb-cs156-s26`, like this:

```
mkdir -p ~/github/ucsb-cs156-s26
cd ~/github/ucsb-cs156-s26
```

### Clone all repos; set up starter remotes

Then, clone all of the repos if you haven't yet, and for each one,
add a remote for the starter code.

```
clone_and_setup_starter() {
  local proj="$1"; shift; local teams=("$@")
  mkdir -p ~/github/ucsb-cs156-s26
  for t in "${teams[@]}"; do
    pushd ~/github/ucsb-cs156-s26
    git clone git@github.com:ucsb-cs156-s26/proj-$proj-s26-$t.git
    pushd proj-$proj-s26-$t
    git remote add starter git@github.com:ucsb-cs156/proj-$proj.git
    popd
    popd
  done
}
clone_and_setup_starter courses 01 02 03 04
clone_and_setup_starter dining 05 06 07 08
clone_and_setup_starter frontiers 09 10 11 12
clone_and_setup_starter happycows 13 14 15 16
```

### Update from starter

This should be run at least once to set up the repos, then periodically to get
updates to the starter code as needed:

```
update_from_starter() {
  local proj="$1"; shift; local teams=("$@")
  for t in "${teams[@]}"; do
    pushd ~/github/ucsb-cs156-s26/proj-$proj-s26-$t
    git fetch starter
    git fetch origin
    git checkout main
    git merge --no-edit -m "Merge starter/main into main" starter/main
    git merge --no-edit -m "Merge origin/main into main" origin/main
    git push origin main
    popd
  done
}
update_from_starter courses 01 02 03 04
update_from_starter  dining 05 06 07 08
update_from_starter frontiers 09 10 11 12
update_from_starter happycows 13 14 15 16
```

## Configure repos

Use this script: <https://github.com/ucsb-cs156-s26/membership-scripts/actions/workflows/70-setup-project-repo.yml>

## Populate the issues

First, check that the issue for the project are the ones you want, i.e. that you've marked
the issues in the starter repo (e.g. <https://github.com/ucsb-cs156/proj-happycows> ) that you want
the students to work on with a tag such as `f23`.

Second, check that workflow 99 has the correct tag in it (near the top).  (We should probably do this before we populate the repos!  If you find that you didn't do this, there's a script below to fix this; or you can just fix it manually in each cloned repo):

Finally, run workflow 99 to populate the issues list:

<img width="1093" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/3d55bbc8-03e8-43e4-84fb-50d29aa3b989">

When it finishes, the issues that were tagged with for example `f23` should appear in the issues list.  Student can then add them to the Kanban board as they see fit.

## Setting up Dokku Deployments

We typically set up the following deployments as staff:

* Prod and qa deployments on dokku-00 for the repos in <https://github.com/ucsb-cs156>, e.g.
  * <https://github.com/ucsb-cs156/proj-happycows> as <https://happycows.dokku-00.cs.ucsb.edu> and <https://happycows-qa.dokku-00.cs.ucsb.edu>
  * <https://github.com/ucsb-cs156/proj-organic> as <https://organic.dokku-00.cs.ucsb.edu> and <https://organic-qa.dokku-00.cs.ucsb.edu>
  * <https://github.com/ucsb-cs156/proj-courses> as <https://courses.dokku-00.cs.ucsb.edu> and  <https://courses-qa.dokku-00.cs.ucsb.edu>

The students are then encouraged to set up personal deployments using the project name and their github id for personal dev testing, and demoing PRs under review. For example:
*  <https://happycows-dev-cgaucho.dokku-01.cs.ucsb.edu>
*  <https://happycows-dev-ldelplaya.dokku-01.cs.ucsb.edu>
*  etc.

Students may create additional deployments if needed.


</details>
