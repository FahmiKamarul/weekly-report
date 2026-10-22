# weekly-report

A [Claude Code](https://claude.com/claude-code) skill that writes your weekly internship report from your notes and this week's commits.

## Install

```bash
git clone https://github.com/FahmiKamarul/weekly-report ~/.claude/skills/weekly-report
```

Then open `~/.claude/skills/weekly-report/SKILL.md` and fill in **Your setup** at the top: your role, the Monday of your first week, and the folder where your work repos live.

## Use

In Claude Code:

```
/weekly-report this week I tested the login page and fixed two bugs
```

Claude runs `scripts/scan-week.sh`, then drafts the report and lists anything it added from your commits so you can remove it. When you say it's final, it saves the report to `past-reports.md`, so later reports match your style and pick up the right week number.

## The scan script

`scripts/scan-week.sh` looks in your work folder and lists:

- your commits since Monday in each git repo (matched by that repo's git email)
- the folders and files you changed since Monday

It only reads; it never changes anything. You can run it yourself to see what Claude sees:

```bash
bash ~/.claude/skills/weekly-report/scripts/scan-week.sh 2026-10-19 ~/work
```
