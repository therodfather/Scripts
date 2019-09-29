#!/bin/bash

#update
sudo apt-get update && sudo apt-get upgrade -y

#Download brook server
wget https://github.com/txthinking/brook/releases/download/v20190601/brook

#Add permissions
chmod +x brook

#Run the server
# Run as a brook server
./brook server -l :9999 -p 10024921s

# Run as multiple brook servers
# brook servers -l ":9999 password" -l ":8888 password"

#Windows Client
#https://github.com/txthinking/brook/releases/download/v20190601/Brook.exe

#Android Client
#https://github.com/txthinking/brook/releases/download/v20190601/Brook.apk

##Client (CLI)

# Run as brook client, start a socks5 proxy socks5://127.0.0.1:1080
#brook client -l 127.0.0.1:1080 -i 127.0.0.1 -s server_address:port -p password

# Run as brook client, start a http(s) proxy http(s)://127.0.0.1:8080
#brook client -l 127.0.0.1:8080 -i 127.0.0.1 -s server_address:port -p password --http

#Client (GUI)

##Tunnel

# Run as tunnel 127.0.0.1:5 to 1.2.3.4:5
#./brook tunnel -l 127.0.0.1:5 -t 1.2.3.4:5 -s server_address:port -p password

##VPN

# Run as VPN to proxy all TCP/UDP. [ROOT privileges required].
#sudo ./brook vpn -l 127.0.0.1:1080 -s server_address:port -p password

##Relay

# Run as relay to 1.2.3.4:5
#./brook relay -l :5 -r 1.2.3.4:5

##Socks5

# Run as a raw socks5 server 1.2.3.4:1080
#./brook socks5 -l :1080 -i 1.2.3.4

##Socks5 to HTTP

# Convert socks5://127.0.0.1:1080 to http(s)://127.0.0.1:8080 proxy
#./brook socks5tohttp -l 127.0.0.1:8080 -s 127.0.0.1:1080

##Shadowsocks

# Run as a shadowsocks server
#./brook ssserver -l :9999 -p password

# Run as multiple shadowsocks servers
#./brook ssservers -l ":9999 password" -l ":8888 password"

##If you run a public/shared server, do not forget this parameter --tcpDeadline

# Run as shadowsocks client, start a socks5 proxy socks5://127.0.0.1:1080
#./brook ssclient -l 127.0.0.1:1080 -i 127.0.0.1 -s server_address:port -p password

# Run as shadowsocks client, start a http(s) proxy http(s)://127.0.0.1:8080
#./brook ssclient -l 127.0.0.1:8080 -i 127.0.0.1 -s server_address:port -p password --http
