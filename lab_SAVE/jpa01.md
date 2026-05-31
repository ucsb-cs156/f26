---
description: Spring Boot Hello World
assigned: 2024-10-03
due: 2024-10-08 23:59
layout: default
title: jpa01
nav_order: 100
ready: false
layout: default
parent: lab
course_org: https://github.com/ucsb-cs156-f26
course_org_name: ucsb-cs156-f26
starter_repo: https://github.com/ucsb-cs156-f26/STARTER-jpa01
software: https://ucsb-cs156.github.io/f26/info/software.html
install_check: https://ucsb-cs156.github.io/f26/info/install_check.html
canvas_link: https://ucsb.instructure.com/courses/25659/assignments/348156
teams_link: "<https://bit.ly/cs156-f26-teams>"
---

{% include drop_down_style.html %}

# {{page.title}} - {{page.description}}

Canvas Link: <{{page.canvas_link}}>

See Canvas for due dates.

## Individual lab, but you may help one another

This is an **individual** lab on the topic of Java web apps.

You may cooperate with one or more pair partners from your team to help in debugging and understanding the lab, but each person should complete the lab separately for themselves.

## Ask for help on `#help-jpa01`

There should be a slack channel called  `#help-jpa01`  where you can ask questions about this assignment.
Check that channel first to see if your question has already been answered.

## What is this lab about?

Like jpa00, this lab is a basic "Hello World" lab, but this time for a simple web application.

You'll run your web application in two place:
* on your local computer (we call this *running on localhost*)
* on an actual web server reachable from any browser connected to the internet

For running on the actual web, we'll be using machines with the following hostnames; the machine you use is determined by which team you are on.

{% include dokkus.md %}

## Step 0: Make sure you can log in to dokku

To login in to your dokku server, you must *first* login to `csil.cs.ucsb.edu`.

To log in to `csil.cs.ucsb.edu`, use ssh like this:

```
ssh username@csil.cs.ucsb.edu
```

You should then be able to log in to dokku without specifying a username, like this (replacing `xx` with your dokku number, which is also your team number).

```
ssh dokku-xx.cs.ucsb.edu
```


Here's what logging in should look like:

```
pconrad@Phillips-Mac-mini-2 .ssh % ssh pconrad@csil.cs.ucsb.edu
csilvm-03.cs.ucsb.edu
Last login: Thu Oct  3 15:41:25 2024 from 128.111.27.247
pconrad@csilvm-03:~$ ssh dokku-03.cs.ucsb.edu
Welcome to Ubuntu 22.04.4 LTS (GNU/Linux 6.8.8-4-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro
Last login: Thu Jun  6 00:47:58 2024 from 128.111.30.204
pconrad@dokku-03:~$ 
```

You will need to type `exit` *twice* to get back to your machine:
* Once to log out of the dokku machine
* Another time to log out of csil

Like this:

```
pconrad@dokku-03:~$ exit
logout
Connection to dokku-03.cs.ucsb.edu closed.
pconrad@csilvm-03:~$ exit
logout
Connection to csil.cs.ucsb.edu closed.
pconrad@Phillips-Mac-mini-2 .ssh % 
```

If you are able to login to your dokku-xx machine successfully, you may log out for now, and move on to the next step.  

But if you were *not* able to log in to the dokku-xx machine successfully, please post to `#help-jpa01` now, with a main post of "trouble loggin into dokku", and then in the reply thread, include screenshots of the problems you are seeing.

Once you've made that post, *you can continue working*, because you won't need dokku for the first few steps of  the lab.  We asked you to check that you could login *first* so that if there's a problem, the staff can look into it while you work on the other steps.

## Step 1: Understanding what we are trying to do

### What are we trying to accomplish again in this lab?

-   In this lab, we will <em>create a basic "Hello, World" type web app in Java"</em>, and <em>deploy it to the web using Dokku</em>.
-   A web app is a piece of Java code that takes HTTP request messages as input, and responds with HTTP response objects as output.
-   Dokku is a platform where we can host a Java web app; it is an open source web platform that tries to capture much of the features of the
    commercial platform Heroku, but that we can host internally at UCSB (so that you do not incur any credit card bills).

### Web Apps vs. Static Web Pages

You may already have some experience with creating static web pages, and/or with creating web applications (e.g. using PHP, Python (Django or Flask) or Ruby on Rails.) If so, then the "Learn More" section will be basic review.

