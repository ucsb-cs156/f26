---
description: "Configuring Full Stack App (Frontend/Backend, OAuth, Database)"
assigned: 2024-10-15
due: 2024-10-21 23:59
layout: default
title: jpa05
prev_lab: jpa03
nav_order: 100
ready: false
qxx: f26
layout: default
parent: lab
course_org: https://github.com/ucsb-cs156-f26
course_org_name: ucsb-cs156-f26
starter_repo: https://github.com/ucsb-cs156-f26/STARTER-jpa05
slack_help_channel: "[#help-jpa05](https://ucsb-cs156-f26.slack.com/archives/C09K987DZ08)"
example_running_app: https://jpa05-staff.dokku-00.cs.ucsb.edu/
office_hours_page: https://ucsb-cs156.github.io/f26/office-hours
software_install_url: https://ucsb-cs156.github.io/f26/info/software.html
staff_emails: "djensen@ucsb.edu,sanjaychandrasekaran@ucsb.edu,katelarrick@ucsb.edu,divyanipunj@ucsb.edu,samuelzhu@ucsb.edu,dgkirschbaum@ucsb.edu,phtcon@ucsb.edu"
starter_storybook: "https://67f864a308dbcc23529c76e8-hpbxoidyyg.chromatic.com/"
---

<!-- <div style="font-size:400%; width: 80%; margin-left: auto; margin-right: auto; background-color: yellow;">This lab is still under construction, but you may go ahead and start.  If you have difficulties, please post to #help-jpa04</div>
 -->

<style>
  tt {white-space: pre; font-size: 80%;}
  code {white-space: pre}
  pre {white-space: pre}
</style>

{% include drop_down_style.html %}

For due date: see the {{page.title}} entry on Gradescope

# Instructions for {{page.title}}

If you run into problems, let us know on the {{page.slack_help_channel}} channel on the slack.

{% include drop_down_style.html %}

This is an **individual** lab on the topic of deploying
Java web apps with a frontend component that also 
use OAuth and Databases, using Dokku.

You may cooperate with one or more pair partners from your team to help in debugging and understanding the lab, but each person should complete the lab separately for themselves.

## Goal

By the end of this lab, you'll have deployed your own copy of the starter code repo (<{{page.starter_repo}}>) on both localhost
and Dokku.

This app is a full-stack web app.  The new part is:
* A front-end built in React (under the directory `./frontend`)
* Automatic generation of Storybook/Chromatic web pages that document the React components for both the production code (`main` branch) and all branches that have open pull requests targetting the `main` branch.

In addition, we still have all of these parts that are similar to the previous lab 
({{page.prev_lab}}):

