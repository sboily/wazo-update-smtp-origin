# Wazo modify Mail configuration 

If you want modify the SMTP origin parameter (default : exemple.wazo.community) to your personal parameter or Domain, relayHost/fallback relayHost and Canical.

This script do:

* Auto-generated edited file /etc/xivo/common.conf
* Generated file /etc/mailname
* And insert to database.

# Wazo version

Wazo version >= 19.12

# Installation

Connect to your stack and get the root.

    apt install wazo-plugind-cli
    wazo-plugind-cli -c "install git https://github.com/wazo-communication/wazo-update-smtp-origin"

# Usage

    wazo-update-smtp-origin

Read instruction into dialog box
