#!/usr/bin/env bash
# Lists this week's evidence of work: own commits per repo in the work folder,
# plus top-level folders/files touched since the start date.
# Usage: bash scan-week.sh [SINCE_DATE YYYY-MM-DD] [WORK_FOLDER]
#   (defaults: this Monday, ~/work)
set -u
SINCE="${1:-$(date -v-mon +%Y-%m-%d 2>/dev/null || date -d 'last monday' +%Y-%m-%d)}"
ROOT="${2:-$HOME/work}"
ROOT="${ROOT/#\~/$HOME}"

echo "== Your commits since $SINCE =="
for repo in "$ROOT"/*/; do
  [ -d "$repo/.git" ] || continue
  # Each repo's own user.email, so work and personal accounts both match
  author=$(git -C "$repo" config user.email) || continue
  log=$(git -C "$repo" log --all --since="$SINCE" --author="$author" \
        --date=short --pretty='  %ad  %s' 2>/dev/null | sort -u)
  [ -n "$log" ] && printf '\n[%s]\n%s\n' "$(basename "$repo")" "$log"
done

echo
echo "== Folders/files under $ROOT changed since $SINCE =="
find "$ROOT" -mindepth 1 -maxdepth 1 -newermt "$SINCE" ! -name '.*' -exec basename {} \; | sort
