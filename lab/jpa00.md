---
description: Getting Started
assigned: 2026-09-30
due: 2026-10-06 23:59
layout: default
title: jpa00
nav_order: 100
ready: false
layout: default
parent: lab
slack: https://ucsb-cs156-f26.slack.com
course_org: https://github.com/ucsb-cs156-f26
course_org_name: ucsb-cs156-f26
starter_repo: https://github.com/ucsb-cs156-f26/STARTER-jpa00
course_software: https://ucsb-cs156.github.io/f26/info/software.html
---

# {{page.title}} - {{page.description}}

{% include drop_down_style.html %}

This assignment is `jpa00`, i.e "Java Programming Assignment 00".

If you find typos or problems with the lab instructions, please report these via Slack:
* When class is in session (e.g. lecture or discussion) please use [`#help-lecture-discussion`]({{site.channels.help-lecture-discussion.url}})
* At other times, please use `#help-jpa00`, or if it is a configuration problem, use one of these channels as applicable:
  - [`#help-macos`]({{site.channels.help-macos.url}})
  - [`#help-windows-linux-wsl`]({{site.channels.help-wsl-linux.url}})

# Goals

This lab checks that you can succesfully edit, compile, run and submit a simple
`Hello.java` to Gradescope for grading.

# We encourage you to do this on your laptop 

At the moment, we need Java 21 and as of right now, it isn't installed on CSIL (they skipped right to Java 22). So you will need to do this lab on your own machine.

<details markdown="1">
<summary markdown="1">
If you are curious why we are so picky about Java 21, you can 
click the triangle to read the details.
</summary>

# Why so picky about the version?

To be honest, for this first lab, the version probably doesn't matter.

But later in the course, we'll be dealing with the Spring framework, which is a very complex Java framework with dozens of external dependencies.   In this case, version matters a lot!

Most large Java frameworks only target *Long Term Support (LTS)* versions of Java, not intermediate versions.  That means Java 8, 11, 17 or 21.  Versions other than LTS versions (such as 18, 19, 20, 22, 23) may have incompatibilities that are not well documented or understood, and result in obscure, difficult to resolve bugs.

The current Java LTS version is Java 21.

More info here: <https://ucsb-cs156.github.io/topics/java/java_versions.html>


</details>

# Something for everyone to learn

Note that even if you have done Java programming before, **there
may be a few things about this `Hello.java` program that may be
unfamiliar to you**.  These have to do with setting us up for real world
programming practices used in large software projects.

* Rather than compiling with command line tools such as `javac` and running
  the program with the `java` command, we'll be using a package and build
  manager called *Maven*.  For a small `Hello World` type program,
  this will seem like overkill; but it will set us up for being able to
  manage much larger projects.
* We are setting our code up in a GitHub repo right from the start.
* We are going to be following the directory conventions required
  by Maven.  So it's important to have the correct directory structure
  within the GitHub repo.

There a few details, but they are all straightforward.  


## Step 1: Basic Orientation

