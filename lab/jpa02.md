---
description: Intro to Spring Boot, junit, jacoco, pitest
assigned: 2026-10-07
due: 2026-10-13 23:59
layout: default
title: jpa02
nav_order: 100
ready: false
qxx: f26
layout: default
parent: lab
course_org: https://github.com/ucsb-cs156-f26
course_org_name: ucsb-cs156-f26
starter_repo: https://github.com/ucsb-cs156-f26/STARTER-jpa02
software: https://ucsb-cs156.github.io/f26/info/software.html
install_check: https://ucsb-cs156.github.io/f26/info/install_check.html
---

<style>
 code {white-space: pre;}
 tt {white-space: pre;}
</style>


# {{page.title}} - {{page.description}}

This lab is going to cover a lot of new concepts.

* **Spring Boot**: You'll see the complete code for a very small web application created with Spring Boot.
* **HTML**: The markup language used for web page content.
* **Spring Boot Controllers**: Java Methods that map a url such as `/`, `/info` `/team` to the code that returns the HTML for a web page.
* **Unit Testing, JUnit, Test Suite**: You'll see Junit, a unit test framework for Java, and we'll talk about the idea of a test suite (a collection of unit tests for a body of code).
* **Line Coverage**: You'll be introduced to the idea of "line coverage", a weak (but fast) way to check whether a test suite has gaps in it.
* **Jacoco**: You'll work with Jacoco, a line coverage testing framework for Java.
* **Mutation Coverage**: You'll be introduced to the idea of "mutation coverage", a better (but slower) way to check the strength of a test suite.
* **Pitest**: You'll work with Pitest, a mutation coverage framework for Java
* **JSON (JavaScript Object Notation)**: a compact syntax for representing objects (used not only in Javascript, but in almost all modern web and mobile applications)

In the Java code, you'll also see, though we won't discuss them immediately:
* **String.format**: a very useful Java method for formatting strings
* **Jackson `ObjectMapper`**: a package providing an `ObjectMapper` object that converts between Java object and JSON objects
* **Java Bean**: A Java Bean is simply a basic Java class with a default (no-arg) constructor,  getters and setters for each data element that follow a specific naming convention, implementations of equals, hashCode, and toString
* **A Class with Only Static Methods**: The use case for a class with only static methods, and how you handle test coverages for such classes

It's a lot, especially if you haven't seen Java before.  But don't worry: we'll guide you through it.

## The programming is basic

Because there are so many new concepts here, the programming will again be pretty simple, and we'll walk you through most of the steps.  

**Don't worry; there will be plenty of difficult programming challenges ahead**.  Right now, while there is so much new stuff going on, I don't also want to
overwhelm you with tricky programming problems *on top* of all of that.

## Do you need a Unix tutorial/refresher?

Throughout these labs, we'll assume a basic knowledge of Unix commands such as `ls`, `cd`, `mkdir`, `rm`, `mv`, `cp`, `chmod`, `pwd`, `cat`, `more`, `less`, and many others.

