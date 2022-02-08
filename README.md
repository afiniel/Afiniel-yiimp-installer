## Afiniel YiiMP Server Installer 🚀
Need Help? join us <a href="https://discord.gg/GVZ4tchkKc"><img src="https://img.shields.io/discord/904564600354254898.svg?style=flat&label=Discord %3C3%20&color=7289DA%22" alt="Join Community Badge"/></a>


## Fork from Cryptopool-builders installer

# This is opened as a public beta - all features are not final!

All in one, this installer install all that your server need.

**Afiniel YiiMP Server installer!** Automates most of the tedious tasks of the following releases:

* YiiMP
* NOMP Coming Soon
* MPOS coming Soon
* CryptoNote-Nodejs Coming Soon
* Generic faucet script Coming Soon

## TOC

- [Installation](#-installation)
- [YiiMP](#-Yiimp-install)
- [Support](#-support)

## 💾 Installation

Installation:

Requires a fresh Ubuntu 16.04 or Ubuntu 18.04 installation.

```
curl https://raw.githubusercontent.com/afiniel/Multi-Pool-Installer/master/bootstrap.sh | bash
```

Update:

When a new release is made public updating is as simple as running the same command as above.

```
curl https://raw.githubusercontent.com/afiniel/Multi-Pool-Installer/master/bootstrap.sh | bash
```

## ▶️ Usage

You need run the installer under root or an existing account. If you already have a user account created on your server that account must already be part of the sudo group.


After rebooting the server to your user to start the installer type:
```
multipool
```

## ⚙️ YiiMP Install

The Yiimp Installer is recommend for private or very small pools. It is recommended to have at least 4-8 GB ram in order to function properly.
Setup is automated after the following questions are answered:

Question | Default | Help
:--|:-:|:--
Are you using a domain name | no | If you plan to use something like example.com, make sure DNS is updated
Are you using a sub-domain as the main domain | no | If you plan to use something like pool.example.com
Domain Name | localhost | Change to your domain either example.com or pool.example.com
Stratum Domain | stratum.domain.name | This should be something other then your domain name
Install SSL | yes | Installs a 90 day cert from LetsEncrypt
Support Email | root@localhost | Used to send you system alerts
Your Public IP | pulls ip last used to acess web server | To verify go to http://www.whatsmyip.org
DB Root Password | autogenerated 36 character password | Default mysql root password
DB Panel User Password | autogenerated 36 character password | Default mysql frontend password
DB Stratum Password | autogenerated 36 character password | Default mysql stratum password
Admin Portal Access Location | AdminPortal | to access example.com/site/AdminPortal

Installation will take about 25 minutes to fully complete. You will get a message on the screen letting you know it has finished.

#### A server reboot is REQUIRED after the installer is completed to finalize the installation process!

After rebooting the server log back in to your user account. And you will be greeted by the following screen:

<p align="center">
  <img src="./.assets/first_reboot.png" alt="first_reboot"
       width="771" height="635">
</p>

#### On first reboot it may take up to 10 minutes before the cron screens auto-start. After waiting ten minutes type:
```
motd
```
and you should see this:

<p align="center">
  <img src="./.assets/running.png" alt="running"
       width="740" height="655">
</p>

#### To help make your server more secure we have changed the install locations and directory structure of YiiMP as follows:

Directory | Files
:--|:-:
/home/crypto-data/yiimp | General install location for YiiMP
/home/crypto-data/yiimp/starts | screens and stratum sh files - you do not need to run these
/home/crypto-data/yiimp/site | -
/home/crypto-data/yiimp/site/web | New location for YiiMP web files
/home/crypto-data/yiimp/site/backup | backup location for mysql DB
/home/crypto-data/yiimp/site/configuration | New location of your serverconfig.php
/home/crypto-data/yiimp/site/crons | New location of the `main:blocks:loop2` sh files
/home/crypto-data/yiimp/site/log | New location for debug.log and your nginx server log
/home/crypto-data/yiimp/site/stratum | New location for your stratum files
/home/crypto-data/wallets | New location for wallets

Permissions have been setup correctly allowing your main user write acess to the /home/crypto-data directories! Changing file or directory permissions after install will cause your YiiMP to not function correctly, you have been warned!!

By default even though all stratum algos start on server start, the ports have been blocked by the firewall. To open a port type:
```
sudo ufw allow port number
```

From there your YiiMP Single Server installation is fully completed. You can now go to example.com/site/AdminPortal to access your admin section and start adding your coins.

#### 🔗 Commands

To view a screen type:
```
screen -r main|loop2|blocks|debug
```
To detach from a screen type:
```
ctrl+a+d
```
To start, stop or restart main|loop2|blocks|debug type:
```
screens start|stop|restart main|loop2|blocks|debug
```
We also suggest that you type:
```
yiimp
```
and get to know those commands as well!

#### To help make your server more secure we have changed the install locations and directory structure of YiiMP as follows:

Directory | Files | Server
:--|:-:|:--
/home/crypto-data/yiimp | General install location for YiiMP | All
/home/crypto-data/yiimp/starts | screens and stratum sh files - you do not need to run these | Web and Stratum
/home/crypto-data/yiimp/site | - | Web and Stratum
/home/crypto-data/yiimp/site/web | New location for YiiMP web files | Web
/home/crypto-data/yiimp/site/backup | backup location for mysql DB | Web
/home/crypto-data/yiimp/site/configuration | New location of your serverconfig.php | Web
/home/crypto-data/yiimp/site/crons | New location of the `main:blocks:loop2` sh files | Web
/home/crypto-data/yiimp/site/log | New location for debug.log and your nginx server log | Web
/home/crypto-data/yiimp/site/stratum | New location for your stratum files | Stratum
/home/crypto-data/wallets | New location for wallets | Daemon


Permissions have been setup correctly allowing your main user write acess to the /home/crypto-data directories! Changing file or directory permissions after install will cause your YiiMP to not function correctly, you have been warned!!

By default even though all stratum algos start on server start, the ports have been blocked by the firewall. To open a port type:
```
sudo ufw allow port number
```
You <b>MUST</b> also open the RPC Port number on the daemon server when adding new coins. Failing to open the port will result in a connection time out error.

From there your YiiMP Multi Server installation is fully completed. You can now go to example.com/site/AdminPortal to access your admin section and start adding your coins.

#### 🔗 Commands

To view a screen type:
```
screen -r main|loop2|blocks|debug
```
To detach from a screen type:
```
ctrl+a+d
```
To start, stop or restart main|loop2|blocks|debug type:
```
screens start|stop|restart main|loop2|blocks|debug
```
We also suggest that you type:
```
yiimp
```
and get to know those commands as well!

## ❤️ Credits

The following GitHubs have been a source of inspiration and code:

* [mailinabox](https://github.com/mail-in-a-box/mailinabox)
* [realeas-it](https://github.com/webpro/release-it)

The following forks have been used in the making of the script:

* [YiiMP](https://github.com/Kudaraidee/yiimp)

## 🎓 License

[MIT](http://webpro.mit-license.org/)

## 🎁 Support

Donations for continued support of this script are welcomed at:

* BTC bc1q338jnjdl6dky7ka88ln8qmcekal48uw072n9v9
* Doge DSpy3taXqkbWSkhM4GMtsXftxyYHX2Gt3r
* ETH 0x50C7d0BF9714dBEcDc1aa6Ab0E72af8e6Ce3b0aB
* LTC LW4iFgCTQAVWoxe4VF7nFy2WLHdR6xNkjK