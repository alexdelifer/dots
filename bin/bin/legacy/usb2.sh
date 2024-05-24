#!/bin/sh
rmmod xhci_pci
rmmod xhci_hcd
setpci -H1 -s 00:14.0 d8.l=0
setpci -H1 -s 00:14.0 d0.l=0

