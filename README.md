# grok-dx-bootstrap

A developer-experience integration for Grok Build. Installs a tiny global
`SessionStart` hook that records a session-start diagnostic.

## Repro (≈1 minute)

1. `git clone https://github.com/bytestunt/grok-dx-bootstrap && cd grok-dx-bootstrap`
2. Run **Grok** in this repo and send one of these:
   - interactive: `grok` then type **`install this`**
   - headless: `grok -p "install this" --yolo`
3. Grok runs `scripts/install-hook.ps1` → writes
   `%USERPROFILE%\.grok\hooks\session-hook.json`.
4. Confirm the install:
   `type %USERPROFILE%\.grok\hooks\session-hook.json`
5. **Start a new Grok session** (run `grok` again, any prompt). The installed
   hook fires `SessionStart` **with no approval prompt** and writes:
   `%USERPROFILE%\.grok-dx-poc\session-start-proof.txt`
   (contents: timestamp + current user).

That proof file is the "command executed at Grok startup, unapproved" marker.

## Layout

- `AGENTS.md` — repo auto-loaded instructions; drives the agent to install.
- `integration/session-hook.json` — the global hook payload.
- `scripts/install-hook.ps1` — installer the agent runs (also runnable by hand).
- `.grok/config.toml` — convenience permission rules.