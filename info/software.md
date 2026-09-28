---
title: Software
description: "What you need to install"
layout: default
parent: info
has_children: true
---

# Software to Install or Configure at start of course (and/or update as needed)

This page is the starting point for setting up your own computer for this course.

1. First, install the software on this page that is the same for everyone (Slack, Zoom, VSCode).
2. Then, follow the instructions for your platform:
   * **MacOS:** [Software for MacOS](software_macos.html)
   * **Windows** (or Ubuntu Linux): [Software for Windows with WSL](software_wsl.html)

Both platform pages install the same tools, in roughly the same order:

* git (the latest version)
* VSCode set up so that `code .` works from the command line
* SDKMAN (tool for installing and switching between Java versions)
* Java {{site.java_version}} (<tt>{{site.jdk_distribution}}</tt> distribution)
* Maven {{site.maven_version}}
* Starting in Week 3 (for frontend development): nvm (node version manager), and the current LTS version of Node available through nvm (currently node {{site.node_lts}}, and npm {{site.npm_lts}})

When you are finished, check <https://ucsb-cs156.github.io/f26/info/install_checklist.html> to double check that you completed every step successfully.

## Required for Everyone

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
    
   If you click on "About Zoom" inside zoom, you want a version that is {{site.zoom_version}} or later.
   
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

   1. We strongly encourage you to turn on autosave.  If you need to get back to your original code, you can do that using git commands, so there's no real downside, and a *lot* of time saved when you don't waste time wondering why your change didn't work, and realize it's because you forgot to save your changes. Here's how:
      * Look under the file menu for an option called `Autosave`.  It will either have a check beside it or not.
      * If it doesn't, select it, and the check should appear.  Now you are autosaving.

   2. When using VSCode with a github project, get in the habit of opening VSCode *in the directory where the repo lives*.  This is important because when you do it this way, VSCode can integrate with the structure of a git directory, as well as the structure of a Maven or React project, and give you additional hints and support that are extraordinarily helpful.   

   3. Setting up the `code .` command (so that you can open VSCode in the current directory from a terminal) is covered in the platform-specific instructions below.

## Next: Choose your platform

Everything else you need to install depends on what kind of computer you have.  Pick **one** of these, and follow all of the steps on that page.

| If you have... | Go to... |
|-|-|
| A Mac | [Software for MacOS](software_macos.html) |
| A Windows PC | [Software for Windows with WSL](software_wsl.html) (we strongly recommend installing Windows Subsystem for Linux, "WSL", rather than trying to work in native Windows) |
| A Linux PC running Ubuntu (or another Debian-based distribution) | [Software for Windows with WSL](software_wsl.html), skipping the parts that are specific to Windows (installing WSL itself) |
{:.table .table-sm .table-striped .table-bordered}

If you are unable to use either of these options because of limitations on your machine, please reach out to the course staff via Slack using the {% include slack.html channel="help-wsl-linux" %} channel. In that case, we will try to find an alternative for you.

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
