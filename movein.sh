#!/bin/bash
# move in to oltorf
export HOST=buffalo
export HOSTNAME=$BRANCH.webhosting.coop
hostname $HOSTNAME
echo $HOSTNAME >/etc/hostname
echo 'domain webhosting.coop'>/etc/resolv.conf
echo 'search webhosting.coop'>>/etc/resolv.conf
echo 'nameserver 8.8.8.8' >>/etc/resolv.conf
echo 'nameserver 8.8.4.4' >>/etc/resolv.conf
cp /etc/resolv.conf /etc/resolvconf/resolv.conf.d/base
cd /tmp
wget https://raw.githubusercontent.com/joshuacox/potential-octo-ironman/$HOST/interfaces
mv interfaces /etc/network/
wget https://raw.githubusercontent.com/joshuacox/potential-octo-ironman/$HOST/sshd_config
mv sshd_config /etc/ssh/
echo -e  'y\n'|ssh-keygen -q -t rsa -N "" -f ~/.ssh/id_rsa
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/addus.sh | bash
