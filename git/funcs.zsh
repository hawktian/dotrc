function gitb(){
    branch=`git symbolic-ref --short HEAD`
    echo "current branch:${branch}"
    if [ -n "$(git status --porcelain)" ]; then
        echo "there are modified files";
        echo "git add";
        git add .
        echo "git commit";
        git commit -m "fix"
        echo "git pull origin ${branch}";
        git pull origin ${branch}
        if [ -z "$(git status --porcelain)" ]; then
            git push origin ${branch}
        else
            echo "there are some errors after pulling from origin";
        fi
    else
        git pull origin ${branch}
    fi
}

function gs(){
    git status
}

function grs(){
    git remote show |
    while IFS= read -r upstream; do
        git remote show $upstream
    done
}

# git pull from paramete specified remote or all remotes
function gl(){
    branch=`git branch --show-current`
    [ $? -ne 0 ] && return
    if [ ! -z $1 ]
        then
            for remote in "$@"
            do
                echo "git pull $remote $branch"
                git pull $remote $branch
            done
            return
    fi

    git remote show |
    while IFS= read -r remote; do
        echo "git pull $remote $branch"
        git pull $remote $branch
    done
}

#git commit
function gci() {
    message=$1
    [ -z $message ] && message='nocommit'
    git commit -m $message
}

# git push to paramete specified remote or all remotes
function gh(){
    branch=`git branch --show-current`
    [ $? -ne 0 ] && return
    if [ ! -z $1 ]
        then
            for remote in "$@"
            do
                echo "git push $remote $branch"
                git push $remote $branch
            done
            return
    fi

    git remote show |
    while IFS= read -r remote; do
        echo "git push $remote $branch"
        git push $remote $branch
    done
}

function gfr(){
    branch=$1
    if [ $branch="" ] 
        then
          return "No arguments supplied"
    fi
    remote=`git remote show`
    git fetch $remote $branch
}

# git add
function ga(){
    if [[ ! -z $1 ]]
        then
            echo "git add $1"
            git add $1
    else
        while read file; do
            echo "git add $file"
            git add $file
        done < <(git ls-files --modified)

        while read file; do
            echo "git add $file"
            git add $file
        done < <(git ls-files --others --exclude-standard)
    fi
}

# git diff
function gd(){
    if [ -f $1 ]
    then
        git diff $1
    else
        git diff
    fi
}

#check modified php file syntax
function gcps(){
    git ls-files --modified | xargs -L1 php -l
}
