#!/bin/bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# install tpm for plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
