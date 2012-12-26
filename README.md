stdyun-api-bash
===============
stdyun's api, bash version

## Usage

请先修改username，password，以及创建主机的参数，包括dataset，packages，stdyun的密码。

1. usename是你在stdyun的注册邮箱。
1. password是你在stdyun的密码。

    
        username="change your email"
        password="change your password"

        creation_json='
         {
           "dataset": "stdyun:stdyun:ubuntu-12.04:1.0.0", 
           "package": "m1", 
           "metadata": {
               "credentials": {
                   "stdyun":"stdyunrocks"
               }
           }
         }
        '

* 查询镜像
 * ./stdyun.sh datasets getall
* 查询配置
 * ./stdyun.sh packages getall
* 获取所有主机信息
 * ./stdyun.sh machines getall
* 创建主机
 * ./stdyun.sh machines create
 * 主机设置请参看API文档中的[创建主机](https://stdyun.com/doc/api create-machine)。
 * 注意: 请先修改默认的dataset设置，否则会有安全问题。
* 获取主机信息 
 * ./stdyun.sh machines get 686ac2a1-9672-4e7c-b484-7f61387f1a17
* 关闭主机
 * ./stdyun.sh machines stop 686ac2a1-9672-4e7c-b484-7f61387f1a17
* 删除主机
 * ./stdyun.sh machines delete 686ac2a1-9672-4e7c-b484-7f61387f1a17
 * 注意：只允删除已关闭的主机。
