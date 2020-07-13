# Demo

Here's a short demo of bluesnarfer I did as part of a school project - https://asciinema.org/a/6e1rjk7V3eJL1qoA3kJRUKfh1.

The trickiest part for me was figuring out which channel to use.
Once you get that, you can test a bunch of AT commands.

Here's a good reference I found for AT commands: https://www.sparkfun.com/datasheets/Cellular%20Modules/AT_Commands_Reference_Guide_r0.pdf

Note that it's likely your phone doesn't support *ALL* of these,
and it will probably show a prompt asking you to give permission for bluesnarfer to read your recently dialed calls.

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
