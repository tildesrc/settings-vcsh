set nocompatible

" If running $OPT_PATH, load full.vim
if exists('$OPT_PATH') && system('sh -c ''[ "$(dirname $(readlink /proc/$(ps -o ppid:1= -p $PPID)/exe))" = "$OPT_PATH/vim/bin" ] && echo -n "true"''') == "true"
  source ~/.vim/full.vim
endif
