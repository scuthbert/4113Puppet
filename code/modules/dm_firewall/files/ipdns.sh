# Allow dns queries
iptables -A INPUT -p tcp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT