# ------------------------------
# General Settings
# ------------------------------
echo --- Welcome Kanufy ---

export PATH=~/.local/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:$PATH #最初にもってこないといろいろ不具合あったつらい
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

bindkey -v               # キーバインドをviモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する 
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit           # 補完機能を有効にする
compinit -u
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

## 補完侯補をメニューから選択する。
#### select=2: 補完候補を一覧から選択する。
####           ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

# 補完時にhjklで選択
zmodload zsh/complist           # "bindkey -M menuselect"設定できるようにするためのモジュールロード
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }


# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Dxfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;33:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}



### Weather ###
#kyoto = 260010
#tokyo = 130010
WEATHER=$(curl -s http://weather.livedoor.com/forecast/webservice/json/v1\?city\=130010 | jq -r '.forecasts[] | select(.dateLabel == "今日").telop' );
case $WEATHER in
  曇時々晴) WE="☁ /☀";;
  曇時々雨) WE="☁ /☂";;
  曇時々雪) WE="☁ /☃";;
  晴時々曇) WE="☀ /☁";;
  晴時々雨) WE="☀ /☂";;
  雨時々曇) WE="☂ /☁";;
  晴のち曇) WE="☀ ->☁";;
  晴のち雨) WE="☀ ->☂";;
  曇のち晴) WE="☁ ->☀";;
  曇のち雨) WE="☁ ->☂";;
  雨のち晴) WE="☂ ->☀";;
  雨のち曇) WE="☂ ->☁";;
  雪のち曇) WE="☃ ->☁";;
  曇のち雪) WE="☁ ->☃";;
  雨) WE="☂";;
  晴れ) WE="☀";;
  曇り) WE="☁";;
  雪) WE="☃";;
  *) WE="♡";;
esac

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
autoload -Uz add-zsh-hook
# vcs_infoロード    
autoload -Uz vcs_info 
# gitのみ有効にする
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" formats "%{${fg[yellow]}%}(^ω^)<%{${reset_color}%}%{${fg[green]}%}%b%{${reset_color}%}%{${fg[yellow]}%})%{${reset_color}%}
"  

# 一般ユーザ時(host% >)
tmp_prompt="%{${fg[cyan]}%}%n%{${reset_color}%} %{${fg[red]}%}${WE}%{${reset_color}%} %{${fg[cyan]}%}%B>%b%{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${rtmeset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    PROMPT="${vcs_info_msg_0_}${tmp_prompt}"
}
add-zsh-hook precmd _update_vcs_info_msg

#PROMPT=${vcs_info_msg_0_}$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"

# ------------------------------
# Other Settings
# ------------------------------
### RVM ###
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

### Aliases ###
alias la='ls -la'
alias -g G='| grep'
alias -g L='| less'
alias relogin='exec $SHELL -l'

### Clip Board ###
#ターミナル上でコピーしたいときのやつ
#たとえば less index.html Cとするとindex.htmlの内容がクリップボードにコピーされる
if which pbcopy >/dev/null 2>&1 ; then 
# Mac  
alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then 
# Linux
alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then 
# Cygwin 
alias -g C='| putclip'
fi

# sptz開発用mysql
alias mysptz='mysql -h 127.0.0.1 -u root -proot supporterz2014'


export PATH=/usr/local/php5/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/sbin:$PATH

#pathの重複を避ける
typeset -U path cdpath fpath manpath PATH

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
 if [ -d "${PYENV_ROOT}" ]; then
     export PATH=${PYENV_ROOT}/bin:$PATH
     eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
 fi
export PATH=$PATH:/Users/k-hata/.nodebrew/current/bin
