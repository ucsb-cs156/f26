---
description: "Intro to Kanban, PRs, Code Review, Spring Boot CRUD"
assigned: 2026-10-21
due: 2026-10-28 23:59
layout: default
title: team01
nav_order: 100
ready: false
qxx: f26
layout: default
parent: lab
sample_team: f26-03
github_org_url: https://github.com/ucsb-cs156-f26
github_org: ucsb-cs156-f26
starter_repo: https://github.com/ucsb-cs156-f26/STARTER-team01
starter_repo_url: git@github.com:ucsb-cs156-f26/STARTER-team01.git
slack_help_channel: "[#help-team01](https://ucsb-cs156-f26.slack.com/archives/C09M40206CC)" 
teams_url: https://bit.ly/cs156-f26-teams
office_hours_page: https://ucsb-cs156.github.io/f26/office-hours
software_install_url: https://ucsb-cs156.github.io/f26/info/software.html
staff_emails: "djensen@ucsb.edu,sanjaychandrasekaran@ucsb.edu,katelarrick@ucsb.edu,divyanipunj@ucsb.edu,samuelzhu@ucsb.edu,dgkirschbaum@ucsb.edu,phtcon@ucsb.edu"
starter_storybook: "https://ucsb-cs156-f26.github.io/STARTER-team01/chromatic"
canvas_link: "[team01 on Canvas, F26](https://ucsb.instructure.com/courses/32781/assignments/455943)"
example_full_running_app: "[team01](https://team01.dokku-00.cs.ucsb.edu)"
num_issues: 42
num_top_level_issues: 6
num_issues_per_table_alpha: 6
num_issues_per_table: 6
num_database_tables_alpha: 6
project_title: team01
---

<style>
  tt {white-space: pre; font-size: 80%;}
  code {white-space: pre}
  pre {white-space: pre}
</style>

{% include drop_down_style.html %}

For due date: see the {{page.title}} entry on Canvas: {{page.canvas_link}}



## What this assignment is about: Database CRUD operations

A basic feature of many applications (not just web applications) is referred to a CRUD operations for a database table.  For example, if a database tables contains students, CRUD operations would be:

* Create Student (add a new student)
* Read Student (look up a student, e.g. by their perm number, or show all students in a sorted table)
* Update Student (update some information about a student, e.g. their major, GPA, etc.)
* Destroy Student (delete a student that is no longer enrolled)

At this link, you'll find a working app with CRUD operations for a Restaurant table:
* {{page.example_full_running_app}}

This is the first of three team assignments (team01, team01, team03) that will add additional database tables to this app.  The coding will be fairly straightforward, and will be very similar to a typical "first assignment" you might get on a real world team, in that it involves a lot of "copy and paste" coding.  That is, you'll look at an example of how to do CRUD operations for one database table, and you'll replicate that code for another database table.

**Avoid the temptation to just do this mindlessly**.  It is common to be assigned tasks like this in your first days in a new software development organization, because the *assumption* is that it gives you a chance to learn the codebase.  You'll need to navigate between two extremes, both of which raise problems:
* If you try to understand *everything* about *every* line of code, you'll likely get bogged down in details.
* But if you just turn off your brain and code mindlessly (perhaps with the help of Github Copilot or Chatgpt), you may miss out on learning that you'll need later when the tasks become more complex; where just copying/pasting blindly won't get the job done.

So try to steer a middle ground between these two extremes.

## team01,team02,team03: backend, frontend, integration tests

This project is divided into three phases:

