export RANGER_LOAD_DEFAULT_RC="false"

alias mpvv='you-get -p mpv'
alias tmux='tmux -u'
alias c='clear'
alias ra='ranger'

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=3000
## History command configuration
setopt hist_ignore_all_dups   # 不保留重复的历史记录项
setopt hist_ignore_space      # 在命令前添加空格，不将此命令添加到记录文件中
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_verify            # show command with history expansion to user before running it

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# ==== 加载功能 ====
autoload -U compinit && compinit
# ==== 异步主题 ====
zinit ice pick"async.zsh" src"pure.zsh"
zinit light ittooo/pure-ys
# ==== 加载 GitHub 插件 ====
zinit light-mode lucid wait for \
    zdharma/fast-syntax-highlighting \
    arialdomartini/oh-my-git

zinit light-mode lucid wait for \
    atload='_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions \
    blockf \
        zsh-users/zsh-completions \
    as="program" atclone="rm -f ^(rgg|agv)" \
        lilydjwg/search-and-view \
    atclone='sed -i "s/\^h/^?/" autopair.zsh' \
        hlissner/zsh-autopair

zinit light hchbaw/zce.zsh

zinit ice atclone="dircolors -b LS_COLORS > c.zsh" atpull='%atclone' pick="c.zsh"
zinit light trapd00r/LS_COLORS

export AGV_EDITOR='kwrite -l $line -c $col $file'

# ==== 加载 OMZ 插件 ====
zinit for \
    OMZ::lib/clipboard.zsh \
    OMZ::lib/completion.zsh \
    OMZ::lib/key-bindings.zsh \
    OMZ::lib/git.zsh \
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    OMZ::plugins/systemd/systemd.plugin.zsh \
    OMZ::plugins/sudo/sudo.plugin.zsh   \

zinit ice curl for \
    OMZ::plugins/extract \
    OMZ::plugins/z

zinit as="completion" for \
    OMZ::plugins/cargo/_cargo \
    OMZ::plugins/rust/_rust \
    OMZ::plugins/fd/_fd

# ==== 激活功能 ====
#自动补全选项
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#补全直接选中菜单项
setopt menu_complete
#以下字符视为单词的一部分
wordchars='*?_-[]~=&;!#$%^(){}<>'

# color
if [[ "$TERM" == "xterm" ]];then
export TERM=xterm-256color
fi

# fzf
alias vfzf='vim $(fzf)'
alias dfzf='cd $(find * -type d | fzf)'
alias gitfzf='git checkout $(git branch -r | fzf)'

export FZF_DEFAULT_COMMAND='fd --hidden -E ".git" -E "node_modules" . /usr /etc /home'
export FZF_DEFAULT_OPTS='--height 90% --reverse --preview-window=down --preview \
"(echo {} | ~/.config/dotfiles/software/fzf/fzf_preview.py) 2> /dev/null | head -300"'
### End of Zinit's installer chunk
