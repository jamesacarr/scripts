# Writing Voice

Core voice rules (clarity, tightening, plain words, active voice) live in `AGENTS.md`. This file adds long-form structure and the platform adjustments below (Slack, Jira, GitLab MRs, GitHub PRs).

## General Writing

The tightening rules in `AGENTS.md` cover the word and sentence level. For long-form, add progressive disclosure - lead with the essential, layer detail below. Write all three and enforce the caps:

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
