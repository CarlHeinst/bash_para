para_count=10
## This is the number of paralell processes to instruct Xargs to make use of
ping_count=4 
## This is the number of pings to carry out
echo '
8.8.8.8
8.8.4.4
AS MANY OTHER IPS as you like
' | sed 's/0.0.0.0\n\|0.0.0.0//g' \
| xargs -n 1 -P $para_count -I{} bash -c "ping {} -c $ping_count \
| sed -e '1i\START={}' -e '$ a\FINISH'" | tee /tmp/ping_res.txt