* team01: You'll focus only on the backend primarily using swagger as your tool to interact with the applications, plus writing unit tests for the backend code.
* [team02](https://ucsb-cs156.github.io/{{site.qxx}}/lab/team02.html): You'll focus on the frontend code, using Storybook/Chromatic along with unit tests for React/Javascript code, as well as interactive testing of the completed app.
* [team03](https://ucsb-cs156.github.io/{{site.qxx}}/lab/team03.html): You'll learn how to write integration tests using Spring Boot,  and end-to-end tests using Playwright that ensure that individual parts of the app work together properly.

In this assignment, we will build the backend only for api endpoint that allow CRUD operations (Create, Read, Update, Destroy) for each of six database tables.

The type of database we'll work with in this assignment is called an SQL database (SQL is typically pronounced like the english word "sequel").


## What you'll do: Process

From a process standpoint, you are working with a Kanban board.

- A Kanban board is a "visualization of work in progress"
- If you've ever worked with a Trello board, it's a similar idea.
- Originally, a Kanban board was a corkboard, and each item was an index card pinned to it with a thumbtack.
- These days, they are mostly online tools.

In this course, we typically work with four columns labelled:
* "todo", "in progress", "in review" and "done".

There may be more columns or fewer, though typically at a minimum, there is:
* "todo", "in progress" and "done".

Here's how that will play out in detail:

1. Navigate to the web page for the GitHub organization, i.e. <https://github.com/{{page.github_org}}>.  You'll see a tab for `Projects`. Click on that tab.  You should then see a project for your team for the team01 assignment, e.g. `team01-f26-01`, `team01-f26-02`,etc.
2. Open the link for your team's Project.  You should find four columns: `Todo`, `In Progress`, `In Review`, `Done`
3. The `Todo` column will be populated with a set of tasks, which are called *Issues* in the GitHub implementation of Kanban.  These correspond to the Issues that we'll also see in the `Issues` column of your repo.
4. Now navigate to your repo for {{page.title}}, which will have a url such as: <https://github.com/{{page.github_org}}/{{page.title}}-{{page.sample_team}}>.  You will see a tab for `Issues`. Click on that tab.
4. You should now see a list of issues.  These are the work items your team needs to complete to do the the work for the team01 assignment. They are the same issues that you find in the "To Do" column of your Kanban board (i.e. your `Project`, to use the GitHub terminology).
5. There may also be some additional housekeeping steps that you need to complete in order for the {{page.num}} assignment to be considered completed; the issues on the Kanban board are not necessarily the only things you need to complete to earn full credit for the assignment.  But these issues are the bulk of the work you need to divide up as a team.
6. Note that you are allowed and even encouraged to add cards on the Kanban board and/or Issues for any other items you find in the assignment description that need to be completed.  Tracking this on the Kanban board can be a helpful way to make sure that it get done, and to signal to other team members when it has been done.
7. Each team member will take on an issue, one at a time, assign it to themselves, and move it from the "To Do" column of the Kanban board to the "In Progress" column as you start the issue.  When you are finished with the issue, you move it into the "In Review" column when you've made a "Pull Request" to indicate that the issue is ready for your team members to review.
8. Ideally, each team member should have exactly one (and only one) issue assigned to them in the In Progress column at a time.
9. Once a pull request is complete for a given task, you move it into the `In Review` column
   - At this stage, you seek a code review from a member of the team that
     was not involved in the coding.
   - Also, at this stage, if the PR is not "green on CI",
     meaning that all of the GitHub actions scripts show green checks, this is when you
     should address that, before merging the pull request.
6. Only when the PR is merged does the issue get moved into the `Done` column.

As long as you are not done with your contribution to the project, you should always have at least one issue in the `In Progress` column (the thing you are working on to contribute to the team's work.)

# The Kanban board belongs to the team

The staff has pre-populated your Kanban board with a number of issues to help you get started.  However, please be aware of these important points:

* There may be things in this assignment description, or other things that your team needs to get done that are *not* included on the Kanban board.
* As/when you find such things, feel free to *add them to the Kanban board yourself*.

The purpose of the Kanban board is primarily to *serve the team* as a visual representation fo the work in progress.

It is true that since this is a *course*, there is an aspect that you are maintaining the Kanban board for a "grade", as part of an "assignment"&mdash;but the hope is that ultimately, you'll see the intrinsic value of keeping a board like this up-to-date so that the team has way to see what's going on with the project at a glance.


## Repos for team01

Here are the links to the repos and Kanban (project) boards for team01

{% include team01_repos.md %}

For team01, the list of issues is populated by the staff before you start using the Github Actions workflow [`99-team01.yml`](
{{page.starter_repo}}/blob/main/.github/workflows/99-team01.yml); your repo should have exactly {{page.num_issues}} issues. 

<details markdown="1">
<summary markdown="1">
If your Kanban is not yet populated, i.e. you don't see {{page.num_issues}} in the todo column, click the triangle for a tutorial on how to 
populate the Todo column with all of the issues in your repo.
</summary>  

### To populate the `Todo` column with all issue in the repo

BEFORE YOU START: Make sure that no-one else on the team, and no-one on the staff is already doing this!  If more than one team member does this, it makes a big mess.  Use *both* your team slack channel (as well as talking to people live, in person) to coordinate this.

1. Open the Kanban board (Project in Github terms)
2. Click beside the `+` sign where it says `Add issues` under the Todo column as shown in the animation below.
3. Type this symbol: `#`
4. Type the name of your repo (e.g. <tt>{{page.title}}-{{page.sample_team}}</tt>)
5. The name of your repo will pop up.  Click on it.
6. A dialog box will pop up.  At the botton it should say (for example): <tt>Add issues from {{page.github_org}}/{{page.title}}-{{site.qxx}}-{{page.sample_team}}</tt>. Click that.
7. Another pop up will appear titled `Add items to project`.  There will be an checkbox at the top labelled something like `25 most recent items` (the number may vary).  Click this box.
8. Click the green button at bottom right labelled `Add selected items`
9. Now, if there are more items to add, a new set of items will appear.  They will be added in batches of 25 until the last few are added (e.g. `17 most recent items`).  Repeat steps 7 and 8 until there are no more items to add.

This animation illustrates the process:

![add-all-issues](https://github.com/ucsb-cs156/s24/assets/1119017/619c1cb7-256f-4ceb-bb02-b536844b5fc8)


</details>

## Work on your own laptop, not CSIL

You should be working with a Java/Javascript setup on your
own laptop by this point, not on CSIL.

For advice on what to install, see:
* <https://ucsb-cs156.github.io/{{site.qxx}}/info/software.html>

If this presents a difficulty, please contact the instructor ASAP so that some arrangement can be made for your situation.

## Big Picture: what is team01 all about?

We'll be working to create six database tables:

* Articles: for example, blog posts, newspaper articles, etc.
* UCSB Dining Commons Menu Items: food/beverage items offered by UCSB Dining Halls
* Menu Item Reviews: reviews of food/beverage items offered by UCSB Dining Halls
* Help Requests: requests for help, e.g. those on the `#help-lecture-discussion` channel of the course slack
* Recommendation Requests: e.g. requests for letters of rec for grad school, scholarships, jobs
* UCSB Organizations: student orgs at UCSB

There is more information on each of these tables in the assignment.

Then, we'll add API endpoints that allow you to create, read, update and destroy records in each of these database tables.


<details markdown="1">
<summary>
Click the triangle to see more detail about what that looks like on Swagger.
</summary>

### CRUD operations on Swagger

Here's what the CRUD operations look like for the two example database tables in the starter code:

<img width="684" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/4710aff0-bfc4-4f31-ba51-3c8e7801fd9e">

Once you set up your team's `team01` deployment on dokku, you should be able to try this out:
* To create a new record, use the `POST` endpoint
* To see the new record you created, use either of the `GET` endpoints
* To modify a record, use the `PUT` endpoint.
* To delete a record, use the `DELETE` endpoint.

You are encouraged to try these out on the example database tables before starting to work on your own, so that you understand
how the database is supposed to work.

</details>

## The Kanban board contents

You should see {{page.num_issues}} issues on the board in the ToDo column when you start.  From a high-level standpoint, you'll be resolving all of the issues on the Kanban board, which are divided into two types:

* There are {{page.num_top_level_issues}} issues that pertain to the whole project; these are for the entire team to divide up (so about one per person, though the team can divide those up any way they see fit.)
* There are also {{page.num_issues_per_table_alpha}} issues for each of the {{page.num_database_tables_alpha}} database tables: for example, there are {{page.num_issues_per_table_alpha}}  issues that pertain to the `UCSBDiningCommonsMenuItems` table.   Typically, each team member will choose one database table (e.g. `Articles` and then complete  all {{page.num_issues_per_table_alpha}} of the issues pertaining to `Articles`.

### Set up Tasks

These appear only once on the board for the entire team; there are a total of {{page.num_top_level_issues}} them.

| Task |
|------|
| Adjusting the `README.md` with a list of who is working on which table |
| Setting up Github Pages |
| Setting up a Repo with prod deployment on Dokku |
| Setting up a Repo with qa deployment on Dokku |
| Adjusting the links in the README.md for the dokku deployments |
| Submitting the final project on Canvas (this is the *last* thing the team will do) |

### Coding Tasks

These are done by each team member for their database table, so each of these {{page.num_issues_per_table}} issues appears
once for each of the {{page.num_database_tables}} database tables.

| Task | Coding? |
|------|--------|
| Setting up a personal dokku dev instance (no coding) | None: config only |
| Setting up the database table (`@Entity` and `@Repository` class) (code under `/src/main/java`) and setup database migration files (under `src/main/resources/db/migration/changes`)| Under `src/main/java` and `src/main/resources/db/migration/changes`|
| Setting up the POST operation (which creates one database row) and a GET operation to get all rows in the database |  Under `src/main/java` and `src/test/java` |
| Setting up an GET operation to get a single row by its id |  Under `src/main/java` and `src/test/java` |
| Setting up a DELETE operation (to delete a single row by its id) |  Under `src/main/java` and `src/test/java` |
| Setting up a PUT operation (to update a single row by its id) |  Under `src/main/java` and `src/test/java` |

There is more detail both in the instructions below and on the issues themselves about how to proceed.


## It's still a *team* project.

Having said that, it is still the responsibility of the *entire team* to get all the issues for all  {{page.num_database_tables_alpha}}  of the tables completed. So, even if/when you are "finished with the {{page.num_issues_per_table_alpha}} issues for your table", please *still stay in class* and help others on your team, do code reviews, and generally see where you can be helpful.

The time/effort you invest now in helping to build the capacity of your team will pay off later.

* If other members of your team are sincerely putting in effort with an intention to work for the team, but don't have as much coding experience as you, helping those members out is both in your personal best interest, and the best interest of the team.  It is something you can talk about at job interviews; for employers, this is a highly valued trait.
* On the other hand, if there are members of your team that are not really showing up, not following through, etc. *this is the time* to call attention to it, not in a mean or hostile way, but in a supportive, but honest way.  You are encouraged to do as much as you can with friendly but candid discussions inside your team first.  Messages on the team slack channel can be helpful here.   If that doesn't help, then call this to the attention of your team mentor (i.e. the TA/LA assigned to your team, see: <{{page.teams_link}}> for a list), and or the instructor via DMs on Slack.
* If you want to have a private 1-1 chat, that's good too, but please start with a Slack message so that we can keep track of who is telling us what; with sixteen teams (and sometimes 32 or more teams over the course of an academic year) it gets difficult to remember who we talked to about what.


## What you'll do: Process

From a process standpoint, here's how this project works:

1. To start, each of you should clone your team's `team01-teamname` repo, which should already have a Kanban board set up for it.
2. On the team's Kanban board, there should be two types of issues:
   * Ones that are global to the entire team (setup tasks)
   * Ones that pertain to a particular database table
4. First, divide up the set up tasks among the members of the team, and assign each of those to a team member.   Leave them in the "to do" column, though, until you actually start working on the issue.
5. Then, divide up the six database tables among the team members.  I suggest that you do this on your team slack channel in a single post, and then "pin" that post to your channel.

   That post might look something like this:

   ```
   Adam:  Articles
   Brianna: Menu Item Reviews
   Chris:  Help Requests
   Danny: Recommendation Requests
   Erin: UCSB Organizations
   Fay: UCSB Dining Commons Menu Items
   ```

   At this point, whomever was assigned the issue to add the table to the README with the team assignments should be able to get that done.

6. Now look on the Kanban board.  You should find that there are six issues on the Kanban board for your specific database table:

   You should find all of the stories for your database item, and assign them to yourself; but drag *only one* into the In Progress column (and if you are already assigned to one of the set up tasks, don't even drag that one yet)!

   Typically, you should be assigned to only one item at a time in the In Progress column.  The exception is if you drag an item to In Progress, make some progress on it, and then need to stop working on it for a while because you are blocked, or something else urgently needs your attention.  But that should be the exception, not the normal way of doing things.

7. This [YouTube video](https://youtu.be/Shi0kzx-3K4) shows how to locate all of your issues and assign them to yourself.  You are strongly encourage to assign all of the issues pertaining to your database table to yourself (as shown in the video) right from the start; but only drag one issues at a time into the `In Progress` column, so that the column reflects what the team is actually working on.    

8. Now work on your issues as you did in team01; dragging them to "In Review" once they are ready for code review, and to "Done" when they are merged.  Also work on the setup task to which you were assigned.
9. While the project is underway, **every time class meets, you'll start with a standup meeting**.

   While it is optional, many teams also find it helpful to schedule a few standups on slack/zoom or in person outside of class on days the class doesn't meet (one or more of: Fri, Sat, Sun, Mon).

   When all issues are finished, complete the "Submit on Canvas" issue. It may contain a checklist of things to review as you submit.


# Getting started

To get started:

* Clone your team's team01
* Add the <{{page.starter_repo_url}}> repo as a remote called starter
  <p>
  <tt>git remote add starter {{page.starter_repo_url}} </tt>
  </p>
  This is in case there are updates to the starter code that you need to pull from by doing:
  ```
  git pull starter main
  git push origin main
  ```
* Then you are ready to start by making your first branch, something like `Chris-RecRequestTable`
  ```
  git checkout -b Chris-ReqRequestTable
  ```

Also: set up your dev deployment on dokku (see the issue: "(your-database-table) - Create personal dokku dev deployment"

# More details on team01

The rest of the material below is extra background/explanation to help you understand the assignment.

In this team project, our starter code has a frontend and backend, however we are still focusing only on the backend part.  The frontend is a minimal frontend that provides *only a place for us to login with our Google account* so that we can authenticate before doing CRUD operations.

We are focusing on learning these new Spring Boot backend concepts:

* Creating SQL database tables using `@Entity` and `@Repository`
* Creating a `database migration` file for Liquibase migration
* Using the Lombok annotations: `@Data`, `@NoArgsConstructor`, `@Builder`, etc.
* Implementing controller routes for CRUD operations (Created, Read, Update, Destroy)
* Writing unit tests for controller CRUD operations, including the use of:
  - Spring `MockMvc`
  - Mockito methods for creating mocks of repositories and services (`when`, `verify`)
  - the idea of "dependency injection"

In addition, we'll practice further with a few concepts that we touched on in `jpa03`, but may not have fully fleshed out:
- Set up of the documentation via Github Pages
- Working with feature branches, issues, a Kanban board, pull requests, and GitHub actions scripts
- Working with code coverage and mutation testing

## The two database tables in the starting code

Your starter code at <{{page.starter_repo}}> provides Spring Boot code with the ability to do CRUD operations on two database tables:

* `UCSBDates`
* `UCSBDiningCommons`

These tables are set up to be parallel with the data that is available through two public APIs that are provided by UCSB and documented at
<https://developer.ucsb.edu> (though the format is slightly alterered for this assignment.)

The `UCSBDates` tables has four columns, is indexed by a numeric `@Id` field (`private long id;`) and is intended to store data like that shown here:

```json
[
  {
    "id": 1,
    "quarterYYYYQ": "20234",
    "name": "firstDayOfClasses",
    "localDateTime":  "2023-09-28T00:00:00"
  },
  {
    "id": 2,
    "quarterYYYYQ": "20234",
    "name": "lastDayOfClasses",
    "localDateTime":  "2023-12-08T00:00:00"
  }
]
```

The `UCSBDiningCommons` table has six columns, is indexed by a string `@Id` field (`private String code`) and is intended to store data like that shown here:

```json
[
  {
    "name": "Carrillo",
    "code": "carrillo",
    "hasSackMeal": false,
    "hasTakeOutMeal": false,
    "hasDiningCam": true,
    "latitude": 34.409953,
    "longitude": -119.85277
  },
  {
    "name": "Ortega",
    "code": "ortega",
    "hasSackMeal": true,
    "hasTakeOutMeal": true,
    "hasDiningCam": true,
    "latitude": 34.410987,
    "longitude": -119.84709
  }
]
```

## Your task: add CRUD for additional database tables

You'll be adding CRUD operations for six additional database tables; one per team member:

Here are the six tables you'll be adding (one per person).

On the Kanban board, you'll find five issues for each of these tables:

* Add database table (the `@Entity` and `@Repository` classes, no test classes)
* Add `GET` endpoint to list all database records, and a `POST`  endpoint to create new database records, plus tests (this, and all of the rest, are done in the Controller and Controller test classes)
* Add `GET` endpoint to get a single database row by its id. (plus tests)
* Add `PUT` endpoint to update a single database row by its id. (plus tests)
* Add `DELETE` endpoint to delete a single database row by its id. (plus tests)

You should choose one of these database tables, and then assign yourself the five issues that pertain to that database table.

As you look over these, note that some of them use an *autogenerated `Long`* as the `@Id` field, while others use a different field
already in the data.  That may not make any sense to you right now, but there is an explanation immediately following the list of database tables.
We'll also go over this in lecture.

### (1) UCSB Dining Commons Menu Item

<details markdown="1">

<summary>
For details on the UCSB Dining Commons Menu database table, click the triangle
</summary>

The `UCSBDiningCommonsMenuItems` table will use an autogenerated `Long` as its `id` field, and will have these additional columns:

* `String diningCommonsCode`
* `String name`
* `String station`

Here are some sample values:

| id | diningCommonsCode | name | station |
|----|-------------------|------|---------|
| 1  | ortega            | Baked Pesto Pasta with Chicken | Entree Specials |
| 2  | ortega            | Tofu Banh Mi Sandwich (v)  | Entree Specials |
| 3  | ortega            | Chicken Caesar Salad  | Entrees |
| 5  | portola            | Cream of Broccoli Soup (v) | Greens & Grains |

</details>

### (2) UCSB Organization

<details markdown="1">
<summary>
For details on the UCSB Organization database table click the triangle
</summary>


The `UCSBOrganizations` table will use the `orgCode` field (a String) as its `@Id` field, and will have these columns:

* String orgCode
* String orgTranslationShort
* String orgTranslation
* boolean inactive

Here are some sample values:

| orgCode | orgTranslationShort | orgTranslation | inactive |
|----|-------------------|------|---------|
| ZPR | ZETA PHI RHO | ZETA PHI RHO | false |
| SKY | SKYDIVING CLUB | SKYDIVING CLUB AT UCSB | false |
| OSLI | STUDENT LIFE | OFFICE OF STUDENT LIFE | false |
| KRC | KOREAN RADIO CL | KOREAN RADIO CLUB | false |

</details>


### (3) Recommendation Request

<details markdown="1">
<summary>
For details on the Recommendation request database table click the triangle
</summary>


The `RecommendationRequests` table will use an autogenerated  `Long` as its `@Id` field, and will have these additional fields:

* String requesterEmail
* String professorEmail
* String explanation
* LocalDateTime dateRequested
* LocalDateTime dateNeeded
* boolean done


Here are some sample values:

| id | requesterEmail | professorEmail | explanation | dateRequested | dateNeeded | done |
|-|-|-|-|-|-|-|
| 1 | cgaucho@ucsb.edu | phtcon@ucsb.edu | BS/MS program | 2022-04-20 | 2022-05-01 | false |
| 2 | ldelplaya@ucsb.edu | richert@ucsb.edu | PhD CS Stanford | 2022-05-20 | 2022-11-15 | false |
| 3 | ldelplaya@ucsb.edu | phtcon@ucsb.edu | PhD CS Stanford | 2022-05-20 | 2022-11-15 | false |
| 4 | alu@ucsb.edu | phtcon@ucsb.edu | PhD CE Cal Tech | 2022-05-20 | 2022-11-15 | false |

</details>


### (4) Menu Item Review

<details markdown="1">
<summary>
For details on the Menu Item Review database table click the triangle
</summary>


The `MenuItemReviews` table will use an autogenerated  `Long` as its `@Id` field, and will have these additional fields:

* Long itemId (the id in the `UCSBDiningCommonsMenuItems` table of a menu item)
* String reviewerEmail (the email of the reviewer)
* int stars (0 to 5 stars)
* LocalDateTime dateReviewed
* String comments

**Pay attention to this important detail** because students doing this table often get this wrong: there are two id values: `id` and `itemId`.
* The
`id` value uniquely identifies a review.  For example:
  * "I love the apple pie; so tasty!" might be a review with id `47`
  * "I hate the apple pie; tastes like cardboard" might be a review with id `53`
* The `itemId` is different. It identifies what item is being reviewed.  It refers to the id in *a different table*, i.e. the `UCSBDiningCommonsMenuItems` table.

For example, if that other table (`UCSBDiningCommonsMenuItems`) has an entry for the Apple Pie at Ortega like this:
```json
{
  "id": 7,
  "diningCommonsCode": "ortega",
  "name": "Apple Pie",
  "station" : "Desserts"
}
```

then this table, the `MenuItemReviews` table might have include these two entries:
```json
[
  {
    "id": 47,
    "itemId": 7,
    "reviewerEmail" : "cgaucho@ucsb.edu",
    "stars": 5,
    "comments": "I love the Apple Pie"
  },
  {
    "id": 53,
    "itemId": 7,
    "reviewerEmail" : "ldelplaya@ucsb.edu",
    "stars": 0,
    "comments": "I hate the Apple Pie"
  },
]
```

Here are some sample values:

| id | itemId | reviewerEmail | stars | dateReviewed | comments |
|-|-|-|-|-|-|
| 1 | 27 | cgaucho@ucsb.edu | 3 | 2022-04-20 | bland af but edible I guess |
| 2 | 29 | cgaucho@ucsb.edu | 5 | 2022-04-20 | best veggie pizza ever |
| 3 | 29 | ldelplaya@ucsb.edu | 0 | 2022-04-21 | not tryna get food poisoning, but if I were this would do it|

</details>


### (5) Help Request

<details markdown="1">

<summary>
For details on the Help Request database table click the triangle
</summary>


The `HelpRequests` table will use an autogenerated `Long` as its `@Id` field, and will have these additional fields:

* String requesterEmail
* String teamId
* String tableOrBreakoutRoom
* LocalDateTime requestTime
* String explanation
* boolean solved


Here are some sample values:

| id |  requesterEmail | teamId | tableOrBreakoutRoom | requestTime | explanation | solved  |
|-|-|-|-|-|-|-|
| 1 | cgaucho@ucsb.edu | s22-5pm-3 | 7 | 2022-04-20T17:35 | Need help with Swagger-ui | false |
| 2 | ldelplaya@ucsb.edu | s22-6pm-3 | 11 | 2022-04-20T18:31 | Dokku problems | false |
| 3 | pdg@ucsb.edu | s22-6pm-4 | 13 | 2022-04-21T14:15 | Merge conflict  | false |

</details>


### (6)  Articles

<details markdown="1">

<summary>
For details on the Articles database table click the triangle
</summary>


The `Articles` table will use an autogenerated `Long` as its `@Id` field, and will have these additional fields:

* String title
* String url
* String explanation
* String email (of person that submitted it)
* LocalDateTime dateAdded


Here are some sample values:

| id | title | url | explanation | email | dateAdded |
|-|-|-|-|-|-|
| 1 | Using testing-playground with React Testing Library | https://dev.to/katieraby/using-testing-playground-with-react-testing-library-26j7 | Helpful when we get to front end development | phtcon@ucsb.edu | 2022-04-20 |
| 2 | Handy Spring Utility Classes | https://twitter.com/maciejwalkowiak/status/1511736828369719300?t=gGXpmBH4y4eY9OBSUInZEg&s=09 | A lot of really useful classes are built into Spring | phtcon@ucsb.edu | 2022-04-19|

</details>


## Adding a database table

To add an SQL database table in Spring Boot, you typically add two files:

* A Java class that is annotated with `@Entity`; each instance of this class represents a single row in the database table.  Name should be a singular noun.  Add the file in the same directory/package as the other `@Entity` classes.
* A Java class that is annotated with `@Repository`; each instance of this class represents a database table.  Name should be the Entity name followed by `Repository`. Add the file in the same directory/package as the other `@Repository` classes.

In addition, you'll need to add a `database migration` file in order to create the table in the database. This is done by adding a file in the directory `src/main/resources/db/migration/changes` that describes the changes to the database.

There is more information in the sections below as well as on the Kanban Board issues themselves to guide you through the process.

### What is an `@Entity` class?

Every database table starts with an `@Entity class that defines what one row of the table contains.

For the most part think of it as a "plain old java object" that just has the basic features of a class:
* private data members for each field (column)
* getters, setters, constructor, `toString`, `hashCode`, and `equals` (we use the `@Data` annotation of Lombok to generate these automatically)

We typically use singular nouns for the entity class, e.g. `UCSBDate`, `UCSBDiningCommons`


### Two types of id values for an `@Entity` class

In Spring, each `@Entity` class has a *primary key* marked with the annotation `@Id`.

This value must be unique in the database table; no two rows can have the same primary key.

There are two strategies for dealing with this requirement:

1. Autogenerated ids, which start at `1` and then increment automatically.   The `UCSBDate` entity in the starter code is an example.  The code looks liek this:

   ```
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private long id;
   ```

   As an aside: you may wonder what happens when we run out of numbers.  Since these `id` numbers are typically stored in a 64-bit Java `Long`, the maximum number is: `9,223,372,036,854,775,807L`.
   * If you stored 1 Million records per second, 24 hours a day, 7 days a week, it would take you [292 thousand years](https://www.google.com/search?q=9%2C223%2C372%2C036%2C854%2C775%2C807+%2F+1000000+%2F+60+%2F+60+%2F+24+%2F+365&rlz=1C5CHFA_enUS888US889&sxsrf=APq-WBtGUMS1ceirZg3u9OrjxeaktzoWaw%3A1643567397963&ei=Jdn2Yen0Oc3EkPIP3du9gA4&ved=0ahUKEwipm63Xjdr1AhVNIkQIHd1tD-AQ4dUDCA4&uact=5&oq=9%2C223%2C372%2C036%2C854%2C775%2C807+%2F+1000000+%2F+60+%2F+60+%2F+24+%2F+365&gs_lcp=Cgdnd3Mtd2l6EANKBAhBGAFKBAhGGABQ4w1Y9A9gxxZoAXAAeACAAZcBiAGYA5IBAzAuM5gBAKABAcABAQ&sclient=gws-wiz) to cycle through this many id numbers.
   * That's also over 18,000 records for every square meter on the face of the planet earth.  Not sure what database table needs that many records.


2. Using a value already in the data that is inherently unique.  For example, we might use perm number as an id field for a table of students.

   The `UCSBDiningCommons` entity in the sample code shows an example, where the `code` field is guaranteed to be unique; no two dining commons
   will have the same `code` value:

   ```
   @Id
   private String code;
   ```

### The `@Entity` class in more detail

<details markdown="1">
<summary markdown="1">
Click the triangle for more details on creating an `@Entity` class
</summary>

For example of `@Entity` classes, consult these files in the starter code:

* [UCSBDate.java](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/main/java/edu/ucsb/cs156/example/entities/UCSBDate.java)
* [UCSBDiningCommons.java](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/main/java/edu/ucsb/cs156/example/entities/UCSBDiningCommons.java)


You'll see that these files have a particular structure, with these annotations:

UCSBDate.java:

```
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity(name = "ucsbdates")
public class UCSBDate {
```

UCSBDiningCommons.java:

```
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity(name = "ucsbdiningcommons")
public class UCSBDiningCommons {
```

What do these annotations do?

* `@Data` is an annotation from a package called [Lombok](https://projectlombok.org/).  Lombok automatically generates code for some of the tedious things
   that can be automated: getters, setters, `toString`, `hashCode` and `equals`.  It also implements a constructor for all "required arguments", though that one is not always very convenient to use if we have lots of fields.
* `@AllArgsConstructor` and `@NoArgsConstructor` are additional [Lombok](https://projectlombok.org/) annotations that define additional constructors for us.  The  `@NoArgsConstructor` is particularly important, since it's a requirement of many pieces of Java Software that classes implement a no-args constructor (it's part of what it means to be a *Java Bean*.)
* `@Builder` create a class and some methods that make it easy to build objects with a syntax like this:
  ```
  UCSBDiningCommons commons = UCSBDiningCommons.builder()
        .name("Carrillo")
        .code("carrillo")
        .hasSackMeal(false)
        .hasTakeOutMeal(false)
        .hasDiningCam(true)
        .latitude(34.409953)
        .longitude(-119.85277)
        .build();
  ```
* `@Entity(name = "ucsbdiningcommons")` is the annotation that says this will be a row in a database table; the parameter sets the name of the table.  We typically use all lowercase plural nouns here, with no hyphens or underscores.

With these annotations in place, it's a simple matter of defining private fields for each of the columns in the database table.

</details>


### What is a `@Repository` class?

A second part of setting up a database table in Spring is creating a `@Repository` class.

Note: do not confuse this use of the english word "repository" with the concept of a "repository
in Git/Github.  The english word "repository" means "a container in which things are stored", and, regrettably, it was chosen, separately, by both the authors of git and the authors of Spring, to mean two very different kinds of collections.

In Spring, a `@Repository` class is an abstraction for the database table itself, i.e. an instance of a `@Repository` class represents the entire table of data (all of the rows and columns).

We typically name a Repository class with a name such as `___Repository` where the blank is filled in with the name of the `@Entity`, e.g. instances of an `@Entity` class named `UCSBDate` would be stored in a `UCSBDateRepository`.

It is important to understand that when you set up an `@Repository` class, the types that you pass to `CRUDRepository` as shown below must match the type of the `@Entity` and the type of the `@Id` field, as in these examples:

1. `UCSBDateRepository` uses `CrudRepository<UCSBDate, Long>` because the `@Id` field of `UCSBDate` is a `Long`:

    ```
    @Repository
    public interface UCSBDateRepository extends CrudRepository<UCSBDate, Long> {
    ...
    ```

2. `UCSBDiningCommonsRepository` uses `CrudRepository<UCSBDate, String>` because the `@Id` field of `UCSBDiningCommons` is a `String`:

    ```
    @Repository
    public interface UCSBDiningCommonsRepository extends CrudRepository<UCSBDiningCommons, String> {
    ...
    ```

As you look over your database table description above, take note of which of these applies to you.  It's important to choose the correct kind of code as your model when creating your own `@Entity`, `@Repository` and `Controller (@RestController)` classes:

* Choose `UCSBDate` as your example to follow when the id field is going to be an integer, e.g. in the cases of `UCSBDiningCommonsMenuItems`,  `RecommendationRequests`, `MenuItemReviews`, `HelpRequests`, `Articles`
* Choose `UCSBDiningCommons` when the id field is going to be a unique string that's part of the data, e.g. in the cases of `UCSBOrganizations`.

### The `@Repository` class in more detail

<details markdown="1">
<summary markdown="1">
Click the triangle for more details on creating an `@Repository` class
</summary>

For the repository class, see the examples:

* [UCSBDateRepository](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/main/java/edu/ucsb/cs156/example/repositories/UCSBDateRepository.java)
* [UCSBDiningCommonsRepository](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/main/java/edu/ucsb/cs156/example/repositories/UCSBDiningCommonsRepository.java)


Note that these are both `interface` files and not classes.

Normally, if you  create an `interface`, you also need to create a  class that implements that interface.

However, Spring Boot will *automatically generate the code for you*.

In addition, if you need certain kinds of queries, you can specify methods in your interface to implement those queries.

The rules for translating method naming conventions into
generated code are complicated: we will not go over all of them in lecture, and you are not expected to memorize or learn them all, and
*you probably won't need that for this assignment* (though you may need to know it later in the course.)

In any case, if/when you do need to understand that, here is some documentation is here to help get you started: <https://docs.spring.io/spring-data/jdbc/docs/current/reference/html/#jdbc.query-methods>

</details>

### What is a `Database Migration` file?

The third part of setting up your new table is a creating a *database migration file*.

In Liquibase, a migration file describes how a change should be applied to a given table. It is used on live databases where the data cannot be erased between versions and need to be under continuous integration.

* Each file contains multiple `changeSets`.
* Each change set has an `id` such as `Articles-1`.  The `id` is typically the name of the `@Entity` class followed by a number; these numbers just start at 1 and increase with each change set. , -the number of the `changeSet` in the file, Example: Articles-1.
* In addition to that each `changeSet` has an `author`, some `preconditions` and most important, a list of `changes`.

### The `Database Migration` file in more detail

<details markdown="1">
<summary markdown="1">
Click the triangle for more details on creating an `Database Migration` file
</summary>

For the Database Migration files, see the examples:

* [UCSBDate]({{page.starter_repo}}/blob/main/src/main/resources/db/migration/changes/UCSBDates.json)
* [UCSBDiningCommons]({{page.starter_repo}}/blob/main/src/main/resources/db/migration/changes/UCSBDiningCommons.json)

We describe the database changes in the `changes` section of the files linked to above.

Here's the code for one of those, namely the database migration for file `UCSBDates`:

```json
  {
    "databaseChangeLog": [
      {
        "changeSet": {
          "id": "UCSBDates-1",
          "author": "YourGitHubID",
          "preConditions": [
            {
              "onFail": "MARK_RAN"
            },
            {
              "not": [
                {
                  "tableExists": {
                    "tableName": "UCSBDATES"
                  }
                }
              ]
            }
          ],
          "changes": [
            {
              "createTable": {
                "columns": [
                  {
                    "column": {
                      "autoIncrement": true,
                      "constraints": {
                        "primaryKey": true,
                        "primaryKeyName": "UCSBDATES_PK"
                      },
                      "name": "ID",
                      "type": "BIGINT"
                    }
                  },
                  {
                    "column": {
                      "name": "LOCAL_DATE_TIME",
                      "type": "TIMESTAMP"
                    }
                  },
                  {
                    "column": {
                      "name": "NAME",
                      "type": "VARCHAR(255)"
                    }
                  },
                  {
                    "column": {
                      "name": "QUARTERYYYYQ",
                      "type": "VARCHAR(255)"
                    }
                  }
                ],
                "tableName": "UCSBDATES"
              }
            }
          ]
        }
      }
    ]
  }
```

The file is a JSON file that contains a single object with a single attribute `databaseChangeLog` which is an array of `changeSet` objects. These `changeSet` objects describe the sets of `changes` that need to be made to the database, as well as any `preConditions` that decide whether or not to apply the `changeSet`.

It is important that the `tableName` attribute of the `change` matches the `@Entity(name = YOURTABLENAME)` that you provided during the creation of the `@Entity` Class.

From this point forward, any time you make a change to the original entity you must add a new `changeSet` to the `databaseChangeLog` array with a new `id` value. The `changes` section of the `changeSet` will describe the changes that need to be made to the database in order to match the new `@Entity` class.

All changes described in these files will be applied everytime you start the app with `mvn spring-boot:run`. However if the changes were already applied they will not be applied again.

For more information on Liquibase you can visit <https://ucsb-cs156.github.io/topics/liquibase/>

Note that these files only describe the creation of a table, however on the real world you will most likely be describing changes like adding a new column or deleting an existing table etc. for all possible changes you can make to the database using the changes sets you can see <https://docs.liquibase.com/change-types/home.html>

### About that `UCSBDATES_PK`

Here's what that means, and what you should do in your code: 
* *Constraints* are rules that a database table is required to follow
* When you specify that a certain field is a *primary key*, one of the aspects of being a primary key is that this field can have no duplicate values in the table.
* In a liquibase specification, each *constraint* has to be given a unique name; unique across the entire database (not just this table, but all tables in the database).
* We suggest the following strategy: Since database tables have to be unique, and a table can only have one primary key, use the name <tt><i>NAME_OF_TABLE</i>_PK</tt>, for example:
  * <tt>RESTAURANTS_PK</tt>
  * <tt>UCSBDININGCOMMONSMENUITEMS_PK</tt>
  * etc.

That is a more sustainable naming convention.

### CamelCase vs. Snake Case

One unexpected thing that you will likely encounter: when a database field is named with  a `camelCaseTypeVariable` such as `diningCommonsCode`, when you put this variable
into the database migration file, you need to convert it to `SNAKE_CASE` like this: `DINING_COMMONS_CODE`. 

If you don't do this, you'll likely run into errors when you try to use the `POST` method and store a database record in the table; it may look something like this:

```
org.h2.jdbc.JdbcSQLSyntaxErrorException: Column "UCMI1_0.DINING_COMMONS_CODE" not found;
```

You may be wondering why this is the case.  

The root cause is related to the fact that  SQL, the language used by the underlying database management system, is *case insensitive*, meaning
that `diningCommonsCode`, `DININGCOMMONSCODE` and `diningcommonscode` are all treated as identical in SQL.

Because of this, the designers of Hibernate, one of the layers on which Spring is built, used a strategy of mapping camel-case to snake case as described [here](https://thorben-janssen.com/naming-strategies-in-hibernate-5/#camelcasetounderscoresnamingstrategy-in-hibernate-554).

It is possible to override this behavior, but this is the default.

</details>


## More Hints

Here are some common problems that folks may run into.

<details markdown="1">
<summary markdown="1">
Test for `GET` by id fails, throwing `EntityNotFound` exception
</summary>

If you get a failure on this test: 

`test_that_logged_in_user_can_get_by_id_when_the_id_does_not_exist`

Check that your Controller extends `ApiController`

* Incorrect: `public class UCSBDiningCommonsMenuItemController {`
* Correct: `public class UCSBDiningCommonsMenuItemController extends ApiController {`

Here's why: The class `ApiController` includes this method, which is then inherited when you extend `ApiController`:

```java
 /**
   * This method handles the EntityNotFoundException.
   * @param e the exception
   * @return a map with the type and message of the exception
   */
  @ExceptionHandler({ EntityNotFoundException.class })
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public Object handleGenericException(Throwable e) {
    return Map.of(
      "type", e.getClass().getSimpleName(),
      "message", e.getMessage()
    );
  }
```

The code in most of our controllers relies on this exception handler to return an object of the correct type (a JSON object that contains `type` and `message` fields describing the exception).   If this is not in place, the controller will simply throw an exception, which is not what the test code is looking for.

</details>

We may add more hints about working with the team01 code as we discover what
problems students run into.

In the meantime, use the `#help-team01` channel to ask questions.

## A note about open source

Note that this assignment is open source.

The repos are public *on purpose*.
* You are encouraged to consult with one another within and across teams where it helps
  your learning.
* That does not mean that you can cheat by just copying code from another team.
* You are *not* permitted to just look at another team's code, even though you "can".
* It does mean that you should try to solve the problems as best you can, but you may
  consult with members of other teams as you work.  In that context, you may look at
  other team's code.

This isn't hard.   You all *know* when you are are looking at other team's work to
try to learn, versus when you are just looking at it as a shortcut to learning.

I'm trusting you to do the right thing.   This is practice for when, later on, you are
all working on different assignments.


# Details: Controller methods and tests

The examples for the Controllers and Controller Tests are in these files:

* Controllers:
  - [UCSBDatesController.java](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/main/java/edu/ucsb/cs156/example/controllers/UCSBDatesController.java)
  - [UCSBDiningCommonsController.java](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/main/java/edu/ucsb/cs156/example/controllers/UCSBDiningCommonsController.java)
* Controller Tests:
  - [UCSBDatesControllerTests.java](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/test/java/edu/ucsb/cs156/example/controllers/UCSBDatesControllerTests.java)
  - [UCSBDiningCommonsControllerTests.java](https://github.com/{{page.github_org}}/STARTER-team01/blob/main/src/test/java/edu/ucsb/cs156/example/controllers/UCSBDiningCommonsControllerTests.java)

You should be able to find the code you need for each of the methods, and use it as a model to create the code for your database table.

If you need additional guidance, ask on the `#help-team01` channel, and we'll try to steer you in the right direction.

# When you are done

When all branches are merged to main, all tasks on Kanban board in the done column, please submit on Canvas.

There is no Gradescope autograder for team01; it will be graded manually.

## Video Resources

| Topic | Video | Length |
|-------|-------|--------|
| (1) Set up dev dokku deployment | <https://youtu.be/pW1LWgu3iuk> | 29 minutes |
| (2) Create database table | <https://youtu.be/KHAKnngUyeY> | 47 minutes |
| (3) Create Controller, `GET /all`  and `POST` | <https://youtu.be/XBCJcRAsZtQ> | 1 hour 3 minutes | 
| (4) Add `GET` by id to Controller | <https://youtu.be/8vDoFSdblLE> | 23 minutes |
| (5) Add `PUT` (edit/update) to Controller | <https://youtu.be/2Iy9TShGURk> | 36 minutes |
| (6) Add `DELETE` (edit/update) to Controller | <https://youtu.be/whu7Nei6zTM> | 20 minutes |

Total running time: 3 hours, 38 minutes.


# Instructor Resources


<details markdown="1">
<summary>
Click the triangle for a list of tasks the instructor should do prior releasing this lab.
</summary>

* Create team01 repos using the github actions in <https://github.com/ucsb-cs156-f26/membership-scripts>
  * public
  * team access admin
  * signed commits
* Set up starter code in the course organization, and update links
* Change the START_DATE and END_DATE in the STARTER-team01 repo in workflow 82!
* Create a Canvas assignment for team01; update the due dates and publish it
* Create projects for all of the groups. The best way is to create a Template that
  has precisely the setup you want (i.e. the columns, etc.) and then manually create the
  team kanban boards.  There is not yet an API that will create the project with a precise
  configuration of columns, etc. so this is still the easiest way.  Make sure the projects
  are named with the same exact names as the repos; this makes a later step easier.
* Then, update `_config.yml` for the website with the project numbers for team01.  This causes the table of links in this lab to render properly.
* Then, in <https://github.com/ucsb-cs156-f26/membership-scripts>, there is a Github Action that will 
  * Link the project to the repo
  * Set the permission for the project properly
* Double check that the kanban boards and repos are set up and have the correct permissions.

* Make sure the app <{{page.demo_deployment}}> is up and running, and is sync'd with the starter code:

  i.e, on dokku-00 for example, do:

  <pre>
  dokku git:sync team01 https://github.com/{{page.github_org}}/PRIVATE-team01 main
  dokku ps:rebuild team01
  </pre>

* Proofread the instructions in this file, and request that the staff (TAs/LAs do also)
* Consider assigning at least one TA/LA (preferably the one with the least prior experience with the course) to complete the lab in it's entirety to debug the starter code and instructions

The next step was probably already done in team01, but just in case: 

* Be sure that the organization settings are set like this, in, for example, <https://github.com/organizations/{{page.github_org}}/settings/actions>

  This is needed so that the github actions scripts have write access to the directory.

  <img width="943" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/de8c9efe-7bcd-48a1-97d5-0c0aa68a68db">


  This setting is probabaly also a good idea:

  <img width="972" alt="image" src="https://github.com/ucsb-cs156/f23/assets/1119017/99fead23-d9d0-4373-a435-466c5ef9e752">

### If setting up starter code and Kanban boards for students

**Clone all repos**: change directory into a directory where you can clone all of the repos like this:

```
for team in {01..16}
do
  echo "Setting up code for $team"
  git clone git@github.com:ucsb-cs156-f26/team01-f26-${team}.git
done
```

**Add starter remotes**: use a loop like this to add the starter remotes:
```
for team in {01..16}
do
  echo "Adding starter remote for $team"
  cd team01-f26-${team}
  git remote add starter https://github.com/ucsb-cs156-f26/STARTER-team01
  cd ..
done
```

**First time pull from starter**: use a loop like this to pull in the starter code and push to main

```
for team in {01..16}
do
  echo "pull from starter for $team"
  cd team01-f26-${team}
  git pull starter main
  git push origin main
  cd ..
done
```

**Subsequent pulls from starter**: use a loop like this to pull in updates to the starter code:

```
for team in {01..16}
do
  echo "pull from starter for $team"
  cd team01-f26-${team}
  git checkout main
  git pull origin main
  git pull starter main
  git push origin main
  cd ..
done
```


## For f26

* Consider updating the issues in 99-team01.yml to guide the students through branch hygeine.  Otherwise, they are likely to make one big branch and one big PR for the entire project.

</details>


