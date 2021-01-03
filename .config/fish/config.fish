# Link ~/Downloads into /tmp
if test ! -d "$HOME/Downloads";
	set --export DOWNLOADS_DIR (mktemp -d)
	ln --symbolic --force "$DOWNLOADS_DIR" "$HOME/Downloads"
end

set --export OPT_PATH "$HOME/opt"

set --path --prepend --export PATH "$OPT_PATH"/*/bin

if ! set --query MANPATH;
  set --export MANPATH (manpath)
end
set --path --prepend --export MANPATH "$OPT_PATH"/*/share/man

