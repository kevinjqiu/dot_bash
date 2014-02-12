#!/bin/bash

# shortcuts for dev
alias optimus='ssh kevin@optimus.2ndsiteinc.com'
alias prod='ssh kevin@prod.2ndsiteinc.com'
alias freshbooks_vpn='sudo netExtender -u kevin -d 2ndsiteinc vpn.2ndsiteinc.com'
alias connect_dev='ssh -A fresh@freshbooksdev.com'
alias connect_pluto='ssh -A fresh@kevin.plutodev.com'
alias evenv='source ~/evolve-env/bin/activate'
alias ev='cd ~/evolve-env && gunicorn_paster evolve.ini'
