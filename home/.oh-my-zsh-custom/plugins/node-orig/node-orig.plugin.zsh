# nodebrew
if [[ -f ~/.nodebrew/nodebrew ]]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
    nodebrew use v0.8.9
fi
