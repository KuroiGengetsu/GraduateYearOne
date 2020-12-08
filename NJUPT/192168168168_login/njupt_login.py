import argparse
import requests

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="login to NJUPT Dr.com")
    parser.add_argument("--account", "-A", type=str)
    parser.add_argument("--passwd", "-P", type=str)
    args = parser.parse_args()

    account = args.account
    passwd = args.passwd
    url = "http://192.168.168.168/0.htm"
    data = "DDDDD={}&upass={}&0MKKey=%B5%C7%A1%A1%C2%BC&v6ip=".format(account, passwd)
    r = requests.post(url=url, data=data)
    print("状态码: {}".format(r.status_code))
