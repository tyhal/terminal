# From scratch

```

useradd -m tyler
passwd tyler
echo "tyler ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/tyler
su tyler

sudo apt update -y && \
sudo apt install -y git && \
git clone https://github.com/tyhal/zsh.git ~/.tyhal_zsh; \
sudo -E ~/.tyhal_zsh/script/bootstrap && \
~/.tyhal_zsh/script/install
```
