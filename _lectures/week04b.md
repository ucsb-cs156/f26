---
title: "Week 04b - 10/21 Wed"
lecture_date: 2026-10-21
description: "First Standup (p10)"
ready: true
layout: default
parent: lectures
canvas_link: https://ucsb.instructure.com/courses/27687/assignments/381962
participation_activity: p10
---

# {{page.title}} - {{page.description}}

It will be important to be present in class today
because we will be doing our first standup meeting.

In fact, it will be important to be in class and on-time
for the rest of the quarter, because from now one,
every class will start with a standup meeting.

## Start with Standup (aka "Daily Scrum")

1. Please take a moment to look over this:
   <https://ucsb-cs156.github.io/topics/agile/agile_standups.html>

1. Then, please take a moment to make a *standup post* on your *official slack team channel*   The post can just be something like this:

   <img width="622" alt="image" src="https://github.com/user-attachments/assets/30bf064b-3537-48eb-85a9-5c5e8c5d5b03">
   <img width="526" alt="image" src="https://github.com/user-attachments/assets/b7479cf0-947b-423c-8e67-2a09041145ea">


   The three questions are:
   * What have you finished since last standup?
   * What are you working on now?
   * Are you stuck on anything, or blocked by anything?

2. When you see that everyone that is present has made a post in the channel (including anyone attending remotely via zoom), invite everyone to stand, and read out their post to the group.

   (Yes, we know this may seem silly.  However, the point is to *actually practice* standups the way that professional software development teams do them, rather than just talk about them, or read about them.  Trust us, this will pay off when you are at your first job/internship where they do this, because you'll *know* what's going on.

   Plus: right now, while the project is relatively straightforward, the value of this may not be as clear, but as the projects get more complex, trust us, the value will reveal itself.)

3. For anyone that's missing, please check on the slack, and let them know that they missed standup, but that they are encouraged to post a standup update as soon as possible. 

## Today's participation activity

Submit a link to your standup update on Canvas as {{page.participation_activity}}

* <{{page.canvas_link}}>

Then, update your team Kanban board as explained below.

## Update Team Kanban board

We'll add a second important "Agile Ceremony" after the Standup meeting: reviewing the Kanban board.

1. As a separate short meeting after standup, while everyone is still paying attention, bring up the Kanban board on the big shared team monitor. (Share the screen for anyone on zoom).
   
2. Look first at the "In Review" column.  For each PR that needs a review *assign someone to do the review*.  You are strongly encouraged to prioritize the code reviews, because later in the course, getting PR's code reviewed and merged is the *only way your team earns points*.

   So, when the meeting is done, do the code reviews *first*, before you jump into your own work for the day.

3. Now look at the `In Progress` column.  There should typically be precisely six cards in the `In Progress` column; one per team members.  If that's not the case, then check in with the team members that don't have a card in the column.

   In addition, be sure that cards in the `In Progress`, `In Review` and `Done` column are assigned to a team member.  The video linked below shows how to do this.



## Kanban board Video

Here’s a short video (5 minutes, 42 seconds) that goes along with team01; we recommend you watch it sometime over the next couple of days.  It has something easy you can do to help organize your work for team01.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Shi0kzx-3K4?si=nIRab8q2uB-fW7hr" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

We suggest you try to complete at least one issue per day starting today; it will be much easier to finish the project by the deadlilne if you do that!


## More on Code Reviews

Note that if you have a PR that needs a code review, that's a form of a blocker, so you are encouraged to mention it during standup.  It's not blocking you from doing more work on other issues, but it *is* blocking you from being *done* because the work isn't done until it's merged into the main branch.

Note: please don't merge your *own* branches into main; someone else on the team should do it after they perform an approving code review.

For more information on how to do code reviews, see: 

* Mechanics: <https://ucsb-cs156.github.io/topics/code_reviews/code_reviews_github.html>
* Considerations: <https://ucsb-cs156.github.io/topics/code_reviews/>


## A little bit each day! 

A general bit of advice:

This is a course where doing “a little bit each day” works a lot better than planning a last minute push the day before something is due.  

The reason is that you tend to run into problems that require checking in with folks, so doing 30 minutes per day for 5 days (2.5 hours total) is a lot more effective than doing 5 hours on the last day (twice as much time); you just get more done, because in between you can check in with folks to ask for help on things you are stuck on.

So you are encouraged to do the following: set a 30 minute timer, and try to do at least 30 minutes of work on team01 each day between now and this coming Tuesday.  

If/when you run into problems, post to your team channel first (since everyone on your team is doing pretty much the “same but different, but also sort of the same” assignment.)  

If they don’t know then try `#help-team01`.
