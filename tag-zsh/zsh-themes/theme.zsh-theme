# TODO: indicator when root .. make path red?
ret_status="%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$? %s)"
PROMPT='%{$fg[cyan]%}%~% %{$fg_bold[blue]%}${ret_status}%{$fg_bold[green]%}%{$reset_color%}'
RPS1='$(git_prompt_info) $(vi_mode_prompt_info)'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
