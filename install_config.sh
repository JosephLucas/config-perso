#! /bin/sh

startingDir=${PWD}

#delete old configuration files
rm ${HOME}/.vimrc
rm -rf ${HOME}/.vim
#create symlinks to the configuration files
ln -s ${PWD}/.vimrc ${HOME}/.vimrc
ln -s ${PWD}/.vim ${HOME}/.vim
#install the software that manages the plugins for vim
mkdir ${HOME}/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
#install language assistance
mkdir ${HOME}/.vim/progExt
wget https://www.languagetool.org/download/LanguageTool-2.6.zip
unzip LanguageTool-2.6.zip
mv LanguageTool-2.6 ${HOME}/.vim/progExt/
rm -r LanguageTool-2.6.zip

vim +PluginInstall +qall

cd ${startingDir}
