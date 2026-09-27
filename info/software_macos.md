---
title: Software for MacOS
description: "Setting up your MacOS computer for this course"
layout: default
parent: Software
grand_parent: info
---

# {{page.title}}

**Using Windows or Ubuntu Linux instead?** Go to [Software for Windows with WSL](software_wsl.html).

Before you begin, be sure you have installed the software that is the same for everyone (Slack, Zoom, VSCode) from the [Software](software.html) page.

The steps on this page are the same, and in the same order, as the steps on the [WSL page](software_wsl.html), except for the prerequisites in Part 0.

If you have questions about this page, please ask on the [`#help-macos`]({{site.channels.help-macos.url}}) channel on the Slack.

Throughout, "command prompt" means "Terminal Window" (open the Terminal app in `Applications/Utilities`).

## Part 0: Prerequisites for MacOS

### 0.1 MacOS version

If you have a MacOS version that is really old (e.g. 12.x), you should consider upgrading to a later version.

I know for sure that 12.x results in this message later on when you try to install things with `brew`, so folks on version 12.x will *need* to upgrade.
(Folks with later versions *might* be able to delay upgrading.  But if you get a message like this, then you know what you need to do.)

```
Warning: You are using macOS 12.
We (and Apple) do not provide support for this old version.
It is expected behaviour that some formulae will fail to build in this old version.
...
```

### 0.2 Command Line Tools for XCode

On MacOS, `git` and other basic developer tools typically get installed as part of the "Command Line XCode Tools" the first time you ask to use them.  To install them now, type this at the command prompt:

```
xcode-select --install
```

If these are not installed, an installer will appear; in that case, follow the instructions given in the message that pops up.

Don't worry if it says it will take 72 hours for the install; if you start it and let it run for a minute or two, that estimate should come down to something reasonable quickly, but it still may take 10-15 minutes.

Or, you might get this message:
```
xcode-select: note: Command line tools are already installed. 
Use "Software Update" in System Settings or the softwareupdate command line interface to install updates
```

If you get that message, type this next:

```
softwareupdate --list
```

Look through the list, and see if you find this:

```
* Label: Command Line Tools for Xcode-16.2
	Title: Command Line Tools for Xcode, Version: 16.2, Size: 751786KiB, Recommended: YES, 
```

If so, use this command to update the command line tools for Xcode.  **Do not copy this command exactly**, but instead, use the label that showed up on your system so that you get the correct version:

```
sudo softwareupdate --install "Command Line Tools for Xcode-..."
```

For example, for the output above, I would type:

```
sudo softwareupdate --install "Command Line Tools for Xcode-16.2"
```

### 0.3 Homebrew (package manager)

For MacOS, we'll be installing several packages for Java and JavaScript (node) development.  
In many cases, installing those is easier if you *first* install the `brew` package manager.

To see if `brew` is already installed, type `brew update` at the command line.  If it is already installed, this will update your installation.

If you see the following, then it isn't installed, so visit <https://brew.sh/> and follow the instructions to install it.

```
zsh: command not found: brew
```

When the command to install brew finishes, **you are not finished** so keep that terminal window open and do the next part
immediately.

There will be some commands at the end of the output; those will look something like this (but they may not look *exactly* like this,
since they will be tailored to your OS version and machine architecture.  Copy from *your* terminal window, not this web page.)

```
==> Next steps:
- Run these commands in your terminal to add Homebrew to your PATH:
 echo >> /Users/pconrad/.zprofile
 echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/pconrad/.zprofile
 eval "$(/opt/homebrew/bin/brew shellenv)"
```

It is important to run these commands to complete the brew installation.

## Part 1: git

Check whether `git` is installed by typing:

```
git --version
```

If it shows something like this you are good (the version number may vary; any 2.x version is fine):

```
git version 2.50.1 (Apple Git-155)
```

If you get a message that you need to install the XCode Command Line Tools, go back to step 0.2.

### Set up git

Set your name and email by running the following commands with the appropriate values:

```
git config --global user.name "Joe Gaucho"
git config --global user.email "joegaucho@ucsb.edu"
```

**Be sure that the listed email is linked to your GitHub account.** This is how GitHub is able to attribute a commit to your account, and this will be necessary to receive credit for the code you write. You can check the emails associated with your GitHub account at <https://github.com/settings/emails>.

