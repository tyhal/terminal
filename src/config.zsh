#!/usr/bin/env zsh

# ~~~~~~~~~~~~~~~~~~~

plugin_source_git() {
	ZSH_PLUGIN="$HOME/.zsh_plugins/$2/$3"
	if [ ! -f "$ZSH_PLUGIN" ]; then
		git clone "git@github.com:$1/$2.git" "$HOME/.zsh_plugins/$2"
	fi
	source "$ZSH_PLUGIN"
}

# Plugins
plugin_source_git "zsh-users" "zsh-history-substring-search" "zsh-history-substring-search.zsh"
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
plugin_source_git "zsh-users" "zsh-autosuggestions" "zsh-autosuggestions.zsh"
plugin_source_git "zsh-users" "zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
plugin_source_git "agkozak" "zsh-z" "zsh-z.plugin.zsh"

# ~~~~~~~~~~~~~~~~~~~
# Vars

source "$(dirname $0)/vars.env"

# ~~~~~~~~~~~~~~~~~~~
# Autocomplete

fpath=("$(dirname $0)/completion" ~/.zsh/completion $fpath)
autoload -U compinit
compinit

# ~~~~~~~~~~~~~~~~~~~~
# Alias

alias k="kubectl"
alias _="sudo"

# Easy jump into a container
alias boop="docker run --rm -it"
alias ubuntu="boop ubuntu"
alias centos="boop centos"
alias debian="boop debian"
alias alpine="boop alpine"
alias fedora="boop fedora"
alias suse="boop opensuse/leap bash"

alias watch-logs="dmesg -THw"

# Git
alias nuke="git reset --hard HEAD && git clean -df" # -x

# Project Init
alias projinit="mkdir -p script && touch LICENSE README.md CONTRIBUTING.md script/test script/bootstrap"

# Cmake
alias build="cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja && cmake --build build"

# Terraform
alias tfgraph="terraform graph | dot -Tps -o graph.ps"

# Update
if [ ! $commands[apt] ]; then
	alias up="_ apt update;_ apt -y full-upgrade;_ apt -y autoremove"
fi

alias install-vim="wget -O ~/.vimrc https://raw.githubusercontent.com/mathiasbynens/dotfiles/main/.vimrc ; mkdir -p ~/.vim/swaps ~/.vim/backups ~/.vim/undo ~/.vim/colors; wget -O ~/.vim/colors/solarized.vim https://raw.githubusercontent.com/mathiasbynens/dotfiles/main/.vim/colors/solarized.vim"

if [ ! $commands[starship] ]; then
	set -x
        curl -sS https://starship.rs/install.sh | sh
	set +x
fi
export STARSHIP_CONFIG="$(dirname $0)/starship.toml"
eval "$(starship init zsh)"
