# Activate venv
function activate {
    if [[ -d build/virtualenv ]]; then
	source build/virtualenv/bin/activate
    else
	source venv/bin/activate
    fi
}

# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Agnoster
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi

# One password
# eval $(op signin my)

# Direnv
eval "$(direnv hook bash)"

