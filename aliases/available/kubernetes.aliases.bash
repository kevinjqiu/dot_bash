cite 'about-kubernetes'
about-alias 'common kubernetes abbreviations'

alias k='kubectl'

alias kclear='export KUBECONFIG='
alias kgp='kubectl get pods'
alias kdbg='krun kevinjqiu/dbg bash'

function krun {
    image=$1
    cmd=${2:-bash}
    kubectl run -it --rm --restart=Never --image=$1 -- $cmd
}

function kenv {
    if [[ "$#" != "1" ]]; then
        envs=( $(IFS='\n' find $HOME/.kube -maxdepth 1 -type f | uniq | sort) )
        counter=0
        for f in ${envs[*]}; do
            env=$(echo $f | rev | cut -d'/' -f1 | rev)
            echo "[$((counter++))] $env"
        done
        echo "[x] Unset"
        echo "---------------------"
        read -p "Pick one: " choice
        if [ "$choice" = "x" ]; then
            cmd="export KUBECONFIG="
            echo "$cmd"
            eval $cmd
        else
            kubeconfig_path=${envs[$choice]}
            cmd="export KUBECONFIG=$kubeconfig_path"
            echo "$cmd"
            eval $cmd
        fi
        return
    fi
    env=$1
    kubeconfig_path="$HOME/.kube/$env"
    if [[ ! -f "$kubeconfig_path" ]]; then
        echo "kube config file $kubeconfig_path does not exist!"
        return
    fi
    echo "export KUBECONFIG=$kubeconfig_path"
    export KUBECONFIG=$kubeconfig_path
}

alias k8s='kenv'
