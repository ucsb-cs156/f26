* If your team still has open PRs, get them mergable!
* If your team is done with PRs: Your "prod" site is linked in the table here in the `Dokku Prod` column.
* Make sure that all of the features work!
* Look for bugs. If you find bugs, create issues for them, and make new PRs to fix them.   Bug fix PRs may be submitted at any time, and *might* be reviewed and merged by the staff.
* *This is not a loophole to add new features*.  These are only bug fixes, and they *do not earn additional points* for the team.  They just help you present a better user experience in your video and release notes.
* Please create the qa dokku instance if your team hasn't done that yet; those are linked in the `Dokku qa` column below.
* We will be using both the `dokku prod` and the `dokku qa` instances during the final product reviews.

| Team <br ><span style="font-size:80%">Links to Slack</span>| Project <br ><span style="font-size:80%">Links to Legacy Repo</span> | Team Repo | PRs | Github Pages | Kanban | Dokku Prod | Dokku qa |
|------|----|------|-----|--------------|--------|------------|----------|{% for team in site.teams %}{% capture repoName %}proj-{{team.legacy_project}}-{{team.team}}{% endcapture %}
|  [{{team.team}}]({{site.channels[t.team].url }}) | [{{team.legacy_project}}](https://github.com/ucsb-cs156/proj-{{team.legacy_project}}) | [ team repo ]({{page.githubOrgUrl}}/{{repoName}}) |   [ PRs ]({{page.githubOrgUrl}}/{{repoName}}/pulls) |  [ github pages ]({{page.githubPagesUrl}}/{{repoName}}) | [ kanban ]({{page.githubProjectsUrl}}/{{team.legacy_kanban}}) | [ dokku prod ](https://{{team.legacy_project}}.dokku-{{team.dokku}}.cs.ucsb.edu) | [ dokku qa ](https://{{team.legacy_project}}-qa.dokku-{{team.dokku}}.cs.ucsb.edu) |{% endfor %}



## Clarifications about the PR end game

* 11:59 Thursday of week 8 was the last day that you can submit *new* PRs to be reviewed by staff.
* By today, PRs need to be *already in a mergeable state*
  * Passing all CI/CD checks
  * Meeting all of the criteria in the PR checklist
  * Already reviewed/approved by a team member

Any PRs that are were not in a reviewable/mergable state by the end of office hours last Thursday (7:15pm) were subject to being closed without further review by the staff. 

We will continue to work with merge candidates already in the queue to get the merged.

**NOTE that even previously approved merge candidates sometimes end up with merge conflicts or failing tests** after earlier PRs are merged.  

If you want those merged *you are responsible for monitoring the Slack messages of your team
and staying in touch.  

If we try for 72 hours to contact you or someone from your team and no one replies, we will consider the PR abandoned, and simply close it without further the review.   Note that this is a 72 hour period so that you can take off a day (e.g. for Thanksgiving) without worry, but you do need to check in *at least every third day*, regardless of holidays and weekends.

We will continue to review PRs that are already in the queue, with the goal of having all of the PR queues empty as soon as possible; preferably before Thanksgiving, but at the latest, before Tuesday's class during week 10.