* [This video tutorial by Ryan He](https://youtu.be/1W5V4GHPO4E?si=aBcPXImlZIhethnz) was developed under the supervision of Prof. Ziad Matni, and is a nice introduction to basic Unix commands if you need a refresher, or if you are joining CS156 as a transfer student from a school where Unix was not used.
* [This PDF](https://github.com/ucsb-cs156/ucsb-cs156.github.io/blob/main/topics/unix/A-Basic-Linux-Workshop.pdf) goes along with the video.


## What you are going to do

We've divided the work into these parts:

* Part 1: Get to know the app
  * In this part, you'll run the app on localhost
  * You'll also deploy it on dokku (as you did in jpa01)
  * You'll also run the test suite, and see that the tests are currently passing
  * You'll also start looking at the jacoco and pitest output to familiarize yourself with them
* Part 2: Customizing the app
  * In this step, you'll start putting in correct values, replacing the placeholders such as `Chris G.` with your own name
  * You'll do this *first* in the test code (the code under `/src/test/java`)
  * You'll see that the tests then fail
  * Then do this in the main code (the code under `src/main/java`)
  * You'll iterate until the tests pass
* Part 3: Test Coverage
  * Next, you'll try to get to 100% test coverage, both using jacoco and pitest
  * We'll show you two ways to cover the tests gaps in the `Team` class for the `equals`, `toString`, and `hashCode` methods: the hard way (by hand) and the easy way (using Lombok)
    


## Part 1: Get to know the app

### Step 1.1: Clone repo

Reviewing, from jpa00 and jpa01:

* In this course, you'll typically start with an empty repo, created by the staff.
* In this case, look for a repo under <{{page.course_org}}> with the name <tt>{{page.title}}-<i>yourGithubId</i></tt>.
* It will start as an empty repo
* You'll then find a place on your laptop to clone it (we suggest under the directory `~/cs156`, but that's up to you).
  <pre>
  cd ~/cs156 
  git clone <i>url</i>
  cd {{page.title}}-<i>yourGithubId</i>
  </pre>

The `url` should be something like
   <tt>git@github.com:{{page.course_org_name}}/{{page.title}}-cgaucho.git</tt> but with your GitHub id in place of <tt>cgaucho</tt>.

You will then have a local repo on your laptop that is a *clone* of the repo on Github.   


### Step 1.2: Pull in starter code

For this step, you need to be at a terminal prompt, and your current directory should be the one where you cloned the repo: [{{page.course_org}}/{{page.title}}-<i>yourGithubId</i>]({{page.course_org}}/{{page.title}}-yourGithubId)

If you type `git remote -v`, you should see that you have something like the following (with `%` representing the terminal shell prompt):

(If you get an error, be sure that you are in the correct directory, i.e. <tt>~/cs156/{{page.title}}-<i>yourGithubId</i></tt>.)

<pre>
% git remote -v
origin	git@github.com:{{page.course_org_name}}/{{page.title}}-<i>yourGithubId</i>.git (fetch)
origin	git@github.com:{{page.course_org_name}}/{{page.title}}-<i>yourGithubId</i>.git (push)
% 
</pre>

What this output signifies is that the name `origin` is the name of a *remote* repo that you can fetch branch information from, pull commits from, and push commits to.

* The `git` system works with both *branches*, which are multiple copies of code in the same repo, and *remotes*, which are the urls of other repos containing branches.
* In this assignment, we'll only work with a single branch in each repo, the `main` branch.
* In future assignments we'll work with multiple branches.
* But, we are working with multiple *remotes* in this assignment:
  * (1) `origin` which is the repo assigned to you,
    specifically, <tt>{{page.course_org}}/{{page.title}}-<i>yourGithubId</i></tt>, and
  * (2) `starter`, which is the repo containing the starter code, which is at <{{page.starter_repo}}>.

**To define the remote called `starter`**, do this:

<pre>
git remote add starter {{page.starter_repo}}
</pre>

(If you mess up the command, you can undo it by doing `git remote remove starter` and then adding it again.)

After you do this, try `git remote -v` again, and you should see the `starter` remote defined:

<pre>
% git remote -v
origin	 git@github.com:{{page.course_org_name}}/{{page.title}}-<i>yourGithubId</i>.git (fetch)
origin	 git@github.com:{{page.course_org_name}}/{{page.title}}-<i>yourGithubId</i>.git (push)
starter	{{page.starter_repo}} (fetch)
starter	{{page.starter_repo}} (push)
% 
</pre>

Now, to pull in your starter code, simply do:

```
git pull starter main
git push origin main
```

After you do this, you should have all of the starter code from <{{page.starter_repo}}> both:
* In your current directory, when you type `ls`
* On Github.com, when you look at this url (adjusting for your own githubid): <{{page.course_org}}/{{page.title}}-*yourGithubId*>

When you've completed those steps, you are ready to deploy your app on localhost.

### Step 1.3: Deploy on `localhost`

Now, to deploy the app on `localhost` (as you did in jpa01), we run the following command:

```
mvn spring-boot:run
```

You'll then need to open a browser on the same machine where you are running the `mvn spring-boot:run` command, and navigate to the url <http://localhost:8080>

You should see a web app come up that looks like this:

![image](https://github.com/user-attachments/assets/f054ff33-f9a2-4498-bc17-922a435887b8)

Note that the web app is only available while you are running the `mvn spring-boot:run` command in the terminal shell.
* If you terminate that shell by typing `CTRL/C`, then you'll see that the web browser no longer brings up the web app, but instead a message that the page is not reachable.

Explore the web app a bit, following the instructions in this table.  The box at the right shows what you should see.


| Instructions | Screenshot |
|--------------|------------|
| Find the Developer Info link on the home page, and click it.  It should take you to a new page at `/info`)  | ![image](https://github.com/user-attachments/assets/3c260e64-a03a-4f03-b0ac-c9580e693d11) |
| The page at `/info` should have information about a fictional developer named `Chris G.`, with their github being `cgaucho`, and their team being <tt>{{page.qxx}}-xx</tt>.  Click the `cgaucho` link | ![image](https://github.com/user-attachments/assets/3f6893ee-f09f-4835-b8b0-3fbcb2de01a4) |
| The `cgaucho` link should take you to the Github profile of github user `cgaucho`.  Click the back button to return to the `/info` page. | ![image](https://github.com/user-attachments/assets/3a7d13b3-9d3e-46d6-b10b-cbd2d129e815) |
| Now, back on the `/info` page, click the link for <tt>{{page.qxx}}-xx</tt> to go to the `/team` page | ![image](https://github.com/user-attachments/assets/892e630a-a3d1-4c9b-a41e-60b1daeecfd6) |
| Note that the page at the url `/team` looks different from the rest. This page is not encoded in HTML, but rather in JSON.  The exact format on the screen will depend on your browser, so it may be formatted with indentation, or may just be one big long string. There's a longer discussion of this below. | ![image](https://github.com/user-attachments/assets/a75d4d00-a6f7-4a1c-b879-60df40212f26) |

#### Let's talk about this JSON page

If you've followed the instructions above, you see that the page `/team` looks different from the other pages in the webapp.  This page contains information in *JSON* format, which is short for *Javascript Object Notation*.

JSON is simply a way to represent the *data* portion of *objects*. Here, we mean *objects* in the *object-oriented programming* sense, though technically, we are only representing the *data* portion of object *instances*.

Here's the JSON content from the web app, formatted with indentation:

```text
{
 name: "f26-xx",
 members: [
   "Alice",
   "Bob",
   "Chris G.",
   "Danny",
   "Eve",
   "Frances"
   ]
}
```

Without indentation, it might look like this; it's harder to read, but equivalent in terms of what it represents.
```
{name: "f26-xx",members: ["Alice","Bob","Chris G.","Danny","Eve","Frances"]}
```

JSON is usually pronounced like this: "Jay Son", rhyming with the phrase "play on".

We'll talk a lot more about `json` as the course progresses, but for now, just notice that:
* The JSON object is surrounded by curly braces (`{}`)
* It is a set of key/value pairs.
* The keys are `name` and `team`.
* The value of `name is a string in *double quotes* (`"Chris G."`)
* The value of team is an array of strings, surrounded by square brackets (`[]`).
  
We'll come back to a discussion of JSON objects later on, and we'll look at the code that produces pages in either HTML or JSON format.

### Step 1.4: Deploy on Dokku

Now deploy the app on dokku (as you did in jpa01)


All steps require you to login to your dokku machine, i.e. the following series of `ssh` commands (replacing `xx` with your two digit team number).

```
ssh username@csil.cs.ucsb.edu
ssh username@dokku-xx.cs.ucsb.edu
```

<details markdown="1">
<summary markdown="1">
Click the triangle for a list of teams and dokku hostnames
</summary>
{% include dokkus.md %}
</details>

The steps to deploy the app are explained here: <https://ucsb-cs156.github.io/topics/dokku/deploying_simple_app.html> in detail, but here's the short version.

First time: 

| Explanation | Command(s) |
|-------------|------------|
| 1. Create dokku app | <tt>dokku apps:create {{page.title}}-<i>yourGithubId</i></tt> |
| 2. Sync the app with git repo, main branch | <tt>dokku git:sync {{page.title}}-<i>yourGithubId</i> {{page.course_org}}/{{page.title}}-<i>yourGithubId</i>.git main</tt>
| 3. Deploy the `http` version of the app | <tt>dokku ps:rebuild {{page.title}}-<i>yourGithubId</i></tt> |
| 4. Configure email for `https` support | <tt>dokku letsencrypt:set {{page.title}}-<i>yourGithubId</i> email <i>youremail</i>@ucsb.edu</tt> |
| 5. Enable https on your app | <tt>dokku letsencrypt:enable {{page.title}}-<i>yourGithubId</i></tt> |

To redeploy any time the repo changes (otherwise changes in the repo don't affect the running app):

| Explanation | Command(s) |
|-------------|------------|
| 1. Re-sync the app with git repo, main branch | <tt>dokku git:sync {{page.title}}-<i>yourGithubId</i> {{page.course_org}}/{{page.title}}-<i>yourGithubId</i>.git main</tt>
| 2. Re-deploy the `http` version of the app | <tt>dokku ps:rebuild {{page.title}}-<i>yourGithubId</i></tt> |

Once you have done these steps, you should be able to see your app running at *both* of these links (modifying them for your dokku/team number, and your github id):

* http (not secure): [http://{{page.title}}-<i>yourGithubId</i>.dokku-xx.cs.ucsb.edu/](http://dokku-xx-yourGithubId.cs.ucsb.edu/{{page.title}})
* https (secure): [https://{{page.title}}-<i>yourGithubId</i>.dokku-xx.cs.ucsb.edu/](https://dokku-xx-yourGithubId.cs.ucsb.edu/{{page.title}})

When that works, you're ready for the next step.

### Step 1.5: Run the test suite

Now return to the terminal command line.  You should `cd` into the directory where you cloned the repo (e.g. <tt>~/cs156/{{page.title}}-<i>yourGithubId</i></tt>)

You are now going to run a suite of tests. You can run the test suite by doing `mvn test`. There will be *lots* of output.  The main thing is that the last part of the output should look like this, indicating that the tests passed:

```
[INFO] Tests run: 3, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.327 s -- in edu.ucsb.cs156.spring.hello.HelloControllerTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 7, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  4.257 s
[INFO] Finished at: 2024-10-08T11:56:18-07:00
[INFO] ------------------------------------------------------------------------
pconrad@Phillips-Mac-mini-2 jpa02-pconrad %
```

Here's what that looks like with screen highlighting:

![image](https://github.com/user-attachments/assets/b55781e5-37b1-4b49-9afb-38a8adfdae70)

The most important lines here are these:

```
[INFO] Tests run: 7, Failures: 0, Errors: 0, Skipped: 0
[INFO] BUILD SUCCESS
```

Later in this assignment, we'll make some changes to the app and we'll see these tests fail, but *not just yet*.  We want to look at something else first, and
that requires the test suite to be "green", meaning, that all tests pass.  For those that can see color, the words `BUILD SUCCESS` show up in green, indicating
that the tests passed.  If one or more did fail, it would look something like this instead:

```
[ERROR] Tests run: 7, Failures: 1, Errors: 0, Skipped: 0
[INFO] BUILD FAILURE
```

Or, with screen highlighting:

![image](https://github.com/user-attachments/assets/a84a86a1-a69f-4df4-b531-59985d9fd8dc)

The tests are located in the directory `/src/test/java/edu/ucsb/cs156/spring/hello`, in the files listed below (the links take you to the version of the code in the starter repo).  Look them over, and you'll see that there are some `TODO` items 
marked in comments.  *Later* in this assignment, you'll be addressing those `TODO` items, **but not yet**.   We need a green test suite before we look at this next step.

* [`ApplicationTest.java`]({{page.starter_repo}}/blob/main/src/test/java/edu/ucsb/cs156/spring/hello/ApplicationTest.java)
* [`DeveloperTest.java`]({{page.starter_repo}}/blob/main/src/test/java/edu/ucsb/cs156/spring/hello/DeveloperTest.java)
* [`HelloControllerTest.java`]({{page.starter_repo}}/blob/main/src/test/java/edu/ucsb/cs156/spring/hello/HelloControllerTest.java)
* [`TeamTest.java`]({{page.starter_repo}}/blob/main/src/test/java/edu/ucsb/cs156/spring/hello/TeamTest.java)

If you are familiar with the idea of writing unit tests for code, then you can just skim the test files above. But if this is a new concept to you, please look over the tests in some detail and try to understand what is happening in these tests.

The basic idea of unit tests is that we want to write some code that tests our "main" code.   In a Maven project, we keep all of our `main` code and our `test` code in entirely separate directory trees (there are several really good reasons for this but we won't go into those just now.)  

A few key points:
* Each of the tests is a single Java method annotated with `@Test`.
* A unit test, ideally, should test just one *unit* of code, i.e. a single method, not relying on any other code (This is not always entirely possible, but that's the goal; in practice you sometimes need to rely on the correctness of the constructor, for example, before you can test a method.)
* In a unit test, there are typically three parts:
  * Arrange: set up the context of the method you want to call
  * Act: call the method you want to test (or otherwise cause it to be invoked)
  * Assert: make one or more *assertions* that should be true if the code worked properly

Look for these in the test code. Note that not all of the test code follows this pattern *precisely*, which may lead you to have many questions.  That's good! Ask the questions on {{page.slack_help_channel}}, and we'll try to answer as many as we can.

But in the meantime, let's move on to discussing code coverage and mutation coverage.

### Step 1.6: Review Jacoco Report

The next two steps involves what may be a new concepts to you:

* *test coverage* in general: more specifically *line coverage* and *branch coverage*
* *mutation testing*

All of these are ways of *measuring the qualilty of a test suite*.  The main idea is:

* Our test suite (collection of unit tests) checks for bugs in the code (assuming that the tests are correct)
* Test Coverage and Mutation Testing *tests that tests themselves* to make sure that the test suite is as complete as possible.

Note that *no testing approach can guarantee 100% correctness*. (Pay attention to that previous sentence, because a misunderstanding of this is one way that students lose points on the final exam.)

Testing can only show the *presence* of bugs, never the *absence* of bugs.
* More specficially: failed tests show that a bug is present (either in the code, or the test).
* A purely green test suite does *not* show that your code is free of bugs; there might be some case you didn't test for!

That last part is the key here: we want to *minimize* the number of cases we didn't test for.

What *test coverage* and *mutation testing* do for us is exactly that: they help uncover parts of the code that are *not* being tested adequately, so that we can try to improve our test suite.

In this step, we focus on the first of these techniques, *test coverage*.

What test coverage does is very simple and fast:
* It runs the entire test suite once
* As it does, it keeps track of every line of code that was executed by at least one of the tests
* The lines left over (the ones that were never executed) are the *gaps in coverage*; lines of code for which you need to write a test.

Clearly, if a line of code was never executed by a test, then the test suite cannot possibly distinguish between whether that code is correct or incorrect.  So if the correctness of that line of code is important, we need to write a test for it.

A tool called `jacoco`, which is short for "Java Code Coverage" can check for line and branch coverage in Java:
* `line coverage` entire lines of code to see if they were run by at least one test
* `branch coverage` looks deeper into things like `if/else`, loops, conditional expressions, etc to ensure that if there is more than one *path* through the code (e.g. the `if` part and the `else` part), that *both* branches were covered.

#### Running `mvn test jacoco:report`

Let's run a line coverage report by typing:

```
mvn test jacoco:report
```

When you do, it will run the test suite, and then generate a jacoco line coverage report, which will be formatted as a web page.  Here's what the tail end of that output looks like:

```
[INFO] --- jacoco:0.8.12:report (default-cli) @ hello ---
[INFO] Loading execution data file /Users/pconrad/github/ucsb-cs156-f26/jpa02-pconrad/target/jacoco.exec
[INFO] Analyzed bundle 'hello' with 4 classes
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  3.968 s
[INFO] Finished at: 2024-10-08T12:32:52-07:00
[INFO] ------------------------------------------------------------------------
pconrad@Phillips-Mac-mini-2 jpa02-pconrad % 
```

There will be no particular indication of the outcome of the report, or where to find it; you just *have to know*.  

The place to look for it is under `target/site/jacoco/index.html`.
* On MacOS, you can open that file with the command `open target/site/jacoco/index.html`
* On Windows, one way to open it is to open the File Explorer, and navigate to the `\\wsl$` directory and open Ubuntu/home to reach your Ubuntu user directory.

In any case, once you open it, it should look like this:

![image](https://github.com/user-attachments/assets/2614fb23-f396-45d3-b0ff-a9dd6bd4c258)

Look over the report, and look for the red.  These are parts of the code that were not touched when you ran `mvn test`.

Let's zoom in on this part:
![image](https://github.com/user-attachments/assets/7970f262-6106-43a9-a677-607258b3e3a0)

It shows the package `edu.ucsb.cs156.spring.hello` and it shows that the code in this package has only 86% line coverage, and 56% branch coverage.  Our goal is to get that to 100%

* An aside: in most industry settings, 100% coverage is explictly **not** the goal; there are diminishing returns if you start chasing 100% coverage in very large legacy code bases.
* However, in this course, we've engineered things so that on these early assignments 100% coverage is definitely reasonable and possible.
* Further, in our large code bases, we adopt an approach of *identifying* the parts of the code that should be *reasonably* exempt from code coverage, and *excluding them* from the computation.
* Accordingly, while in many settings 100% coverage may not be a reasonable goal, in this course *it always is*.

So, how can we learn more?  Click on the package name  `edu.ucsb.cs156.spring.hello`; it's a link and it should open up a page that looks like this:

![image](https://github.com/user-attachments/assets/ff40860d-39af-4de9-b1d0-d83c1e0fcb30)

On *this* page, we see individual class names.  And we can see that all of the problems (lines not covered by tests) are in the `Team` class.

So, now we can click on the link for `Team` and it takes us to a page like this one, where we see statistics for individual constructors and methods:

![image](https://github.com/user-attachments/assets/d6677d54-14fc-4b10-9cd3-762ed873a28a)

From here, we can see that three methods, in particular, are the ones not tested:
* `hashCode`
* `toString`
* `equals`

Clicking on any of these three links takes us to a page with the source code, marked up with information about the line and branch coverages gaps.  Click on any one of these, and you'll be taken to a page that looks like this (I'm only showing the part from line 56 to the bottom, so you may need to scroll to see this view):

![image](https://github.com/user-attachments/assets/9d126368-40b2-48bd-b210-1f3212aeebcf)

A few things to notice:
* The green on lines 60-61 shows that the `setMembers` method is fully covered by tests (this is also true of all the methods and constructors earlier in the file; scroll up to verify)
* The mix of yellow, red and green in the `equals` method shows that some parts are covered by tests, but others are not.
  * Green means completely covered (the whole line was run by at least one test)
  * Red means not covered at all (none of this line was run during any test)
  * Yellow means partial branch coverage (some part of this line was run by at least one test, but at least part of this line was *not* run by *any* test).
* The solid red in the remaining two methods shows they are not covered by tests *at all*.
  
One note, especially for *red/green colorblind folks*, but really for everyone: `jacoco` here is violating an important priciple of accessiblity (sometimes abbreviated as [a11y](https://www.a11yproject.com/): don't depend solely on color (especially red/green) to indicate something in a user interface.   It's a [known issue with jacoco](https://github.com/jacoco/jacoco/issues/144); after the course is done, if you feel confident, you might submit a pull request to try to address it.  The link also has some suggested work arounds if it's a problem for you.

As we'll discuss later in the assignment, the three methods `hashCode`, toString` and `equals` are really important methods for a Java class; if they are not implemented correctly, many things can go wrong.
So testing them is important.

Later in the assignment, we'll show two ways to address this testing gap:
1. Write good tests for these methods
2. Rewrite the class so that these methods are generated automatically, and therefore don't need to be tested.

But for now, as long as you understand how to generate a line/branch coverage report (i.e. `mvn test jacoco:report`) and how to interpret the output, you are good to move on.

### Step 1.7: Review Pitest Report

Line coverage has two advantages:
* It runs fast; calculating it is just a little bit of overhead on a single run through all of the unit tests.
* It's good for a quick check to find out which parts of the code have *no tests at all*.

But, the problem is: it's easy to cheat.  Consider the following *imaginary* scenario (please, never actually do this):
* You are required to get 100% test coverage
* So you write a bunch of tests that invoke each method once
* In each test, you just invoke the method and then write `assertEquals(4, 2+2)`
* Add additional method calls with slightly different parameters until all of the branches are covered.

You now have 100% line and branch coverage, but *no meaningful testing*, except to test the the code doesn't crash.  That's a low bar, and not what testing is for.

The problem with line coverage, even when someone is doing a good faith effort to write tests with meaningful assertions is that it's easy to miss all of the things that you need to be
asserting in order to verify that the code is correct.

This is where mutation testing can really help.  

#### How does mutation testing work?

Here's how mutation coverage works:
* pitest starts with the assumption that your code is correct (after all, it passes your tests).
* Then, it makes many copies of your main code (usually dozens of copies), each with one "mutation" that is designed to break the code.
  * For example, if it finds `if (x < 0)` it mutates it to `if (x >= 0)`
  * If it finds `return result;` it changes it to `return null;`
  * If it finds a call to a method, it just removes that line of code completely.
  * etc.
* Each copy of the code has just *one* and *only one* of these mutations.   The notion is that these mutations should cause bugs (assuming the code is written correctly, and every line of code is really necessary).
* These copies with mutations are called *mutants*.  Think of them like *mutants* in a science fiction film that are roaming the earth causing mayhem.  Mutants are bad.  We want to *kill the mutants*.
  * Note: If you are a person that practices non-violence, I apologize that this metaphor may be uncomfortable, but please remember: it's just a metaphor. If you want to suggest that we negotiate peace with the mutants instead of killing them, I admire your ethics, but in that case the metaphor breaks down. Please just go with me here: we want to *kill the mutants!*.
* Mutation testing works by generating these mutants, then running your entire test suite on each of them, hoping for at least one test to fail. (This is why it takes so long to run!)
* For each mutant, if at least one test fails, that means the *mutant was killed*.  That's *good*.  It means that your tests suite is powerful enough to detect when something has gone wrong in your code.
* But if there is a mutant where all of the tests pass, that means the *mutant survived*. That's usually *bad*.  It usually means your tests suite was not powerful enough to detect the problem.
  (There is a *rare* corner case where it might be a "false positive", meaning there's nothing wrong with your code or the test suite; we'll cover that case later as it arises).
* A third possibility is when the mutation causes one or more tests to go into an infinite loop.  This is called a "time out" and is a consequence of the *halting problem*, which is a topic of CMPSC 138.  In practice, timeouts are unavoidable (see *halting problem*), so we treat timeouts as "inconclusive" and ignore them; we focus only on trying to ensure that no mutants survive.

#### Let's try mutation testing with `pitest`

Use `mvn test pitest:mutationCoverage` to generate a mutation coverage report.

Then open the file `target/pit-reports/index.html` in a browser

* On MacOS, you can just type `open target/pit-reports/index.html`
* On Windows, one way to open it is to open the File Explorer, and navigate to the `\\wsl$` directory and open Ubuntu/home to reach your Ubuntu user directory.

As with the line coverage reports from `jacoco`, the `pitest` report starts at the package level.  In this project, all of our code is in the package
`edu.ucsb.cs156.spring.hello`.  The part we are interested in here is the mutation percentage, which shows how many of our mutants survived (remember that
a surviving mutant is *bad*; it means that we were able to introduce what was likely a bug into the code, but no test caught the bug.)  We only killed 11 out of 25 mutants, which is
not very good.

![image](https://github.com/user-attachments/assets/b13953d3-5ea7-42c4-8a5a-4369eba19a56)

Next, click on the top level package to drill down into individual classes. That should look like this:

![image](https://github.com/user-attachments/assets/ff3dc653-889f-4b0d-82e1-7ed3804724db)

We now see that while line coverage only showed that there was insufficient tests for `Team.java`, running
pitest shows that we also have some problems in `Developer.java`.  So let's click into that file to see
what's going on:

The top of the file looks fine:

![image](https://github.com/user-attachments/assets/44490066-a3bb-4e1a-9940-4b52e974dac6)

But as we scroll down, we see the issues.   The lines with numbers to the right of the line numbers
are lines that were mutated.  When the highlighting is green, the mutants were killed (or timed out), but when they are red,
it means they survived. 

![image](https://github.com/user-attachments/assets/8eb2b179-6132-4ea8-800a-ea4e266feea4)

The numbers beside the line numbers can be treated like footnotes: they refer to the table below that shows
what the mutation was, and what the outcome was.  You can also hover over any of these numbers and there's a pop up, like this one:

![image](https://github.com/user-attachments/assets/504b35a1-2feb-40cd-8675-63dcd105ff7a)

What this is telling us is that for each of the lines 44-49, if you remove the line of code completely, the *tests all still pass*.
So, if these lines are important to the correct functioning of the code, we need a test for the *outcome* of calling these lines: one that passes when the line is present, and
fails when it is not present.

At a later stage, you'll be asked to write tests to cover these mutation coverage gaps.

But for now, its enough that you are familiar with:
* How to run pitest (`mvn test pitest:mutationCoverage`)
* How to bring up the report and make sense of it.

Now we are ready to do some actual coding.

## Part 2: Customizing the app

In this step, you'll start putting in correct values, replacing the placeholders such as `Chris G.` with your own name

You'll do this *first* in the test code (the code under `/src/test/java`)

You'll see that the tests then fail

Then do this in the main code (the code under `src/main/java`)

Iterate on this until the tests pass.

You should *also*, in parallel, actually run the application on localhost using `mvn spring-boot:run` to see that the output actually looks correct.

* Examine the contents of the home page (i.e. <http://localhost:8080/>)
* Example the contents when you click the link that takes you to <http://localhost:8080/info>
* Examine the contents when you click the link that takes you to <http://localhost:8080/team>

Make sure that every page has real information for you and your team, and that all of the placeholders are gone.

In addition, make sure that when you run `mvn test` all of the tests now pass.

### Do this methodically, and try to follow along 

It would be very easy to get through this lab super quickly, just doing the bare minimum to get everything to work and pass.  I'm walking you through most of the code changes, and they aren't that hard.

BUT: I encourage you to instead, take some time to really look at the code and try to understand it. That will pay off in later assignments, where there will *not* be this level of handholding.

### Part 2.1: Edit `getName_returns_correct_name` in `DeveloperTest.java`

In the file `DeveloperTest.java`, locate the test `getName_returns_correct_name`.  It looks like this:

```java
    @Test
    public void getName_returns_correct_name() {
        // TODO: Replace Chris G. with your name as shown on
        // <https://bit.ly/cs156-f26-teams>
        assertEquals("Chris G.", Developer.getName());
    }
```

Follow the instructions, and then remove the the line `//` style comment.  For example, if your name is just `Katy` on the teams list, your code should look like this after you are done (only put `Katy P.` if the last initial appears on the teams list.)

```java
    @Test
    public void getName_returns_correct_name() {
        assertEquals("Katy", Developer.getName());
    }
```

Now run the test suite.  The test should fail, like this:

```
[ERROR] Failures: 
[ERROR]   DeveloperTest.getName_returns_correct_name:27 expected: <Katy> but was: <Chris G.>
```

Now find the place in `Developer.java` where `Chris G.` needs to be replaced with your name (e.g. `Katy`).  Make the change, and remove the three line `//` style comment with the `TODO` in it.  Run the test again, and they should pass.

Run the app too, with `mvn spring-boot:run` and see that the name `Chris G.` is now your name.

When this is done, do a commit. Start by typing `git add .` followed by `git status`.

```
git add .
git status
```

This will show you what file will go into the next commit.  It should be *only* these files:

```
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
    	modified:   src/main/java/edu/ucsb/cs156/spring/hello/Developer.java
	    modified:   src/test/java/edu/ucsb/cs156/spring/hello/DeveloperTest.java
```

If there are other files that got scooped up by mistake, you can use the `git restore --staged <file>` command to unstage them (as explained in the message from git).

**ALWAYS** type `git status` after typing `git add .` so that you avoid committing files by accident.

Assuming the staged files are only `Developer.java` and `DeveloperTest.java`, you can now make the commit.

```
git commit -m "xy - updated with actual developer name"
git push origin main
```

We don't necessarily need to say: `"xy - updated code and tests with actual developer name"` since the *normal* case should be that we update code and tests in the same commit.   
* There may be times when we must deviate from this practice, but this is the best way to go about it.
* The idea is to not make a commit that breaks things; if the unit tests aren't passing, that leaves things in a broken state.

Let's make another change now.

### Part 2.2: Add test for `getGithubId`

Now, return to the pitest report you ran on `Developer.java`.  Note that there is a testing gap for the `getGithubId` method.

To address, this, add a test in `DeveloperTest.java`.  It will be very similar to the one that is already there called `getName_returns_correct_name`.

A good name for this new test would be: `getGithubId_returns_correct_githubId`.

Write a test, but use *your* githubId in place of `cgaucho`.

Then, fix the code in Developer.java so that the test passes (use `mvn test` to run the tests)

You should then be able to run these commands and verify that the method `getGithubId` is now green in both the `jacoco` and `pitest` reports:

```
mvn test jacoco:report
mvn test pitest:mutationCoverage
```

Make another commit (replace `xy` with your initials):

```
git add .
git status
git commit -m "xy - updated with actual github id"
git push origin main
```

### Part 2.3: Change `getTeam` in `Developer.java` to the names of the member of your team.

Next, change the names in this method to match those of the members of your team, including yourself, and remove the `// TODO` comment:

```
  /**
     * Get the developers team
     * @return developers team as a Java object
     */
    
    public static Team getTeam() {
        // TODO: Change this to your team name
        Team team = new Team("f26-xx");
        team.addMember("Alice");
        team.addMember("Bob");
        team.addMember("Chris G.");
        team.addMember("Danny");
        team.addMember("Eve");
        team.addMember("Frances");
        return team;
    }
```

Then, run the test suite (`mvn test`); everything should still pass.

Then, run `mvn test pitest:mutationCoverage` and you'll see we still have a testing gap here.

To address that, let's write a test in `DeveloperTest.java` that the team that `getTeam` returns has the correct name. For example, if your teamname is `f26-00`, the test might look like this:

```
    @Test
    public void getTeam_returns_team_with_correct_name() {
        Team  t = Developer.getTeam();
        assertEquals("f26-00", t.getName());
    }
```

We can also write a test that checks for each of the members of the team.  Here's one way to do that.  Note that `assertTrue` takes two parameters:
* An boolean expression that should evaluate to true if the test passes
* A string that is printed if the test fails

```
    @Test
    public void getTeam_returns_team_with_correct_members() {
        Team  t = Developer.getTeam();
        assertTrue(t.getMembers().contains("Amey"),"Team should contain Amey");
        assertTrue(t.getMembers().contains("Grace"),"Team should contain Grace");
        // ... etc
    }
```

Or, you could make each one a separate test.  There are pros/cons to each approach.  All-in-one test is more compact code, but if any of the assertions fails, it won't check the rest of them.
With separate tests, you get a lot more information from the test suite, since they can independently pass or fail.  It's a judgement call; different programmers will make different decisions here,
and each could defend their choice.

```
    @Test
    public void getTeam_returns_team_with_Amey() {
        Team  t = Developer.getTeam();
        assertTrue(t.getMembers().contains("Amey"),"Team should contain Amey");
    }

    @Test
    public void getTeam_returns_team_with_Grace() {
        Team  t = Developer.getTeam();
        assertTrue(t.getMembers().contains("Grace"),"Team should contain Grace");
    }
    // ... etc
```

Either way, write these tests, and then check the pitest output again.  If you did it correctly, you should now have this on pitest for `Developer.java`:

![image](https://github.com/user-attachments/assets/b0d40a7c-f3f7-48dc-b2f7-01c3e66cff40)

And, when you run `mvn spring-boot:run`, you should now see correct information for yourself, your github, and your team on the web pages.

Do another commit.  Choose a reasonable commit message for the change that you made, and push that change to the `main` branch on the `origin` repo (the one on Github).

**NOTE: The autograder will check your team members names on your Dokku installation. If the autograder detects that the names are incorrect, you will need to update them and redeploy on Dokku.**

### Part 2.4: Redeploy to dokku

If the website now looks correct when you type `mvn spring-boot:run` and look at it on `localhost:8080`, it's time to update dokku:

As a reminder, that's:

| Explanation | Command(s) |
|-------------|------------|
| 1. Re-sync the app with git repo, main branch | <tt>dokku git:sync {{page.title}}-<i>yourGithubId</i> {{page.course_org}}/{{page.title}}-<i>yourGithubId</i>.git main</tt>
| 2. Re-deploy the `http` version of the app | <tt>dokku ps:rebuild {{page.title}}-<i>yourGithubId</i></tt> |

Note that in future labs, we'll start to wean you off this hand-holding; if we say "deploy on dokku", you'll be expected to just know the command to do that (or be able to look it up quickly).

Check that your dokku deployment has the correct content (i.e. your name, your github, your team's name, your teammates' names).

## Part 3: Full line and mutation coverage for Team.java

We now want to get to full line and mutation coverage for Team.java

We have this problem left to solve: three methods of Team.java have mutation coverage gaps:

![image](https://github.com/user-attachments/assets/d32dc527-f7c1-4837-bc7f-6846361bda50)

Before we can proceed, we need to understand what each of these methods is really doing.

* The three methods `hashCode()`, `toString()` and `equals()` are particularly important in Java
* Every class has these three methods, whether they are declared or not.
* That's because in Java, every class inherits methods from a special base class called `java.lang.Object`.
* So, if you don't override these methods in your class, you get the *default* implementation.
* The default implementation is sometimes fine, but other times it isn't.

Let's start with the easiest method: `toString`.  

One easy way to understand toString is to use the `jshell` utillity. In the next section, we try to do the shortest possible lesson on `toString`, but if you want a more in-depth lesson, visit: <https://ucsb-cs156.github.io/tutorials/student/student_ex02.html>

### Part 3.1: Using `jshell` to understand `toString`

First, verify that `jshell` works on your system by typing `jshell`.  You should see this:

```
pconrad@Phillips-Mac-mini-2 jpa02-pconrad % jshell
|  Welcome to JShell -- Version 21.0.4
|  For an introduction type: /help intro

jshell> 
```

To exit `jshell` at any time, use: `/exit` like this:

```
jshell> /exit
|  Goodbye
pconrad@Phillips-Mac-mini-2 jpa02-pconrad % 
```

Next, be sure your code is up to date by typing `mvn compile`, and then start up `jshell` with the `classpath` being the directory <tt>&#96;pwd&#96;/target/classes</tt>.  Note that the (<tt>&#96;</tt>) character is the *backtick*, at the upper left hand corner of the US-EN keyboard.

```
mvn compile
jshell --class-path `pwd`/target/classes
```

You should then be able to import the Team class with the command:
* import edu.ucsb.cs156.spring.hello.*

```
pconrad@Phillips-Mac-mini-2 jpa02-pconrad % jshell --class-path `pwd`/target/classes
|  Welcome to JShell -- Version 21.0.4
|  For an introduction type: /help intro

jshell> import edu.ucsb.cs156.spring.hello.*

jshell> 
```

Then you can type in the following:
```
Team t = new Team();
t.toString();
```

The output should be something like this:

```
jshell> import edu.ucsb.cs156.spring.hello.*

jshell> Team t = new Team();
t ==> Team(name=, members=[])

jshell> t.toString()
$3 ==> "Team(name=, members=[])"

jshell> 
```

Now, try `t.setName("f26-xx")` then put in `t.toString()` again.  You should get the result: `"Team(name=f26-xx, members=[])"`

You can also try invoking other methods such as `addMember` on the `t` object to see the result.

Now, try this: comment out the `toString` method in the `Team.java` class so that it looks like this.  Note that in VSCode, you
can comment out a block by selecting it, then using `Command /` on MacOS, or `Control /` on WSL.

```
    // @Override
    // public String toString() {
    //     return "Team(name=" + this.name + ", members=" + this.members + ")";
    // }

```

Exit from jshell, recompile, and go back into jshell:

```
/exit
mvn compile
jshell --class-path `pwd`/target/classes
```

Now if you type the same sequence as before, you'll see that the output of `t.toString()` is simple a generic string followed by a number:

```
"edu.ucsb.cs156.spring.hello.Team@1"
```

The point is that the purpose of the toString method is to give us a nice human readable version of the contents of an object.

And that turns out to be *very important for reading the output of JUnit messsages*, since JUnit uses `toString` to give us information about objects.

Now that we understand the purpose of `toString`, let's look at how to solve the testing gap.

### Part 3.2: Testing gap in toString

Fixing the test gap for `toString` is relatively simple.  

Note that in `TeamTest.java`, we have this code:

```
    Team team;

    @BeforeEach
    public void setup() {
        team = new Team("test-team");    
    }
```

This declares a variable called `team`, and in the `setup` method which is run before each test (due to the `@BeforeEach` annotation), it is initialized to an instance of `Team`.

So our test can just assert that the `toString` method returns what we expect for this object:

```
    @Test
    public void toString_returns_correct_string() {
        assertEquals("Team(name=test-team, members=[])", team.toString());
    }
```

Add this test, run `mvn test`, and if passes, run `mvn test pitest:mutationCoverage` again.  You should see that the `toString` method is now green 
on the pitest report:

![image](https://github.com/user-attachments/assets/c79f6adc-b2c9-453b-887b-58f7f565dde3)

Next, we tackle the equals method.

### Part 3.3: Testing gap in equals

There are two ways to test for equality in Java:
* `x==y`
* `x.equals(y)`

Understanding the different is important.

The short version of `==` vs `.equals` in Java is this:
* When you compare primitives (values of types `boolean` , `byte` , `char` , `short` , `int` , `long` , `float` and `double`), `==` works like you expect, and `x.equals(y)` isn't available.
* When you compare objects, `==` compares the *references* (the pointers) and returns `true` if they are the *same object on the heap*, otherwise false.
* When you compare objects, `equals` does *exactly what `==` does*, **unless** some code has been written to override `equals`.

In practice:
* For all classes that are standard built in Java classes such as `String`, `ArrayList<T>`, etc. `equals` has been overridden appropriately.
* For all classes that *you write*, you *need to do it yourself* if you are ever relying on comparisons for equality.
* Any class where you test whether objects are equal in JUnit tests need a proper `equals` method.

This is what a proper equals method looks like (this the `equals` method in the starter code, just with
some extra comments):

```java
  /**
     * Check if a team is equal to another object
     * @param obj object to compare to
     * @return true if the object is a team with the same name and members
     */
    @Override
    public boolean equals(Object obj) {
        // Case 1: these are the same object
        if (obj == this) {
            return true;
        }
        // Case 2: the other object isn't even an instance of this class
        if (!(obj instanceof Team)) { 
            return false;
        }
        // Case 3: Cast the other object to this class, and compare all of the fields
        Team other = (Team) obj;
        return this.name.equals(other.name) && this.members.equals(other.members);
    }
```

What we need (that's missing) are some test cases for the parts of the code that aren't covered.

We need (in all), a test case for:
* Case 1: same object
* Case 2: different class
* Case 3: Here, there are two parts to the `&&`, so we may need to cover these possibilities:

  | `this.name.equals(other.name)` | `this.members.equals(other.members)` |
  |--|--|
  | T  | T |
  | T  | F |
  | F  | T |
  | F  | F |

Note that we might not need to cover both `F,T` and `F,F` because of short-circuit boolean evaluation, but I'll leave that for you to work out.

See if you can supply the missing test cases.


### Part 3.4: Testing gap in hashCode

Strictly speaking, any time you modify the `equals` method, you are supposed to modify the `hashCode` method as well.  If you don't, then if/when you use data structures that rely on hashing such as `java.util.HashMap`, they may fail.

(Hopefully you remember the idea of a hash table and hashing from CMPSC 24, CMPSC 32, or an equivalent course.  If not, go review!)

The point of the `hashCode` method is to generate a hash (an `int` value, i.e. a 32-bit signed integer) based on the contents of the object, such that:
* if `a.equals(b)`, then `a.hashCode()==b.hashCode()`
* note that it is *not necessarily* the case that if `a.hashCode()==b.hashCode()`, that `a.equals(b)` (that's sort of the whole idea of hashing; taking a large domain of values and mapping it to a smaller domain of values.)

Try to write a test that will check the `hashCode` value.  

Note that you might not know what the expected value is.  But you do know that if you set two objects to have the same content, that their `hashCode()` values should be equal. So, consider something like this:

```
   Team t1 = new Team();
   t1.setName("foo");
   t1.addMember("bar");
   Team t2 = new Team();
   t2.setName("foo");
   t2.addMember("bar");
   assertEquals(t1.hashCode(), t2.hashCode());
```

This should enable to you to get 100% test coverage (both line coverage and mutation coverage) for the Team.java class.
(But! See below!)

#### The equivalent mutation problem in `hashCode()`

There is an interesting problem that arises with the mutation testing for the `hashCode()` function.

Here's the question that a students in a previous offering of CMPSC 156 asked:

```
I'm assuming the choice to use the | operator instead of something like & is arbitrary
(i.e. using it still maintains the property of a hash function). Mutation testing is complaining
that using & in replacement should cause test suite to fail, but in fact doesn't.
How would you test this code if theoretically & should work? Unless it shouldn't?
```

Prof. Conrad's response:

> Ah, Terrific! You've stumbled across something we call the "equivalent mutation" problem.
> 
> Mutation testing is a pretty darn good technique. But it's not perfect. There are a few cases where it runs into problems. They are rare, but they do occur.
>
> An equivalent mutation arises when:
> * There is more than one correct way to write the code (call two of these a and b)
> * The correctness doesn't really depend on which implementation you choose, so you chose a
> * One of the mutations turns a into b
> * Since it's also a correct implementation it passes all the tests

Adding to this explanation from the Slack: 

We have exactly the situation described in the slack post.  The `hashCode()` function is just trying to combine the hash codes of the two parts in some way.  That can be done with bitwise `&` or bitwise `|`, and either way, you get a hash function that satisfies the requirements.   So, a mutation that turns one into the other is not going to affect correctness.

In this situation, there are at least two ways I know of to get around the problem to get full mutation coverage:

1. Write a test that *depends on a particular implementation*.  This works, though it's kind of "overspecifying" the requirements, so it's not ideal. That is, you are adding requirements to your test suite that really aren't *strictly* necessary for the implementation to be "correct" in the sense of meeting the needs of the users.   This is a case where some comments to clarify this may be helpful. 
2. Configure the mutation testing framework to just skip this mutation and/or this method.

For this exercise, I'm going to recommend option 1, because it's easier to understand and implement.  Here's the trick:

1. Write a test for the `hashCode` function something like this:
```
// instantiate t as a Team object
int result = t.hashCode();
int expectedResult = 0;
assertEquals(expectedResult, result);
```

2. Run the test.  That test will fail the first time you run it.  But, you'll then learn what the actual value of the `hashCode()` function is on that object from the error message.
3. Put that correct 
value in for the `expectedResult`.  This is cheating, a little bit, so it's not a great idea to get into this habit.   But sometimes, it's the most expedient way.


## Part 4: Finishing up and Submitting

### Part 4.1: Getting Green on CI

Before reading on, please do this (even if you've done it before):

```
git pull starter main
git push origin main
```

Reason: there were some references to older Github Actions embedded in the Github Actions scripts; ones that have been *deprecated*.  The word *deprecated* means: you shouldn't be using this thing any more, even though it used to work just fine.

Now look at your repo on github.com.  You should see a green check instead of red X, as shown below.

Red check:

<img width="1267" alt="image" src="https://github.com/user-attachments/assets/989499ef-f284-4ec9-b67a-1fbf52fc9eff">

Green Check: 

What's this red X, green check stuff? 
* The red X shows that at least one *Github Actions* run failed.
* The green check shows that all *Github Actions* runs succeeded.
* A yellow circle means that at least one *Github Action* run is still in progress (e.g. due to a recent push to `main`).

What are Github Actions runs?
* They are scripts that are run on Github's servers when certain conditions are met (e.g. pushing a branch to `main`)
* They typically run things like unit tests, test coverage, mutation coverage, etc.

The scripts are in the `.github/workflows` directory; in this repo, they are called
* `maven.yml` (runs unit tests and jacoco line/branch coverage report; passes when all tests pass and 100% coverage)
* `pitest.yml` (runs pitest mutation coverage; passes when all mutants are killed).

Check that you have a green check.  If you don't, clicking the red X will take you a page where you can look into what's going wrong.

Typically, you'll try to fix all of these problems locally (i.e. get your `jacoco` and `pitest` reports green locally) before you try to get the green check; if all goes well, when you get a green check locally and push to github, the green check will automatically appear.

### Part 4.2: Updating your README.md

Go the the `README.md` file for your repo.

If you still see stuff in there about `jpa01`, then do these commands to get the latest updates from the starter code:

```
git pull starter main
git push origin main
```

You should then see a README that starts like this:

```
# STARTER-jpa02

* TODO: Change the title of this README 
  in the text `# STARTER-jpa02` above
  to match the name of your repo, i. e., `jpa02-yourgithubid`, then delete
  this TODO item.
...
```

Follow all of the `TODO` items and update the `README.md` as requested.  The most important thing is to have a link to your running webapp on dokku.


### Part 4.3: Submit on Gradescope.

You are now ready to submit on Gradescope.


   
