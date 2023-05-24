#!/bin/bash

set -e

openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem -config cert.conf
openssl x509 -in ca.pem -inform PEM -out ca.crt