1. Ideally, you will already
   know the following things from previous courses (CMPSC 16, 24, 32).  It is possible that if you are joining UCSB for the first time in this course, some of this may be unfamiliar to you.   The rest of these instructions will assume you know how to do the items in the list below. If not, then let a member of the course staff know,
   and we'll point you to resources
   where you can come up to speed.

   -  knowing how to use a **basic
      text editor such as emacs or vim** to edit files.  (Here, for example, is some [basic instruction on vim](https://ucsb-cs156.github.io/topics/vim)
)
   -  knowing basic Unix/Linux
      commands to create directories, change directory, manipulate files, i.e. commands such as: `mkdir`, `cd`, `pwd`, `mv`, `rm`, `ls`.
   
   If those topics are new to you, please reach out to the instructor to let them know, and ask for pointers to resources where you can
   study up on these skills.

2. We strongly encourage the use of VSCode as an editor this 
   course. For this assignment, it will not matter what editor you use,
   but in future assignments, the use of an IDE will become more important. So we encourage you to try VSCode if you haven't used it before.

3. Make sure you have completed the checklist for installation steps here: <https://ucsb-cs156.github.io/f26/info/install_checklist.html>.
  
   If you haven't done the `nvm` part yet, it's ok; you won't need
   that for this lab.  But you will need Java 21, Maven, and VSCode.


## Step 2: Get setup with gradescope

We will use gradescope to grade all your homeworks, exams and lab/programming assignments. I have added everyone enrolled in the course to Gradescope by syncing the Canvas roster.   You should have received an email notification with instructions about logging into gradescope. Once you follow the instructions to set your password, you should have access to our course on Gradescope. You should see {{site.course}} in your {{site.quarter}} courses.

The lab assignment {{page.title}} should appear in your Gradescope dashboard in {{site.course}}. You will need to submit your code for {{page.title}} using this page.

If you don't see the course {{site.course}} and the assignment {{page.title}}, please check with the staff using [`#help-lecture-discussion`]({{site.channels.help-lecture-discussion.url}}) during class, or `#help-lab00` outside of class.


## Step 3: Configure your machine for git/GitHub

We want to be able to use `git` and GitHub with ssh links, so we need to set up public-key/private-key pairs.

We also want to set up `git` so that it records our commits properly.

1. `git` configuration: [Detailed Instructions](https://ucsb-cs156.github.io/topics/git/configuration.html)


2.  Configure ssh keys for git
    - Detailed instructions: [Configuring your ssh key for Github.com](https://ucsb-cs156.github.io/topics/GitHub/github_ssh_keys.html)


3.  If you are brand new to git and github, review a few basic facts about git and github.com
    - <https://ucsb-cs156.github.io/topics/git/git_overview.html>


## Step 4: Finding your jpa00 repo on GitHub

Open a web browser and login to GitHub, then navigate to the course organization page, <{{page.course_org}}>.

You should see that there is a private repo in this organization called `jpa00-yourGithubId`, where `yourGithubId` is replaced with your GitHub id.  This is the repo
that you'll be using for this assignment.

This is currently an empty private repo.  In the next step, we'll clone this empty repo into a directory, either on your CSIL account, or on your local system.

## Step 5: Cloning the repo


1. Make a directory somewhere on your computer for your work in CS156.  It is often convenient to make that under you "home directory", i.e. `~/cs156` subdirectory.  On both MacOS and WSL you can do that with these commands:

   ```
   mkdir ~/cs156
   cd ~/cs156
   ```

   You can actually use any directory you like, but for consistency, we'll refer
   to `~/cs156` throughout the rest of
   the instructions.

2. Now, go to the `github.com` web page, and find your `jpa00-userid` repo. The page should look something like this:


   <img width="513" alt="jpa00-cgaucho-50" src="https://user-images.githubusercontent.com/1119017/230218643-28916fd4-42ac-4be7-80e6-5b517ac6654e.png">

   You should see a button for `SSH`;
   select that button.  Then there is a button to copy the URL shown;
   click that to copy the URL.

3. Now type this command, replacing
   `url` with the url that you copied.

   That `url` should be something like
   <tt>git@github.com:{{page.course_org_name}}/{{page.title}}-cgaucho.git</tt> but with your GitHub id in place of <tt>cgaucho</tt>.

   ```
   git clone url
   ```

   You'll will see a warning message that you are cloning an empty repo; that's normal.


   <tt>Cloning into {{page.title}}-cgaucho...<br />
   warning: You appear to have cloned an empty repository<br /></tt>


4. If you use the `ls` command, you should now have a subdirectory called <tt>{{page.title}}-cgaucho</tt> (except <tt>cgaucho</tt> will be your GitHub username.)  Use
   a `cd` command to change directory
   into that directory, e.g.


   <tt>cd {{page.title}}-cgaucho</tt>


   An `ls -a` should reveal an empty
   directory except for the `.git` subdirectory indicating that this is a GitHub repo.

   ```
   % ls -a
   .	..	.git
   %
   ```

   We are now ready to pull in some starter code.

## Step 6: Locate the starter code.

First, let's take a look at this remote on GitHub, here:

* <{{page.starter_repo}}>

You should see that the `README.md` for this repo has an explanation of the contents of the starter code.  Read though this explanation to learn more about:
* Maven
* the `pom.xml`
* the required directory structure

Next, we'll add this starter code as a second *remote* for our repo.

## Step 7: A remote for starter

If you've used `git` before, you
may be familiar with the command:

```
git pull origin main
```

The word `origin` in this case refers to a *remote*, that is a repo that lives somewhere out there on the network.

The word `main` refers to the default branch of the repo.  The default branch of GitHub repos recently changed from `master` to `main`; we'll be using `main` throughout this course.

If you type the following command, you'll see that `origin` is defined as a remote for the repo that you cloned from.  Your output will look similar, except that you'll have your GitHub in place of `cgaucho`:

<tt>
% git remote -v<br />
origin	git@github.com:{{page.course_org_name}}/{{page.title}}-cgaucho.git (fetch)<br />
origin	git@github.com:{{page.course_org_name}}/{{page.title}}-cgaucho.git (push)<br />
% <br />
</tt>

Now, we are going to add a second remote.  This remote will use the URL for the starter code.

The image below shows how to copy that URL: (1) Click the green `Code` button.  (2) Select `SSH` to choose that as the network protocol for the URL (3) Click the icon to copy the URL to your clipboard.


<img width="192" alt="starter-ssh-url-50" src="https://user-images.githubusercontent.com/1119017/229932825-e2ce51b9-acc3-4b45-b314-50174a211d26.png">


Then, use this command to add a remote called `starter` for the starter code repo:

```
git remote add starter paste-url-here
```

After this command, use `git remote -v` to list all your remotes. Your output should look like this (except your GitHub id in place of `cgaucho`):

<tt>
% git remote -v<br />
origin	git@github.com:{{page.course_org_name}}/{{page.title}}-cgaucho.git (fetch)<br />
origin	git@github.com:{{page.course_org_name}}/{{page.title}}-cgaucho.git (push)<br />
starter	git@github.com:{{page.course_org_name}}/STARTER-{{page.title}}.git (fetch)<br />
starter	git@github.com:{{page.course_org_name}}/STARTER-{{page.title}}.git (push)<br />
%
</tt>

## Step 8: Pull Starter Code into your Repo

The next step is to pull the starter code into your repo, and then push
that code to your origin repo on GitHub.

Here are the three commands:

```
git checkout -b main
git pull starter main
git push origin main
```

After these three commands, go look at your repo on GitHub, i.e. the repo at this url (but substituting your GitHub id for cgaucho:)

* <https://github.com/{{page.course_org_name}}/{{page.title}}-cgaucho>

You should see that instead of an empty repo, you now have a copy of the starter code.

The starter code should compile and run, and can even be submitted to Gradescope for a grade.   Of course, it won't be for full credit, but we can at least make sure that the mechanisms are working.  So let's give it a try.

## Step 9: Compile and run the Starter code

To compile the starter code, return to a shell prompt in the directory where your cloned your repo.  You should see, when you type `ls`, that
the file `pom.xml` is in the current directory.  For best results, you should always run Maven from this directory.

To compile type `mvn compile`.

* If you see the message `The JAVA_HOME environment variable is not defined correctly...` plus a few more lines of output, see [this link](https://ucsb-cs156.github.io/topics/maven/maven_faq.html) for a fix.
* Otherwise, you should see no error messages
* There may be warning about missing `resources` and `UTF-8 encoding`, but you can safely ignore those for now.  If you are curious, see the the section "Warnings you May be able to Ignore" on [this page](https://ucsb-cs156.github.io/topics/maven/maven_hello_world.html).

Then, type `mvn package`.  You should see a lot of output, but somewhere in that output, something like this:

```
 [INFO] Building jar: target/hello-1.0.0.jar
```

That indicates that you have built a `.jar` (or Java Archive) file.  This file is a compressed archive of all of the compiled Java code from your program.  You can run it with this command:

```
java -cp target/hello-1.0.0.jar jpa00/Hello
```

You should see output like this:

```
% java -cp target/hello-1.0.0.jar jpa00/Hello
This is the wrong output!
%
```

The line `This is the wrong output!` is being produced by the line of code:

```
        System.out.println("This is the wrong output!");
```

You should eventually change this line to produce the correct output.
But, don't do that just yet.  Let's first see what happens when you submit a program with errors in it to Gradescope.


## Step 10: Submit incorrect Java code to Gradescope

In this step, we'll see what happens when you submit two incorrect program to Gradescope.  We aren't grading this step, so you *could* skip it, but we strongly encourage you to do it anyway, because it's important to be able to understand how the autograders work on a simple case before dealing with a more complex case.


First, we'll submit the starter code "as is" to Gradescope.  Gradescope will be expecting a program that produces, as it's output `Hello, World!` (followed by a newline).

Instead, your code currently produces: `This is the wrong output!` followed by a newline.

We want to see what the Gradescope output looks like in that case.

To submit to Gradescope, navigate to:
<https://gradescope.com>.

Log in with the School Credentials for UCSB.  Don't use username/password credentials.  Or, access Gradescope through Canvas.

To submit your work, you should be able to click on the GitHub link in Gradescope, and locate your repo.  The first time you do this, it may take a while; be patient before giving up.   If it still doesn't work after a while, you can either (a) ask the staff for assistance, or submit a zip file as an alternative.

* For instructions on submitting a Zip file, see: [Gradscope Zip Submission](https://ucsb-cs156.github.io/topics/gradescope/gradescope_zip_submission.html)


After you submit, it will take some time for Gradescope to process your submission.  Once it's processsed, you should see output similar to this:

<img width="294" alt="jpa00-gs-starter-code-50" src="https://user-images.githubusercontent.com/1119017/229932774-25157e0d-5911-4df9-877e-7d35d9a01c00.png">


The most important part is this:

```
FAILED:
expected:<[Hello, World]!
> but was:<[This is the wrong output]!
>
```

Note that it tells you exactly what was different between the expected and actual output (the part in `[]`).  The `!` is the same in both parts, so it is outside the `[]`.


Once you've understood this output,
let's move on and see what happens when you submit code with a syntax error.

Go into the file `src/main/java/jpa00/Hello.java`, and remove the semicolon at the end of the statement:

```
 System.out.println("This is the wrong output!");
 ```

 So that it reads:

 ```
  System.out.println("This is the wrong output!")
 ```

This, of course, has a syntax error.

Try using `mvn compile` and see what happens when you compile this.

## Step 11: Submit correct Java code to Gradescope

Now, fix the code so that it produces the correct output.  Change the file `src/main/java/jpa00/Hello.java` so that the `System.out.println` method call reads:

```
        System.out.println("Hello, World!");
```

Test this locally by compiling and running the code:

```
mvn compile
mvn package
java -cp target/hello-1.0.0.jar jpa00.Hello
```

You should see the correct output, `Hello, World!`.

Now, commit this change:

```
git add src/main/java/Hello.java
git commit -m "correct the output"
git push origin main
```

Then submit to Gradescope again.


Once you see that you have a score of 100 for {{page.title}} on Gradescope, you are *done* with the *required* work for {{page.title}}. However, you are encouraged to look at the README.md file in your lab00 repo and go through the explanation of the files in the repo.  Some of this may be review, but some if it may be new to you, especially if you have not used Maven before.   We'll be using Maven throughout the course, so it's good to get familiar with how Maven works in this very small `Hello World` program before we see a more complex example.

# Step 12: Bonus Step: GitHub Student Developer Pack

The GitHub Student Developer Pack is a package of free stuff that you can get if you are a university student.

One of those is access to **Github CoPilot**

Create a GitHub account on the free plan, then visit <https://education.github.com/students> to sign up.

You may need those additional benefits for some of the assignments in this course.

We may include details about configuring your VSCode installation for Github Copilot in a future lab; it's a very useful tool, especially for large code bases, and working with complex frameworks such as Spring Boot and React.


# Staff Info

<details markdown="1">
<summary markdown="1">Information in this section is for staff.  You can click on the triangle to see the staff info if you like.
</summary>

## Before this lab

* Set up STARTER-jpa00
* Set up autograder on Gradescope
* Create jpa00 student repos (student access is admin, visibility is private as shown below)


  <img width="343" alt="image" src="https://github.com/ucsb-cs156/s24/assets/1119017/8562f4e8-fbe0-4fa4-8fe4-016e9d548d75">

* Test that you can submit on Gradescope. You may have to do the step where you authorize Gradescope to access the Github organization. [This may help](https://ucsb-cs156.github.io/topics/gradescope/gradescope_organization_access.html)


  
</details>
