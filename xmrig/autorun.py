import configparser
import os
import sys
import requests
import json
import time

config = configparser.ConfigParser()
config.read("info.ini")
GLBWALLET = config['global']['wallet']
GLBHOST = config['global']['host']
GLBSLEEPTIME = config['global']['sleeptime']
GLBPWD = config['global']['pwd']

accountlist = config.items('account')
pushlist = config.items('push')

def my_curl(id, token):
    url = "https://api.github.com/repos/%s/actions/dispatches" % (id)
    data = {"key":"value"}
    headers = \
    {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token "+token
    }
    body = \
    {
        "event_type": "xmrig",
        "client_payload": {
            "wallet": GLBWALLET,
            "sleeptime": GLBSLEEPTIME,
            "poolserver": GLBHOST,
            "poolcmd": "-p "+id+" -k"
        }
    }
    print(headers)
    print(json.dumps(body))
    #res = requests.post(url=url,headers=headers,data=json.dumps(body))
    #print(res.text)
    #return res.text;


def in_pushone():
    idd = sys.argv[2]
    val = os.system('./push.sh %s %s' % (idd, GLBPWD))
    print(val)

def in_push():
    for ii in range(len(pushlist)):
        print(ii, pushlist[ii][0], pushlist[ii][1])
        val = os.system('./push.sh %s %s' % (pushlist[ii][0], GLBPWD))
        print(val)
        time.sleep(5)

def in_triggerone():
    idd = sys.argv[2]
    tokenn = sys.argv[3]
    my_curl(idd, tokenn)

def in_trigger():
    for ii in range(len(accountlist)):
        print(ii, accountlist[ii][0], accountlist[ii][1])
        my_curl(accountlist[ii][0], accountlist[ii][1])
        time.sleep(30)

def in_see():
    print(GLBHOST)
    print("accountlist")
    for ii in range(len(accountlist)):
        print(ii, accountlist[ii][0], accountlist[ii][1])
    print("pushlist")
    for ii in range(len(pushlist)):
        print(ii, pushlist[ii][0], pushlist[ii][1])

def in_help():
    print("help this doc")
    print("see")
    print("trigger")
    print("triggerone")
    print("push")
    print("pushone")

if __name__=="__main__":
    if (2 > len(sys.argv)):
        in_help();
        sys.exit()
    cmdrunstr = "in_"+sys.argv[1]
    print(cmdrunstr)
    eval(cmdrunstr)()

    '''
    try:
        eval(cmdrunstr)()
    except:
        print("cmd not find", sys.argv[1])
        in_help()
    '''

