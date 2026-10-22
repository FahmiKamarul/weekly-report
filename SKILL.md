---
name: weekly-report
description: Use when the user asks for their weekly internship report, weekly progress summary, or "what did I do this week" write-up for their internship, whether they paste bullet notes or give nothing at all.
argument-hint: "[your notes for the week, optional week number]"
---

# Weekly Internship Report

## Your setup

Fill these in once:

- **Role:** Software Engineering Intern at <company>
- **Week 1 Monday:** YYYY-MM-DD
- **Work folder:** ~/work

---

Turn the user's week into a paste-ready report in the same shape and voice as their past reports.

**Core principle:** every line traces to something real — the user's notes, their commits, or their files. Never invent work, numbers or outcomes to fill a section.

## Steps

1. **Read `past-reports.md`** (next to this file), if it exists. The last report gives the latest week number and what was already covered; all of them show the voice to match. If there is none, this is the first report: use the format below as the voice.
2. **Pin the week.** Week N starts on the Week 1 Monday + 7×(N−1). Default is the current week. If the user gives a number, theirs wins (leave or breaks may shift it).
3. **Collect the week's evidence.**
   - The user's notes (arguments or chat) are the main source.
   - Run `bash <this skill's folder>/scripts/scan-week.sh <that week's Monday> <work folder>` for their commits and the folders touched since then.
   - Check the memory index for project notes dated inside the week.
4. **Draft the report** in the format below.
5. **After the report**, list in one short block anything taken from the scan or memory that was not in the user's notes, so they can drop it. If a section had no material, say which and ask one question — don't pad.
6. **When the user says it's final**, append it to `past-reports.md` after a `---` line (create the file if needed).

## Report format

```
Weekly Report <N>
Status: Pending

1. Objectives
- <imperative goal: "Implement…", "Learn…", "Test…">

2. Activities
<Topic & Topic>:
- <past-tense bullet: "Created…", "Reviewed…">

<Topic & Topic>:
- ...

3. Problem Solving
- Challenge: <the technical difficulty>
- Resolution: <exactly what was done about it>

4. Achievements
- <"Successfully…" / "Gained…" / "Verified…" + the finished result>
```

- **Size:** 3–5 objectives; 2–4 Activities groups of 1–4 bullets; 1–3 Challenge/Resolution pairs; 3–4 achievements.
- **Activities headings** are named after this week's actual work, usually "X & Y" (e.g. "API Testing & Bug Triage:", "CI/CD & Deployment:"), optionally with a parenthetical "(Multi-Stack CDK App)".
- **Activities vs Achievements:** Activities is the doing; Achievements is the finished result, often rolling several activities into one outcome line.
- **Keep it high-level:** describe the process ("Learned how X is set up", "Created scripts to automate Y"), not the details of what was changed, unless the user's notes give them.
- **Claims match the evidence:** "Gained hands-on experience with…" for something studied this week; "Mastered" or "critical" only if the notes support it. Percentages only from the user's own numbers.
- **Safe to share outside the company:** no secrets, account IDs, internal URLs, or customer data.

## Output

Print the report in chat as plain text, ready to paste. Only create a doc or file if the user asks for one.
