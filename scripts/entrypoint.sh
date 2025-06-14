#!/usr/bin/env sh

if [ -n "$FOUNDRY_ADMIN_KEY" ]; then
  echo $FOUNDRY_ADMIN_KEY | node /opt/foundry/encode_password.js > /data/Config/admin.txt
fi

cd /opt/foundry

node main.js --dataPath=/data --adminKeyFile=/data/Config/admin.txt --skipWelcomeScreen --skipUpdateCheck