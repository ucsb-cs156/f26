---
title: "Week 01a - 09/29 Tue"
lecture_date: 2026-09-29
description: "Install software, start jpa00, jpa01"
ready: true
layout: default
parent: lectures
---

# {{page.title}} - {{page.description}}

Today's activity is {{page.on_canvas}}.

Also note that you can get started on some of this *before* class and you are encouaged to do so.  If you get it all done before class, then all you need to do is come to class to check in briefly, and possibly help some of your teammates.

## Outline for Today

1. Dokku is the platform where we'll be deploying web apps in this course, so let's test your dokku access.  Here's how:
   * First, ssh into your CSIL account at `csil.cs.ucsb.edu` (if you are unfamiliar with this, ask your teammates first before asking the staff.)
   * Then, *from* your session on `csil.cs.ucsb.edu`, try this command:
     
     <tt>ssh <i>username</i>@dokku-<i>xx</i>.cs.ucsb.edu</tt>
 
     where <tt><i>username</i></tt> is your CSIL username, and <tt><i>username</i></tt> is your two digit team number (e.g. `04` or `13`).

     If it doesn't work, check the steps in H00 again where you set up your private key and authorized key files.

     If it *still* doesn't work, ask for help on [#help-lecture-discussion]({{site.channels.help-lecture-discussion.url}}).

     Once it works, make a post to your team slack channel that says: "I can login to dokku".

     But if you are unable to resolve the dokku issue in a reasonable amount of time, make a post on your team channel that says: "I cannot log into dokku", as well as making a post on `#help-dokku` describing what's happening (along with screenshots.)

   
2. Next, check in on your Slack with your name, and what platform you use, e.g. `I use MacOS`, or `I use Windows/WSL` or `My laptop runs Ubuntu Linux` or whatever.
   * Optional: You may want to rearrange yourself at the table so that Mac folks are sitting with Mac folks, and Windows folks with Windows folks, etc.  This will make it easier if you run into problems later, since you can check in with your neighbor.
3. Follow the instructions at this link: <https://ucsb-cs156.github.io/f26/info/software.html>
   * If you get stuck, check your slack channel to see which team members have the same platform as you.  Try to get help from them first.
   * If the folks are your team don't know, then try the [`#help-macos`]({{site.channels.help-macos.url}}) or [`#help-windows-linux-wsl`]({{site.channels.help-wsl-linux.url}}) channels. Before posting your question, see if it's already been answered by someone else.
   * If you post a question that has no answer, then copy a link to your Slack post, and post that *again* on [`#help-lecture-discussion`]({{site.channels.help-lecture-discussion.url}}).  Include your table number along with the link to your question on either [`#help-macos`]({{site.channels.help-macos.url}}) or [`#help-windows-linux-wsl`]({{site.channels.help-wsl-linux.url}})

4. When you are all finished, go through the checklist at:  <https://ucsb-cs156.github.io/f26/info/install_checklist.html> to ensure that each item works as expected.  If it doesn't, then ask for help (using the same order as in step 2: (1) team slack channel and live people (2) [`#help-macos`]({{site.channels.help-macos.url}}) or [`#help-windows-linux-wsl`]({{site.channels.help-wsl-linux.url}}) (3) [`#help-lecture-discussion`]({{site.channels.help-lecture-discussion.url}}) with table/team number and link to your post on [`#help-macos`]({{site.channels.help-macos.url}}) or [`#help-windows-linux-wsl`]({{site.channels.help-wsl-linux.url}}).

5. When all items work as expected, make a post on your slack channel that says: "Installation steps for P04: installation check complete", and post that link to Canvas.
6. **IF YOU RUN OUT OF TIME**, i.e. class is almost over and it doesn't look like you'll finish:
   * Make a post on Canvas that says: P04: installation check incomplete" and then lists the things you still need to do.
   * Submit that post as your answer to P04 on Canvas.  As long as you make a post that reports your current status, and as long as you made a valid attempt to do as much as you could today during classtime, **you get full credit**.
   * You will *still* need to finish these installation steps eventually, preferably outside of class, and make a post that says: "Install check complete!" at some point, preferably before your discussion section on Wednesday, but at the latest by next Tuesday.  However, the minimum requirement for full credit for the participation grade today is just to get as far as you can with it, and then document what still needs to be done.  If you get it all done, that's even better, but not required for full credit.
6. Then work on jpa00, and then jpa01 (find them under "labs" on the course website.)
7. If you've done *all* of the items above, then check in with your teammates on the Slack channel and/or in person to see if any of them need any help.  If so, please help them as best you can. If not, you are *free to go early*, but only if you've finished jpa00 and jpa01 and no one else on your team needs your help.

