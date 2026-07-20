# Writing Voice

Core voice rules (clarity, tightening, plain words, active voice) live in `AGENTS.md`. This file adds drafting discipline, long-form structure, and the platform adjustments below (Slack, Jira, GitLab MRs, GitHub PRs). It applies to anything written in my voice or under my name - reviews, feedback, docs, and messages included - not only the platforms listed.

## Drafting Discipline

Voice rules reliably pass an audit but fail during generation, so build the audit into drafting:

- Before drafting for a form or tool, ask for the audience and any length or character caps. Draft to fit; don't trim after.
- Before presenting a draft, check it against the AGENTS.md voice rules: search the text for em/en dashes, then scan for AI tells ("not X, but Y", rule-of-three padding).
- When revising, present the delta, not the whole document, and list anything removed so nothing is dropped silently.
- Draft substance only from what I've actually said. If I haven't expressed a view, ask - don't compose one for me. Never state or imply my contribution beyond what I've confirmed.

## General Writing

The tightening rules in `AGENTS.md` cover the word and sentence level. For standalone documents longer than about a page (proposals, design docs, announcements), add progressive disclosure - lead with the essential, layer detail below. Write all three layers and enforce the caps. Shorter content and the platform formats below follow their own rules; do not scaffold layers onto them.

| Layer | Purpose | Cap |
| ----- | ------- | --- |
| TLDR | What is this and why does it matter? | 2-3 sentences |
| Summary | Key points, decisions, or recommendations | 2-3 paragraphs |
| Detail | Full context, nuance, supporting info | 1-2 pages |

A 30-second reader should get everything they need from the TLDR alone.

## Slack

- Keep it short - Slack rewards brevity over completeness.
- Default to plain prose; most messages need no headings or lists at all.
- Tone should be casual, competent, and conversational.
- Dry humour is fine when it fits. Do not force it.
- Openers: team channels `Hey team :wave:`; DMs `Hey [Name]`.
- Emoji should be sparse and only where they help the tone. Match what is already used in the channel rather than reaching for generic ones like `:+1:` or `:rocket:`. Do not use them inside technical analysis.
- No sign-off.
- Corrections should be explicit follow-ups, not silent rewrites.
- Tone benchmark: "I'd also recommend having a solid rollback strategy in place for if something goes wrong, even if it's just a revert MR ready to go. Pretty much every time I touched that code, something broke."

## MR/PR Descriptions

- Open with `This MR [updates|adds|fixes|makes|removes] ...`. Not "I" or "We".
- Focus on why the change exists, how it works, and what behaviour changes.
- Describe behaviour changes explicitly, for example "Previously ..." and "Now ...".
- Group secondary changes clearly instead of burying them.
- Wrap identifiers, file paths, config keys, and literals in backticks when that improves readability.
- Testing or QA sections should be numbered steps a reviewer can follow.
- Default to no emoji.

## Jira Tickets

- Describe current behaviour and the problem clearly. Use "Currently, ..." framing when describing existing behaviour.
- Include only the detail needed to understand, triage, or reproduce the issue.
- No emoji.
