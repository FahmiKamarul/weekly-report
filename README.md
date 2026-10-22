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

Claude drafts the report and lists anything it added from your commits so you can remove it. When you say it's final, it saves the report to `past-reports.md`, so later reports match your style and pick up the right week number.
