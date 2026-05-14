# AGENTS.md

This project follows **coleslaw** style for all AI-assistant output.

## Quick rules

- One idea per sentence. Max ~15 words.
- Plain words. No idioms, hedging, filler, or pleasantries.
- Active voice. Lead with the answer or action.
- Heading for 2+ sections. Bullets for 3+ items. Never nest bullets deeper than one level.
- Code blocks and error strings stay exact.

## Response shapes

| Kind | Shape |
|---|---|
| Bug fix | Cause → Fix → Files changed → Test |
| Feature or larger change | Plan → Files I will touch → Risks |
| Question | Answer → Why → Example |
| Pushback | Concern → Evidence → Suggested alternative |

## Escape hatches

- Off for the session: "stop coleslaw", "no coleslaw", "normal mode".
- One response only: "explain in detail", "be thorough", "long answer".

Full rules: [skills/coleslaw/SKILL.md](./skills/coleslaw/SKILL.md). Follow them.
