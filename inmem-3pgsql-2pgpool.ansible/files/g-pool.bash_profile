# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

PATH=/usr/pgpool-11/bin:/usr/pgsql-11/bin:$PATH
LD_LIBRARY_PATH=/usr/pgpool-11/lib:/usr/pgsql-11/lib:$LD_LIBRARY_PATH
