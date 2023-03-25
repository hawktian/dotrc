function p() {
    argv=("$@")
    if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
        return
    fi
    cmd="grep -iRl '$1' ."

    for ((i=2; i<=$#; i++))
        do
            cmd=$cmd" --include \"*.${argv[i]}\" "
        done
    if [ -e ~/.grep-exclude ]
    then
        while read exclude
        do
            cmd=$cmd" --exclude="$exclude
        done < ~/.grep-exclude
    fi

    if [ -e ~/.grep-exclude-dir ]
    then
        while read excludedir
        do
            cmd=$cmd" --exclude-dir="$excludedir
        done < ~/.grep-exclude-dir
    fi
    echo $cmd
    eval $cmd
}

function x() {
    exit
}

function f(){
    file=$1
    if [ $# -eq 0 ]
          then
              echo "No arguments supplied"
              return
    fi
    if [ -z "${file##*.vue}" ] ;then
        find . -not -name "*.json" -not -name "*.js" \
        -not -path "./.git/*" \
        -not -path "./.logs/*" \
        -iname "*$1"
    elif [ -z "${file##*.php}" ] ;then
        find . -not -name "*.png" -not -name "*.jpg" -not -name "*.gif" \
        -not -name "*.json" -not -name "*.js" -not -name "*.vue" \
        -not -path "./.git/*" \
        -not -path ".logs/*" \
        -not -path "./vendor/*" \
        -iname "*$1"
    elif [ -z "${file##*.js}" ] ;then
        find . -not -name "*.png" -not -name "*.jpg" -not -name "*.gif" \
        -not -name "*.php" -not -name "*.json" -not -name "*.vue" \
        -not -path "./.git/*" \
        -not -path ".logs/*" \
        -not -path "./bi/*" \
        -iname "*$1"
    else
        find . -not -name "*.png" -not -name "*.jpg" -not -name "*.gif" \
        -not -path "./.git/*" \
        -not -path "./logs/*" \
        -iname "*$1*"
    fi
    return
    ext=$2
    if [ $ext="" ]
          then
              ext="php"
    fi
    if [ $2="php" ] ;then
        find . -not -name "*.png" -not -name "*.jpg" -not -name "*.gif" \
        -not -name "*.json" -not -name "*.js" -not -name "*.vue" \
        -not -path ".git/*" \
        -not -path ".logs/*" \
        -not -path "./wwwroot/manager/web/*" \
        -not -path "./standapi/*" \
        -not -path "./bi/*" \
        -iname "*$1*"
    elif [ $2="js" ] ;then
        find .  -not -name "*.php" -not -name "*.bak" ! -path "./.git/*" ! -path "./logs/*" -iname "*$1*"
    elif [ $2="vue" ] ;then
        find .  -not -name "*.php" -not -name "*.js" ! -path "./.git/*" ! -path "./logs/*" -iname "*$1."
    elif [ $2="be" ] ;then
        find .  -not -name "*.json" -not -name "*.js" -not -name "*.vue" ! -path "./.git/*" ! -path "./logs/*" ! -path "./wwwroot/manager/web/*" -iname "*$1*"
    else [ $2="fe" ] 
        find .  -not -name "*.php" -not -name "*.bak" ! -path "./.git/*" ! -path "./logs/*" -iname "*$1*"
    fi
}

function fv(){
    if [ $# -eq 0 ]
          then
              echo "No arguments supplied"
    fi
    string=$1
    substr="."
    if [ -z "${string##*$substr*}" ] ;then
        vim -p $(find .  -not -name "*.json" -not -name "*.js" -not -name "*.vue" ! -path "./logs/*" ! -path "./wwwroot/manager/web/*" -iname "*$1")
    else
        vim -p $(find .  -not -name "*.json" -not -name "*.js" -not -name "*.vue" ! -path "./logs/*" ! -path "./wwwroot/manager/web/*" -iname "*$1*")
    fi
}

function h() {
    if [ $# -eq 0 ]
    then
            history | tail -100
    else
            history | tail -$1
    fi
}


function t(){
    p1=$1
    if [ -d $p1 ]
    then
        tree $p1 | more
    elif [ -z "${1//[1-9]}" ]
    then
        tree -L $1 | more
    else
        tree -L 1 | more
    fi
}

#screen
function sn(){
    session=$1
    if [ -z $session ]
        then
            screen -ls
        else
            screen -rD $session
    fi
}

# map v to nvim first vim second
function v() {
    if [ ! -z $(command -v nvim) ]
    then
        echo "neovim $@"
        sleep 0.5
        nvim "$@"
    else
        if [ ! -z $(command -v vim) ]
        then
            echo "vim $@"
            sleep 0.5
            vim "$@"
        else
            echo "please install vim"
        fi
    fi
}

function ip1() {
    FILE=/root/ip
    if test -f "$FILE"; then
        echo 'cat '$FILE
        cat $FILE
    else
        echo "curl https://fig.red/myip/"
        curl https://fig.red/myip/
    fi
}

#remove directories and their contents recursively
function rmrf() {
    rm -rf *
}


#delete file can not recover
function rm0() {
    FILE=$1
    if test -f "$FILE"; then
        echo "chattr +s $FILE"
        chattr +s $FILE
        echo "rm $FILE"
        rm $FILE
    else
        echo "file not exists."
    fi
}

# map vim to nvim first vim second
function vim() {
    if [ ! -z $(command -v nvim) ]
    then
        echo "neovim $@"
        sleep 0.5
        nvim "$@"
    else
        if [ ! -z $(command -v vim) ]
        then
            echo "vim $@"
            sleep 0.5
            vim "$@"
        else
            echo "please install vim"
        fi
    fi
}

function c(){
    if [ "e" = $1 ]; then
        crontab -e
    else
        crontab -l
    fi
}

is_mac() {
    [[ $OSTYPE == darwin* ]]
}

i() {
    if is_mac; then
        package_manager="brew"
        desired_os=1
        os="Mac"
        return
    fi

    os_name="$(cat /etc/*-release | awk -F= '$1 == "NAME" { gsub(/"/, ""); print $2; exit }')"

    case "$os_name" in
        Ubuntu*|Pop!_OS)
            desired_os=1
            os="ubuntu"
            package_manager="apt-get"
            ;;
        Amazon\ Linux*)
            desired_os=1
            os="amazon linux"
            package_manager="yum"
            ;;
        Debian*)
            desired_os=1
            os="debian"
            package_manager="apt-get"
            ;;
        Linux\ Mint*)
            desired_os=1
            os="linux mint"
            package_manager="apt-get"
            ;;
        Red\ Hat*)
            desired_os=1
            os="red hat"
            package_manager="yum"
            ;;
        CentOS*)
            desired_os=1
            os="centos"
            package_manager="yum"
            ;;
        Rocky*)
            desired_os=1
            os="centos"
            package_manager="yum"
            ;;
        SLES*)
            desired_os=1
            os="sles"
            package_manager="zypper"
            ;;
        openSUSE*)
            desired_os=1
            os="opensuse"
            package_manager="zypper"
            ;;
        *)
            desired_os=0
            os="Not Found: $os_name"
    esac
    echo "$package_manager install $1"
    eval "$package_manager install $1"
}
