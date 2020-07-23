# Wazo modify Mail configuration 

If you want modify the SMTP origin parameter (default : exemple.wazo.community) to your personal parameter

Or Domain, relayHost / fallback relayHost and Canical.

Autogenered edited file /etc/xivo/common.conf

Generated file /etc/mailname

and insert to database.

# Wazo version

Wazo version >= 19.12

# Installation

Connect to your stack and get the root.

    apt install wazo-plugind-cli
    wazo-plugind-cli -c "install git https://github.com/sboily/wazo-update-smtp-origin"

# Usage

    wazo-smtp-origin

Read instruction into dialog box
