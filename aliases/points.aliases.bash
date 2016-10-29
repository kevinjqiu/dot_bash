#! /bin/bash
alias ptsvpn='tac /etc/resolv.conf > /tmp/resolv.conf && echo 10.20.12.1 >> /tmp/resolv.conf && sudo mv /tmp/resolv.conf /etc/resolv.conf && cd ~/.ovpn && sudo openvpn kevin.qiu.ovpn &&'
