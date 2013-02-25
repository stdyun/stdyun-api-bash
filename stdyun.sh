#!/usr/bin/env bash
#
# Client CLI for the stdyun API 
# https://stdyun.com/doc/api

url="https://stdyun.com"
username="changeyouremail"
password="changeyourpassword"

creation_json='
{
    "dataset": "stdyun:stdyun:ubuntu-12.04:1.0.3", 
    "package": "m1", 
    "metadata": {
        "credentials": {
            "root":"stdyunrocks"
        }
    }
}
'

api_set=$1
api_action=$2
api_id=$3

curl_options=""

function machines {
    case $api_action in
        "create" )
            echo $creation_json
            curl "$url/api/v1/machines" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -d "$creation_json" \
                -X POST
            ;;
        "reboot" )
            curl "$url/api/v1/machines/$api_id?action=reboot" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X POST
            ;;
        "stop" )
            curl "$url/api/v1/machines/$api_id?action=stop" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X POST
            ;;
        "delete" )
            curl "$url/api/v1/machines/$api_id" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X DELETE
            ;;
        "get" )
            curl "$url/api/v1/machines/$api_id" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X GET
            ;;
        "getall" )
            curl "$url/api/v1/machines" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X GET
            ;;
    esac
}

function packages {
    case $api_action in
        "get" )
            curl "$url/api/v1/packages/$api_id" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X GET
            ;;
        "getall" )
            curl "$url/api/v1/packages" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X GET
            ;;
    esac
}

function datasets {
    case $api_action in
        "get" )
            curl "$url/api/v1/datasets/$api_id" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X GET
            ;;
        "getall" )
            curl "$url/api/v1/datasets" \
                $curl_options \
                -u $username:$password \
                -H "Accept: application/json" \
                -H "Content-type: application/json" \
                -X GET
            ;;
    esac
}

function usage {
    echo "Usage:"
    echo "   $0 machines getall"
    echo "   $0 machines get [ID]"
    echo "   $0 machines create"
    echo "   $0 machines reboot [ID]"
    echo "   $0 machines stop [ID]"
    echo "   $0 machines delete [ID]"
    echo "   $0 datasets getall"
    echo "   $0 packages getall"
}

if [[ ! -n $1 ]] ; then
    usage
    exit 0
fi

if [[ $api_set = "machines" ]]; then
    machines
    echo ""
fi

if [[ $api_set = "datasets" ]]; then
    datasets
    echo ""
fi

if [[ $api_set = "packages" ]]; then
    packages
    echo ""
fi

exit 0
