export PATH=/usr/local/bin:$PATH
# export LANG="ja_JP.UTF-8"

# 3秒以上かかった処理は詳細表示
REPORTTIME=3

# 補完機能
autoload -U compinit
compinit

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_all_dups # 履歴と重複したコマンドの古い方を削除
setopt hist_ignore_dups     # 直前と同じコマンドラインは履歴に追加しない
setopt share_history        # コマンド履歴の共有
setopt inc_append_history   # 履歴をインクリメンタルに追加
setopt hist_no_store        # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks   # 余分な空白は詰めて記録

# Emacsライクキーバインド設定
#bindkey -e
#bindkey "^U" universal-argument

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ディレクトリ名を入力するだけで移動
setopt auto_cd
# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd
# 同じディレクトリを重複してpushしない
setopt pushd_ignore_dups
# コマンド訂正
setopt correct
# 補完候補を詰めて表示する
setopt list_packed
# 補完候補表示時などにピッピとビープ音をならないように設定
#setopt nolistbeep
# ビープ音を鳴らさない
setopt no_beep
# 先方予測機能
#autoload predict-on
#predict-on
# 補完候補一覧をカラー表示（変換候補の色をlsコマンドと揃える）
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# アルファベット，数字以外で単語の一部とみなされる文字
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'    # "/"を抜いてディレクトリ単位でC-wできる
# 拡張グロブ~での除外や(a|b)のグルーピング
setopt extended_glob
# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
# 補完候補を矢印キーで選択
zstyle ':completion:*:default' menu select=1
# コマンドラインで # 以降をコメントとする
setopt interactive_comments

function temp(){
  TMP_DIR="$HOME/tmp/"
  if [ ! -d $TMP_DIR ]; then
    mkdir -p $TMP_DIR
  fi
  TEMPLATE=$(date +'%Y%m%d'.$1${1:+.})XXXXXX
  cd $(mktemp -d --tmpdir=$TMP_DIR $TEMPLATE)
}
