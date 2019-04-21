### Machines B and F (carriage and saddle):

I ran the following commands, given that ssh is port 22, http is port 80, and https is port 443.

```
# Allow all loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Stateful!
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Ping/tracert rules
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT

# Default to drop
iptables -P INPUT DROP
# No forwards
iptables -P FORWARD DROP
sysctl -w net.ipv4.ip_forward=0

# SSH Rules
iptables -A INPUT -p tcp -s 100.64.0.0/16 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 10.21.32.0/24 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 198.18.0.0/16 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Allow http/https traffic
iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Save it
service iptables save
```

On saddle, I also had to add:

```
systemctl stop firewalld
systemctl disable firewalld
systemctl enable iptables
systemctl start iptables
```

After rebooting, rules were verified with `iptables -v -L` on each machine and `nmap 100.64.18.{2, 5}` run locally (outside the network).

![iptablesb](./iptablesb.png)

![nmapb](./nmapb.png)

![saddle](./iptablesf.png)

![saddle](./nmapf.png)

TODO: Screenshot of website.

### Machine D (chase):

```
# Allow all loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Stateful!
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Ping/tracert rules
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT

# Default to drop
iptables -P INPUT DROP
# No forwards
iptables -P FORWARD DROP
sysctl -w net.ipv4.ip_forward=0

# SSH Rules
iptables -A INPUT -p tcp -s 100.64.0.0/16 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 10.21.32.0/24 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s 198.18.0.0/16 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Allow dns traffic
iptables -A INPUT -p tcp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Save it
service iptables save
```



