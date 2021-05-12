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
### 安裝編譯工具 ###
$ sudo apt-get update
​$ sudo apt-get dist-upgrade
​$ sudo apt-get install build-essential make
### 掛載大容量硬碟 ###
$ sudo mkdir /mnt/ethpool
$ sudo fdisk -l #find large storage (ex: /dev/nvme1n1)
$ sudo mkfs -t ext4 /dev/nvme1n1 # foramt storage
$ sudo mount /dev/nvme1n1 /mnt/ethpool
$ #sudo umount /mnt/ethpool
$ sudo chown -R $USER /mnt/ethpool
### 建立geth目錄  ###
$ cd /mnt/ethpool
$ mkdir .ethereum
```

#### 1. Install Go
```bash
$ wget https://golang.org/dl/go1.13.15.linux-amd64.tar.gz
$ tar zxvf go1.13.15.linux-amd64.tar.gz
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
#sudo ln -s /usr/bin/nodejs /usr/bin/node
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
$ cd /mnt/ethpool
$ mkdir .ethereum
$ geth account new --datadir /mnt/ethpool/.ethereum
$ geth account list --datadir /mnt/ethpool/.ethereum
```

> keystore path: /mnt/ethpool/.ethereum/keystore


### 編譯 & 啟動礦池

#### 編譯
```bash
$ cd /mnt/ethpool
$ git clone https://github.com/02047788a/open-ethereum-pool.git
$ cd open-ethereum-pool/
$ chmod +x ./build/env.sh
$ make
```

#### 修正編譯錯誤

1. 修改 util.go
  1. 第11行 加入 `"github.com/ethereum/go-ethereum/common/hexutil"`
  2. 第39行 發現 `return string(common.ToHex(diff1.Bytes())）` 修改 `return string(hexutil.Encode(diff1.Bytes())）`
  > 檔案路徑: build/_workspace/src/github.com/sammy007/open-ethereum-pool/util/util.go

2. 修改 rpc.go
  1. 第15行 發現 `"github.com/ethereum/go-ethereum/common"` 修改 `""github.com/ethereum/go-ethereum/common/hexutil"`
  2. 第180行 發現 `rpcResp, err := r.doPost(r.Url, "eth_sign", []string{from, common.ToHex(hash[:])})` 修改 `rpcResp, err := r.doPost(r.Url, "eth_sign", []string{from, hexutil.Encode(hash[:])})`
  > 檔案路徑: build/_workspace/src/github.com/sammy007/open-ethereum-pool/rpc/rpc.go
3. 再次編譯 `make`