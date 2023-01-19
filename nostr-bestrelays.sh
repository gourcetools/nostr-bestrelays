
echo " "
echo " "
echo "  ====================================================================== "
echo "      ┌┐┌┌─┐┌─┐┌┬┐┬─┐                 ";
echo "      ││││ │└─┐ │ ├┬┘                 ";
echo "      ┘└┘└─┘└─┘ ┴ ┴└─                 ";
echo "      ┌┐ ┌─┐┌─┐┌┬┐  ┬─┐┌─┐┬  ┌─┐┬ ┬┌─┐";
echo "      ├┴┐├┤ └─┐ │   ├┬┘├┤ │  ├─┤└┬┘└─┐";
echo "      └─┘└─┘└─┘ ┴   ┴└─└─┘┴─┘┴ ┴ ┴ └─┘";
echo " "
echo "  == 📡 https://github.com/gourcetools/nostr-bestrelays =="
echo "  == 📡 Ping and find best nostr relays for you =="
echo "  ====================================================================== "



# Delete a potentially old relays-list.txt
rm -f relays-list.txt

# Download a list of nostr relays from nostr.watch
wget -q https://raw.githubusercontent.com/dskvr/nostr-watch/develop/relays.yaml

# Remove the first line wich is " Relays :"
sed -i "1d" relays.yaml

# Remove spaces and wss:// from relays so we cant ping urls
cat relays.yaml | sed 's/^.\{10\}//' > urllist.txt

# Delete relays.yaml, we dont need it anymore.
rm -f relays.yaml
# Delete any relays that have a / , because it breaks the ping command 
sed -i '/\//d' urllist.txt

# Ping the urls in urllist.txt and sort them by ping
cat urllist.txt | while read LINE
do
    echo "  == Pinging $LINE =="
    # Timeout 1 second. If it takes more than that, we dont want this relay in our list so no need to wait for a ping reply.
    # Output a list starting with pings in sorted.txt
    timeout 1 ping -c 1 $LINE | tail -n 1 | awk '{print $4}' | cut -d '/' -f 2 | sed "s/$/$LINE/" >> sorted.txt
done

#Sort relays by ping
sort -n sorted.txt > ipsorted.txt

# Delete sorted.txt, we dont need it anymore.
rm sorted.txt

# Remove pings from relay list.
while read line; do
	echo ${line} | sed -e 's/[^A-Za-z. ]//g'>>under1srelays.txt
done <ipsorted.txt

# Delete ipsorted.txt, we dont need it anymore.
rm -f ipsorted.txt

# Remove first character wich is a dot left from the pinging... it works.
sed -i 's/^.//' under1srelays.txt

# Keep the first 10 lines
head -n 10 under1srelays.txt > relays-list.txt

# Delete thoses, we dont need them anymore
rm -f under1srelays.txt
rm -f urllist.txt

# Add back wss:// to relays list
sed -i 's/^/wss:\/\//' relays-list.txt
echo "  ====================================================================== "
echo "  == Best relays for you: "
echo " "
cat ./relays-list.txt
echo " "
echo "  ====================================================================== "
echo "  ==      📡 Saved 10 best relays in: ./relays-list.txt =="
echo "  ==      📡 Thanks for using nostr-bestrelays == "
echo "  ==      📡 Later :) =="
echo "  ====================================================================== "
