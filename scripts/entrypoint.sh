#!/usr/bin/env sh

cp /etc/options.json /data/Config/options.json

if [ -n "$FOUNDRY_ADMIN_KEY" ]; then
  echo $FOUNDRY_ADMIN_KEY | node /opt/foundry/encode_password.js > /data/Config/admin.txt
fi

if [ -n "$FOUNDRY_WORLD" ]; then
  sed -e "s/\"world\":.*$/\"world\": \"$FOUNDRY_WORLD\",/" -i /data/Config/options.json
fi

cd /opt/foundry

rm -rf /data/Config/Options.json.lock || true
node --inspect=0.0.0.0:9229 main.js --dataPath=/data --adminKeyFile=/data/Config/admin.txt --skipWelcomeScreen --skipUpdateCheck
