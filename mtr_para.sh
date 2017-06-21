echo '
8.8.8.8
8.8.4.4
ANY OTHER IPS
' | sed 's/0.0.0.0\n\|0.0.0.0//g' \
| xargs -n 1 -P 10 -I{} bash -c "mtr {} -rw -c ${mtr_count} | sed -e '1i\START={}' -e '$ a\FINISH'" \
| tee /tmp/${exec_id}/mtr.txt
