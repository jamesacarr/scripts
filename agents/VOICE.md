# Writing Voice - Platform Specific

Load when drafting for Slack, Jira, GitLab MRs, or GitHub PRs. Global writing rules live in `AGENTS.md`.

## Slack

- Keep it short and lead with the point.
- Use plain prose for short messages.
- For longer messages, add structure only when it improves scanning or comprehension.
- Use headings only when they describe real sections, not generic templates.
- Use bullets or numbered lists only for actual enumeration.
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
- Use subheadings only when the description covers distinct topics.
- Testing or QA sections should be numbered steps a reviewer can follow.
- Default to no emoji.

## Jira Tickets

- Keep the tone neutral, technical, and concise.
- Describe current behaviour and the problem clearly. Use "Currently, ..." framing when describing existing behaviour.
- Include only the detail needed to understand, triage, or reproduce the issue.
- No emoji.
