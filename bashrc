# Shipyard sets up a default development environment:
# https://github.com/basecamp/shipyard/blob/master/dotfiles/bashrc-shipyard-defaults
[ -e ~/.bashrc-shipyard-defaults ] && . ~/.bashrc-shipyard-defaults

# Your additions and overrides. You can use utility functions like add_path
# that are provided by the Shipyard defaults.
#
# e.g. for Ops Chef v1 tooling:
#add_path "/opt/bcdk/bin"

# Or to change your default editor for git commits:
#export EDITOR=nvim

eval "$(work init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# FIDDLER_EVERYWHERE_SCRIPT_START
if [ -n "$FE_STARTED" ] && [ -s '/Applications/Fiddler Everywhere.app/Contents/Resources/app/out/assets/scripts/startup-mac.sh' ] && [ "$STARTUP_SOURCED" != "true" ] ; then
    source '/Applications/Fiddler Everywhere.app/Contents/Resources/app/out/assets/scripts/startup-mac.sh'
    STARTUP_SOURCED="true"
fi
# FIDDLER_EVERYWHERE_SCRIPT_END