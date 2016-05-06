#!/bin/bash

if [[ -v LDAPTLS_CACERT_PEM ]];then
  echo "$LDAPTLS_CACERT_PEM" > /usr/local/share/ca-certificates/ldap.ca.crt
elif [[ -v LDAPTLS_CACERT ]]; then
  cp "$LDAPTLS_CACERT" /usr/local/share/ca-certificates/ldap.ca.crt
fi

update-ca-certificates

chown -R www-data:www-data /var/lib/ldap-account-manager/config/

apachectl -DFOREGROUND
