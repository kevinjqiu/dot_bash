cite 'about-kubernetes'
about-alias 'common kubernetes abbreviations'

alias k='kubectl'
alias k8s-dev="export KUBECONFIG=$HOME/.kube/k8s-dev"
alias k8s-util="export KUBECONFIG=$HOME/.kube/k8s-util"
alias k8s-prod="export KUBECONFIG=$HOME/.kube/k8s-prod"

#alias kalpha='export KUBECONFIG=$HOME/.kube/alpha'
#alias kgamma='export KUBECONFIG=$HOME/.kube/kube-config-gamma'
#alias kdelta='export KUBECONFIG=$HOME/.kube/kube-config-delta'
#alias kstaging='export KUBECONFIG=$HOME/.kube/kube-config-staging'
#alias kmonarch='export KUBECONFIG=$HOME/.kube/monarch'
#alias kminikube='export KUBECONFIG=$HOME/.kube/minikube'
alias kclear='export KUBECONFIG='
alias kgp='kubectl get pods'
alias kdbg='kubectl run -it --rm --restart=Never dbg --image=kevinjqiu/dbg bash'
