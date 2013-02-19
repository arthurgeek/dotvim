# Installation

        $ git clone git://github.com/arthurgeek/dotvim.git ~/.vim
        $ ln -s .vim/vimrc .vimrc
        $ ln -s .vim/gvimrc .gvimrc
        $ cd ~/.vim
        $ git submodule init
        $ git submodule update

## Install all plugins

To install plugins, open vim and type `:BundleInstall`.

### Command-T Installation

        $ cd ~/.vim/bundle/command-t/ruby/command-t/
        $ /usr/bin/ruby extconf.rb
        $ make

That's all!
