---
description: Getting Started
assigned: 2026-09-30
due: 2026-10-06 23:59
layout: default
title: jpa00
nav_order: 100
ready: false
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

This lab checks that you can successfully edit, compile, run, and submit a simple
`Hello.java` program to Gradescope for grading.

# We encourage you to do this on your laptop, not CSIL!

It is possible to do this assignment on CSIL, but that misses the point.  

Later in the course, we are working with projects that will be too large for your CSIL disk and file quotas (mainly the file quotas, due to the way that the `node_modules` directory is structure.)

## Installing Java with SDKMAN

You should complete the setup steps in <{{page.course_software}}> before starting this lab.

For this course, we use Java {{site.java_version}} installed via SDKMAN. The purpose of SDKMAN is to allow multiple versions of Java to co-exist on your system.

Even if you have a later version of Java, you are strongly encouraged to install *this exact version* of Java.  It will likely not matter for this assignment. It very well may for future assignments; misaligned Java versions tend to produced difficult to diagnose bugs that are frustrating for you, waste your time, and put extra burden on the staff as we try to help you.  

So, before you begin, install the required Java version using SDKMAN:

```bash
sdk install java {{site.jdk_distribution}}
sdk use java {{site.jdk_distribution}}
java -version
```

This ensures you are using the exact Java distribution specified by the course for this assignment.

<details markdown="1">
<summary markdown="1">
If you are curious why we are so picky about Java versions, you can 
click the triangle to read the details.
</summary>

# Why so picky about the version?

To be honest, for this first lab, the version probably doesn't matter.

But later in the course, we'll be dealing with the Spring framework, which is a very complex Java framework with dozens of external dependencies. In this case, version matters a lot!

Most large Java frameworks only target *Long Term Support (LTS)* versions of Java, not intermediate versions. That means Java 8, 11, 17, or 21, and in this course we are specifically using Java {{site.java_version}}. Versions other than the supported LTS and course-supported versions may have incompatibilities that are not well documented or understood, and they can result in obscure, difficult-to-resolve bugs.

For this course, the required version is Java {{site.java_version}}, using the recommended <tt>{{site.jdk_distribution}}</tt> distribution from SDKMAN.

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
   that for this lab.  But you will need Java 25.0.4 via SDKMAN, Maven 3.9.14, and VSCode.


## Step 2: Get setup with Gradescope

We will use Gradescope to many of your homework, exams and lab/programming assignments. I have added everyone enrolled in the course to Gradescope by syncing the Canvas roster.   You should have received an email notification with instructions about logging into Gradescope. Once you follow the instructions to set your password, you should have access to our course on Gradescope. You should see {{site.course}} in your {{site.quarter}} courses.

The lab assignment {{page.title}} should appear in your Gradescope dashboard in {{site.course}}. You will need to submit your code for {{page.title}} using this page.

If you don't see the course {{site.course}} and the assignment {{page.title}}, please check with the staff using [`#help-lecture-discussion`]({{site.channels.help-lecture-discussion.url}}) during class, or `#help-lab00` outside of class.


## Step 3: Configure your machine for git/GitHub

We want to be able to use `git` and GitHub with ssh links, so we need to set up public-key/private-key pairs.

We also want to set up `git` so that it records our commits properly.

