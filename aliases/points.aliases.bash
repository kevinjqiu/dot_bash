#! /bin/bash
function ptsvpn {
    tac /etc/resolv.conf > /tmp/resolv.conf
    echo "nameserver 10.20.12.1" >> /tmp/resolv.conf
    tac /tmp/resolv.conf | sudo tee /etc/resolv.conf
    cd ~/.ovpn && sudo openvpn kevin.qiu.ovpn
}
