## Open Source Ethereum Mining Pool


### Building on Linux

Dependencies:

  * go >= [1.13.15](https://golang.org/dl/go1.13.15.linux-amd64.tar.gz)
  * geth 
  * redis-server
  * nodejs
  * nginx
  * I highly recommend to use Ubuntu 20.04 LTS.

#### Initial storage & folder
```bash
$ sudo mkdir /mnt/ethpool
$ sudo fdisk -l #find large storage (ex: /dev/nvme1n1)
$ sudo mkfs -t ext4 /dev/nvme1n1 # foramt storage
$ sudo mount /dev/nvme1n1 /mnt/ethpool
$ #sudo umount /mnt/ethpool
$ sudo chown -R $USER /mnt/ethpool
```

#### Install Go
```bash
$ wget https://golang.org/dl/go1.13.15.linux-amd64.tar.gz
$ tar zxvf  go1.13.15.linux-amd64.tar.gz
$ sudo mv go /usr/local
$ vim ~/.profile
$ # edif [.profile] 
$ source ~/.profile
```

***.profile***
```
# set PATH so it includes user's private bin if it exists
if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi
```
