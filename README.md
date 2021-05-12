## Open Source Ethereum Mining Pool


### 安裝套件

Dependencies:

  * go >= [1.13.15](https://golang.org/dl/go1.13.15.linux-amd64.tar.gz)
  * geth 
  * redis-server
  * nodejs
  * nginx
  * I highly recommend to use Ubuntu 20.04 LTS.

#### Initial storage & folder
```bash
$ sudo apt-get update
​$ sudo apt-get dist-upgrade
​$ sudo apt-get install build-essential make
###########################################3
$ sudo mkdir /mnt/ethpool
$ sudo fdisk -l #find large storage (ex: /dev/nvme1n1)
$ sudo mkfs -t ext4 /dev/nvme1n1 # foramt storage
$ sudo mount /dev/nvme1n1 /mnt/ethpool
$ #sudo umount /mnt/ethpool
$ sudo chown -R $USER /mnt/ethpool
$ mkdir /mnt/ethpool/.ethereum
```

#### 1. Install Go
```bash
$ wget https://golang.org/dl/go1.13.15.linux-amd64.tar.gz
$ tar zxvf  go1.13.15.linux-amd64.tar.gz
$ sudo mv go /usr/local
$ vim ~/.profile       # .profile檔案內容在下方
$ source ~/.profile
```

***.profile***
```bash
# set PATH so it includes user's private bin if it exists
if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi
```
> go 1.13.15 才能正常編譯

#### 2. Install redis-server
```bash
$ sudo apt update
$ sudo apt install redis-server
$ sudo systemctl status redis-server # 察看 redis-server 服務狀態
```

***redis test***
```bash
$ ping
PONG
$ ​exit
```

#### 3. Install Node.js
```bash
$ sudo apt-get update​
$ sudo apt-get install nodejs​
$ sudo apt-get install npm
​$ nodejs -v​
$ sudo ln -s /usr/bin/nodejs /usr/bin/node
```

#### 4. Install Geth

```bash
$ wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.10.3-991384a7.tar.gz
$ sudo mv geth-linux-amd64-1.10.3-991384a7/geth /usr/bin/
```
> 儘量用最新版本

#### 5. Install nginx
```bash
$ sudo apt-get -y install nginx
```


### Geth 建立錢包
```bash
$ mkdir /mnt/ethpool/.ethereum
$ geth account new --datadir /mnt/ethpool/.ethereum
$ geth account list --datadir /mnt/ethpool/.ethereum
```

> keystore path: /mnt/ethpool/.ethereum/keystore