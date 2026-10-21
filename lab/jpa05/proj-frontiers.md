---
description: "Configuration of proj-frontiers dev deployment"
title: jpa04-proj-frontiers
nav_order: 100
parent: lab/jpa04
layout: default
---

# {{page.title}} - {{page.description}}


## Step 2: Configure your app for localhost as documented in the README.md

### 2a: Google OAuth Setup

Assuming that you have set up a project in the Google Developer Console and set up an OAuth Consent Screen for your project (which should have been done in `jpa03`), you will just need to create a set of OAuth credentials (`GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` values) using Steps 1-4 of these instructions: [Oauth Google Setup](https://ucsb-cs156.github.io/topics/oauth/oauth_google_setup.html) 

**NOTE:** The name of your Dokku app for `jpa04` will be
* `frontiers-dev-yourGithubUsername`

So your first Dokku redirect URI will be:
* <tt>http://localhost:8080/login/oauth2/code/google</tt>

And your second Dokku redirect URI will be:
* <tt>https://<b><i>frontiers-dev-yourGithubUsername</i></b>.dokku-<b><i>xx</i></b>.cs.ucsb.edu/login/oauth2/code/google</tt>

where <i>xx</i> is your team number.

Then, complete Step 1 in [oauth.md](https://github.com/ucsb-cs156/proj-frontiers/blob/main/docs/oauth.md) (set up `.env` values for `localhost`, including `ADMIN_EMAILS`)

### 2b: Github App Setup

Now, you need to follow the additional steps in this file to setup Github credentials before continuing.

* <https://github.com/ucsb-cs156/proj-frontiers/blob/main/docs/github-app-setup-localhost.md>


### 2c: Launch your application

* Open *two separate terminal windows*  
* In the first window, start up the backend with:
  ``` 
  mvn spring-boot:run
  ```
* In the second window:
  ```
  cd frontend
  nvm install v22.18.0
  nvm use v22.18.0
  npm install  # only on first run or when dependencies change
  npm start
  ```

Then, the app should be available on <http://localhost:8080>. Test that Oauth was set up properly by logging in. 


## Step 3: Configure your app to run on Dokku


### 3a: Creating and configuring your Dokku app 

You will need to create a personal dokku deployment so that you can test future PRs during the legacy code project. This is a quick guide to setting up a `proj-frontiers` dokku instance that assumes you are already familiar with the basic operation of dokku, and just need a "cheat sheet" to get up and running quickly. 

First, log in to your dokku machine--ssh into csil, then dokku ([Login instructions](https://ucsb-cs156.github.io/topics/dokku/logging_in.html)). 

The lines in the instructions where you need to modify something are marked with the comment: `# modify this`

* The other lines you can copy/paste as is, except for changing `frontiers-dev-yourGithubUsername` to your app name

```
# Create app
dokku apps:create frontiers-dev-yourGithubUsername

# Create and link postgres database
dokku postgres:create frontiers-dev-yourGithubUsername-db
dokku postgres:link frontiers-dev-yourGithubUsername-db frontiers-dev-yourGithubUsername --no-restart

# Modify dokku settings
dokku git:set frontiers-dev-yourGithubUsername keep-git-dir true

# Set config vars
dokku config:set --no-restart frontiers-dev-yourGithubUsername PRODUCTION=true
dokku config:set --no-restart frontiers-dev-yourGithubUsername GOOGLE_CLIENT_ID=get-value-from-google-developer-console # modify this
dokku config:set --no-restart frontiers-dev-yourGithubUsername GOOGLE_CLIENT_SECRET=get-value-from-google-developer-console # modify this

# Set SOURCE_REPO to the project repo (modify the url)

# This is for the link in the footer, and for the link to currently deployed branch in /api/systemInfo
dokku config:set --no-restart frontiers-dev-yourGithubUsername SOURCE_REPO=https://github.com/ucsb-cs156/proj-frontiers

# Set ADMIN_EMAILS to staff emails and team emails
dokku config:set --no-restart frontiers-dev-yourGithubUsername ADMIN_EMAILS=list-of-admin-emails # modify this
```

### 3b: Configuring your Dokku App as a Github App

Now, you need to follow the additional steps in this file to setup Github credentials before continuing.

* <https://github.com/ucsb-cs156/proj-frontiers/blob/main/docs/github-app-setup-dokku.md>

### 3c: Syncing app with Github and Deploying on Dokku.

Now follow these steps to sync your app with Github and deploy it on Dokku

```
# git sync for first deploy (http)
dokku git:sync frontiers-dev-yourGithubUsername https://github.com/ucsb-cs156/proj-frontiers main  # modify this 
dokku ps:rebuild frontiers-dev-yourGithubUsername

# Enable https
dokku letsencrypt:set frontiers-dev-yourGithubUsername email yourEmail@ucsb.edu # modify email
dokku letsencrypt:enable frontiers-dev-yourGithubUsername

# rebuild again
dokku ps:rebuild frontiers-dev-yourGithubUsername
```

Your app should now be running at <tt>https://frontiers-dev-<i>yourGithubUsername</i>.dokku-<i>xx</i>.cs.ucsb.edu</tt>. Make sure that you are able to log in.  

If you have any issues with configuring your Dokku app, see the more detailed instructions: [Deploying a Dokku App](https://ucsb-cs156.github.io/topics/dokku/deploying_an_app.html)

Full documentation: [Dokku Setup](https://ucsb-cs156.github.io/topics/dokku/)

## Return to the main instructions

Please return to the main instructions 
for information on submitting.
