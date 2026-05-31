---
title: Software
description: "What you need to install"
layout: default
parent: info
maven_version: 3.9.14
node_lts: v22.22.2
npm_lts: v10.9.7
zoom_version: 6.3.11
java_version: 21
---

# Software to Install or Configure at start of course (and/or update as needed)

Instructions on installing these follow below.

* The latest version of git
* SDKMAN (tool for installing and switching between Java versions)
* Java {{page.java_version}} (`bellsoft-liberica-jdk` distribution recommended).
* Maven {{page.maven_version}}

When you are finished, check <https://ucsb-cs156.github.io/f26/info/install_checklist.html> to double check that you completed every step successfully.

# Software to Install in week 3 (for frontend development)

* nvm (node version manager)
* Current LTS version of Node available through nvm (currently node {{page.node_lts}}, and npm {{page.npm_lts}})

## Recommmended for Everyone


1. Slack Client

   Be sure you have a slack client installed on your devices.  I strongly encourage you to have Slack installed on your phone as well so that you can stay
   in touch with your team and news about the course, though that's a personal decision.

   * Mac: <https://slack.com/downloads/mac>
   * Windows: <https://slack.com/downloads/windows>
   * iOS: <https://slack.com/downloads/ios>
   * Android: <https://slack.com/downloads/android>
   * Linux: <https://slack.com/downloads/linux>

2. Updated Zoom Client 

   Be sure that you have the *latest* version of the Zoom client.  Older versions may not have some of the features we'll need for this course.
    
   If you click on "About Zoom" inside zoom, you want a version that is {{page.zoom_version}} or later.
   
   Download it here: <https://zoom.us/download>

