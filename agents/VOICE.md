# Writing Voice

Core voice rules (clarity, tightening, plain words, active voice) live in `AGENTS.md`. This file adds drafting discipline, long-form structure, technical formatting, documentation rules, and the platform adjustments below (Slack, Jira, GitLab MRs, GitHub PRs). It applies to anything written in my voice or under my name - reviews, feedback, docs, and messages included - not only the platforms listed.

## Drafting Discipline

Voice rules reliably pass an audit but fail during generation, so build the audit into drafting:

- Before drafting for a form or tool, ask for the audience and any length or character caps. Draft to fit; don't trim after. The audience sets the knowledge baseline: a named reader overrides the one-level-below default - gloss what they'd pause on, skip glosses they don't need.
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

A 30-second reader should get everything they need from the TLDR alone - vocabulary included; jargon enters at the layer where its detail lives.

## Technical Formatting

Cross-cutting rules for anywhere code, values, or structure appear - MR/PR descriptions, tickets, and documentation.

- Inline code for paths, identifiers, config keys, file extensions, and literals. If it looks wrong without monospace, monospace it.
- Placeholders: descriptive snake_case (`your_access_token_here`); sequential digits for numbers (`1234567890123`). Never `<TOKEN>`, `xxx`, `ABC123`, or `your-token`.
- Units: no space between number and unit, keeping the unit's standard case ("64KB", "200ms", "30s"); numerals for counts ("8 deployments", not "eight").
- Every code block gets a language tag and a prose explanation before or after it. Keep snippets under ~25 lines; split longer ones with prose.
- Three or more parallel items in prose become a list - numbered when order matters, bulleted otherwise. Introduce lists with a colon; use `**Term**: description` for definition-style items; no terminal periods unless items are full sentences.
- No `---` horizontal rules; headings provide the structure.
- Bold only for UI elements or critical facts. Reaching for bold to strengthen a sentence means the sentence needs rewriting.

## Documentation

READMEs, design docs, runbooks, ADRs, and similar. The General Writing layers apply to anything longer than a page.

- One page, one purpose. Match tone to the doc type:
  - How-to: terse and imperative (reader is mid-task).
  - Reference: neutral and exhaustive.
  - Conceptual: clear enough to teach back.
- Frame titles and headings around the reader's task, not the feature ("Configure retries", not "Retry system").
- Sentence case for headings. Subheadings descriptive enough to predict the section's content - no single-word headings like "Overview" or "Caveats".
- Open each major section with a summary sentence.
- Address the reader as "you", never "the user" or "one". Write steps as imperatives ("Click **Add Project**", not "You will need to click").
- Present tense unless describing genuinely future behaviour.
- Expand acronyms and define terms on first use; link to the canonical explanation where one exists.
- Anchor text names the destination - never "here", "this link", or a bare URL.

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
- Testing or QA sections should be numbered steps a reviewer can follow.
- Default to no emoji.

## Jira Tickets

- Describe current behaviour and the problem clearly. Use "Currently, ..." framing when describing existing behaviour.
- Include only the detail needed to understand, triage, or reproduce the issue.
- No emoji.
