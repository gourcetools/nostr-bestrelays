# <b> 📡 nostr-bestrelays</b><br>
<img src="https://img.shields.io/badge/License-MIT-orange.svg"> <br>

<img src="https://user-images.githubusercontent.com/120996278/213799411-6e57d622-172c-4df9-9a98-848a3ed5302e.png" alt="nostrbestrelays1" width="400px"><img src="https://user-images.githubusercontent.com/120996278/213799577-e81ffb69-3a77-4a85-8757-1ac1f237ff88.png" alt="nostrbestrelays2" width="400px"> 
<br> <br>
# <b>⚙️ Short explaination of how the script is working:</b><br>
First he get a list of relays from nostr.watch, <br>
then he ping relays with a timeout of 0.5 seconds, <br>
then he takes all the output and save the 10 with slowest ping as relays-list.txt<br>
<b>done.</b>
# <b>⚙️ Requirements:</b><br>

- `wget ping sed cat awk cut head` aka: nothing much  <br>
- 
<br>

# <b>✔️ How to use nostr-bestrelays?</b><br>

` git clone https://github.com/gourcetools/nostr-bestrelays ` <br>
` cd ./nostr-bestrelays ` <br>
 maybe ` sudo chmod a+rwx ./nostr-bestrelays.sh ` <br>
` ./nostr-bestrelays.sh ` <br>

<br>
wait...<br>
You should have 10 fast relays in <b>nostr-bestrelays/relays-list.txt</b><br>
<br>
<br>



=================================
🙋‍♂️ Need help? 
- Nostr: <b>bitpaint@bitpaint.club</b> | <b>gourcetools@gourcetools.github.io</b>
- Telegram: <b>@bitpaint</b> | Twitter: <b>@bitpaintclub<br></b>