3. VSCode Text Editor for your local computer

   Download it here: <https://code.visualstudio.com/download>

   While `vim` and `emacs` are perfectly fine for the work you may have done in CS16/24/32, when it comes to 
   professional level application development, it's time to graduate to some more professional tools.
   
   We have found that VSCode (a free download for Windows/Mac/Linux) is in the sweet spot between too few features, and too complicated.
  
   If you haven't worked with it before, we suggest you download it and start getting used to it.
   
   What it does for you:
   * Autocompletion
   * Syntax highlighting and checking
   * Automatic import detection
   * Ability to see an entire directory tree at once
   * Search and replace across multiple files
   * and much much more...
   
   Note: If you have **already** tried using VSCode and genuinely feel like you are more of a pro at `vim`, `nano`, `neovim`, or other project/code/text editors, feel free to use whatever is convenient for you. We are suggesting VSCode for ease of all-round use.
  
   Some additional hints for using VSCode:
   1. Note that you *might* need to install VSCode separately under Windows and the WSL partition.
   2. Install the command line command so that at the Mac or WSL command line you can type `code .` at the command line and it will open VSCode in that directory.
      * Access the VS Code Command Palette via either `shift + Command + P` (Mac) or `Ctrl + Shift + P` (Windows/Linux).
      * Type `shell` and two commands should pop up:

        ![image](https://github.com/user-attachments/assets/d0243bbf-c15b-4071-8bf2-4a05d03a4b64)
        
        Choose `Shell Command: Install 'code' command in PATH` and follow the prompts.

   3. We strongly encouage you to turn on autosave.  If you need to get back to your original code, you can do that using git commands, so there's no real downside, and a *lot* of time saved when you don't waste time wondering why your change didn't work, and realize it's because you forgot to save your changes. Here's how:
      * Look under the file menu for an option called `Autosave`.  It will either have a check beside it or not.
      * If it doesn't, select it, and the check should appear.  Now you are autosaving.

   4. When using VSCode with a github project, get in the habit of opening VSCode *in the directory where the repo lives*.  This is important because when you do it this way, VSCode can integrate with the structure of a git directory, as well as the structure of a Maven or React project, and give you additional hints and support that are extraordinarily helpful.   


**On Windows / WSL ? Switch to [these directions](/topics/windows/windows_wsl.html)**

**On Mac? Continue with the steps below.**


5. Install SDKMAN on your local system.  SDKMAN is a tool that works on WSL, Mac and Linux that makes it easy to select and install Java versions.  For installation instructions, see: <https://sdkman.io/>; it's typically a one line install such as:
   ```
   curl -s "https://get.sdkman.io" | bash
   ```

   Be sure to also run `source "$HOME/.sdkman/bin/sdkman-init.sh"` to add the sdk executable to the `PATH` environment variable.
   
6. Use `SDKMAN` to install Java {{page.java_version}}

   Note that even once you decide to install Java {{page.java_version}}, there are a bewildering array of differnet distributions to choose from.  Based on the website <https://whichjdk.com/>, the distribution we currently recommend is {{site.jdk-distribution}}, so the command to install this with `SDKMAN` is:

   <p><code>sdk install java {{site.jdk_distribution}}</code></p>

   Then, any time you want to use this version of Java, you can type:

   <p><code>sdk use java {{site.jdk_distribution}}</code></p>

   If you just type `sdk use java ` and press the tab key it may autocomplete for you if you have only one version of java installed with `sdk`.

   **You really do need Java {{page.java_version}}, specifically**, and NOT Java 8, Java 11, Java 17, or a preview version of 22, 23, or higher.   It won't matter for the `"Hello World"` program in the first week, but when we move on to complex Java applications involving third-party libraries, it will definitely matter.

8. Install Maven on your local system.

   * For Mac users, instructions for installing Maven with Homebrew appear below.   
   * For WSL users, see: [https://ucsb-cs156.github.io/topics/windows_wsl/](https://ucsb-cs156.github.io/topics/windows/windows_wsl.html)

9. Install nvm on your local system.

   * For Mac users, instructions for installing nvm with Homebrew appear below. 
   * For WSL users, see:
     * [Install nvm and Node on WSL](https://ucsb-cs156.github.io/topics/windows/windows_wsl.html#install-nvm-and-node-on-wsl)

     * [Update npm on WSL](https://ucsb-cs156.github.io/topics/windows/windows_wsl.html#update-npm-on-wsl)

   
## Recommmended for Windows Users

Install Windows Subsystem for Linux.

It turns out that almost everything in terms of installing software (Java, Maven, Node, etc.) is easier under Linux than under native Windows.
Therefore we strongly suggest that if you have a Windows environment, you install the Windows Subsystem for Linux (WSL) and then follow the 
instructions under Linux/WSL.
   
If you are unable to install WSL because of limitations on your machine, please reach out to the course staff via Slack using the [#help-windows-linux-wsl]({{site.channels.help-wsl-linux.url}}) channel on Slack. In that case, we will try to find an alternative for you.
 
## Recommended for Ubuntu Linux / WSL Users
 
Instructions for installing Windows Subsystem for Linux (WSL), as well as environment setup instructions for Ubuntu systems, is available here: [https://ucsb-cs156.github.io/topics/windows_wsl/](https://ucsb-cs156.github.io/topics/windows/windows_wsl.html)

Native Ubuntu users (those not using Ubuntu through WSL) can skip the Windows-specific setup and go directly to [Install / Update Git on WSL](https://ucsb-cs156.github.io/topics/windows/windows_wsl.html#install--update-git-on-wsl) and follow all instructions from there on.

The following programs will be installed in the above guide:

* The latest version of git
* Java {{page.java_version}}
* Maven {{page.maven_version}}
* nvm (latest stable version)
* Current LTS version of Node installed via `nvm install {{page.node_lts}}; nvm use {{page.node_lts}}` (currently node {{page.node_lts}}, and npm {{page.npm_lts}})

If you're using a Linux distribution that is not Ubuntu (or a similar Debian-based distribution with access to `apt`), the commands listed in the setup guide linked above may not work. The staff cannot provide support on finding equivalent commands for your desired distribution, but community resources such as Stack Overflow can help here.

## Recommmended for MacOS Users

If you have questions about this section, please ask on the [[`#help-macos`]({{site.channels.help-macos.url}})]({{site.channels.help-macos.url}}) channel on the Slack

1. MacOS version: If you have a MacOS version that is really old (e.g. 12.x), you should consider upgrading to a later version.

   I know for sure that 12.x results in this command later on when you try to install Java {{page.java_version}}, so folks on version 12.x will *need* to upgrade.
   (Folks with later versions *might* be able to delay upgrading.  But if you get a message like this, then you know what you need to do.)

   ```
   Warning: You are using macOS 12.
   We (and Apple) do not provide support for this old version.
   It is expected behaviour that some formulae will fail to build in this old version.
   ...
   ```


2. Command Line Tools XCode for MacOS, including `git`

   On MacOS, `git` typically gets installed as part of the "Command Line XCode Tools" the first time you ask to use it.  To be sure that `git` is installed,
   try typing:
   
   ```
   git --version
   ```
   
   If it shows something like this you are good (version number may vary, and is not important as far as we know):
   
   ```
   git version 2.24.3 (Apple Git-128)
   ```

   Otherwise, you might get a message that you need to install the XCode Command Line Tools, i.e. something like this:

   ![image](https://github.com/user-attachments/assets/8e37dd9c-afb0-4a64-8611-86e4b03b6409)

   In that case, please just follow the instructions given in the message.  Don't worry if it says it will take 72 hours for the install; if you start it and let it run for a minute or two, that estimate should come down to something reasonable quickly, but it still make take 10-15 minutes.

   When you are done, you should be able to type `git --version` at a command prompt and see something like:

   ```
   git version 2.24.3 (Apple Git-128)
   ```

3. Brew (package manager)

   For MacOS, we'll be installing several packages for Java and JavaScript (node) development.  
   In many cases, installing those is easier if you *first* install the brew package manager.

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

   It is important to run these command to complete the brew installation.



5. Maven

   You can use `brew` to install Maven:

   ```
   brew update
   brew install maven
   ```

   Or if you already have Maven installed, do this to upgrade your version to the latest one:

   ```
   brew update
   brew upgrade maven
   ```

   Then to check that it is installed, do:

   ```
   mvn --version
   ```

   Be sure that you have Maven version 3.9 or higher, as Java {{page.java_version}} requires this version to work.

   When you type `mvn --version` be sure you are getting the correct version of Java
   (the one you selected with <code>sdk use java {{site.jdk_distribution}}</code>

   For example, you do NOT want to see this:
   ```
   pconrad@Phillips-MacBook-Air ~ % mvn --version
   Apache Maven 3.9.11 (8e8579a9e76f7d015ee5ec7bfcdc97d260186937)
   Maven home: /opt/homebrew/Cellar/maven/3.9.11/libexec
   Java version: 23, vendor: Homebrew, runtime: /opt/homebrew/Cellar/openjdk/23/libexec/openjdk.jdk/Contents/Home
   Default locale: en_US, platform encoding: UTF-8
   OS name: "mac os x", version: "14.4.1", arch: "aarch64", family: "mac"
   pconrad@Phillips-MacBook-Air ~ % 
   ```

   That shows the wrong Java version (23).

   If you are not seeing the correct Java version after typing <code>sdk use java {{site.jdk_distribution}}</code> followed by `mvn --version`, then ask for help on the [`#help-macos`]({{site.channels.help-macos.url}}) channel on the course slack.
   
4. nvm, Node, and npm

   Even if you already have node and npm installed on your computer, you should install Node Version Manager (nvm). The instructions for installing this are the same as those for Linux and WSL users, so please follow the instructions listed there.

   You can install nvm via `brew install nvm`.

   Be sure to read the post installation instructions, which may ask you to type in some commands to adjust your shell, typically something like the ones below. It's important to do these extra commands, and **note that the ones below may not be the correct ones for your system, so copy the ones shown on your screen after you type `brew install nvm`**.

   ```
   echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
   echo '[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"' >> ~/.zshrc
   echo '[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"' >> ~/.zshrc
   source ~/.zshrc
   ```

## Optional (for everyone)

1. UCSB VPN Client (Pulse Secure) 

   What it does:
   * Reroutes all your network traffic through the UCSB network, so that it appears that
     your machine is directly connected to the UCSB Campus network

   What it allows you to do:

   * Access the textbooks for the course online without having to buy them.
   * Mount your CSIL home directory as a shared network drive using Samba
   * Graphically remote into CSIL


   **Note:** In order to use Pulse Secure, you need to setup DUO (a two factor authentication app).
   Here is a link for the instructions on how to set it up: <https://www.it.ucsb.edu/getting-started-mfa-duo/enroll-push-notification>

   Where to get Pulse Secure:  <https://www.it.ucsb.edu/pulse-secure-campus-vpn/get-connected-vpn>

2. Samba Access to your CSIL home directory 

   What it does:

   * Mounts your CSIL home directory "as if" it were connected directly to your
     computer.


   What it allows you to do:
   * Click on files on CSIL and open them in software on your own machine
     (e.g. an editor such as Sublime Text, VSCode, or a web browser.)

   Where to get it:
   * You don't have to download anything (though you do need the UCSB VPN Client first)
   * Instead, follow the instructions here:

     | Platform | Text Instructions | YouTube Video Instructions |
     |-|-|-|
     | MacOS | [Text](https://ucsb-cs156.github.io/topics/csil_mount_drive_to_macOs_using_samba/)  | [Video](https://youtu.be/FTlxjhjwbt0) |
     | Windows | [Text](https://ucsb-cs156.github.io/topics/CSIL/csil_mount_drive_to_windows_using_samba.html) | [Video](https://www.youtube.com/watch?v=fgORcrGWBH0) |
     | Linux | (ask staff) | |
     {:.table .table-sm .table-striped .table-bordered}


