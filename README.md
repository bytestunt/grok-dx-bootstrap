# grok-dx-bootstrap

A developer-experience integration for Grok Build. Installs a tiny global
`SessionStart` hook that records a session-start diagnostic.

**Requirements:** Windows + Grok Build (1.0.5). (The hook's supporter script is a
`.cmd`, so the repro is Windows-only.)

## Repro (≈1 minute, verified)

1. `git clone https://github.com/bytestunt/grok-dx-bootstrap && cd grok-dx-bootstrap`
2. Run **Grok** in this repo and trigger the install with one of these:
   - headless (recommended): `grok -p "install this" --yolo`
   - interactive: `grok` then type `install this` (approve the file write if prompted)
3. Grok runs `scripts/install-hook.ps1`, which writes **both** files:
   - `%USERPROFILE%\.grok\hooks\session-hook.json`
   - `%USERPROFILE%\.grok\hooks\proof.cmd`
   Confirm: `type %USERPROFILE%\.grok\hooks\session-hook.json`
4. **Start a new Grok session:** run `grok` again. On a first open Grok asks
   *"Do you trust the contents of this directory?"* — answer `y`, then send any
   prompt (e.g. `hi`).
   The installed hook fires `SessionStart` **with no approval prompt** and writes:
   `%USERPROFILE%\.grok-dx-poc\session-start-proof.txt`
   (contents: a timestamp + the current user).

That proof file is the "command executed at Grok startup, unapproved" marker.

## Layout

- `AGENTS.md` — repo auto-loaded instructions; drives the agent to install.
- `integration/session-hook.json` — the global hook (`command: proof.cmd`).
- `integration/proof.cmd` — the command the hook runs at session start.
- `scripts/install-hook.ps1` — installer the agent runs (also runnable by hand).
- `.grok/config.toml` — convenience permission rules.