1. `git` configuration: [Detailed Instructions](https://ucsb-cs156.github.io/topics/git/configuration.html)


2.  Configure ssh keys for git
    - Detailed instructions: [Configuring your ssh key for Github.com](https://ucsb-cs156.github.io/topics/GitHub/github_ssh_keys.html)


3.  If you are brand new to git and Github, review a few basic facts about git and github.com
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


## Step 9: Enable Verified Commits

In this step, we set up verified/signed commits.  

This only has to be done
once per machine that you work on, but if you work on multiple machines it has to
be done on *each of them*.  

If you complete this lab on one machine, but later switch to another for working on other projects that require signed commits, you'll need to repeat this entire "Step 9" on that other machine as well.

What we are doing in this step applies to all of your Github work on that machine, so it isn't necessary to do it on individual repos or for different courses.

### Step 9a: Configure `user.name` and `user.email`

To set your name and email for your whole git installation, run the following commands. The email will need to be one associated with your GitHub Account.

* Replace `"Your Name"` use the name you want to be called in class (e.g. `"Chris Gaucho"`
* Replace `"email@ucsb.edu"` with an email associated with your GitHub account. This is usually your UCSB email. If you are unsure, please check [here](https://github.com/settings/emails) 

```
git config --global user.name "Your Name"
git config --global user.email "email@ucsb.edu"
```

### Step 9b: Create an ssh key

Next, you'll need an ssh public key/private key pair. 

If you have one already, you should be able to find it by doing:

```
ls -al ~/.ssh
```

* The key file ending in `.pub` is the public key.
* The key file that doesn't end in `.pub` is the private key.

If you don't have one on this machine, follow these instructions to create one:

* <https://ucsb-cs156.github.io/topics/GitHub/github_ssh_keys.html>.  


### Step 9c: Configure Github for signing keys


Once you've made an ssh key, you have to tell github it exists. For most students, the commands will be below. 

* If you set a custom location for your public/private key pair, replace `~/.ssh/id_rsa.pub` with your public key location. 
* **If you have an id_ed25519 key, replace `id_rsa.pub` with `id_ed25519.pub`**. 

Run the following commmands:

```bash
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_rsa.pub
```

So that you don't have to remember to sign each commit as you make it, you can run the following command:
```bash
git config --global commit.gpgsign true
```

### Step 9c: Configure local git for signing keys

Now run these commands:

```
mkdir -p ~/.config/git
touch ~/.config/git/allowed_signers
```

Followed by this one (changing `~/.ssh/id_rsa.pub to the name of your public key file if needed).

```
echo "myemail@ucsb.edu" `cat ~/.ssh/id_rsa.pub` >> ~/.config/git/allowed_signers
```

Then, tell git where the allowed signers are:
```bash
git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers
```

This is mainly needed so that the `git log --show-signature` command works properly.

### Step 9d: Configure Github for signing keys


Next, you need to upload your *public* key to Github as a *signing key*.  This is different from uploading it to Github for accessing repos, which you probably have already done previously. 

VERY IMPORTANT: you want to upload your `id_rsa.pub` file to `github.com`

You do NOT upload your `id_rsa` file to github.com. That file is your private key, and needs to stay private and protected.

You don't actually "upload" your `id_rsa.pub` to github.com.   You actually just copy and paste the value. `cd` into the `~/.ssh` directory and use the command `cat id_rsa.pub` to have the file be printed in the terminal like this

```
    (~/.ssh)$ cat ~/.ssh/id_rsa.pub
    ssh-rsa 
    AAAAB3NzaC1yc2EAAAADAQABAAABAQDYySoh7b1uGpI7saLozpgXz184YYgC9k22zLH8TqKiSLAcNCO5hEzgC0kZoytCMtw/hUx3kto8
    apPS4ORL6HebWXuGfzQ3nQslPpBNmto0hdo446wBu/Hl5a7pC3SZUzti4YbUjRDOBgM5zQMaopTXhtqNY/tRB8/lSSYaEtIxLN5twk29
    IQUoA2wdPTmU/fRPc3PUdD9/KHJfBIL/ROsOb73tGOxqZoMnzV0ElmLhjq6WEqNWypaFrI0YU8OmIvxmlDXn0gkr3oYHqrbz5qznSust
    ucWBEFZ3lekvZiXrqizFplYZF+LiG9TOGjhxujOJ+sIcCy0BCN4msb1/lguN hamstra@csil.cs.ucsb.edu
    (~/.ssh)$
```

Then you want to copy the text contents of the file, starting with 'ssh-rsa AAAAA...' and ending with '...@csil.cs.ucsb.edu or the name of your computer'.

* Keep in mind that uploading a public SSH key gives access to your github account to whoever has access to the matching private SSH key on his/her computer.
* So make sure that you are using YOUR OWN public ssh key—and not the key shown in the example above.

To do this, login to the page <http://github.com>

Look for the gear icon in upper right to take you to the settings screen.

Click on the tool icon, and it should take you to a screen like this—you are looking for the SSH Keys menu item on the left:

<div style='border:1px solid black;' markdown="1">
<img src="http://i.imgur.com/xXESmRI.png" alt="ssh" />
</div>

Click on that, and you'll be taken to this screen, where you can upload a new public key:

<div style='border:1px solid black;' markdown="1">
<img src="http://i.imgur.com/z8blAzI.png" alt="ssh" />
</div>

Select "Signing Key"
![image](https://github.com/user-attachments/assets/0dad096a-d717-41fb-ad7b-54b4ef31eaa8)

Paste the key you copied into the key field.

Once the key is uploaded, you're all set to be able to sign your commits!

## Step 10: Compile and run the Starter code

To compile the starter code, return to a shell prompt in the directory where your cloned your repo.  You should see, when you type `ls`, that
the file `pom.xml` is in the current directory.  For best results, you should always run Maven from this directory.

To compile type `mvn compile`.

* If you see the message `The JAVA_HOME environment variable is not defined correctly...` plus a few more lines of output, see [this link](https://ucsb-cs156.github.io/topics/maven/maven_faq.html) for a fix.
* Otherwise, you should see no error messages
* There may be warning about missing `resources` and `UTF-8 encoding`, but you can safely ignore those for now.  If you are curious, see the the section "Warnings you May be able to Ignore" on [this page](https://ucsb-cs156.github.io/topics/maven/maven_hello_world.html).

Then, type `mvn package`. You should see a lot of output, but somewhere in that output, something like this:

```
[INFO] Building jar: target/hello-1.0.0.jar
```

That indicates that you have built a `.jar` (or Java Archive) file. This file is a compressed archive of all of the compiled Java code from your program. You can run it with this command:

```
java -cp target/hello-1.0.0.jar jpa00.Hello
```

You should see output like this:

```
% java -cp target/hello-1.0.0.jar jpa00.Hello
This is the wrong output!
%
```

The line `This is the wrong output!` is being produced by the line of code:

```
        System.out.println("This is the wrong output!");
```

You should eventually change this line to produce the correct output.
But, don't do that just yet.  Let's first see what happens when you submit a program with errors in it to Gradescope.


## Step 11: Submit incorrect Java code to Gradescope

In this step, we'll see what happens when you submit two incorrect program to Gradescope.  We aren't grading this step, so you *could* skip it, but we strongly encourage you to do it anyway, because it's important to be able to understand how the autograders work on a simple case before dealing with a more complex case.


First, we'll submit the starter code "as is" to Gradescope.  Gradescope will be expecting a program that produces, as it's output `Hello, World!` (followed by a newline).

Instead, your code currently produces: `This is the wrong output!` followed by a newline.

We want to see what the Gradescope output looks like in that case.

To submit to Gradescope, navigate to:
<https://gradescope.com>.

Log in with the School Credentials for UCSB.  Don't use username/password credentials.  Or, access Gradescope through Canvas.

To submit your work, you should be able to click on the GitHub link in Gradescope, and locate your repo.  The first time you do this, it may take a while; be patient before giving up.   If it still doesn't work after a while, you can either (a) ask the staff for assistance, or submit a zip file as an alternative.

* For instructions on submitting a Zip file, see: [Gradscope Zip Submission](https://ucsb-cs156.github.io/topics/gradescope/gradescope_zip_submission.html)


After you submit, it will take some time for Gradescope to process your submission. Once it's processed, you should see output similar to this:

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

## Step 12: Submit correct Java code to Gradescope

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
git add src/main/java/jpa00/Hello.java
git commit -m "correct the output"
git push origin main
```

Ensure when you push to GitHub, your output **does not** look like this:
```bash
To github.com:ucsb-cs156-f26/jpa00-yourGithubId.git
 ! [remote rejected]   main -> main (push declined due to repository rule violations)
error: failed to push some refs to 'github.com:ucsb-cs156-f26/jpa00-yourGithubId.git'
```

If so, please go back and look at the instructions for setting up signed commits, and go through them again.  You may have missed something.

If it does work, try this command:

```
git log --show-signature
```

You should see that your commits are signed; something like this:

<img width="1071" alt="image" src="https://github.com/user-attachments/assets/1ceac976-5ee9-4091-971a-c10475b0816e" />

You can type `q` to get out of the `git log` command and return to the terminal shell prompt.


Then submit to Gradescope again.


Once you see that you have a score of 100 for {{page.title}} on Gradescope, you are *done* with the *required* work for {{page.title}}. However, you are encouraged to look at the README.md file in your lab00 repo and go through the explanation of the files in the repo.  Some of this may be review, but some if it may be new to you, especially if you have not used Maven before.   We'll be using Maven throughout the course, so it's good to get familiar with how Maven works in this very small `Hello World` program before we see a more complex example.

# Step 13: Bonus Step: GitHub Student Developer Pack

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
