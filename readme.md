# Brandon's Dotfiles

Personal macOS dotfiles. Plain zsh, starship, mise, GNU Stow, 1Password CLI for secrets.

Last major refactor: April 2026. The repo has been around since 2017, but most of the structure here is new.

## Setting up a new Mac

1. Update macOS to the latest version (App Store or System Settings).
2. Generate an SSH key and add it to GitHub:

   ```sh
   curl https://raw.githubusercontent.com/bbohling/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo:

   ```sh
   git clone git@github.com:bbohling/dotfiles.git ~/.dotfiles
   ```

4. Run the bootstrap. Idempotent — safe to re-run.

   ```sh
   cd ~/.dotfiles
   ./bootstrap.sh                # brew bundle + stow home/ into $HOME
   ./bootstrap.sh --macos        # also apply macOS defaults (reboot after)
   ./bootstrap.sh --clone        # also clone personal repos via clone.sh
   ```

5. Open the **1Password** app → Settings → Developer → enable **"Connect with 1Password CLI"**, then run `load-secrets` in a new shell. See [Secrets](#secrets) below.

6. Open a fresh terminal. Run `reload` whenever you want to re-source the shell config (`exec zsh` under the hood).

## Layout

```
~/.dotfiles/
├── home/                  GNU Stow package — symlinked into $HOME
│   ├── .zshrc             interactive shell config
│   ├── .zshenv            env vars + PATH (loaded for every zsh invocation)
│   ├── .gitconfig         base git config
│   ├── .gitconfig-work    work identity (Intel email + signing key)
│   ├── .gitconfig-personal personal identity
│   ├── .inputrc
│   └── .npmrc             gitignored
├── aliases.zsh            sourced by .zshrc by absolute path
├── exports.zsh            non-PATH shell env (history, kube, etc.)
├── extra.zsh              local-only: 1Password-resolved secrets + Intel aliases
├── functions.zsh          md/fs/extract
├── starship.toml          prompt config (referenced via $STARSHIP_CONFIG)
├── Brewfile               brew bundle dependencies
├── .macos                 curated macOS defaults (~50 settings)
├── bootstrap.sh           run this once to set up a new Mac
├── clone.sh, ssh.sh       optional helpers
└── .github/workflows/     CI: shellcheck + zsh -n + brew bundle parse
```

## Stack

- **Shell:** plain zsh + 3 brew plugins (`zsh-autosuggestions`, `zsh-syntax-highlighting`, `zsh-completions`). Replaced oh-my-zsh.
- **Prompt:** [starship](https://starship.rs/). Replaced oh-my-posh. Config at `starship.toml` (top level, referenced via `$STARSHIP_CONFIG` set in `.zshenv`). The file has a "minimal" layout active and a "common additions" layout commented out — swap by toggling two comment lines.
- **Runtime versions:** [mise](https://mise.jdx.dev/) for new projects. Volta is still installed as a fallback for projects with `volta` blocks in `package.json`. Migrate per project: `cd <project> && mise use node@<version>`.
- **Secrets:** [1Password CLI](https://developer.1password.com/docs/cli/) (`op`). Secrets resolve from the Private vault at shell startup via `op read`. The `extra.zsh` file contains references like `op://Private/<item>/credential` — never the actual values.
- **Dotfile deployment:** [GNU Stow](https://www.gnu.org/software/stow/). Files in `home/` get symlinked into `$HOME`. Adding a new home-bound file: drop it in `home/` and run `stow -t ~ -d ~/.dotfiles home`.
- **Modern CLI:** `bat`, `eza`, `fzf`, `ripgrep`, `zoxide`. See `Brewfile`.

## Per-directory git identity

Everything under `~/excl/` resolves to the work identity (`brandon.bohling@intel.com`, work GPG key, Intel HTTPS proxies enabled). Everything under `~/excl/🥃/` overrides back to personal (`brandon@bohling.me`, personal key, proxies unset). Everything else (e.g., `~/.dotfiles`) uses personal as default. Implemented via `[includeIf "gitdir:..."]` blocks in `home/.gitconfig`; the override files are `home/.gitconfig-work` and `home/.gitconfig-personal`.

## Secrets

`extra.zsh` declares secret env vars but resolves them at shell startup via `op read`. Setup:

1. Install 1Password desktop app (the cask is in `Brewfile`).
2. Settings → Developer → enable **"Connect with 1Password CLI"**.
3. Make sure the relevant items exist in your **Private** vault. Field defaults to `credential` (API Credential template); use `password` for Login items.
4. New shell, then `op whoami` should return your account info instantly.
5. `load-secrets` populates the env vars. Verify with `env | grep -E 'OPENAI|LB_TOKEN'`.

If `op` is not signed in, `extra.zsh` skips silently (won't error). The auto-load is gated on env-vars-not-already-set, so `reload`/`exec zsh` inherits the secrets and skips re-probing — only the first shell of the day pays the timeout cost.

## Useful aliases / functions

- `reload` — `exec zsh`. Re-source the shell.
- `dotfiles` — `cd ~/.dotfiles`
- `work` — `cd ~/excl`
- `ls`/`ll`/`la`/`lt` — `eza` with `--group-directories-first --git`
- `md <dir>` — mkdir -p && cd
- `extract <archive>` — universal extractor
- `fs [path]` — file or directory size
- `load-secrets` — pull `OPENAI_API_KEY` / `LB_TOKEN` from 1Password (see [Secrets](#secrets))
- `z <fragment>` / `zi` — zoxide jump / fzf picker
- `Ctrl-R` — fzf history search
- `Ctrl-T` — fzf file picker

## CI

GitHub Actions runs on every push and PR (`.github/workflows/ci.yml`):

- `shellcheck` on `bootstrap.sh`, `clone.sh`, `ssh.sh`, `.macos`
- `zsh -n` parse check on every `*.zsh` file
- `brew bundle list` to validate `Brewfile`

## Inspiration

[Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Dries Vints](https://github.com/driesvints/dotfiles).

:ok_person: bob's your uncle :ok_person:
