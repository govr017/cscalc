import std/httpclient
import strutils
import json

var reqpart = ""
var fullreq = ""

const COLOR_RED = "\e[31m"
const COLOR_GREEN = "\e[32m"
const COLOR_BLUE = "\e[36m"
const COLOR_END = "\e[00m"

proc sendReq(param: string) {.thread.} = 
    var client = newhttpclient()
    var response = client.getContent(param)
    var responseParsed = parseJson(response)
    echo COLOR_BLUE, responseParsed["result"].getStr(), COLOR_END

while true: 
    echo COLOR_GREEN,"What operator would you like to use?", COLOR_END
    echo COLOR_GREEN,"The options are:",COLOR_BLUE," addition,subtraction,multiplication,division?", COLOR_END
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
        echo COLOR_RED,"Invalid choice! -> ",COLOR_END,COLOR_BLUE, choice,COLOR_END, "\n"
        continue
    echo COLOR_GREEN,"Enter the first number:", COLOR_END
    var choice2 = readLine(stdin)
    reqpart = reqpart & "a=" & choice2
    try:
        var choice2Parsed = parseInt(choice2)
    except ValueError:
        echo COLOR_RED,"Input is not an interger! -> ",COLOR_END,COLOR_BLUE, choice2,COLOR_END, "\n"
        continue
    echo COLOR_GREEN,"Enter the second number:", COLOR_END
    var choice3 = readLine(stdin)
    reqpart = reqpart & "&b=" & choice3
    try:
        var choice3Parsed = parseInt(choice3)
    except ValueError:
        echo COLOR_RED,"Input is not an interger! -> ",COLOR_END,COLOR_BLUE, choice3,COLOR_END, "\n"
        continue
    echo COLOR_GREEN,"Enter the address:", COLOR_END
    var choice4 = readLine(stdin)
    echo "\n"
    if choice4[^1] == "/"[0]:
        choice4 = choice4[0 ..< ^1]
        choice4 = choice4 & "/"
    try:
        fullreq = choice4 & reqpart
        sendReq(fullreq)
    except OSError:
        echo COLOR_RED,"Couldn't reach the server, did you type the address correctly?",COLOR_END, "\n"
    except ValueError:
        echo COLOR_RED,choice4," is not a URL!",COLOR_END, "\n"
    except HttpRequestError:
        echo COLOR_RED, "Invalid request, did you type the address correctly?"
        