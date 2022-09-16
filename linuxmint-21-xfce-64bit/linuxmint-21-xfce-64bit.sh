#!/bin/bash
bash update.sh
bash upgrade.sh
bash apache2.sh
bash ufw.sh
sudo systemctl status apache2
hostname -I