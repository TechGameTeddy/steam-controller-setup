The location of the rules we are looking for is:
# /lib/udev/rules.d/99-steam-controller-perms.rules
#
# This script will check if the rules exist
# -create the rule of it doesnt exist
# -append the code needed for your controller to run
# -prompt you to unplug your controller and test again
# to get your controller working
#
#
# If you want you can do so manually also
#
#You can open it easily doing this in terminal (on Ubuntu for example):
#sudo gedit /lib/udev/rules.d/99-steam-controller-perms.rules
#Edit it to look like this (make sure you edit the group name like it says!):
#

Valve have changed the USB/Bluetooth communication the Steam Controller uses, so on Linux you will need to update your udev rules.


Note: This is for the Beta client, but works on the stable client too. Even if you're on the stable client, it's likely a good idea to do it now ready for the next stable release on the Steam client.

See their announcement here, which links to this guide of issues.

Funnily enough, Valve didn't even list the actual file you need to update, so here it is:
/lib/udev/rules.d/99-steam-controller-perms.rules

You can open it easily doing this in terminal (on Ubuntu for example):
sudo gedit /lib/udev/rules.d/99-steam-controller-perms.rules


Edit it to look like this (make sure you edit the group name like it says!):
Quote# This rule is needed for basic functionality of the controller in Steam and keyboard/mouse emulation
SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"

# This rule is necessary for gamepad emulation; make sure you replace 'pgriffais' with a group that the user that runs Steam belongs to
KERNEL=="uinput", MODE="0660", GROUP="pgriffais", OPTIONS+="static_node=uinput"

# DualShock 4 wired
SUBSYSTEM=="usb", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", MODE="0666"
# DualShock 4 wireless adapter
SUBSYSTEM=="usb", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", MODE="0666"
# DualShock 4 slim wired
SUBSYSTEM=="usb", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"

# Valve HID devices over USB hidraw
KERNEL=="hidraw*", ATTRS{idVendor}=="28de", MODE="0666"


# Valve HID devices over bluetooth hidraw
KERNEL=="hidraw*", KERNELS=="*28DE:*", MODE="0666"


# DualShock 4 over bluetooth hidraw
KERNEL=="hidraw*", KERNELS=="*054C:05C4*", MODE="0666"

# DualShock 4 Slim over bluetooth hidraw
KERNEL=="hidraw*", KERNELS=="*054C:09CC*", MODE="0666"

