---
description: "Configuration of proj-courses dev deployment"
title: jpa05-proj-courses
nav_order: 100
parent: lab/jpa05
layout: default
---

# {{page.title}} - {{page.description}}


## Step 2: Configure your app for localhost as documented in the README.md

In this step, you are configuring your app to run on localhost.  This consists mainly 
of:
* Copying `.env.SAMPLE` to `.env`
* Filling in various values in the `.env` as explained below.

Two values you will NOT need to set for this assignment are:
* `CHROMATIC_PROJECT_TOKEN` (we'll need this later, but not now)
* `MONGODB_URI` (we'll need to set this on dokku, but not localhost)

First, complete step 1 of oauth setup here:
* <https://github.com/ucsb-cs156/proj-courses/blob/main/docs/oauth.md>

Next, follow the steps here to configure a UCSB API key:
* <https://ucsb-cs156.github.io/topics/apis/apis_ucsb_developer_api.html>

Open *two separate terminal windows*, each of which has the directory where you cloned the repo as the current directory.

* In the first window, start up the backend with:
  ``` 
  mvn spring-boot:run
  ```
* In the second window, start up the frontend with:
  ```
  cd frontend
  nvm install 20.17.0
  nvm use 20.17.0
  npm install  # only on first run or when dependencies change
  npm start
  ```

A window will pop up with the frontend running on port 3000, but this is not the address you want.  You'll see this in the browser:

<img width="489" height="61" alt="image" src="https://github.com/user-attachments/assets/ab305d5e-339a-4c77-b9b9-08e1e589210c" />

Click on the link to <http://localhost:8080>, and you should see the app running.

Try logging in, and make sure you can log in successfully.

Also try exploring the features of the app a bit.

You'll see that you can change the start and end quarters for the menus by changing the values of `START_QTR` and `END_QTR` in your `.env` file.  The first four digits are the year, and the last digit is the quarter (1 for winter, 2 for spring, 3 for summer and 4 for fall.)

When you're satisfied that the application works, you can use Control-C to shut down both the frontend and backend, and move on to the next step: deploying on dokku.

## Step 3: Configure your app to run on Dokku
Next, you need to create a personal dokku deployment so that you can test future PRs during the legacy code project.

Start by logging in on the dokku machine that corresponds to your team number.

Create a dokku app called `courses-dev-yourGithubUsername` (for example, `courses-dev-cgaucho`) following the steps at the link below.  Be sure to include the MongoDB step.

* <https://ucsb-cs156.github.io/topics/dokku/deploying_an_app.html>


## Return to the main instructions

Please return to the main instructions 
for information on submitting.
