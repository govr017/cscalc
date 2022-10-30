import std/httpclient
import strutils
import json

var reqpart = ""
var fullreq = ""

proc sendReq(param: string) {.thread.} = 
    var client = newhttpclient()
    var response = client.getContent(param)
    var responseParsed = parseJson(response)
    echo "\e[36m", responseParsed["result"].getStr(), "\e[00m"

while true: 
    echo "\e[32m","What operator would you like to use?", "\e[00m"
    echo "\e[32m","The options are:","\e[36m"," addition,subtraction,multiplication,division?", "\e[00m"
    var choice = readLine(stdin)
    case choice
    of "addition":
        reqpart = "/api/plus?"
    of "subtraction":
        reqpart = "/api/minus?"
    of "multiplication":
        reqpart = "/api//multiply?"
    of "division":
        reqpart = "/api/divide?"
    else:
        echo "\e[31m","Invalid choice! -> ","\e[00m","\e[36m", choice,"\e[00m", "\n"
        continue
    echo "\e[32m","Pick the first number:", "\e[00m"
    var choice2 = readLine(stdin)
    reqpart = reqpart & "a=" & choice2
    try:
        var choice2Parsed = parseInt(choice2)
    except ValueError:
        echo "\e[31m","Input is not an interger! -> ","\e[00m","\e[36m", choice2,"\e[00m", "\n"
        continue
    echo "\e[32m","Pick the second number:", "\e[00m"
    var choice3 = readLine(stdin)
    reqpart = reqpart & "&b=" & choice3
    try:
        var choice3Parsed = parseInt(choice3)
    except ValueError:
        echo "\e[31m","Input is not an interger! -> ","\e[00m","\e[36m", choice3,"\e[00m", "\n"
        continue
    echo "\e[32m","Enter the address:", "\e[00m"
    var choice4 = readLine(stdin)
    echo "\n"
    if choice4[^1] == "/"[0]:
        choice4 = choice4[0 ..< ^1]
        choice4 = choice4 & "/"
    try:
        fullreq = choice4 & reqpart
        sendReq(fullreq)
    except OSError:
        echo "\e[31m","Couldn't reach the server, did you type the address correctly?","\e[00m", "\n"
    except ValueError:
        echo "\e[31m",choice4," is not a URL!","\e[00m", "\n"
        