# Wazo modify SMTP Origin 
If you want modify the SMTP origin parameter (default : exemple.wazo.community) to your personal parameter <br>
Autogenered edited file /etc/xivo/common.conf<br>
Genered file /etc/mailname<br>

# Wazo version
Wazo version >= 19.12<br>

# Installation 

```console
foo@bar:~$  cd /tmp/
foo@bar:/tmp$  wget https://raw.githubusercontent.com/fouille/wazo_update_smtp_origin/master/update_smtp_origin.sh
foo@bar:/tmp$  chmod +x update_smtp_origin.sh
foo@bar:/tmp$  ./update_smtp_origin.sh
```

Enter into dialog box the new new domain (ex: exemple.wazo.io)
