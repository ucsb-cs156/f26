---
description: "Configuring OAuth, Database for Spring Boot Backend"
assigned: 2025-04-08
due: 2025-04-15 23:59
layout: default
title: jpa03
nav_order: 100
ready: false
qxx: f26
layout: default
parent: lab
course_org: https://github.com/ucsb-cs156-f26
course_org_name: ucsb-cs156-f26
starter_repo: https://github.com/ucsb-cs156-f26/STARTER-jpa03
slack_help_channel: "[#help-jpa03](https://ucsb-cs156-f26.slack.com/archives/C08LVULHME1)"
teams_url: https://bit.ly/cs156-f26-teams
example_running_app: https://jpa03-staff.dokku-00.cs.ucsb.edu/
office_hours_page: https://ucsb-cs156.github.io/f26/office-hours
software_install_url: https://ucsb-cs156.github.io/f26/info/software.html
staff_emails: "djensen@ucsb.edu,benjaminconte@ucsb.edu,samuelzhu@ucsb.edu,divyanipunj@ucsb.edu,sangitakunapuli@ucsb.edu,amey@ucsb.edu,phtcon@ucsb.edu"
canvas_link: https://ucsb.instructure.com/courses/25659/assignments/348159
---

<style>
  tt {white-space: pre; font-size: 80%;}
  code {white-space: pre}
  pre {white-space: pre}
</style>

{% include drop_down_style.html %}

For due date: see the jpa03 entry on Canvas: <{{page.canvas_link}}>

# Instructions for jpa03

If you run into problems, let us know on the {{page.slack_help_channel}} channel on the slack.

{% include drop_down_style.html %}

This is an **individual** lab on the topic of deploying
backend only Java web apps that use OAuth and Databases, using Dokku.

You may cooperate with one or more pair partners from your team to help in debugging and understanding the lab, but each person should complete the lab separately for themselves.

## Goal

The goal of this lab is to learn about some of the techniques and tools that you will need while working on upcoming assignments and the legacy code project. By the end of this lab, you'll have deployed your own copy of the starter code repo (<{{page.starter_repo}}>) on both localhost and Dokku.

The app that you’ll be deploying doesn’t do much beyond demonstrating some *very* basic features:
* It allows users to login and logout using a Google account
* It allows the developer to configure some users as "admins" through setting an environment variable (`ADMIN_EMAILS`)
* It allows admin users to see who has logged in to the app in the past (by storing
  each login in a database), and to see which users have admin credentials.

