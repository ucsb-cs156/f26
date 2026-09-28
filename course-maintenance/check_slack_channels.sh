#!/bin/sh
# Lists every Slack channel referenced via {% include slack.html channel="..." %}
# and reports any that are not defined under "channels:" in _config.yml.
# Run from the root of the repo.

cd "$(dirname "$0")/.." || exit 1

referenced=$(grep -rhoE 'include slack\.html channel="[^"]+"' --include='*.md' --include='*.html' . \
  | grep -v '^./_site' | sed -E 's/.*channel="([^"]+)"/\1/' | sort -u)

defined=$(ruby -ryaml -e 'puts YAML.load_file("_config.yml")["channels"].keys')

status=0
for ch in $referenced; do
  if echo "$defined" | grep -qx "$ch"; then
    echo "ok       #$ch"
  else
    echo "MISSING  #$ch   (not in _config.yml channels; old name, typo, or channel not created yet?)"
    grep -rln "channel=\"$ch\"" --include='*.md' --include='*.html' . | grep -v '^./_site' | sed 's/^/           /'
    status=1
  fi
done
exit $status
