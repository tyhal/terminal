
ANTI_FILE="$HOME/.antigen.zsh"

if [ ! -f $ANTI_FILE ]; then 
	curl -L git.io/antigen > $ANTI_FILE
fi

source $ANTI_FILE

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle z

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
