# About
Несколько примеров Клиент-Серверной реализации калькулятора

## Server

### Python

```console
$ python3 server.py
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:8080
 * Running on http://192.168.1.138:8080 (Press CTRL+C to quit)
```

## Client

### cURL

```console
$ curl 'http://127.0.0.1:8080/plus?a=10&b=5'
a = 10, b = 5
a + b = 15

$ curl 'http://127.0.0.1:8080/minus?a=10&b=4'
a = 10, b = 4
a + b = 6

$ curl 'http://127.0.0.1:8080/api/plus?a=10&b=5'
{"result": "15"}

$ curl 'http://127.0.0.1:8080/api/minus?a=10&b=4'
{"result": "6"}
```
