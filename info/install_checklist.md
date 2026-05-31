---
title: Install Checklist
description: "A checklist to be sure your installation is complete"
layout: default
parent: info
nvm_version: v0.40.4
maven_version: 3.9.14
node_lts: v22.22.2
npm_lts: v10.9.7
zoom_version: 6.3.11
java_version: 21
---

# {{page.title}} 

**{{page.description}}**

After you complete the [software installation steps here](https://ucsb-cs156.github.io/f26/info/software.html), you can use this checklist to make sure that you've done everything properly.

There are separate checklists for Mac and Windows/WSL.  For Linux, use the WSL checklist and adapt as needed.

# MacOS

Throughout, "command prompt" means "Terminal Window" or "Shell Window".

1. XCode and XCode Command Line Tools are installed
   * To test this, look for XCode in the Applications Directory, and try `g++ --version` at the command line
2. git is installed
   * To test this, type `git --version` and get a reasonable version (2.x or higher)
4. VSCode is installed
   * Look for VSCode in the Applications Folder
5. VSCode shell command is installed
   * To test this, type `code .` at a WSL command prompt in any directory, and it should bring up that directory in VSCode
6. Java version {{page.java_version}} is installed.
   * To test this, type `java --version` at a WSL command prompt; you should get version {{page.java_version}} of Java (not a later or earlier one, but exactly {{page.java_version}}  point something).
8. Maven version {{page.maven_version}} is installed.
   * To test this, type type `mvn --version` at a command prompt, and you get a message that Maven is version {{page.maven_version}} and that it is using version {{page.java_version}} of Java (not a later or earlier one, but exactly {{page.java_version}}  point something).
10. Node Version Manager is installed (**Not needed for first two weeks of the course**)    
    * To test this, type `nvm --version` at a command prompt; you should see version {{page.nvm_version}}
11. Node Version Manager can install the latest lts version of node and npm.  (**Not needed for first two weeks of the course**)
    Note the difference between [nvm (node version manager)](https://ucsb-cs156.github.io/topics/node/node_nvm.html) and [npm (node package manager)](https://ucsb-cs156.github.io/topics/node/node_npm.html).
    * You can type `nvm install {{page.node_lts}}` and it should either install node {{page.node_lts}} and npm {{page.npm_lts}}, or tell you that it is already installed.

# Windows/WSL

Throughout, "command prompt" means a **WSL** "Terminal Window" or "Shell Window" (not Windows Powershell).

1. WSL is installed
2. git is installed **in the WSL partition**
   * To test this, type `git --version` and get a reasonable version (2.x or higher)
4. VSCode is installed **in the WSL partition**
   * Look for VSCode in the Applications Folder
5. VSCode shell command is installed **in the WSL partition**
   * To test this, type `code .` at a WSL command prompt in any directory, and it should bring up that directory in VSCode
6. Java version {{page.java_version}} is installed **in the WSL partition**
   * To test this, type `java --version` at a WSL command prompt; you should get version {{page.java_version}} of Java (not a later or earlier one, but exactly {{page.java_version}}  point something).
8. Maven version {{page.maven_version}} is installed **in the WSL partition**
   * To test this, type type `mvn --version` at a command prompt, and you get a message that Maven is version {{page.maven_version}} and that it is using version {{page.java_version}} of Java (not a later or earlier one, but exactly {{page.java_version}}  point something).
10. Node Version Manager is installed **in the WSL partition** ((**Not needed for first two weeks of the course**).
   * To test this, type `nvm --version` at a command prompt; you should see version {{page.nvm_version}}
11. Node Version Manager can install the latest lts version of node and npm. **in the WSL partition**  (**Not needed for first two weeks of the course**)
    Note the difference between [nvm (node version manager)](https://ucsb-cs156.github.io/topics/node/node_nvm.html) and [npm (node package manager)](https://ucsb-cs156.github.io/topics/node/node_npm.html).
   * You can type `nvm install {{page.node_lts}}` and it should either install node {{page.node_lts}} and npm {{page.npm_lts}}, or tell you that it is already installed.
