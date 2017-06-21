para_count=10
## This is the number of paralell processes to instruct Xargs to make use of
mtr_count=50
## This is the number of pings to carry out
echo '
8.8.8.8
8.8.4.4
ANY OTHER IPS
' | sed 's/0.0.0.0\n\|0.0.0.0//g' \
| xargs -n 1 -P $para_count -I{} bash -c "mtr {} -rw -c $mtr_count | sed -e '1i\START={}' -e '$ a\FINISH'" \
| tee /tmp/${exec_id}/mtr.txt

### Generating MTR against a list of IPs in a file:

para_count=10
## This is the number of paralell processes to instruct Xargs to make use of
mtr_count=50
## This is the number of pings to carry out
cat /tmp/file_of_ips.txt | sed 's/0.0.0.0\n\|0.0.0.0//g' \
| xargs -n 1 -P $para_count -I{} bash -c "mtr {} -rw -c $mtr_count | sed -e '1i\START={}' -e '$ a\FINISH'" \
| tee /tmp/${exec_id}/mtr.txt
