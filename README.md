# From scratch

```bash
# Make sure im me
useradd -m tyler
passwd tyler
echo "tyler ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/tyler
su tyler

# Get the general config
sudo apt update -y && \
sudo apt install -y git && \
git clone https://github.com/tyhal/zsh.git ~/.tyhal_zsh; \
sudo -E ~/.tyhal_zsh/script/bootstrap && \
~/.tyhal_zsh/script/install && \
~/.tyhal_zsh/script/test

# Get my stuff
install-tyler
```
