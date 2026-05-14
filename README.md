# coleslaw

> Caveman's no-fluff discipline, with output you can actually read.

A coding-agent skill that makes AI output easier to read for **non-native English speakers** and **developers with ADHD**. Predictable response shapes, plain words, short sentences. Same technical content, less effort to parse.

## Why

[Caveman](https://github.com/JuliusBrussee/caveman) cuts ~75% of tokens. It works, but the output is often too rough to read quickly, especially in a second language.

coleslaw goes a different way:

- Plain words instead of compressed slang.
- Short sentences instead of telegraphic fragments.
- Standardized shapes so you always know where the answer is.
- Compactness is a side effect, not the goal.

## Who it is for

Default AI output is full of phrasal verbs ("get rid of", "kick off", "look into"), idioms, and soft hedging ("you might want to consider"). This style is invisible to most native English speakers, but it takes extra effort to parse if English is not your first language, especially under time pressure.

coleslaw drops that style by default. In priority order:

1. **Developers who read English as a second language (ESL).** Output stays in plain words. No phrasal verbs. No idioms. Jargon is defined on first use.
2. **Developers with ADHD** who bounce off walls of text.
3. **Anyone** tired of AI preamble, hedging, and filler.

You do not need to identify with any of these. If clear, structured output beats friendly preamble for you, coleslaw is for you.

## Before / after

**Default AI output**

> Sure! I'd be happy to help. The reason your React component is re-rendering is most likely because you're creating a new object reference on each render cycle. When you pass an inline object as a prop, React's shallow comparison sees it as a different object every render, which triggers a re-render. I'd recommend using `useMemo` to memoize the object.

**coleslaw output**

> **Cause:** Inline object prop creates a new reference each render.
> **Fix:** Wrap the object in `useMemo`.

Same fix. Faster to read in any language.

## Install

coleslaw has one installer per tool. Each is self-contained. Clone the repo first.

By default the installer **registers** coleslaw globally for the chosen tool. You activate it per session with `/coleslaw` or "use coleslaw". To turn it off, say "no coleslaw".

If you want coleslaw **always active** in the current repo without invocation, pass `--always-on`.

### Cursor

```bash
./install/cursor.sh                # register globally, invoke with /coleslaw
./install/cursor.sh --always-on    # also always-on in current repo (writes .cursor/rules/coleslaw.mdc)
./install/cursor.sh --uninstall    # remove
```

### Claude Code

```bash
./install/claude-code.sh              # register globally, applied when description matches
./install/claude-code.sh --always-on  # also always-on in current repo (injects coleslaw block into ./AGENTS.md)
./install/claude-code.sh --uninstall  # remove
```

### Codex

```bash
./install/codex.sh              # register globally, applied when description matches
./install/codex.sh --always-on  # also always-on in current repo (injects coleslaw block into ./AGENTS.md)
./install/codex.sh --uninstall  # remove
```

### Install everything at once

`./install.sh` is a thin wrapper that delegates to the per-tool scripts. It auto-detects which tools you have installed.

```bash
./install.sh                            # every detected tool, global registration
./install.sh --always-on                # also always-on in current repo
./install.sh cursor claude-code         # specific tools (positional args)
./install.sh cursor --always-on         # one tool, always-on for this repo
./install.sh --uninstall                # remove for every detected tool
```

If you only use one tool, call its script directly. The wrapper exists for convenience.

## How coleslaw activates (by tool)

| Tool | Global install | `--always-on` (this repo) |
|---|---|---|
| **Cursor** | Available, invoke with `/coleslaw` | Always active (`alwaysApply: true` rule) |
| **Claude Code** | Auto-discovered by description, applied when relevant | Always loaded via `AGENTS.md` |
| **Codex** | Auto-discovered by description, applied when relevant | Always loaded via `AGENTS.md` |

To turn coleslaw off in any session, just say "no coleslaw" or "normal mode".

## Triggers

- **Turn on:** `/coleslaw`, "coleslaw mode", "use coleslaw"
- **Turn off:** "stop coleslaw", "no coleslaw", "normal mode"
- **This response only:** "explain in detail", "be thorough", "long answer"

## Response shapes

coleslaw uses four shapes. Once you learn them, scanning becomes automatic.

| Kind | Shape |
|---|---|
| Bug fix | Cause → Fix → Files → Test |
| Feature / larger change | Plan → Files → Risks |
| Question | Answer → Why → Example |
| Pushback | Concern → Evidence → Alternative |

## Hard rules (short version)

- One idea per sentence. Max ~15 words.
- No phrasal verbs, idioms, hedging, filler, or pleasantries.
- Active voice. Lead with the answer.
- Headings for 2+ sections. Bullets for 3+ items.
- Code blocks and error strings stay exact.

Full rules live in [skills/coleslaw/SKILL.md](./skills/coleslaw/SKILL.md).

## The name

A small pun on ESL: col**ESL**aw. The lowercase spelling is canonical everywhere — the capitals are just here so the joke lands.

## Status

Hobby project. v0. Used daily by the author. Feedback and PRs welcome.

## License

MIT.
