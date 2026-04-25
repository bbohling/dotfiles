# OMZ's macos plugin defines `md` as an alias for `mkdir -p`, which would shadow
# the function and (worse) cause a parse error here that aborts the whole file.
unalias md 2>/dev/null
unalias fs 2>/dev/null
unalias extract 2>/dev/null

# Create a directory and cd into it.
md() {
  mkdir -p "$@" && cd "$@"
}

# File or directory size, human-readable.
fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

# Universal archive extractor — `extract foo.tar.gz`
extract() {
  if [ ! -f "$1" ]; then
    echo "'$1' is not a valid file" >&2
    return 1
  fi
  local filename=$(basename "$1")
  local foldername="${filename%%.*}"
  local fullpath=$(perl -e 'use Cwd "abs_path"; print abs_path(shift)' "$1")
  local didfolderexist=false
  if [ -d "$foldername" ]; then
    didfolderexist=true
    read "?$foldername already exists, overwrite? (y/n) "
    [[ "$REPLY" =~ ^[Nn]$ ]] && return
  fi
  mkdir -p "$foldername" && cd "$foldername"
  case "$1" in
    *.tar.bz2|*.tb2|*.tbz|*.tbz2) tar xjf "$fullpath" ;;
    *.tar.gz|*.tgz|*.tar.Z|*.taz) tar xzf "$fullpath" ;;
    *.tar.xz|*.txz)               tar Jxvf "$fullpath" ;;
    *.tar)                        tar xf "$fullpath" ;;
    *.zip)                        unzip "$fullpath" ;;
    *)
      echo "'$1' cannot be extracted via extract()" >&2
      cd ..
      $didfolderexist || rmdir "$foldername"
      return 1
      ;;
  esac
}
