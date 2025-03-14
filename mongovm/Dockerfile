FROM ubuntu:22.04
RUN apt-get update && \
      apt-get -y install sudo

# Install dependencies
RUN apt install -y python3 git clangd clang-format gdb vim libxml2-dev libssl-dev libcurl3-dev libkrb5-dev libsasl2-dev libldap-dev python3.10-venv wget curl build-essential

# Install zsh
RUN apt-get install -y zsh
RUN chsh -s $(which zsh) $(whoami)

# Install antigen
RUN curl -L git.io/antigen > ~/antigen.zsh

# Install rust
RUN apt install -y snapd gh xclip htop ncdu bpytop tmux nano xclip ripgrep
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --completion --key-bindings --no-update-rc

# Install toolchain
RUN curl -o /tmp/toolchain_installer.sh http://mongodbtoolchain.build.10gen.cc/installer.sh | bash
