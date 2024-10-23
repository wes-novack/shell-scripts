# shell-scripts

## delta-wifi-fix.sh
Upon attempting to connect to Delta Airline's WiFi using an Ubuntu 24.04 Linux machine, I found that I was unable to resolve the DNS entries that were required in order to pass their captive portal, which requires you to login with a Delta SkyMiles account and then let a video play.

After troubleshooting, I found that the wrong name server was getting set by Delta's WiFi Access Point. This script fixes the name server issue and allows you to connect to their captive portal and login endpoints at https://wifi.delta.com

Google Chrome browser still had issues connecting and logging into their portal, therefore, the script outputs guidance to use Firefox.
