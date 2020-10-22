# Bluesnarfer

>Bluesnarfing is the unauthorized access of information from a wireless device through a Bluetooth connection, often between phones, desktops, laptops, and PDAs (personal digital assistant).
>\- https://en.wikipedia.org/wiki/Bluesnarfing

Bluesnarfing is a fairly old attack. (First license in debian/copyright says 2007, so that gives you an idea).
To my knowledge, all modern devices have at least some kind of protection against bluesnarfing.
For example, I tested this with a Samsung Galaxy s7, and it prompted be to give permission to bluesnarfer to read my contacts, make calls, etc.
So at least it asked me for permission!

# Installation

To install bluesnarfer:
```
git clone https://github.com/kimbo/bluesnarfer.git
cd bluesnarfer
make
```

If everything worked, you should be able to run `./bluesnarfer`.

# Running bluesnarfer

The fun part of this is actually doing some bluesnarfing (or just saying "bluesnarfing", it's definitely in my top 10 favorite words to say).

I ran this on Ubuntu 18.04 and targetted my Samsung Galaxy s7, which worked well.

First, you need to make sure you can reach the device from your computer. Connect your computer to your phone with Bluetooth, then verify you can reach it using something like `l2ping`:

```
l2ping <MAC_ADDRESS>
```

If you're having trouble finding the MAC_ADDRESS, usually you'll be able to see it in your bluetooth settings.
I also like to use `bluetoothctl` and then `devices list` and it'll show you what devices have been picked up by the scanner or paired previously and what their MAC addresses are.

Next, you run the `bluesnarfer` program. The general usage is

```
./bluesnarfer -b <MAC_ADDR> [options]
```

For example, to list device info, run 

```
./bluesnarfer -b <MAC_ADDR> -i
```

Once you get that working, you can test a bunch of AT commands (read contacts, read recent calls, make calls, send text messages, etc).
Here's a good reference I found for AT commands: https://www.sparkfun.com/datasheets/Cellular%20Modules/AT_Commands_Reference_Guide_r0.pdf
(Note that your phone may not support all of the AT commands listed in the reference guide.)

If running the above command doesn't work, you probably need to figure out the right channel to use.
The default channel used is 17 (see [src/bluesnarfer.c#L59](https://github.com/kimbo/bluesnarfer/blob/kali/master/src/bluesnarfer.c#L59)).

To see what channels are available, I used the `sdptool`:
```
sdptool browse --tree --l2cap <MAC_ADDRESS>
```

Then I looked through the output for something that looks like it might let you read information or make calls, send messages, etc.
When in doubt, just check all of the channels listed.
(Channel 2 worked on my Samsung Galaxy s7, see demo below).

# Demo

Here's a short demo of bluesnarfer I did as part of a school project - https://asciinema.org/a/6e1rjk7V3eJL1qoA3kJRUKfh1.

# License
License is GPL-2+.

License and copyright info can be found in [debian/copyright](
https://github.com/kimbo/bluesnarfer/blob/kali/master/debian/copyright).


# Original README

\- HOW TO USE

```
bluesnarfer, version 0.1 -
usage: ./bluesnarfer [options] [ATCMD] -b bt_addr

ATCMD     : valid AT+CMD (GSM EXTENSION)

TYPE      : valid phonebook type ..
example   : "DC" (dialed call list)
            "SM" (SIM phonebook)
            "RC" (recevied call list)
            "XX" much more

-b bdaddr : bluetooth device address
-C chan   : bluetooth rfcomm channel

-c ATCMD  : custom action
-r N-M    : read phonebook entry N to M 
-w N-M    : delete phonebook entry N to M
-f name   : search "name" in phonebook address
-s TYPE   : select phonebook memory storage
-l        : list aviable phonebook memory storage
-i        : device info
```
it's simple :P

\- what it's do ?
rfcomm connection to bdaddr and send/recv AT command from gsm extension ..

\- thanks to:
mainman, sgrakkyu
