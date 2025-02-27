#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='\033[94m[\u@\h \w\a]\033[0m\$ '
green="\001$(tput setaf 2)\002"
blue="\001$(tput setaf 4)\002"
dim="\001$(tput dim)\002"
reset="\001$(tput sgr0)\002"

export PS1=""
PS1+="$green\u@\h " # user@host
PS1+="$blue\w$reset\$ " # workingdir$

export PS1
unset green blue dim reset

alias vcmake="cmake .. -DCMAKE_TOOLCHAIN_FILE=~/Documents/vcpkg/scripts/buildsystems/vcpkg.cmake"
alias build="cd build && make -j8; cd .."
alias make="bear -- make -j8"
alias pac="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias yayt="yay -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias lndb="ln -s build/compile_commands.json ."

export PATH="$PATH:/home/jom/.local/bin:/home/jom/bin"
export EDITOR=nvim
export LD_LIBRARY_PATH="/usr/local/lib"

unset HISTFILE

. "$HOME/.cargo/env"

source ~/Documents/emsdk/emsdk_env.sh &> /dev/null

[ -f "/home/long/.ghcup/env" ] && source "/home/long/.ghcup/env" # ghcup-env

alias qemu="qemu-system-x86_64"
alias term-tty="cp ~/.config/alacritty_tty.yml ~/.config/alacritty.yml"

# python -m http.server

# alias conda="/home/long/anaconda3/bin/conda"
# export PATH="/home/long/anaconda3/bin:$PATH"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# <<< conda initialize <<<

# export PATH="$PATH:/home/long/Documents/Ndless/ndless-sdk/toolchain/install/bin:/home/long/Documents/Ndless/ndless-sdk/bin"

function cd() {
    builtin cd "$@" && ls
}

alias run="g++ main.cpp -std=c++17 -ggdb3 && ./a.out"

function contest() {
    builtin cd ~/cp/contest
    clear
    nvim
}

function cf() {
    rm -rf ~/cp/contest
    cp -r ~/templates/cf/ ~/cp/contest
    builtin cd ~/cp/contest
    cft A
    cft B
    cft C
    cft D
    cft E
    cft F
    cft G
    cft H
    clear
    nvim
}

function usaco() {
    rm -rf ~/cp/contest
    cp -r ~/templates/usaco ~/cp/contest
    builtin cd ~/cp/contest
    clear
    nvim
}

function save() {
    mkdir -p ../saved/$1
    cp 1.cpp ../saved/`cat save`1.cpp
    cp 2.cpp ../saved/`cat save`2.cpp
    cp 3.cpp ../saved/`cat save`3.cpp
    echo "Saved to ~/cp/saved/ (`cat save`)"
}

function load() {
    cp ../saved/`cat save`1.cpp 1.cpp
    cp ../saved/`cat save`2.cpp 2.cpp
    cp ../saved/`cat save`3.cpp 3.cpp
    echo "Loaded ~/cp/saved/`cat save`*"
}

function latec() {
    cp ~/templates/template.tex $1.tex
}

function cft() {
    echo "codeforces template to $1.cpp"
    cp ~/templates/cft.cpp $1.cpp
}

function cpt() {
    echo "cp template to $1.cpp"
    cp ~/templates/cpt.cpp $1.cpp
}

function cfth() {
    echo "large codeforces template to $1.cpp"
    cp ~/templates/cfth.cpp $1.cpp
}

function cpth() {
    echo "large cp template to $1.cpp"
    cp ~/templates/cpth.cpp $1.cpp
}

function one() {
    rm -rf ~/cp/contest
    cp ~/templates/one ~/cp/contest -r
    builtin cd ~/cp/contest
    clear
    nvim
}

alias cheat="wine \"~/.wine/drive_c/Program Files/Cheat Engine 7.5/Cheat Engine.exe\""

function sora-crop() {
    ffmpeg -i $1 -vf "crop=iw:ih*0.88:0:0" -c:a copy out.mp4
    mv out.mp4 $1
}

alias pj64="wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Project64\ 3.0/Project64.exe"
alias dolphin-emu="flatpak run org.DolphinEmu.dolphin-emu"

export ASAN_OPTIONS=detect_leaks=1:strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1:detect_invalid_pointer_pairs=2:verbosity=1:halt_on_error=1

function tcgen() {
    cp ~/templates/tcgen.cpp $1-gen.cpp
    echo "tcgen template to $1-gen.cpp"
}
