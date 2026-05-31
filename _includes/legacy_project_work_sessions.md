
## Start with Standup

Please do a standup meeting, both on your slack channel, and out loud.

## Review the PR queue, as a team

One of the keys to success for a software team is staying on top of the PR queue.

Every class meeting, *as a team*, look over all of the PRs in the queue.  Make sure that:

* any PRs that are ready to be reviewed *get* reviewed
* the job of reviewing is being shared by team members in an equitable way

It's important to your *final course grade*, that *each* member of the team reviews at least one PR during the course of the legacy code project.   Make sure that's happening.

Post a brief update to your team's slack channel with the status of the PR queue; something like this.   (The format is just a suggestion; adapt it to your situation):

```
Team reviewed PR queue; 2 draft PRs, 4 PRs ready for team review, 3 other
* Alice will review PR 27
* Bob will review PRs 28, 29
* Carly will review PR 37
The three other PRs all have merge conflicts; Danny is taking care of those.
```

## Review the Kanban board, as a team

Make sure that the team is keeping the Kanban board up to date.  Each member of the team should always be assigned to at least one issue in progress at all times.  Make sure that the team is making daily incremental progress.

## Then, work on your issues

Then, work on your issues, either individually, or in pairs.

Sometimes it helps to get a second set of eyes on something you've been working on.

Get help from the staff as needed.

## Making PRs


Reminders:
* Most PRs need dokku deployments
* You can (and should) set up multiple dokku dev instances if/when you have multiple unmerged PRs outstanding
* Don't forget the basics:
  * Assign the PR
  * Get a Team CR
  * No commented out code
  * Set up a dokku deployment
  * Make sure the PR has a good description (see: [PR descriptions](https://ucsb-cs156.github.io/topics/GitHub/github_pull_requests.html#pr-descriptions))

## Responding to Staff Review

You can see the queue of when to expect the next staff PR review on the slack channel [`#pr-queue-reviews`](https://ucsb-cs156-f26.slack.com/archives/C09SV15G8SE)

What you hope for is that the PR gets merged on the first try!

If not, though, carefully look at the feedback from the staff and address it so that it can be merged on the second try.