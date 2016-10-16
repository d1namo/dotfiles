#!/bin/bash
# original : https://github.com/jacobsalmela/pi-hole/blob/master/gravity-adv.sh
# but made to work for my dnsmasq needs (black/whitelisting) oh dats racist
# if you want to add or remove domains (whitelist/blacklist) then add the domain, eg: www.bing.com to a file named whitelist or blacklist in same folder as the script.  1 url per line.

destinationIP="192.168.1.3"  # your dnsmasq server
finaloutlist='/home/dean/host.ads'      # the final finished file
tempoutlist="tempoutlist.tmp" # temp file gets removed on completion.
tempout="tempout.tmp"         # same as above

#Grabs the lists from multiple sources.  Remove any you don't want.
echo "Getting yoyo ad list..." 
curl -s -d mimetype=plaintext -d hostformat=unixhosts http://pgl.yoyo.org/adservers/serverlist.php? | sort > $tempoutlist

echo "Getting winhelp2002 ad list..." 
curl -s http://winhelp2002.mvps.org/hosts.txt | grep -v "#" | grep -v "127.0.0.1" | sed '/^$/d' | sed 's/\ /\\ /g' | awk '{print $2}' | sort >> $tempoutlist

echo "Getting adaway ad list..." 
curl -s https://adaway.org/hosts.txt | grep -v "#" | grep -v "::1" | sed '/^$/d' | sed 's/\ /\\ /g' | awk '{print $2}' | grep -v '^\\' | grep -v '\\$' | sort >> $tempoutlist

echo "Getting hosts-file ad list..." 
curl -s http://hosts-file.net/.%5Cad_servers.txt | grep -v "#" | grep -v "::1" | sed '/^$/d' | sed 's/\ /\\ /g' | awk '{print $2}' | grep -v '^\\' | grep -v '\\$' | sort >> $tempoutlist

echo "Getting malwaredomainlist ad list..." 
curl -s http://www.malwaredomainlist.com/hostslist/hosts.txt | grep -v "#" | sed '/^$/d' | sed 's/\ /\\ /g' | awk '{print $3}' | grep -v '^\\' | grep -v '\\$' | sort >> $tempoutlist

echo "Getting adblock.gjtech ad list..." 
curl -s http://adblock.gjtech.net/?format=unix-hosts | grep -v "#" | sed '/^$/d' | sed 's/\ /\\ /g' | awk '{print $2}' | grep -v '^\\' | grep -v '\\$' | sort >> $tempoutlist

echo "Getting someone who cares ad list..." 
curl -s http://someonewhocares.org/hosts/hosts | grep -v "#" | sed '/^$/d' | sed 's/\ /\\ /g' | grep -v '^\\' | grep -v '\\$' | awk '{print $2}' | grep -v '^\\' | grep -v '\\$' | sort >> $tempoutlist

#echo "Getting Mother of All Ad Blocks list..." 
#curl -A 'Mozilla/5.0 (X11; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0' -e http://forum.xda-developers.com/ http://adblock.mahakala.is/ | grep -v "#" | awk '{print $2}' | sort >> $tempoutlist

echo "Removing duplicates, processing whitelist/blacklist, and formatting the list..."
sleep 1
cat blacklist >> $tempoutlist
sleep 1
grep -vwf whitelist $tempoutlist > $tempout
#awk 'NR==FNR{A[$1]; next}!($1 in A)' whitelist $tempoutlist > $tempout
sleep 1

cat $tempout | sed $'s/\r$//' | sort -u | sed '/^$/d' | awk -v "IP=$destinationIP" '{sub(/\r$/,""); print IP" "$0}' > $finaloutlist

# Removes the temporary lists.
echo "Removing temporary files.."
rm $tempoutlist
rm $tempout

# Count how many domains/whitelists were added so it can be displayed to the user
numberOfAdsBlocked=$(cat $finaloutlist | wc -l | sed 's/^[ \t]*//')
echo "$numberOfAdsBlocked ad domains blocked."

sudo systemctl restart dnsmasq