This app is a full-stack web app with:
* A back-end built in Spring Boot (the code for this is under the directory `./src`, plus the `pom.xml` at the top level
* OAuth integration; this allows the app to have a "login/logout" feature based on Google Accounts (e.g. your UCSB Google Account)
* A SQL database, which runs using H2 (an in-memory database) on localhost, and using Postgres when running on Dokku.
* Automatic generation of javadoc, jacoco, and pitest web pages for both
  the production code (`main` branch) and all branches that have
  open pull requests targetting the `main` branch.

The configuration and deployment of the app can be broken down into several parts:
* Setting up SSL (https) for your dokku app
* Configuring Google OAuth (this can be tested on localhost first)
* Setting up the dokku app
* Connecting it to a Github repo
* Configuring https
* Configuring a postgres database on Dokku

Here is an example of the app you'll be implementing, up and running. Try logging in with your UCSB Google Credentials:

* <{{page.example_running_app}}>


So, let's get started.


TODO: Insert some more details here about what to expect from the running app.

## Step 1: Create your repo

There should already be a repo for you under the course organization
with a name in this format:

* <tt>{{page.course_org}}/{{page.title}}-<i>githubid</i></tt>

where <tt><i>github</i></tt> is your github id.

If not, create one for yourself following that naming convention;
it should initially be public, and empty (no `README`, license or
`.gitignore`.)

Clone that repo somewhere and cd into it.

<details markdown="1">
<summary markdown="1">
Click the triangle if you need a reminder on how to clone a repo
</summary>

As in previous labs, you should have a directory somewhere, perhaps `~/cs156` in which you clone the repos you work on in this course.

`cd` into that directory, then use `git clone` followed by the url for your repo, e.g.

<tt>cd ~/cs156</tt><br />
<tt>git clone git@github.com:{{page.course_org_name}}/{{page.title}}-<i>yourGithubid</i>.git</tt><br />
<tt>cd {{page.title}}-<i>yourGithubid</i></tt>
  
</details>

Then add this remote:

<tt>git remote add starter {{page.starter_repo}}</tt>

That sets up `starter` as a remote with the code from this github repo:
* <{{page.starter_repo}}>

Then do:

```
git checkout -b main
git pull starter main
git push origin main
```

## Step 2: Configure Actions and Github Pages

In this step, we'll:
* Enable Github Actions if not already enabled
* Set up Github Pages
* Check that the Github Pages app for the repo is building properly


### Step 2.1: Enable Github Actions (if not already enabled)

Go to the webpage for your repo on Github, e.g. <tt>https://github.com/{{page.course_org_name}}/{{page.title}}-<i>yourGithubLogin</i></tt>.  Find the `Actions` tab on your repo.  

The menu will look like this: the `Actions` tab is fourth from the left:

<img width="1048" alt="image" src="https://github.com/user-attachments/assets/330f4487-cb2b-41eb-99c3-a27a47cca3d0" />

When you click on the `Actions` tab, it should look like one of the images below, depending on whether Actions are already enabled or not.
* Note that you can click on the images below to zoom in on them.

<table>
<thead>
<tr>
<th>
If GitHub Actions are not yet enabled:
</th>
<th>
If GitHub Actions are already enabled:
</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<img width="476" alt="image" src="https://github.com/user-attachments/assets/a7e42344-8591-47de-88db-fd41c2ab36a0" />  
</td>
<td>
<img width="984" alt="image" src="https://github.com/user-attachments/assets/01dc2c3f-ac2f-43f5-b57b-70acf3308f16" />  
</td>
</tr>
</tbody>
</table>

If it looks like the one on the left, click the green button that says "Enable Actions on this Repository".

### Step 2.2: Enable Github Pages

Next, visit the file [`docs/github-pages.md`]({{page.starter_repo}}/blob/main/docs/github-pages.md) on GitHub or in your repo.

* **Follow all of the instructions in that file**

When you've completed this step, on your main repo page on Github, the link at right under `About` (near the Gear icon) should take you to the Github Pages for your repo; it should look like this:

<img width="375" alt="image" src="https://github.com/user-attachments/assets/4113c0b3-147e-46af-a784-8b60633c565a" />

The link will be of the form: <tt>https://{{page.course_org_name}}.github.io/jpa03-<i>yourGithubId</i></tt>, where <tt><i>yourGithubId</i></tt> is replaced by your Github Id.   Click on the link, and:
* you should see a page like this one (this image only shows the top portion of the page, not the entire page.)
* the links to `javadoc`, `jacoco`, and `pitest` should all work (i.e. they are not dead links).

<img width="620" alt="image" src="https://github.com/user-attachments/assets/9865af73-9ce9-4508-b25d-dd98a09287bf" />

If this is *not* what you see: 

* Look through the instructions again here, and be sure that you've completed *every* step. [`docs/github-pages.md`]({{page.starter_repo}}/blob/main/docs/github-pages.md)
  
## Step 3: Configure your app for localhost as documented in the README.md

Before we start configuring your app, let's take just a moment to learn what OAuth is.

### About OAuth

OAuth is a protocol that allows you to delegate the login/logout
functionality (user authentication) to a third party such as
Google, Facebook, GitHub, Twitter, etc.  If you've ever used
a website that allows you to "Login with Google", "Login With Facebook", or "Login with Github" then chances are good that app was built using OAuth.

Indeed, you've already encountered an examples of GitHub OAuth earlier in the course when you used your GitHub account to log into the <https://frontiers.dokku-00.cs.ucsb.edu> app.

When implementing a website that can store information and making it available on the public internet it's important to *secure the site;* otherwise, bad actors may fill your database with unsavory material.

One choice is to implement our own username/password authentication, but I want to strongly caution you: if you take on the responsibility of storing passwords, you are assuming a lot of risk.  The problem is that people reuse passwords, so even if you think that your site isn't that important, the problem is that the passwords you are storing might be the same ones folks are using for other sensitive apps.

Using OAuth sidesteps this issue:
* Your app never actually sees the password the user enters; it is entered on a page that is hosted by Google (or Facebook, or Github, or whoever is providing the OAuth service.)
* The user doesn't need to come up with a new username or password; they can use one they already have.

Implementing OAuth can be tricky at first, but once you get the hang of it, it's far easier than everything you would need to do to really work with usernames/passwords securely and safely.

### Steps to Configure your app

The next step is to read through the [`README.md`]({{page.starter_repo}}/blob/main/README.md) and configure your app as indicated there.

As shown in the [`README.md`]({{page.starter_repo}}/blob/main/README.md), these steps include the following.  Each of these is documented in files linked to from the [`README.md`]({{page.starter_repo}}/blob/main/README.md) file so we won't repeat those here; we'll just link to them.

1. [Configuring GitHub Pages for the documentation]({{page.starter_repo}}/tree/main#configuring-github-pages-for-the-documentation)
2. [Getting Started on localhost]({{page.starter_repo}}/tree/main#getting-started-on-localhost), which includes:
   - Setting up Google OAuth credentials
   - Entering those credential in the `.env` file
   - Learning how to run the backend and frontend in separate windows

### The `.env` file  should *not* be committed to GitHub

I already made this point, but I really, really want to emphasize it.

One of the values in the `.env` file is called a client *secret* for a reason.

If it leaks, it can be used for nefarious purposes to compromise the security of your account; so don't let it leak!

Never, ever, commit those to GitHub, and try to only share them in DMs on Slack (not in public channels).

Security starts with making smart choices about how to handle credentials and tokens. The stakes get higher when you start being trusted with credentials and tokens at an employer, so learning how to handle these with care now is a part of developing good developer habits.

The staff reserve the right to deduct points if we find that you have committed your `.env` file to GitHub.

### Green check ✅, not red X ❌

Once you've completed your setup, GitHub Actions should be running on the main branch with
a green check, not a red X.  If there are problems there,
address those as best you can before submitting.

### Explaning the `H2-Console` and `Swagger` links.

You may have noticed two extra links on your localhost version of the app:
* `H2-Console` is a link that is typically only available when running on localhost.  It provides access to database features for the database that is used when we run on localhost, which uses software called H2.  This link can be used to bring up H2 and look directly into the database tables that are present in the application.
* `Swagger` is a link that takes you to a special page that is automatically generated from the backend controller code.   This page allows you to interact directly with backend api endpoint, endpoints that often (though not always) take inputs, and typically (though not always) return their responses in JSON format.

You are encourged to take a look at each of these.   We'll be using them extensively later in the course. 

Note that when we run our application on Dokku, we typically do *not* use H2, but a different database called Postgres, so we don't use the H2-Console there; it's typically only for when we are running on localhost.   We will, however, sometimes enable swagger access when running on dokku.  We'll discuss this more at a later step in the lab.

## Step 4: Configure your app to run on Dokku

The steps to get your app up and running on Dokku are documented here:

* <https://ucsb-cs156.github.io/topics/dokku/deploying_an_app.html>

Note that there are are *more steps* than in the previous labs, since this app is more complex:
* It requires configuration variables
* It requires a Postgres database
* It requires a special `dokku git` setting (to keep the `.git` directory)
  
Once you've followed these instructions, try logging in to your app.  It should be available at this url:

<tt>https://{{page.title}}-<i>yourGithubId</i>.dokku-<i>xx</i>.cs.ucsb.edu</tt>

Where:
* <tt><i>yourGithubId</i></tt> is your Github Id
* <tt><i>xx</i></tt> is your two-digit team/dokku number

You should test the following features:

* You should see be able to login with your UCSB Google account
* Navigate to the swagger page and find the /admin/users api and click `Try it Out`. Then click `Execute`, your output should look as follows:

```

[{"id":1,"email":"cgaucho@ucsb.edu","googleSub":"10123023023","pictureUrl":"url","fullName":"Chris Gaucho","givenName":"Chris","familyName":"Gaucho","emailVerified":true,"locale":null,"hostedDomain":"ucsb.edu","admin":true}] 

```


### What if it doesn't work?

If it doesn't work:

* Check on the Slack channel <tt>#help-{{page.title}}</tt> to see if there are any known issues.
* Ask folks on your own team for help first on your team's slack channel.
* Post a specific question on the <tt>#help-{{page.title}}</tt> slack channel—note what you were trying to do, what you expected, and what happened instead.  Screenshots or copy/pasted console output is helpful!
* Come to office hours (posted here: <{{page.office_hours_pages}}>)
* Ask during class on `#help-lecture-discussion`

## Step 6: Add link to running app to your README.md file

At the top of your README.md, you'll find this:

<img width="500" alt="image" src="https://user-images.githubusercontent.com/1119017/235758700-20b3d8cf-d0dc-4182-8e6d-5e6ef551956a.png">

Follow these instructions; i.e. put in the link to your running app on Dokku, and
remove the comment so that afterwards it looks something like this (but with your actual Dokku link,
not the example value shown here).

<img width="500" alt="image" src="https://user-images.githubusercontent.com/1119017/235759017-e48fdcf6-abb7-40e7-8ae8-71173113d4cd.png">


## Step 7: Submit on Canvas

Before submitting on Canvas, check all of the items in the grading rubric below; make sure you are in compliance with all of them.

If so, then you are ready to submit on Canvas.

Remember to submit a link to *your repo*, not a link to your running app.

## Grading Rubric:

1.  (10 pts) README in your repo has a link to your running web app.
2.  (20 pts) There is a running web app at <tt>https://{{page.title}}-<i>githubid</i>.dokku-xx.cs.ucsb.edu</tt>
3.  (10 pts) Running web app has the ability to login with OAuth through a Google Account.
4.  (10 pts) The `ADMIN_EMAILS` variable is set to include all staff emails (see list below) plus your own email.
    - The correct setting is shown below, except with your email in place of <tt><i>youremail</i></tt>
    - <tt>ADMIN_EMAILS=<i>youremail</i>@ucsb.edu,{{page.staff_emails}}</tt>
5.  (10 pts) The link on your main repo page is set your Github Pages page (i.e. <tt>https://{{page.course_org_name}}.github.io/{{page.title}}-<i>yourGithubId</i></tt>, where <tt><i>yourGithubId</i></tt> is replaced by your Github Id.  ) 
6.  (10 pts) The Github Pages page shows a web page that looks like the example in the lab instructions and has the correct content.
8.  (10 pts) GitHub Actions runs correctly and there is a green check (not a red X) on your main branch
9. (10 pts) There is a post on Canvas for this assignment that has the correct content (i.e. a link to the *repo*, not the running app on Dokku)

Note that the Rubric above is subject to change, but if it does:

* You'll be notified during a class meeting
* You'll have an additional week from the date of the announced change to get your repo in shape with the new requirements.

## Instructor Resources


<details markdown="1">
<summary>
Click the triangle for a list of tasks the instructor should do prior releasing this lab.
</summary>

* Create {{page.title}} repos 
* Set up starter code in the course organization, and update links
* Create a Canvas assignment for {{page.title}}
* Make sure the app <{{page.example_running_app}}> is up and running, and is sync'd with the starter code:

  i.e, on dokku-00 for example, do:
  <pre>
  dokku git:sync {{page.title}}-staff {{page.starter_repo}} main
  dokku ps:rebuild {{page.title}}-staff
  </pre>
  
* Remove older users from the database, e.g.
  ```
  dokku postgres:connect jpa03-staff-db
  select * from users;
  delete from users where id>2;
  \q
  ```
* Proofread the instructions in this file, and request that the staff (TAs/LAs do also)
* Consider assigning at least one TA/LA (preferably the one with the least prior experience with the course) to complete the lab in it's entirety to debug the starter code and instructions
* Be sure that the organization settings are set like this, in, for example, <https://github.com/organizations/ucsb-cs156-f26/settings/actions>

  This is needed so that the github actions scripts have write access to the directory.

  <img width="943" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/de8c9efe-7bcd-48a1-97d5-0c0aa68a68db">


  This setting is probabaly also a good idea:

  <img width="972" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/99fead23-d9d0-4373-a435-466c5ef9e752">


</details>
