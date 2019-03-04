# From scratch

```

useradd -m tyler
passwd tyler
su tyler

sudo apt update -y && \
sudo apt install -y git && \
git clone git@github.com:tyhal/zsh.git ~/.tyhal_zsh; \
~/.tyhal_zsh/script/bootstrap && \
~/.tyhal_zsh/script/install
```
