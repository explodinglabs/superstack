Add to postgres/.inputrc

set editing-mode vi

Add to postgres/.psqlrc

\x off
\pset pager always
\setenv PAGER 'less -S'

Add to compose.override.yaml

      - ./postgres/.inputrc:/root/.inputrc:ro
      - ./postgres/.psqlrc:/root/.psqlrc:ro

# How to nuke everything and start again?

docker compose down --volumes
rm -r iko/migrations

# How to install Postgres extensions?

# How to enable history in the Iko shell

Add to your ikorc:

HISTFILE=~/.bash_history
HISTSIZE=1000
HISTFILESIZE=2000
PROMPT_COMMAND='history -a; history -n'

touch ~/iko/.bash_history

Then mount it into the container, by adding to the iko service volumes section
in compose.override.yaml:

- ./iko/.bash_history:/home/.bash_history:rw