* A back-end built in Spring Boot (the code for this is under the directory `./src`, plus the `pom.xml` at the top level
* OAuth integration; this allows the app to have a "login/logout" feature based on Google Accounts (e.g. your UCSB Google Account)
* A SQL database, which runs using H2 (an in-memory database) on localhost, and using Postgres when running on Dokku.
* Automatic generation of javadoc 

This app is not intended as a coherent app to solve a real-world problem,
but as a code base that demonstrates many of the techniques you
would need in such an app.   The legacy code apps that we'll work
with in this course have a similar structure.

Here is an example of this app, up and running.  Try logging in with your UCSB Google Credentials:

* <{{page.example_running_app}}>

If the menu looks like this, click on the hamburger icon (☰) to expose the Login button:

![image](https://github.com/user-attachments/assets/51f5fdfe-fc77-4d80-b39c-f82a9bbf27d6)

It should then look like this, and you should be able to login:

![image](https://github.com/user-attachments/assets/deeaaa7f-9a3e-4a98-a69a-b70ee1ae6e8c)

Once you are logged in, you'll see a navigation bar like this one (though you will not see the `Admin` menu):

![image](https://github.com/user-attachments/assets/a9cab513-0c7e-4e6f-a1e3-95d3f60d8832)


None of the menus will do much of anything.  It turns out that the application is
a shell of an application that:

* allows users to login and logout using a Google account
* allows the developer to configure some users as "admins"
* allows admin users to see who has logged in to the app in the past (by storing
  each login in a database)

However, we need those basic functions as a basis to build more complex functions,
and every student in the class needs to know how to configure and deploy an app on
Dokku.  

The configuration is mostly the same as in {{page.prev_lab}}, so for many of these steps, we won't repeat the instructions. Instead, refer to  {{page.prev_lab}} for the details:

* Setting up SSL (https) for your dokku app
* Configuring Google OAuth (this can be tested on localhost first)
* Setting up the dokku app
* Connecting it to a Github repo
* Configuring https
* Configuring a postgres database on Dokku

So, let's get started.


## Step 1: Create your repo

There should already be a repo for you under the course organization
with a name in this format:

* <tt>{{page.course_org}}/{{page.title}}-<i>githubid</i></tt>

where <tt><i>github</i></tt> is your github id.

You should add a remote for the starter code from this repo:

<tt>git remote add starter {{page.starter_repo}}</tt>

Then pull in the code from the main branch of the starter repo (here: <{{page.starter_repo}}>) and push it to the main branch of your repo.  

If you need a refresher on how to do that, please see the instructions for {{page.prev_lab}}.


## Step 2: Configure Actions and Github Pages

As you did in {{page.prev_lab}}, please:

* Enable Github Actions
* Set up Github Pages 

The steps are mostly the same, but there is one new aspect: setting up your repo for Chromatic access, as explained below; however, please get everything else with Github pages working first.

As a reminder, the steps for configuring Github Page are mostly documented in the README file of your starter code, but you may also refer to {{page.prev_lab}}.

Once the basic Github Page configuration is done, you'll notice that there are additional links on the Github Pages site for frontend components, but they probably won't all work until you do the next couple of steps to enable Storybook/Chromatic.

So let's proceed.

### Step 2.1: Enable Chromatic

In this step, we are setting up *Storybook* and *Chromatic*. 
* Storybook  is software that allows us to document and test the frontend of our application, one component at a time, without needing the backend at all.    
* Chromatic is a private company that offers free hosting for Storybook sites, as well as some paid tools for working with Storybook.  We have been given complimentary access to some of those paid tools as a courtesy.

As an example of Storybook, here is a link to the storybook for the starter code:
* <{{page.starter_storybook}}>

<details markdown="1">
<summary markdown="1">
Click the triangle to read more about why Storybook and Chromatic are useful when building a full-stack web applications.
</summary>

Storybook is helpful for several reasons:

* You can develop frontend components without depending on whether the backend part is working yet.  This is very helpful for team projects where you may want to have different team members working on the frontend and the backend. (Note, however, that it's *very* important to agree in advance on the interface between the frontend and the backend!).
* You can test the frontend components separately from the backend.  This is very helpful when debugging problems in the web app which are typically caused by one of three things (a) a problem in the backend, (b) a problem in the frontend (c) a error in communication between the front and backend.  Having a way to isolate the frontend makes it much easier to identify the root causes of such problems.
* It serves as a way of documenting the collection of user interface elements that a present in the code base.  This is helpful for being able to reuse user interface components, or identify the existing part of the user interface that's closest to the one you intend to build.
* It helps to be able to identify opportunities for refactoring the user interface code to make it more consistent.

Chromatic.com, in addition to providing web hosting for Storybook sites, offers: 
> "... a visual testing & review tool that scans every possible UI state across browsers to catch visual and functional bugs. Assign reviewers and resolve discussions to streamline team sign-off."

The idea is that the first time your Storybook is built, it takes a screenshot of each user element.  On subsequent builds, it again takes those screenshots, and if/when any of them change, it asks whether the change should be approved or rejected.  This is incorporated into the Github Action for Storybook which will remain marked with a yellow (i.e. unfinished, incomplete) until the developer reviews the changes in the user interface elements.
  
</details>

To configure your web app for Chromatic, you need to:
* Create a Chromatic.com account (using your Github login)
* Visit the page <https://ucsb-cs156.github.io/topics/chromatic> and follow the instructions to set up your repo as a Chromatic project.
* Once it is setup as a project, you'll be able to obtain a value for the `CHROMATIC_PROJECT_TOKEN`
* Then, you can set up the `CHROMATIC_PROJECT_TOKEN` as a repository level secret, accessible to the Github Actions scripts.



### Step 2.2: Check that Chromatic is building properly

Go to the Github Actions page for your repo and run  the job `53-chromatic-main-branch.yml` again; it may  have failed on the 
first run for lack of a value for  `CHROMATIC_PROJECT_TOKEN`.


When you've re-run the Github Action `53-chromatic-main-branch.yml`, navigate to the Github Pages site for repo.

<img width="412" alt="image" src="https://github.com/user-attachments/assets/6190a217-87d4-4058-a0c1-45a799df4292">

And the links for `Storybook` and `build info` should take you to pages that looks like these:

| storybook | build info |
|-|-|
| <img width="500" alt="image" src="https://github.com/user-attachments/assets/eaa1b86d-cd8a-449d-81bc-4fa813f51a7d"> | <img width="500" alt="image" src="https://github.com/user-attachments/assets/bb041223-49e7-4b4f-a831-5033a6b4425e"> |


### Green check ✅, not red X ❌

Once you've completed your setup, GitHub Actions should be running on the main branch with a green check, not a red X.  If there are problems there,


## Step 3: Configure your app for OAuth localhost as documented in the README.md


The steps here are similar to those in {{page.prev_lab}}, so we won't repeat the instructions; the short version is: 

* read through the [`README.md`]({{page.starter_repo}}/blob/main/README.md) and configure your app for oauth on localhost.

Reminders:

* The `.env` file  should *not* be committed to GitHub
* The `.env.SAMPLE` file should *not* be changed or deleted.


## Step 4: Configure your app to run on Dokku

Now follow the steps from the [`README.md`]({{page.starter_repo}}/blob/main/README.md) to configure your app on dokku.

These steps to get your app up and running on Dokku are also documented here:

* <https://ucsb-cs156.github.io/topics/dokku/deploying_an_app.html>

Once you've followed these instructions, try logging in to your app.  It should be available at this url:

<tt>https://{{page.title}}-<i>yourGithubId</i>.dokku-<i>xx</i>.cs.ucsb.edu</tt>

Where:
* <tt><i>yourGithubId</i></tt> is your Github Id
* <tt><i>xx</i></tt> is your two-digit team/dokku number

You should test the following features:

* You should see be able to login with your UCSB Google account
* You should see an Admin menu, where you can see the names of everyone that has logged in

### What if it doesn't work?

If it doesn't work:

* Check on the Slack channel <tt>#help-{{page.title}}</tt> to see if there are any known issues.
* Ask folks on your own team for help first on your team's slack channel.
* Post a specific question on the <tt>#help-{{page.title}}</tt> slack channel—note what you were trying to do, what you expected, and what happened instead.  Screenshots or copy/pasted console output is helpful!
* Come to office hours (posted here: <{{page.office_hours_pages}}>)
* Ask during class on `#help-lecture-discussion`


## Step 5: Enable Link to Swagger

For a *production* dokku deployment of a *real, user-facing* app, we would normally not want a link to the Swagger tool to appear.  This is not functionality that a normal end user
would be interacting with.

However, for developers, it is often convenient to enable this link on deployments of our app that are being used for quality assurance (QA), demos, etc.  

You can enable this link by setting the following configuration variable on dokku:

<tt>dokku config:set <i>appname</i> SHOW_SWAGGER_UI_LINK=true</tt>

Where <tt><i>appname</i></tt> in this case is <tt>{{page.title}}-<i>yourGithubId</i></tt>.

Type that command, and when it finishes, you should be able to refresh the web page for your dokku deployment of the app and see the Swagger link in the menu bar.

## Step 6: Add link to running app to your README.md file

At the top of your README.md, you'll find this:

<img width="500" alt="image" src="https://github.com/user-attachments/assets/8593a5f7-8aa7-4373-8e4a-6b7cdb7987f3" />

Follow these instructions; i.e. put in the link to your running app on Dokku, and
remove the comment so that afterwards it looks something like this (but with your actual Dokku link,
not the example value shown here).

<img width="534" alt="image" src="https://github.com/user-attachments/assets/57d2abb4-bc83-41bb-a659-c27260462938" />

## Step 7: Submit on Canvas

Before submitting on Canvas, check all of the items in the grading rubric below; make sure you are in compliance with all of them.

If so, then you are ready to submit on Canvas.

Remember to submit a link to *your repo*, not a link to your running app.

## Grading Rubric:

1.  (10 pts) README in your repo has a link to your running web app.
2.  (10 pts) There is a running web app at <tt>https://{{page.title}}-<i>githubid</i>.dokku-xx.cs.ucsb.edu</tt>
3.  (10 pts) Running web app has the ability to login with OAuth through a Google Account.
4.  (10 pts) The `ADMIN_EMAILS` variable is set to include all staff emails (see list below) plus your own email.
    - The correct setting is shown below, except with your email in place of <tt><i>youremail</i></tt>
    - <tt>ADMIN_EMAILS=<i>youremail</i>@ucsb.edu,{{page.staff_emails}}</tt>
5.  (10 pts) The link on your main repo page is set your Github Pages page (i.e. <tt>https://{{page.course_org_name}}.github.io/{{page.title}}-<i>yourGithubId</i></tt>, where <tt><i>yourGithubId</i></tt> is replaced by your Github Id.  ) 
6.  (10 pts) The Github Pages page shows a web page that looks like the example in the lab instructions and has the correct content.
7.  (10 pts) Chromatic is configured correctly, and the Github Pages site has a Storybook configured properly.
8.  (10 pts) GitHub Actions runs correctly and there is a green check (not a red X) on your main branch
9.  (10 pts) On dokku, the Swagger link appears in the menu bar.
10. (10 pts) There is a post on Canvas for this assignment that has the correct content (i.e. a link to the *repo*, not the running app on Dokku)

Note that the Rubric above is subject to change, but if it does:

* You'll be notified during a class meeting
* You'll have an additional week from the date of the announced change to get your repo in shape with the new requirements.

## Instructor Resources


<details markdown="1">
<summary>
Click the triangle for a list of tasks the instructor should do prior releasing this lab.
</summary>

* Create {{page.title}} repos using the <https://ucsb-cs-github-linker.herokuapp.com>
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
  dokku postgres:connect jpa05-staff-db
  select * from users;
  delete from users where id>2;
  \q
  ```
* Proofread the instructions in this file, and request that the staff (TAs/LAs do also)
* Consider assigning at least one TA/LA (preferably the one with the least prior experience with the course) to complete the lab in it's entirety to debug the starter code and instructions
* Be sure that the organization settings are set like this, in, for example, <https://github.com/organizations/ucsb-cs156-s24/settings/actions>

  This is needed so that the github actions scripts have write access to the directory.

  <img width="943" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/de8c9efe-7bcd-48a1-97d5-0c0aa68a68db">


  This setting is probabaly also a good idea:

  <img width="972" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/99fead23-d9d0-4373-a435-466c5ef9e752">


</details>
