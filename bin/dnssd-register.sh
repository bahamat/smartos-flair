#!/bin/bash -x

# dnssd-register.sh -- Register common services for SmartOS
#
# This is really only useful for people who run SmartOS on a LAN segment
# with workstations. E.g., your house.
#
# This script scans for common locally listening services and registers
# them with mDNS/DNS-SD/Bonjour.
#
#   Copyright 2014 Brian Bennett
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


typeset -a port

kill_children() {
    for child in ${CHILDREN}
    do
        kill $child
    done
}

trap kill_children TERM

port[22]="_ssh"
port[21]="_ftp"
port[445]="_smb"
port[548]="_afpovertcp"
port[631]="_ipp"

NETSTAT=$(netstat -na -f inet -f inet6 | grep LISTEN)

for key in ${!port[@]}
do
    echo "looking for service ${port[${key}]} on port ${key}"
    RE="\.${key}[^[:digit:]].*LISTEN"
    if [[ "$NETSTAT" =~ $RE ]]
    then
        /usr/bin/dns-sd -R ${HOSTNAME} ${port[${key}]}._tcp local ${key} &
        CHILDREN="$! $CHILDREN"
    fi
done

wait $CHILDREN
