<style>
table * td,th {
    width: auto;
    min-width: 0px;
    text-align: center;
    /* background-color: aqua; */
    padding: 0px;
    margin: 0px;
}

</style>

| Team <br/><span style="font-size: 80%; font-weight: normal">(Links to Slack)</span> | Repo | Issues | Kanban |  PRs | Merged | Project |
|------|---------|-----|-------|-------|----------|-----------|{% for t in site.teams %}
| [{{ t.team }}]({{ site.channels[t.team].url }})| [Repo](https://github.com/ucsb-cs156-{{site.qxx}}/proj-{{t.project}}-{{t.team}}) | [Issues](https://github.com/ucsb-cs156-{{site.qxx}}/proj-{{t.project}}-{{t.team}}/issues) | [Kanban]({{t.kanban}}) | [PRs](https://github.com/ucsb-cs156-{{site.qxx}}/proj-{{t.project}}-{{t.team}}/pulls)|[Merged](https://github.com/ucsb-cs156-{{site.qxx}}/proj-{{t.project}}-{{t.team}}/pulls?q=is%3Apr+is%3Amerged+)|  {{t.project}} |{% endfor %}
