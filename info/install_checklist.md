---
title: Install Checklist
description: "A checklist to be sure your installation is complete"
layout: default
parent: info
---

# {{page.title}} 

**{{page.description}}**

After you complete the software installation steps ([MacOS](software_macos.html) or [Windows/WSL](software_wsl.html), starting from the [Software](software.html) page), you can use this checklist to make sure that you've done everything properly.

There are separate checklists for Mac and Windows/WSL, with the same items in the same order as the installation pages.  For Linux, use the WSL checklist and adapt as needed.

Items marked **(Week 3)** are not needed for the first two weeks of the course.

# MacOS

Throughout, "command prompt" means "Terminal Window" or "Shell Window".

1. Everyone: Slack, Zoom (version {{site.zoom_version}} or later) and VSCode are installed
   * VSCode should be in your Applications folder.
2. Part 0: XCode Command Line Tools and Homebrew are installed
   * To test this, type `xcode-select -p` and `brew --version` at the command prompt; neither should give an error.
3. Part 1: git is installed and configured
   * To test this, type `git --version` and get a reasonable version (2.x or higher)
   * Type `git config --global user.name` and `git config --global user.email`; they should show your name and the email linked to your GitHub account.
   * Type `ssh -T git@github.com`; you should see "Hi *your-github-username*! You've successfully authenticated".
4. Part 2: VSCode shell command is installed
   * To test this, type `code .` at a command prompt in any directory, and it should bring up that directory in VSCode
5. Part 3: SDKMAN and Java version {{site.java_version}} are installed
   * To test this, type `sdk version` first.
   * Then, type `sdk use java {{site.jdk_distribution}}; java --version` at a command prompt; you should get version {{site.java_version}} of Java (not a later or earlier one).
6. Part 4: Maven version {{site.maven_version}} is installed
   * To test this, type ``sdk use maven {{site.maven_version}}; mvn --version` at a command prompt, and you get a message that Maven is version {{site.maven_version}} (or newer), that the Maven home is under `.sdkman`, and that it is using version {{site.java_version}} of Java (not a later or earlier one).
7. **(Week 3)** Part 5: Node Version Manager is installed
   * To test this, type `nvm --version` at a command prompt; you should see version {{site.nvm_version}} (or newer)
8. **(Week 3)** Part 5: Node Version Manager can install the current LTS version of node and npm.
   Note the difference between [nvm (node version manager)](https://ucsb-cs156.github.io/topics/node/node_nvm.html) and [npm (node package manager)](https://ucsb-cs156.github.io/topics/node/node_npm.html).
   * You can type `nvm install {{site.node_lts}}` and it should either install node {{site.node_lts}} and npm {{site.npm_lts}}, or tell you that it is already installed.

# Windows/WSL

Throughout, "command prompt" means a **WSL** "Terminal Window" or "Shell Window" (not Windows Powershell).

1. Everyone: Slack, Zoom (version {{site.zoom_version}} or later) and VSCode are installed
   * VSCode is installed on the Windows side (with the WSL extension); it is not installed separately inside WSL.
2. Part 0: WSL (Ubuntu) is installed, and `zip`, `unzip` and `curl` are installed in WSL
   * To test this, open an Ubuntu terminal and type `zip --version`, `unzip -v` and `curl --version`; none should give an error.
3. Part 1: git is installed and configured **in the WSL partition**
   * To test this, type `git --version` and get a reasonable version (2.x or higher)
   * Type `git config --global user.name` and `git config --global user.email`; they should show your name and the email linked to your GitHub account.
   * Type `ssh -T git@github.com`; you should see "Hi *your-github-username*! You've successfully authenticated".
4. Part 2: VSCode shell command works **from the WSL partition**
   * To test this, type `code .` at a WSL command prompt in any directory, and it should bring up that directory in VSCode (with "WSL: Ubuntu" in the bottom left corner)
5. Part 3: SDKMAN and Java version {{site.java_version}} are installed **in the WSL partition**
   * To test this, type `sdk version` and `java --version` at a WSL command prompt; you should get version {{site.java_version}} of Java (not a later or earlier one).
6. Part 4: Maven version {{site.maven_version}} is installed **in the WSL partition**
   * To test this, type `mvn --version` at a WSL command prompt, and you get a message that Maven is version {{site.maven_version}} (or newer), that the Maven home is under `.sdkman`, and that it is using version {{site.java_version}} of Java (not a later or earlier one).
7. **(Week 3)** Part 5: Node Version Manager is installed **in the WSL partition**
   * To test this, type `nvm --version` at a WSL command prompt; you should see version {{site.nvm_version}} (or newer)
8. **(Week 3)** Part 5: Node Version Manager can install the current LTS version of node and npm **in the WSL partition**.
   Note the difference between [nvm (node version manager)](https://ucsb-cs156.github.io/topics/node/node_nvm.html) and [npm (node package manager)](https://ucsb-cs156.github.io/topics/node/node_npm.html).
   * You can type `nvm install {{site.node_lts}}` and it should either install node {{site.node_lts}} and npm {{site.npm_lts}}, or tell you that it is already installed.
