#!/bin/bash
#Wazo SUPPORT - Franck MULLER

bye() {
whiptail --title "Hello Wazo HELP / Modify SMTP Origin" --msgbox "Your SMTP origin has been modified\nHave a nice day :-) Wazo Support." 10 60
}

update_smtp_origin() {
SMTP_Origin=$(whiptail --title "Hello Wazo HELP / Modify SMTP Origin" --inputbox "Please write your new SMTP Origin Domain (ex.: smtp.wazo.io):" 13 60 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
{
    echo -e "XXX\n0\nAdd in DB, Please Wait... \nXXX"
    sudo -u postgres psql asterisk -c "UPDATE mail SET origin='$SMTP_Origin';";

    echo -e "XXX\n50\nAdd $SMTP_Origin in DB... Done.\nXXX"
    sleep 0.5

    echo -e "XXX\n50\nCreate new config... \nXXX"
    xivo-create-config

    echo -e "XXX\n100\nCreate Config... Done.\nXXX"
    sleep 0.5

    echo -e "XXX\n50\nUpdate new config... \nXXX"
    xivo-update-config

    echo -e "XXX\n100\nUpdate Config... Done.\nXXX"
    sleep 0.5

} | whiptail --gauge "Wait Please" 6 60 0

bye

fi

}

update_smtp_origin
