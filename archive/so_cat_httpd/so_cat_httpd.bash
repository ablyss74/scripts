##
## Big thanks to the support of Stack Exchange

# List on non priviledged port 1234, do stuff on localhost / 127.0.0.1
socat -v -v TCP-LISTEN:1234,crlf,reuseaddr,fork SYSTEM:"echo HTTP/1.0 200; echo Content-Type\: text/plain; echo; echo HelloWorld"

