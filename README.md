dotfiles
========

### install

$ mkdir ~/projects

$ cd ~/projects

$ git clone https://github.com/hasen/dotfiles

$ cd dotfiles/.vim

$ git clone https://github.com/Shougo/neobundle.vim

$ cd ../

(pwdはバッククォートで囲む)

$ ln -s -f `pwd`/.bashrc ~/

$ ln -s -f `pwd`/.gitconfig ~/

$ ln -s -f `pwd`/.gitignore ~/

$ ln -s -f `pwd`/.inputrc ~/

$ ln -s -f `pwd`/.my.cnf ~/

$ ln -s -f `pwd`/.tmux.conf ~/

$ ln -s -f `pwd`/.vimrc ~/

$ mkdir ~/vim_backup

$ chmod 755 ~/vim_backup

$ exec $SHELL -l

#### vimのコマンドモードで`:NeoBundleInstall`
