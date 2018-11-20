
# ~~~~~~~~~~~~~~~~~~
# Antigen Setup

_ANTIGEN_INSTALL_DIR="$HOME/.antigen/"
export _ANTIGEN_INSTALL_DIR
mkdir -p "$_ANTIGEN_INSTALL_DIR"
ANTI_FILE="$_ANTIGEN_INSTALL_DIR/antigen.zsh"

if [ ! -f $ANTI_FILE ]; then 
	curl -L git.io/antigen > $ANTI_FILE
fi

source $ANTI_FILE

# ~~~~~~~~~~~~~~~~~~
# Antigen Config

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle z
antigen bundle docker-compose
antigen bundle docker
antigen bundle golang

# External bundles
antigen bundle dbz/zsh-kubernetes
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle webyneter/docker-aliases.git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle chrissicool/zsh-256color

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Tell Antigen that you're done.
antigen apply

# ~~~~~~~~~~~~~~~~~~~
# Kubernetes

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# ~~~~~~~~~~~~~~~~~~~
# Vars
 
source "$(dirname $0)/vars.env"

# ~~~~~~~~~~~~~~~~~~~~
# Alias

# Easy jump into a container
alias boop="docker run --rm -it"
alias ubuntu="boop ubuntu"
alias centos="boop centos"
alias debian="boop debian"
alias alpine="boop alpine"
alias suse="boop opensuse bash"

# AWS
alias aws='docker run --rm -t $(tty &>/dev/null && echo "-i") -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION -v "$(pwd):/project" mesosphere/aws-cli'
alias awsnodes='aws ec2 describe-instances --query "Reservations[*].Instances[*].[Tags[?Key==\`Name\`].Value[],State.Name,KeyName,InstanceType,InstanceId,ImageId,SubnetId,NetworkInterfaces[*].Association.PublicIp,SecurityGroups[*].GroupId,NetworkInterfaces[*].PrivateIpAddress]"'

# Update
alias up="_ apt update;_ apt -y full-upgrade;_ apt -y autoremove"

# Personal Prefs
alias install-tyler="\
_ add-apt-repository ppa:ryu0/aesthetics && \
_ apt update && \
_ apt install -y \
	xfonts-terminus-oblique \
	xfonts-terminus \
	vim \
	keepassx \
	gnome-tweak-tool \
	clusterssh \
	matcha-theme \
	network-manager-openvpn \
	network-manager-openvpn-gnome && \
_ snap install --classic vscode && \
_ snap install --classic slack && \
_ snap install \
	discord \
	spotify \
	hexchat \
"

# All Font size 11
# Window Title = Terminus Bold
# Interface = Terminus Regular
# Document = Terminus Bold Oblique
# Monospace = Terminus Regular