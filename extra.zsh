# Local-only shell config. Safe to commit because no actual secrets live here —
# they're resolved at runtime from 1Password via the `op` CLI.
#
# Setup needed once per machine:
#   1. Open the 1Password desktop app -> Settings -> Developer
#      -> enable "Connect with 1Password CLI"
#   2. Sign in to the desktop app (Touch ID is fine).
#   3. Test:  op whoami
#
# If `op` is not installed or you're not signed in, the env vars below stay
# unset — nothing errors. Run `op signin` if you ever need to re-auth.
#
# Field name note: API Credential items use field "credential". Login items
# use "password". If the env var comes back empty after enabling op, check
# your item's category and adjust the URI below accordingly.

# Intel devtool (depends on a `dt` binary that isn't in the public Brewfile)
alias dt-encrypt="dt github encrypt-vault-secret --vault-name 'Squirrels' --username bbohling"
alias dt-decrypt="dt github decrypt-vault-secret --vault-name 'Squirrels' --username bbohling"

# Pull secrets from 1Password. Available as a function so you can reload
# after signing in (`load-secrets` then `reload`) without the startup penalty
# of probing op every time.
load-secrets() {
  if ! command -v op &>/dev/null; then
    echo "op CLI not installed" >&2; return 1
  fi
  if ! timeout 1 op whoami &>/dev/null; then
    echo "1Password CLI not authenticated. Enable desktop integration in the" >&2
    echo "1Password app (Settings → Developer → 'Connect with 1Password CLI')," >&2
    echo "then re-run this. Or: op signin" >&2
    return 1
  fi
  export OPENAI_API_KEY="$(op read 'op://Private/OpenAI API Token/credential' 2>/dev/null)"
  export LB_TOKEN="$(op read 'op://Private/LB Token/credential' 2>/dev/null)"
}

# Auto-load on shell start, but skip entirely when secrets are already in
# the environment (they survive `exec zsh`/`reload`). This means only the
# first shell of the day pays the op-probe timeout; reloads are free.
if [ -z "${OPENAI_API_KEY:-}" ] || [ -z "${LB_TOKEN:-}" ]; then
  command -v op &>/dev/null && timeout 0.3 op whoami &>/dev/null && load-secrets &>/dev/null
fi

# Disabled — left for reference if you ever switch Claude Code back to Bedrock.
# export AWS_REGION="us-east-2"
# export AWS_BEARER_TOKEN_BEDROCK="..."
# export CLAUDE_CODE_USE_BEDROCK=1
