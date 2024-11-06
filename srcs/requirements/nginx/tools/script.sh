#!/bin/bash

# Certificate details
COUNTRY="US"
STATE="California"
CITY="San Francisco"
ORGANIZATION="My Company"
ORG_UNIT="IT"
COMMON_NAME="mydomain.com"  # Change to your domain or IP
EMAIL="admin@mydomain.com"

# Output files
KEY_OUT="/selfsigned.key"
CERT_OUT="/selfsigned.crt"

# Generate the certificate with OpenSSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_OUT" -out "$CERT_OUT" \
    -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORGANIZATION/OU=$ORG_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"
