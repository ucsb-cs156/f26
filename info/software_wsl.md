---
title: Software for Windows with WSL
description: "Setting up your Windows computer (using Windows Subsystem for Linux) for this course"
layout: default
parent: Software
grand_parent: info
---

# {{page.title}}

**Using a Mac instead?** Go to [Software for MacOS](software_macos.html).

Before you begin, be sure you have installed the software that is the same for everyone (Slack, Zoom, VSCode) from the [Software](software.html) page.

The steps on this page are the same, and in the same order, as the steps on the [MacOS page](software_macos.html), except for the prerequisites in Part 0.

It turns out that almost everything in terms of installing software (Java, Maven, Node, etc.) is easier under Linux than under native Windows.
Therefore we strongly suggest that if you have a Windows environment, you install the Windows Subsystem for Linux (WSL) and then follow
the instructions below.  WSL is a tool that creates a separate Linux environment alongside your Windows environment, with access to your local filesystem.  This gives you access to package managers (such as `apt` for Ubuntu/Debian) and the full suite of UNIX commands.

If you are unable to install WSL because of limitations on your machine, please reach out to the course staff via Slack using the [#help-windows-linux-wsl]({{site.channels.help-wsl-linux.url}}) channel. In that case, we will try to find an alternative for you.

**Native Ubuntu Linux users** (those not using Ubuntu through WSL) can skip Part 0 and go directly to Part 1.  If you're using a Linux distribution that is not Ubuntu (or a similar Debian-based distribution with access to `apt`), the commands on this page may not work. The staff cannot provide support on finding equivalent commands for your desired distribution, but community resources such as Stack Overflow can help here.

Note that the reference platform for the course remains "CSIL"; we cannot commit to being "tech support" for every conceivable platform. On your own machine, you *are* your own tech support. But we'll help as best we can, given the time constraints we are under.

Throughout, "command prompt" means a **WSL** "Terminal Window" (an Ubuntu terminal, *not* Windows PowerShell or Command Prompt), except where noted in Part 0.  **All of the software in Parts 1-5 must be installed in the WSL (Ubuntu) environment**, not in native Windows.

## Part 0: Prerequisites for Windows: Installing WSL

### 0.1 Compatibility

You will need:
* One of the following operating systems:
   * Windows 11, any build
   * Windows 10, build 19041 or later (though a more recent build is better)
* Administrator privileges on your machine

If your Windows 10 machine has an older build, the better / safer solution is to update Windows to a more recent build.

### 0.2 Install WSL

1. Open Command Prompt or PowerShell as administrator
   * This can be done by searching for either program in the Start Menu, right-clicking on the result, and selecting "Run as administrator"
2. Run the following command: `wsl --install`
   * This will enable and install WSL with the default configuration:
      * WSL 2
      * The latest LTS release of Ubuntu
3. Restart your computer if asked to.
4. Once installation is complete, launch Ubuntu from the Windows Start Menu.  The first time, it will ask you to choose a Linux username and password.  (Remember the password; you need it for `sudo` commands below.)

More information on the above steps can be found in the [Microsoft WSL install documentation](https://docs.microsoft.com/en-us/windows/wsl/install).

If your machine doesn't meet the criteria to use the one-line install command, you can follow the [manual installation instructions](https://docs.microsoft.com/en-us/windows/wsl/install-manual). Unless you know exactly what you're doing, we recommend the latest Ubuntu LTS as your distribution. The rest of these instructions assume you installed Ubuntu.

### 0.3 (Recommended) Windows Terminal

For a nicer looking terminal, complete with tabs, full Unicode support (for emojis!), custom colors / fonts, and more, you can use Windows Terminal.

Windows Terminal is already the default terminal for Windows 11, so no further installation is needed.

For Windows 10 users, you can install Windows Terminal from the [Microsoft Store](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701).

### 0.4 Working in the WSL filesystem

When using WSL for CS156, place your projects on your virtual WSL system (for example, in your home directory `~`) rather than your main Windows filesystem. If you place projects on your main Windows filesystem, you will experience long loading times and slow I/O. You can tell that a project is on your Windows system if, when using WSL, the location starts with `/mnt/c/`. If so, move it onto your WSL system.

WSL uses UNIX line endings (LF) while Windows uses CRLF line endings. If you check out code natively in Windows (e.g. using Git Bash or GitHub Desktop), your checked-out code will use CRLF line endings, and therefore may cause shell scripts and git commits to act differently or fail.  Since most of our work will be done in WSL, always use `git` from inside WSL.

Finally, install the following packages in WSL that later steps depend on.  In your Ubuntu terminal, type:

```
sudo apt update
sudo apt install zip unzip curl
```

## Part 1: git

Ubuntu should come with `git`, but the pre-installed version is usually outdated (you can check by running `git --version`).

If the pre-installed version is out-of-date or not installed, run the following commands to install the latest version:

```
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git
```

To verify that the install was successful, run the following command:

```
git --version
```

You should see something like this (the version number may vary; any 2.x version is fine):

```
git version 2.50.1
```

### Set up git

Git on WSL does NOT operate in the same environment as native Git on Windows. This means that you will have to generate a new global config and SSH key specific to the WSL environment.

Set your name and email by running the following commands with the appropriate values:

```
git config --global user.name "Joe Gaucho"
git config --global user.email "joegaucho@ucsb.edu"
```

**Be sure that the listed email is linked to your GitHub account.** This is how GitHub is able to attribute a commit to your account, and this will be necessary to receive credit for the code you write. You can check the emails associated with your GitHub account at <https://github.com/settings/emails>.

Next, generate an SSH key so that you can `git clone`, `git push`, etc. without re-entering your GitHub login information each time.  (You can always work with repos via HTTPS instead, so this isn't strictly necessary, but it makes using git much easier.)

1. At the WSL command prompt, type this (use your own email; accept the default file location, and choose a passphrase or leave it empty):

   ```
   ssh-keygen -t ed25519 -C "joegaucho@ucsb.edu"
   ```

2. Display the *public* key, and copy it (select it with the mouse and right-click, or `Ctrl+Shift+C`):

   ```
   cat ~/.ssh/id_ed25519.pub
   ```

3. On GitHub, go to <https://github.com/settings/keys>, click "New SSH key", paste the key in, and save it.

4. Test it:

   ```
   ssh -T git@github.com
   ```

   The first time, you will be asked whether to trust the host; type `yes`.  You should see a message that says "Hi *your-github-username*! You've successfully authenticated".

## Part 2: VSCode command line tool

You should already have installed VSCode (in Windows) from the [Software](software.html) page.  Now connect it to WSL so that at the **WSL** command prompt you can type `code .` and it will open VSCode in that directory.

1. Open VSCode (on the Windows side) and install the [WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) from the Extensions tab.  (Documentation: <https://code.visualstudio.com/docs/remote/wsl>)
2. Open an Ubuntu (WSL) terminal, `cd` to any directory, and type `code .`
3. The first time, VSCode will install a small "VS Code Server" inside WSL.  When it finishes, VSCode should open with that directory, and the bottom left corner of the window should say "WSL: Ubuntu".

If the `code` command is not found in WSL, make sure that VSCode is installed in Windows (not only in WSL), and restart your Ubuntu terminal.

## Part 3: SDKMAN and Java

Java {{site.java_version}} is required for this course. SDKMAN is a tool that works on Mac, WSL and Linux that makes it easy to select and install Java versions.

### 3.1 Install SDKMAN

SDKMAN needs `zip` and `unzip`, which you installed in step 0.4.  For installation instructions, see <https://sdkman.io/>; it's typically a one line install:

```
curl -s "https://get.sdkman.io" | bash
```

Then open a new terminal window, or run this command to add the `sdk` executable to your `PATH` in the current window:

```
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

To check that it worked, type `sdk version`.

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

Install or upgrade to the latest supported version of Maven, specifically Maven {{site.maven_version}} or later.
Do not leave an older Maven version installed from a previous course or from the system package manager.

The `apt` package manager typically has an older version of Maven, so we need to manually download and extract Maven.

Note: The first `cd` command below is to make sure that you are doing the rest of the commands in your "home directory" (i.e. a directory where you have write permission.)  Sometimes the shell will put you in a system directory by default where you don't have write permission; in that case, downloads will fail even if the link and network connections are fine.

```sh
cd
export MAVEN_VERSION={{site.maven_version}}
curl -O https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
tar -zxvf apache-maven-${MAVEN_VERSION}-bin.tar.gz
sudo mv apache-maven-${MAVEN_VERSION} /opt/maven
```

If the `curl` download fails with "not found", the Apache site may have moved Maven {{site.maven_version}} to a different mirror.  Try `https://dlcdn.apache.org/maven/maven-3/...` or `https://archive.apache.org/dist/maven/maven-3/...` in place of `https://downloads.apache.org/maven/maven-3/...`, or check for the current version at <https://maven.apache.org/download.cgi>.

**Then, add Maven to your PATH by adding the following line to `~/.bashrc`.**  Your `.bashrc` file can be opened in any text editor, but an easy one is:

```sh
nano ~/.bashrc
```

Add this line at the bottom:

```sh
export PATH=$PATH:/opt/maven/bin
```

Save and close nano by hitting `Ctrl+O` followed by enter, and then `Ctrl+X`.

**Then, restart your terminal.**

To check that Maven is installed, do:

```
mvn --version
```

Be sure that you have Maven version {{site.maven_version}} or newer, as Java {{site.java_version}} requires a recent version of Maven to work.  You should see output similar to:

```
Apache Maven {{site.maven_version}}
Maven home: /opt/maven
Java version: {{site.java_version}}, vendor: Eclipse Adoptium, runtime: ...
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "5.4.0-72-generic", arch: "amd64", family: "unix"
```

When you type `mvn --version`, be sure you are also getting the correct version of Java
(the one you selected with <code>sdk use java {{site.jdk_distribution}}</code>), not an older or newer Java version from another installation.

If you are not seeing the correct Java version after typing <code>sdk use java {{site.jdk_distribution}}</code> followed by `mvn --version`, then ask for help on the [`#help-windows-linux-wsl`]({{site.channels.help-wsl-linux.url}}) channel on the course slack.

## Part 5: nvm and Node (needed starting in Week 3, for frontend development)

You will not need this right away, so you can put this off until later.

Even if you already have node and npm installed on your computer, you should install Node Version Manager (nvm).  The projects you'll be working on may require specific versions of node and npm, so rather than installing a specific version of Node directly, it is better to use `nvm`, a program that allows you to easily install and switch between different versions of Node.

As of the start of F26, the recommended LTS version is <tt>node {{site.node_lts}} (npm {{site.npm_lts}})</tt>.

### 5.1 Install nvm

To install `nvm`, run the following command.  As of the time of writing, the latest version is <tt>{{site.nvm_version}}</tt>.  (To check whether this is the latest version, visit <https://github.com/nvm-sh/nvm#install--update-script>.)

<p><code>curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/{{site.nvm_version}}/install.sh | bash</code></p>

If `curl` is not available on your system, try this command which uses `wget` instead:

<p><code>wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/{{site.nvm_version}}/install.sh | bash</code></p>

The install script should add the following lines to the end of your `~/.bashrc` file. If the following lines are not present, add them:

```sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

To verify that the install was successful, open a new terminal window and run:

```
nvm --version
```

You should see <tt>{{site.nvm_version}}</tt> or something similar.

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

## Tips for using WSL

### Viewing jacoco and pitest reports

On WSL, if you have the output of a jacoco or pitest report, for example in an `index.html` file in a directory such as `target/site/jacoco`,
here is a way you can get access to that in your web browser.

1. In File Explorer, enter the path `\\wsl$` to access your WSL file system.

2. Navigate to `Ubuntu\home\[your-username]\` then navigate to your project directory.

3. You can simply double-click your HTML files to open them in your browser.

If this doesn't work, try the following steps:

1. At a WSL command prompt, `cd` into the directory with the `index.html` file, e.g.

   ```
   cd target/site/jacoco
   ```

   If you do an `ls` in that directory, you should see the `index.html` file.

2. In that directory, type this command to start up a web server:

   ```
   python3 -m http.server
   ```

   This should start a web server that serves up the files in that directory on an address such as <http://0.0.0.0:8000>

3. Try navigating to <http://0.0.0.0:8000> in a web browser on the Windows side.

   If it doesn't work, then in another WSL window, type `ip route`.

   Try substituting the IP address that shows in place of 0.0.0.0, e.g. <http://172.29.192.1:8000>

   There may be more than one IP address shown; try both.
