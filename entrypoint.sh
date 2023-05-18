#!/bin/sh

ENV_MARKET="/etc/profile.d/world-market.sh"
ENV_HELPER="/etc/profile.d/world-helper.sh"

touch $ENV_MARKET
touch $ENV_HELPER

echo "#!/bin/bash" >> $ENV_MARKET
echo "export DB_HOST=$DB_HOST" >> $ENV_MARKET
echo "export DB_USER=$DB_USER" >> $ENV_MARKET
echo "export DB_PASS=$DB_PASS" >> $ENV_MARKET

echo "export OPEN_AI_KEY=$OPEN_AI_KEY" >> $ENV_HELPER
echo "export OPEN_AI_ORG=$OPEN_AI_ORG" >> $ENV_HELPER

ln -s /world/.python/bin/python3 /usr/bin/python

useradd -u $VS_USER_ID $VS_USER -s /bin/bash
groupadd -g $GID $DISTRICT

usermod -g $GID $VS_USER

usermod -aG $DISTRICT $VS_USER
usermod -d /world/city/$DISTRICT/$VS_USER $VS_USER

cd /world

chown root:$DISTRICT city/$DISTRICT
chown -R $VS_USER:$VS_USER city/$DISTRICT/$VS_USER

export INV_PATH="~/.inv"
export INV_REGISTRY=".registry"

mkdir -p city/$DISTRICT/$VS_USER/.inv

INV_FILE="city/$DISTRICT/$VS_USER/.inv/.registry"

if [ -f $INV_FILE ]; then
  echo "INVENTORY FILE EXISTS!"
else
  echo "{}" >> $INV_FILE
fi

sudo -i -u $VS_USER source /etc/profile.d/world-cmd.sh
sudo -i -u $VS_USER source /etc/profile.d/world-market.sh

sudo -i -u $VS_USER code-server --install-extension /term-world-theme.vsix
sudo -i -u $VS_USER code-server --install-extension /term-world-launcher.vsix
sudo -i -u $VS_USER code-server --install-extension /bierner.markdown-checkbox-0.4.0.vsix
sudo -i -u $VS_USER code-server --disable-getting-started-override
