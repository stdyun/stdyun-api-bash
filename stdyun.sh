#!/usr/bin/env bash

url="https://stdyun.com"
username="changeyouremail"
password="changeyourpassword"

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
            curl "$url/api/v1/machines/$api_id?action=delete" \
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

exit