If you are new to writing software for the web, you are <em>strongly encouaged</em> to read the background information at the "learn more" link below.
-   [Web Pages vs. Web Apps](https://ucsb-cs156.github.io/topics/webapps/webapps_webapps_vs_websites.html)


### More about Dokku

-   Web applications run on the "server" side of the web architecture, not the client side.
-   So to test a web application, we need to set up a web server that can run Java code.
-   You can run applications at a URL such as <http://localhost:8080> but that app is only available in a browser on the same
    computer as where the `mvn spring-boot:run` command was performed, (i.e. the "local host", typically your laptop.)
-   Configuring a public web server for Java is challenging. But, fortunately, we don't have to; the folks that maintain CSIL have
    already done that for us.
-   Dokku offers "platform as a service" cloud computing for Java web applications (along with many other platforms)
-   This puts your application "on the web", for real, so that anyone in the world can access it 24/7
-   Dokku offers many of the same features as Heroku, but through a command line interface rather than a web interface


### What are we trying to accomplish again in this lab?

If you just did a deep dive into the article [Web Pages vs. Web Apps](https://ucsb-cs156.github.io/topics/webapps/webapps_webapps_vs_websites.html) it may be helpful to again review what we are trying to accomplish in this lab:

-   In this lab, we will <em>create a basic "Hello, World" type web app in Java"</em>
-   To test that, we need to run that on a server somewhere.
-   Configuring a web server for Java is challenging. But, fortunately, we don't have to.
-   Dokku offers "platform as a service" cloud computing for Java web applications.


## Step 2: Set up your jpa01 repo

**The next steps are to be done in your own development enviroment, i.e your own machine, NOT on the dokku machine. The previous step is there to verify that you have access to dokku before starting the programming assignment.**

You should already have a repo under the course organization
<tt>{{page.github_org}}</tt> called
<tt>{{page.num}}-<i>githubid</i></tt>
created for you by the staff, where <tt><i>github</i></tt>
is your github id.

If not, create one for yourself following that naming convention;
it should initially be **public** (not private), and empty (no `README`, license or
`.gitignore`.)

Clone that repo somewhere and cd into it.

Then add this remote:

<tt>`git remote add starter git@github.com:ucsb-cs156-f26/STARTER-jpa01.git`</tt>

Then do:

```
git checkout -b main
git pull starter main
git push origin main
```

## Step 3: Start your webapp on `localhost`

The application should be ready to go out of the box; it
starts up a web server that brings up a page with the message
`Hello, World`

We are going to run a command
to start up this web server
and then try to connect with
a browser.

* First, use `mvn compile` to make sure that the code compiles.
* Next, try `mvn test` to be sure that the test cases pass.
* Then, try `mvn spring-boot:run`.  This should start up a web
  server on port 8080 running on `localhost`

  The `mvn spring-boot:run` command is a shortcut that is provided for us to be able to run the jar file.  It does pretty much the same thing as
  if we ran the `.jar` file and specified the class containing our `main` on the command line.

### Connecting with a browser

Now, if you are running on your own machine, connecting with a browser is quite simple;
the web server is running on the local machine (`localhost`) on port
8080, so putting the address <http://localhost:8080> in your browser
will just work.  If you are successful, you should see the message `Hello, World` appear in your browser.



### About `localhost` and "Port Numbers"

The code in this repo is configured to start up a webserver on port 8080, running on `localhost`, which is a name for the machine on which the code is running.

* If you are running on your own machine, then `localhost` refers to that machine (e.g. your laptop).
* The port number is a more specific "communications channel" on that machine.   You can find more information on port numbers
  at this short article, which you are encouraged to read if you are not already familiar with port numbers
  (or, for that matter, even if you are): <https://ucsb-cs156.github.io/topics/port_numbers.html>

So the web address to acccess your server is: `http://localhost:8080`.

* Note: You should use `http` not `https` when running on `localhost`. Using `http` is the unsecure, unencrypted version.
* When running on dokku, we'll use https instead.

## Step 4: Understanding `localhost` vs. Dokku

When running on `localhost`:
* The web app is only runnning as long as your program is executing.
* As soon as you CTRL/C the program to interrupt it, the web app is no longer available.
* The web app is only available on the machine where you are running the program; not on the public internet.

Running on `localhost` is fine for testing and development.  But eventually we want to know how to deploy a web application so that anyone on the internet can access it.

To get the web app running on the public internet, we'll need to use a cloud-computing platform.

*A note about security*: Let's say up front that this is a risky thing to do.   You need to be very careful about security when deploying web applications to the public internet.  Fortunately, this particular application is rather simple and low-risk.   We'll discuss web security throughout the course.

## Step 5: Create a new Dokku app and link your Github repo


In this step, we'll deploy our Spring Boot application to the public internet using dokku.

You can follow the instructions here to create a new app. Use the name `jpa01-yourgithubid`

* <https://ucsb-cs156.github.io/topics/dokku/deploying_simple_app.html>

This should result in an app running at the addresses:
* `http://jpa01-yourgithubid.dokku-xx.cs.ucsb.edu`
* `https://jpa01-yourgithubid.dokku-xx.cs.ucsb.edu`
  
## Step 6: Learning some the dokku commands

On your dokku machine, you should now be able to try a few commands. Use your app name in place of: `jpa01-cgaucho`

* `dokku apps:list`
   - This shows all of the apps on your dokku instance.
   - Note that you share your dokku instance with all of the members of your team
* `dokku logs --tail jpa01-cgaucho`
  - This shows the console output (including error messages and log messages) of your running app.
  - See what the app shows if you try to navigate to pages that exist, and pages that don't exist (e.g. put `/foobar` in the url bar of the browser after your host url)

## Step 7: Adding links to running web app in the README.md

Edit your README.md.  You'll find some TODO items inside indicating what edits you need to make.

There are two ways to do it: 
1. You can edit the README.md file in VSCode on your machine and then push a change to Github with:
   ```
   git add README.md
   git commit -m "xy - customize README.md for jpa01"
   git push origin main
   ```
2. OR: you can edit the README.md file directly in the Github web interface.
   
   But if you do it that way, then immediately do:
   ```
   git pull origin main
   ```
   on your laptop to pull in the latest changes to your local repo (the one on your laptop.)


In general, all quarter long, we want you to develop the habit of adjusting the
README.md in your repo to include a link to your running web app, and sometimes
other things as well.

Follow the instructions in the README.md, including removing the `TODOs` after you take care of each one.

Use the `https` link when you put a link to your running app in your README.md file.


## Step 8: Submitting your work for grading

When you have a running web app on Dokku, make a submission under jpa01 on Canvas with a
link to **your repo**.

For full credit:

* The link should be something like : `https://github.com/ucsb-cs156-s24/jpa01-cgaucho`
* It should NOT be:  `https://jpa01-cgaucho.dokku-01.cs.ucsb.edu`
* BUT: the README at the link should contain a link to your running app on dokku.

