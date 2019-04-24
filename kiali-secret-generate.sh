#!/bin/bash
kiali_username=$(read -p 'Kiali Username: ' uval && echo -n $uval | base64)
kiali_pass=$(read -p 'Kiali Passphrase: ' pval && echo -n $pval | base64)

sed -i "s/kialiuserkey:/kialiuserkey: $kiali_username/g" ./istio_values-with-plugins.yaml
sed -i "s/kialipasskey:/kialipasskey: $kiali_pass/g" ./istio_values-with-plugins.yaml

