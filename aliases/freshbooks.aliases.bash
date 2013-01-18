#!/bin/bash

# shortcuts for dev
alias optimus='ssh kevinqiu@optimus.2ndsiteinc.com'
alias prod='ssh kevinqiu@prod.2ndsiteinc.com'
alias freshbooks_vpn='cd ~/.openvpn/freshbooks && sudo openvpn --script-security 3 --config freshbooks.ovpn; cd -'
alias connect_dev='ssh -A fresh@freshbooksdev.com'
alias connect_pluto='ssh -A fresh@kevin.plutodev.com'
alias evenv='source ~/evolve-env/bin/activate'
alias ev='cd ~/evolve-env && gunicorn_paster evolve.ini'
