COUNT=$(grep -r " `date +\%H:\%M -d '1 minutes ago'`" LOG_PATH/LOG_`date +\%Y\%m\%d` | awk '{print $4}' | awk '{arr[$1]+=1} END {for(i in arr) {print i"\t" arr[i]}}' | sort -V -r -k 2 | head -n 1)


IP=$(grep -r " `date +\%H:\%M -d '1 minutes ago'`" LOG_PATH/LOG_`date +\%Y\%m\%d` | awk '{print $4}' | awk '{arr[$1]+=1} END {for(i in arr) {print i"\t" arr[i]}}' | sort -V -r -k 2 | head -n 1|awk '{print $1}')
ACCESS=$(grep -r " `date +\%H:\%M -d '1 minutes ago'`" LOG_PATH/LOG_`date +\%Y\%m\%d` | awk '{print $4}' | awk '{arr[$1]+=1} END {for(i in arr) {print i"\t" arr[i]}}' | sort -V -r -k 2 | head -n 1|awk '{print $2}')

if (( "$ACCESS" > 50 )); then
    echo "$ACCESS"
	curl --request POST --url SLACK_HOOK_URL --data '{"channel": "CHANNEL","text": "최근 1분 동안 ACCESS가 많이 발생한 IP : '"$IP"' ('"$ACCESS"'건) "}'
fi