Next, generate an SSH key so that you can `git clone`, `git push`, etc. without re-entering your GitHub login information each time.  (You can always work with repos via HTTPS instead, so this isn't strictly necessary, but it makes using git much easier.)

1. At the command prompt, type this (use your own email; accept the default file location, and choose a passphrase or leave it empty):

   ```
   ssh-keygen -t ed25519 -C "joegaucho@ucsb.edu"
   ```

2. Copy the *public* key to your clipboard:

   ```
   pbcopy < ~/.ssh/id_ed25519.pub
   ```

3. On GitHub, go to <https://github.com/settings/keys>, click "New SSH key", paste the key in, and save it.

4. Test it:

   ```
   ssh -T git@github.com
   ```

   The first time, you will be asked whether to trust the host; type `yes`.  You should see a message like this one:

   <pre>
   Hi <i>your-github-username</i>! You've successfully authenticated, but GitHub does not provide shell access.
   </pre>
   
## Part 2: VSCode command line tool

You should already have installed VSCode from the [Software](software.html) page.  Now install the command line command so that at the command prompt you can type `code .` and it will open VSCode in that directory.

1. Open VSCode.
2. Access the VS Code Command Palette via `shift + Command + P`.
3. Type `shell` and two commands should pop up:

   ![image](https://github.com/user-attachments/assets/d0243bbf-c15b-4071-8bf2-4a05d03a4b64)

   Choose `Shell Command: Install 'code' command in PATH` and follow the prompts.

4. Open a *new* terminal window, `cd` to any directory, and type `code .`.  VSCode should open with that directory.

## Part 3: SDKMAN and Java

Java {{site.java_version}} is required for this course. SDKMAN is a tool that works on Mac, WSL and Linux that makes it easy to select and install Java versions.

### 3.1 Install SDKMAN

For installation instructions, see <https://sdkman.io/>; it's typically a one line install:

```
curl -s "https://get.sdkman.io" | bash
```

Then open a new terminal window, or run this command to add the `sdk` executable to your `PATH` in the current window:

```
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

To check that it worked, type `sdk version`.  It should show these version numbers (or higher):

```
pconrad@Phillips-MacBook-Air-2 ~ % sdk version

SDKMAN!
script: 5.23.1
native: 0.7.34 (macos aarch64)

pconrad@Phillips-MacBook-Air-2 ~ % 
```

### 3.2 Use SDKMAN to install Java {{site.java_version}}

Even once you decide to install Java {{site.java_version}}, there are a bewildering array of different distributions to choose from. Based on the website <https://whichjdk.com/>, the distribution we currently recommend is <tt>{{site.jdk_distribution}}</tt>, so the command to install this with SDKMAN is:

<p><code>sdk install java {{site.jdk_distribution}}</code></p>

Then, any time you want to use this version of Java in a particular terminal window, you can type:

<p><code>sdk use java {{site.jdk_distribution}}</code></p>

If you just type `sdk use java ` and press the tab key it may autocomplete for you if you have only one version of Java installed with SDKMAN.

To check that it worked, type:

```
java --version
```

You should see something like this:

```
openjdk 25.0.4 2026-..
```

**You really do need Java {{site.java_version}}, specifically**, and NOT some other version of Java, even if it is a *later* version than {{site.java_version}}. It won't matter for the `"Hello World"` program in the first week, but when we move on to complex Java applications involving third-party libraries, it can definitely matter.

In this course we work with Spring Boot, as well as many other complex third party libraries.  They may have specific dependencies on specific Java
versions.  In this course we work only with the "Long Term Support" (LTS) versions of Java, avoiding the ones in between, and working with only one at a time (or in some cases, transitioning between LTS versions).  That helps us limit the number of
different incompatibility issues we have to deal with.

Many real-world software organizations do the same. New graduates are often surprised to see how slowly organizations adopt new versions of languages
and frameworks.

## Part 4: Maven

Install Maven {{site.maven_version}} using SDKMAN (which you installed in Part 3):

<pre>
sdk install maven {{site.maven_version}}
sdk use maven {{site.maven_version}}
</pre>

If SDKMAN asks whether you want to make it the default version, answer `Y`.

Installing Maven with SDKMAN (rather than Homebrew) means the same steps work on MacOS and WSL, and that Maven uses whichever Java version you selected with SDKMAN.

**Do not leave an older Maven version installed from a previous course or from another package manager.**  If you previously installed Maven with `brew`, remove it with `brew uninstall maven`; otherwise `mvn` may run Homebrew's copy, which comes with its own (wrong) version of Java.

To check that the correct version of Java and Maven are installed and selected, use:

```
mvn --version
```

You should see output similar to the following. Be sure that:
* the Maven version is {{site.maven_version}} (or newer)
* the Maven home is under `.sdkman`:
* the selected Java version is {{site.java_version}}

```
Apache Maven {{site.maven_version}} (...)
Maven home: /Users/yourname/.sdkman/candidates/maven/{{site.maven_version}}
Java version: {{site.java_version}}, vendor: ..., runtime: /Users/yourname/.sdkman/candidates/java/{{site.jdk_distribution}}
Default locale: en_US, platform encoding: UTF-8
OS name: "mac os x", ...
```

If you are not seeing the correct version of Maven or Java after typing the following, then ask for help on the [`#help-macos`]({{site.channels.help-macos.url}}) channel on the course slack.
<pre>
 sdk use java {{site.jdk_distribution}}
 sdk use maven {{site.maven_version}}
 mvn --version
</pre>

## Part 5: nvm and Node (needed starting in Week 3, for frontend development)

You will not need this right away, so you can put this off until later.

Even if you already have node and npm installed on your computer, you should install Node Version Manager (nvm).  The projects you'll be working on may require specific versions of node and npm, so rather than installing a specific version of Node directly, it is better to use `nvm`, a program that allows you to easily install and switch between different versions of Node.

As of the start of F26, the recommended LTS version is <tt>node {{site.node_lts}} (npm {{site.npm_lts}})</tt>.

### 5.1 Install nvm

You can install nvm via `brew`:

```
brew install nvm
```

Be sure to read the post installation instructions, which may ask you to type in some commands to adjust your shell, typically something like the ones below. It's important to do these extra commands, and **note that the ones below may not be the correct ones for your system, so copy the ones shown on your screen after you type `brew install nvm`**.

```
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"' >> ~/.zshrc
echo '[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"' >> ~/.zshrc
source ~/.zshrc
```

To verify that the install was successful, open a new terminal window and run:

```
nvm --version
```

### 5.2 Install Node

Use `nvm` to install the current LTS version of Node:

<p><code>nvm install {{site.node_lts}}</code></p>

Then type this command **in every terminal window where you are working with the frontend code (i.e. JavaScript, React)**:

<p><code>nvm use {{site.node_lts}}</code></p>

To verify that the install was successful, run:

```
node -v
npm -v
```

You should see <tt>{{site.node_lts}}</tt> for node and <tt>{{site.npm_lts}}</tt> for npm.

## Finished?

Check <https://ucsb-cs156.github.io/f26/info/install_checklist.html> to double check that you completed every step successfully.
