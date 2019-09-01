#!/bin/bash

echo "Checking required programs..."
programs="git curl python3 cmake pip3"

for program in $programs ; do
    command -v $program
    if [ $? -ne 0 ] ; then
        echo "Program '${program}' is not available. Install it and run this script again."
        exit 1
    else
        echo "Found '${program}'"
    fi
done

echo "Installing required python packages..."
pip3 install flake8
pip3 install neovim

echo "Installing vim plug as package manager..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing packages required by init.vim..."
nvim +'PlugInstall --sync' +qall

echo "Installing YouCompleteMe..."
cd ~/.local/share/nvim/plugged/YouCompleteMe
python3 install.py --clang-completer

# clean up packages
echo "Removing unused packages..."
nvim +"PlugClean --sync" +qall

