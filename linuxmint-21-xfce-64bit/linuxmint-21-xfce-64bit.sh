#!/bin/bash
bash update.sh
bash upgrade.sh
bash apache2.sh
bash ufw.sh
hostname -I
bash mysql.sh