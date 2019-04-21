# Enable http/https
iptables -A FORWARD -i eth0 -p tcp --dport 80 -d 100.64.18.2 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 443 -d 100.64.18.2 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 80 -d 100.64.18.5 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 443 -d 100.64.18.5 -j ACCEPT



