cite 'about-kubernetes'
about-alias 'common kubernetes abbreviations'

alias k='kubectl'

alias kclear='export KUBECONFIG='
alias kgp='kubectl get pods'
alias kdbg='kubectl run -it --rm --restart=Never dbg --image=kevinjqiu/dbg bash'

function krun {
    image=$1
    cmd=${2:-bash}
    kubectl run -it --rm --restart=Never --image=$1 -- $cmd
}

function kenv {
    if [[ "$#" != "1" ]]; then
        ls -1 $HOME/.kube
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
