jacopo dotfiles
-------------

My personal collection of dotfiles

Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Install spaceshift prompt (outdated):

    https://denysdovhan.com/spaceship-prompt/#installing

Install
-------

Clone onto your laptop:

    git clone git@github.com:intrip/dotfiles.git ~/.dotfiles

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/.dotfiles/rcrc rcup

Install from a different folder (for overrides):

    env RCRC=$HOME/.dotfiles/rcrc rcup -d dotfiles-local/
