# How to add bash extras?

Write a bash_extras file in the current directory.

# How to enable history in the Iko shell

Add to bash_extras:

HISTFILE=~/.bash_history
HISTSIZE=1000
HISTFILESIZE=2000
PROMPT_COMMAND='history -a; history -n'

touch ~/.iko_bash_history

Then mount it into the container with:

      - ~/.iko_bash_history:/home/.bash_history:rw
