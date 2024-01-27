#!/usr/bin/env bash
cp .profile ~
cp .bashrc ~
cp .zshrc ~
cp fast /usr/bin/
chmod +x /usr/bin/fast
source ~/.bashrc
source ~/.profile
