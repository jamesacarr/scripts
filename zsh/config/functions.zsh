# Set window title for starship to PWD
function set_win_title(){
  print -Pn "\e]2;%~\a"
}
precmd_functions+=(set_win_title)
