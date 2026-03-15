# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
 ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker zsh-autosuggestions fzf-tab zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export OPENAI_API_KEY="YOUR_OPENAI_API_KEY_HERE"


alias docker=podman
alias docker-compose="podman-compose"
# Docker général
alias d='docker'                          # Commande Docker principale
alias dc='docker-compose'                 # Commande Docker Compose
alias dp='docker ps'                      # Liste des conteneurs actifs
alias dpa='docker ps -a'                  # Liste des conteneurs, y compris arrêtés
alias di='docker images'                  # Liste des images Docker
alias dnet='docker network ls'            # Liste des réseaux Docker
alias dvol='docker volume ls'             # Liste des volumes Docker
alias dsw='docker swarm'                  # Commande Docker Swarm
alias dsys='docker system df'             # Utilisation du disque Docker

# Gestion des conteneurs
alias dr='docker run'                     # Lancer un conteneur
alias drd='docker run -d'                 # Lancer un conteneur en mode détaché
alias de='docker exec -it'                # Accéder à un conteneur (bash)
alias drm='docker rm'                     # Supprimer un conteneur
alias drma='docker rm $(docker ps -aq)'   # Supprimer tous les conteneurs
alias dstop='docker stop'                 # Stopper un conteneur
alias dstopa='docker stop $(docker ps -q)'# Stopper tous les conteneurs
alias dkill='docker kill'                 # Forcer l'arrêt d'un conteneur

# Gestion des images
alias dpull='docker pull'                 # Télécharger une image
alias dbuild='docker build'               # Construire une image
alias dbuildc='docker build --no-cache'   # Construire une image sans cache
alias drmi='docker rmi'                   # Supprimer une image
alias drmia='docker rmi $(docker images -q)' # Supprimer toutes les images inutilisées

# Gestion des volumes
alias dvolrm='docker volume rm'           # Supprimer un volume
alias dvolrma='docker volume rm $(docker volume ls -q)' # Supprimer tous les volumes inutilisés

# Logs et informations
alias dlog='docker logs -f'               # Suivre les logs d'un conteneur
alias dinspect='docker inspect'           # Inspecter un conteneur ou une image
alias dstat='docker stats --all'          # Statistiques sur les conteneurs
alias dtop='docker top'                   # Afficher les processus d'un conteneur

# Docker Compose
alias dcu='docker-compose up'             # Lancer un stack Docker Compose
alias dcud='docker-compose up -d'         # Lancer un stack en mode détaché
alias dcd='docker-compose down'           # Arrêter un stack
alias dcr='docker-compose restart'        # Redémarrer un stack
alias dcb='docker-compose build'          # Cons




export PATH=~/.npm-global/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/home/vgermain/.npm-global/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export TMUX_CONFIG_FILE=~/.config/tmux/tmux.conf

export PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH


#rm -f ~/.config/BraveSoftware/Brave-Browser/SingletonLock*
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PATH="$HOME/.local/bin:$PATH"

# Couleurs kitty automatiques selon le serveur SSH
ssh() {
  if [ -n "$KITTY_WINDOW_ID" ]; then
    case "$@" in
      *jenkins*)
        ~/bin/kitty-tab-color.sh '#e63333' '#6b0000' '#2a0000'
        kitty @ set-tab-title '🔴 PROD'
        command ssh "$@"
        ~/bin/kitty-tab-color.sh '#e63333' '#6b0000' '#2a0000'
        ;;
      *srvdeg*)
        ~/bin/kitty-tab-color.sh '#4db84d' '#1a4a1a'
        kitty @ set-tab-title 'DEV.153'
        command ssh "$@"
        ~/bin/kitty-tab-color.sh '#4db84d' '#1a4a1a'
        ;;
      *Energieteam*)
        ~/bin/kitty-tab-color.sh '#e6c800' '#6b5c00'
        kitty @ set-tab-title 'STAGING .154'
        command ssh "$@"
        ~/bin/kitty-tab-color.sh '#e6c800' '#6b5c00'
        ;;
      *)
        command ssh "$@"
        ;;
    esac
  else
    command ssh "$@"
  fi
}
