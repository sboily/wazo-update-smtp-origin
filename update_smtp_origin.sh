#!/bin/bash
#Wazo SUPPORT - Franck MULLER

bye() {
whiptail --title "Hello Wazo HELP / Modify SMTP Origin" --msgbox "Your SMTP origin has been modified\nHave a nice day :-) Wazo Support." 10 60
}

update_smtp_origin() {
SMTP_Origin=$(whiptail --title "Hello Wazo HELP / Modify SMTP Origin" --inputbox "Please write your new SMTP Origin Domain (ex.: contact@domain.io):" 13 60 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
  {
      echo -e "XXX\n0\nAdd in DB, Please Wait... \nXXX"
      sudo -u postgres psql asterisk -c "UPDATE mail SET origin='$SMTP_Origin';";

      echo -e "XXX\n50\nAdd $SMTP_Origin in DB... Done.\nXXX"
      sleep 0.5

  } | whiptail --gauge "Wait Please" 6 60 0

fi

update_domain

}

update_domain() {
  domain=$(whiptail --title "Hello Wazo HELP / Modify Domain" \
--inputbox "Please write domain (ex.: domain.tdl):" 13 60 3>&1 1>&2 2>&3)

exitstatus=$?
  if [ $exitstatus = 0 ]; then
    {
        echo -e "XXX\n0\nAdd in DB, Please Wait... \nXXX"
        sudo -u postgres psql asterisk -c "UPDATE mail SET mydomain='$domain';";

        echo -e "XXX\n50\nAdd in DB... Done.\nXXX"
        sleep 0.5

    } | whiptail --gauge "Wait Please" 6 60 0
  fi

update_canonical

}

update_canonical() {
Canonical=$(whiptail --title "Hello Wazo HELP / Modify Canonical" \
--inputbox "Please write canical mail (ex.: ex@mail.com general@domain.tdl\n+ex2@mail.com general@domain.tdl):" 13 60 3>&1 1>&2 2>&3)

exitstatus=$?
  if [ $exitstatus = 0 ]; then
    {
        echo -e "XXX\n0\nAdd in DB, Please Wait... \nXXX"
        sudo -u postgres psql asterisk -c "UPDATE mail SET canonical='$Canonical';";

        echo -e "XXX\n50\nAdd in DB... Done.\nXXX"
        sleep 0.5

    } | whiptail --gauge "Wait Please" 6 60 0
  fi

  update_relayhost

}

update_relayhost() {
Relayhost=$(whiptail --title "Hello Wazo HELP / Modify relayhost" \
--inputbox "Please write Relay Host (ex.: smtp2.domain.tld | no relay? leave empty):" 13 60 3>&1 1>&2 2>&3)

exitstatus=$?
  if [ $exitstatus = 0 ]; then
    {
        echo -e "XXX\n0\nAdd in DB, Please Wait... \nXXX"
        sudo -u postgres psql asterisk -c "UPDATE mail SET relayhost='$Relayhost';";

        echo -e "XXX\n50\nAdd in DB... Done.\nXXX"
        sleep 0.5

    } | whiptail --gauge "Wait Please" 6 60 0
  fi

  update_fallback_relayhost

}

update_fallback_relayhost() {
  fallback_relayhost=$(whiptail --title "Hello Wazo HELP / Modify fallback_relayhost" \
--inputbox "Please write fallback relay host (ex.: smtp.provider.tld | no relay? leave empty):" 13 60 3>&1 1>&2 2>&3)

exitstatus=$?
  if [ $exitstatus = 0 ]; then
    {
        echo -e "XXX\n0\nAdd in DB, Please Wait... \nXXX"
        sudo -u postgres psql asterisk -c "UPDATE mail SET fallback_relayhost='$fallback_relayhost';";

        echo -e "XXX\n50\nAdd in DB... Done.\nXXX"
        sleep 0.5

    } | whiptail --gauge "Wait Please" 6 60 0
  fi

  final_step

}


final_step() {
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    {
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
