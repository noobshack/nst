#!/bin/bash
SERVICE="Mordhau Dedicated Server"
PROMPT="`date` - $SERVICE -"

echo "$PROMPT Installing startup services."
apt-get update && apt-get upgrade
apt-get install lib32gcc1

echo "$PROMPT Configuration of Steam."
useradd -m steam
su - steam
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

echo "$PROMPT "
sed -i '/DEFAULT_FORWARD_POLICY/s/DROP/ACCEPT/g' /etc/default/ufw
echo "net.ipv4.ip_forward=1" | tee -a /etc/sysctl.conf

echo "$PROMPT "
echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDP79xnrmixYH1vVGR0ZlkHOnhkypw6inAy6vV9LgDjEsw4snJ1xQUote6GIoZYfrOwTlSYefp5GZTBo+xk3Wr0ud3EvGG4fqRYZ7NBbUFU5zmy+AT22nuj5NtpSFTrgPua5texo4BTVanMXQuyGLnRUOF53tbKs2xCnIOY995shALO3iHkNeNPP+PuxICQnXXpE+vwsUxZoocaFBnAf+XMPAqCDlMAS/g6qrW6tit2qOVky2TqV1n99gyS3GQUN+dX1OKIu4csDmIl9vyQtrKLQQMUPHl+Ls6wmB9HsRA4BUx1vuq+BePOpysg0zoxhkcQVieShwy6TpVW4lW0J+zz0vktE6hM+AfI0RwCIunAOjfuZNCNKjJ+EQKT4irkACQ9O8KGt6aDFnxYVvhUSXARCzGq22lw+12nyBiVnyixfLzv7kjHKWxIk1d8v4tFguGCBuY9dICLUHLj2LEPvL2kEmCNEFlPwAeuCdZac8fgbLo5GxifrmvyYJwqMvlgHoMV02F9DuDxUtQzm7A5fD8+EuzKymSajT4JHtAx0Ks8ler2SrK7Y53uVsbZYC8Z+iRPvz2QjWjoMgKhQNlYqXP2SRWsoUHwM919SFleEGPAV64rG8r3feAh+gLVvc7SQgPU1FOh8Xt+EutzrMYiN0LZpnFOgXq6duhQdLJwHmXVQw== openvpn@gcp" >> /home/ubuntu/.ssh/authorized_keys

echo "$PROMPT Configuration complete."
exit 0
