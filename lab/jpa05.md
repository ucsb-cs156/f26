---
description: "Configuring dev deployment of legacy app"
assigned: 2026-10-15
due: 2026-10-30 23:59
layout: default
title: jpa05
nav_order: 100
ready: false
qxx: f26
layout: default
parent: lab
course_org: https://github.com/ucsb-cs156-f26
course_org_name: ucsb-cs156-f26
slack_help_channel: "[#help-jpa05](https://ucsb-cs156-f26.slack.com/archives/C09K987DZ08)"
staff_emails: "djensen@ucsb.edu,sanjaychandrasekaran@ucsb.edu,katelarrick@ucsb.edu,divyanipunj@ucsb.edu,samuelzhu@ucsb.edu,dgkirschbaum@ucsb.edu,phtcon@ucsb.edu"
previous_deploy_backend_lab: jpa03
---

<style>
  tt {white-space: pre; font-size: 80%;}
  code {white-space: pre}
  pre {white-space: pre}
</style>

{% include drop_down_style.html %}

For due date: see {{page.title}} on Canvas.

# Instructions for {{page.title}}

If you run into problems, let us know on the {{page.slack_help_channel}} channel on the slack.

{% include drop_down_style.html %}

This is an **individual** lab on the topic of creating a dokku dev deployment for one of the legacy code projects for CMPSC 156.

The detailed instructions will depend on which project you are assigned to.  Here are the legacy project assignments:

## Goal

The goal of this lab is to build on what you learned in {{page.prev_deploy_backend_lab}} about setting up
dokku deployments.  This time, you'll be setting up a deployment of a full stack app (backend and frontend) that represents one of the legacy code projects in CMPSC 156.

By the end of this lab, you'll have deployed your own copy of the `main` branch of one of these four repos on both localhost and Dokku.   The repo you will deploy
depends on which team you are a part of.

| Teams | Repo |
|-|-|
| `01,02,03,04` | <https://github.com/ucsb-cs156/proj-courses> |
| `05,06,07,08` | <https://github.com/ucsb-cs156/proj-dining> |
| `09,10,11,12` | <https://github.com/ucsb-cs156/proj-frontiers> |
| `13,14,15,16` | <https://github.com/ucsb-cs156/proj-happycows> |

Note that you will have read only access to these repos, but at a later stage, you will have a copy of these repos that is set up specifically for your team, where you will the ability to push to every branch *except* the `main` branch.

Your dev deployment should be named as follows:

* <tt>https://<i>project</i>-dev-<i>username</i>.dokku-<i>team</i>.cs.ucsb.edu</tt>

Where:
* <tt><i>project</i></tt> is the project you are assigned to: courses, dining, frontiers, or happycows
* <tt><i>username</i></tt> is your Github username
* <tt><i>team</i></tt> is your two digit team number (`01`,`02`,...`16`)

You should end up with a private instance of one of these four running applications (which you can access to check your work):
* <https://courses.dokku-00.cs.ucsb.edu>
* <https://dining.dokku-00.cs.ucsb.edu>
* <https://frontiers.dokku-00.cs.ucsb.edu>
* <https://happycows.dokku-00.cs.ucsb.edu>

You may cooperate with one or more pair partners from your team to help in debugging and understanding the lab, but each person should complete the lab separately for themselves.


As with jpa03, the configuration and deployment of the app can be broken down into several parts:
* Setting up SSL (https) for your dokku app
* Configuring Google OAuth (this can be tested on localhost first)
* Setting up the dokku app
* Connecting it to a Github repo
* Configuring https
* Configuring a postgres database on Dokku

## Step 1: Clone the starter repo on your machine

The starter repo you should clone is one of these:

| Teams | Repo |
|-|-|
| `01,02,03,04` | <https://github.com/ucsb-cs156/proj-courses> |
| `05,06,07,08` | <https://github.com/ucsb-cs156/proj-dining> |
| `09,10,11,12` | <https://github.com/ucsb-cs156/proj-frontiers> |
| `13,14,15,16` | <https://github.com/ucsb-cs156/proj-happycows> |

NOTE: You should use the `https` link rather than the `ssh` link, since you don't have push access to these repos.

Clone that repo somewhere and cd into it.  Note that for this assignment, you won't actually be making any changes to this repo; you'll just
be running the code that it contains, both on localhost, and on dokku.

## Step 2: Configure your app for localhost as documented in the README.md

Now, you need to configure your app for localhost as documented in the README.md

This step may differ in subtle ways across the four repos, so we have created separate pages for each of the four repos with details.  Please follow the details there for this step:


| Teams | Repo |
|-|-|
| `01,02,03,04` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-courses.html> |
| `05,06,07,08` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-dining.html> |
| `09,10,11,12` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-frontiers.html> |
| `13,14,15,16` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-happycows.html> |



## Step 3: Configure your app to run on Dokku

Now, you need to set up a dokku deployment on your team's dokku machine.

This step may differ in subtle ways across the four repos, so we have created separate pages for each of the four repos with details.  Please follow the details there for this step:

| Teams | Repo |
|-|-|
| `01,02,03,04` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-courses.html> |
| `05,06,07,08` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-dining.html> |
| `09,10,11,12` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-frontiers.html> |
| `13,14,15,16` | <https://ucsb-cs156.github.io/f26/lab/jpa05/proj-happycows.html> |


### What if it doesn't work?

If it doesn't work:

* Check on the Slack channel <tt>#help-{{page.title}}</tt> to see if there are any known issues.
* Ask folks on your own team for help first on your team's slack channel.
* Post a specific question on the <tt>#help-{{page.title}}</tt> slack channel—note what you were trying to do, what you expected, and what happened instead.  Screenshots or copy/pasted console output is helpful!
* Come to office hours (posted here: <{{page.office_hours_pages}}>)
* Ask during class on `#help-lecture-discussion`

## Step 5: Submit a link to your running app on Canvas

On canvas submit a link to your running app.

It should look like this:

The grading rubric is as follows:

* (20 pts) Submitted a dokku link in the correct format
* (20 pts) There is a running app 
* (10 pts) Configured for OAuth correctly so that a user can login with Google Credentials
* (10 pts) ADMIN_EMAILS is configured correctly.
* (40 pts) Application specific configuration is correct (includes database, access keys, etc.)

  
## Instructor Resources

<details markdown="1">
<summary>
Click the triangle for a list of tasks the instructor should do prior releasing this lab.
</summary>

* Create a Canvas assignment for {{page.title}}
* Make sure the legacy code apps are all running in production.
* Proofread the instructions in this file, and request that the staff (TAs/LAs do also)
* Consider assigning at least one TA/LA (preferably the one with the least prior experience with the course) to complete the lab in it's entirety to debug the starter code and instructions

</details>
