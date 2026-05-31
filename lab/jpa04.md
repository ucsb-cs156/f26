---
description: "Enabling Verified Commits"
assigned: 2026-10-14
due: 2026-10-17 23:59
layout: default
title: jpa04
prev_lab: jpa00
nav_order: 100
ready: false
qxx: f26
layout: default
parent: lab
course_org: https://github.com/ucsb-cs156-f26
course_org_name: ucsb-cs156-f26
starter_repo: https://github.com/ucsb-cs156-f26/STARTER-jpa04
---

<style>
  tt {white-space: pre; font-size: 80%;}
  code {white-space: pre}
  pre {white-space: pre}
</style>

{% include drop_down_style.html %}


For due date: see the {{page.title}} entries on Gradescope.

# Goal

By the end of this lab, commits you push to GitHub will have a "Verified" tag next to them.

This is important because it allows GitHub to verify that commits come directly from you, and have not been modified or tampered with.

It also ensures that we can accurately associate each commit with the individual that made the commit.  Without this, it's possible for some commits to end up with 
metadata (name and email) that are difficult to associate with any given student in the class.

# But why? (More information about Signed Commits)

When you set your git configuration to use an email address with a command like this, github puts that email address on your
commmits:
```
 git config --global user.email "cgaucho@ucsb.edu"
```

But what is to stop you from typing this:

```
git config --global user.email "billgates@microsoft.com"
```

Well, nothing really.  If that really is an email address associated with a GitHub account, you could totally put in commit messages 
that look as if they were made by Bill Gates.  And Bill Gates could impersonate "Chris Gaucho" in return.

While there is nothing in place to stop this impersonation, it is possible to configure 
Commit Signature Verification so that when you make commits, they are identified
with a special badge indicating that the commit is verified as having come from you.

You can learn more at this web page:
* <https://ucsb-cs156.github.io/topics/GitHub/github_verified_commits.html>

Shout out to our friends at AppFolio: this is one of the tips Phill Conrad picked up while interning there.


# This is an individual lab

This is an **individual** lab.  It's very straightforward; probably the easiest lab since {{page.prev_lab}},
so it shouldn't take very long. But it's essential before you undertake the legacy code projects.

You may get help from your teammates in understanding the lab, but each person should complete the lab separately for themselves.


## Step 1: Find your repo

There should already be a repo for you under the course organization
with a name in this format:

* <tt>{{page.course_org}}/{{page.title}}-<i>githubid</i></tt>

where <tt><i>github</i></tt> is your github id.

This repo has configured to require signed commits.  You can verify this by going
to the branch pro

You should add a remote for the starter code from this repo:

<tt>git remote add starter {{page.starter_repo}}</tt>

Then pull in the code from the main branch of the starter repo (here: <{{page.starter_repo}}>) and push it to the main branch of your repo.  

If you need a refresher on how to do that, please see the instructions for {{page.prev_lab}}.

## Step 2: Enable Verified Commits

In this step, we set up verified/signed commits.  

This only has to be done
once per machine that you work on, but if you work on multiple machines it has to
be done on *each of them*.  

If you complete this lab on one machine, but later switch to another for working on other projects that require signed commits, you'll need to repeat this entire "Step 2" on that other machine as well.

What we are doing in this step applies to all of your Github work on that machine, so it isn't necessary to do it on individual repos or for different courses.

### Step 2a: Configure `user.name` and `user.email`

To set your name and email for your whole git installation, run the following commands. The email will need to be one associated with your GitHub Account.

* Replace `"Your Name"` use the name you want to be called in class (e.g. `"Chris Gaucho"`
* Replace `"email@ucsb.edu"` with your ucsb email (e.g. `"cgaucho@ucsb.edu"`). 

```
git config --global user.name "Your Name"
git config --global user.email "email@ucsb.edu"
```

### Step 2b: Create an ssh key

Next, you'll need an ssh public key/private key pair. 

If you have one already, you should be able to find it by doing:

```
ls -al ~/.ssh
```

* The key file ending in `.pub` is the public key.
* The key file that doesn't end in `.pub` is the private key.

If you don't have one on this machine, follow these instructions to create one:

* <https://ucsb-cs156.github.io/topics/GitHub/github_ssh_keys.html>.  


### Step 2c: Configure Github for signing keys


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

### Step 2c: Configure local git for signing keys

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

### Step 2d: Configure Github for signing keys


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

## Step 3: Make a test commit and push to GitHub

Just like in [{{page.prev_lab}}](/f26/labs/{{page.prev_lab}}.html), change the file `src/main/java/Hello.java` so that the `System.out.println` method call reads:

```
        System.out.println("Hello, World!");
```

Now, commit this change:

```
git add src/main/java/jpa00/Hello.java
git commit -m "correct the output"
git push origin main
```

Ensure when you push to GitHub, your output **does not** look like this:
```bash
To github.com:ucsb-cs156-f26/jpa05-yourGithubId.git
 ! [remote rejected]   main -> main (push declined due to repository rule violations)
error: failed to push some refs to 'github.com:ucsb-cs156-f26/jpa05-yourGithubId.git'
```

If so, please go back and look at the instructions for setting up signed commits, and go through them again.  You may have missed something.

If it does work, try this command:

```
git log --show-signature
```

You should see that your commits are signed; something like this:

<img width="1071" alt="image" src="https://github.com/user-attachments/assets/1ceac976-5ee9-4091-971a-c10475b0816e" />

You can type `q` to get out of the `git log` command and return to the terminal shell prompt.

## Step 4: Submit on Gradescope

Now submit your work on Gradescope at the link for {{page.title}}.


## Instructor Resources

<details markdown="1">
<summary>
Click the triangle for a list of tasks the instructor should do prior releasing this lab.
</summary>

* Create {{page.title}} repos 
* Set up starter code in the course organization, and update links
* Create a Gradescope assignment for {{page.title}}
* Run a script to set up the restrictions for signed commits for all repos with the prefix {{page.title}}.  The script here should do it: <https://github.com/ucsb-cs156-f26/membership-scripts/blob/main/.github/workflows/34-create-public-repos-with-commit-verification.yml>
</details>
