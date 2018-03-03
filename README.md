# ASKNET - Network setup interview

This program can be used to interactively ask the user for network configuration when first starting a machine. The typical use case is newly instantiated VMs when DHCP is not available / not needed, to ease the hostname/network configuration of the new VM.
 
The interview is done only when `/etc/hostname` contains the text `__INIT__`.

It creates/overwrites the following files:
* `/etc/hostname`
* `/etc/hosts`
* `/etc/network/interfaces`
* `/etc/resolv.conf` 

Static IP and DHCP are supported.

The defaults can be set in `/etc/default/asknet`.

Example run:

    (On first boot of the VM)

    Hostname examples:
    INPUT                     RESULT
    ----------                ----------
    falcon                    falcon.subdom.dom.zu      # no dot in the input
    falcon.other              falcon.other.dom.zu       # dot in the input
    falcon.else.dom.zu.       falcon.else.dom.zu        # dot at the end of the input

    Hostname [falcon]: eagle

    Going with hostname=eagle.subdom.dom.zu

    IP examples:
    INPUT                     RESULT
    ----------                ----------
    1.2                       10.0.1.2                  # 2 numbers - in 10.0. network
    1.2.3                     10.1.2.3                  # 3 numbers - in 10. network
    1.2.3.4                   1.2.3.4                   # 4 numbers - exact IP
    dhcp                      DHCP
    x                         Back to previous question

    IP [10.0.0.41]: 55.66

    Going with IP=10.71.55.66


    Netmask (x=back): [255.255.255.0]:255.255.0.0

    Going with netmask=255.255.0.0


    Gateway (x=back): [10.71.55.1]:

    Going with gateway=10.71.55.1


    DNS servers (x=back): [10.0.0.1 10.0.0.254]:

    Going with DNS=10.0.0.1 10.0.0.254


    DNS search domains (x=back): [subdom.dom.zu dom.zu]:

    Going with DNS search=subdom.dom.zu dom.zu


        Hostname:   eagle.subdom.dom.zu
        IP:         10.71.55.66
        Netmask:    255.255.0.0
        Gateway:    10.71.55.1
        DNS:        10.0.0.1 10.0.0.254
        DNS search: subdom.dom.zu dom.zu

    All ok? (x=back) [yes]: yes
    Creating /etc/network/interfaces
    Creating /etc/resolv.conf
    Creating /etc/hosts
    Creating /etc/hostname
    Rebooting in 5 seconds, press Ctrl-C to abort

