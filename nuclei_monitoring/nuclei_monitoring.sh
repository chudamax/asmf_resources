#!/bin/bash

python3 nuclei_monitoring.py --hours 720 --output output/30days.json
python3 nuclei_monitoring.py --hours 168 --output output/7days.json
python3 nuclei_monitoring.py --hours 24 --output output/1day.json
python3 nuclei_monitoring.py --hours 4 --output output/4hours.json

jq -r 'select(.category == "http" and (.severity == "critical" or .severity == "high" or .severity == "medium")).raw_url' output/30days.json > output/30days_http_medium_high_critical_raw_urls.txt
jq -r 'select(.category == "http" and (.severity == "critical" or .severity == "high" or .severity == "medium")).raw_url' output/7days.json > output/7days_http_medium_high_critical_raw_urls.txt
jq -r 'select(.category == "http" and (.severity == "critical" or .severity == "high" or .severity == "medium")).raw_url' output/1day.json > output/1day_http_medium_high_critical_raw_urls.txt
jq -r 'select(.category == "http" and (.severity == "critical" or .severity == "high" or .severity == "medium")).raw_url' output/4hours.json > output/4hours_http_medium_high_critical_raw_urls.txt

jq -r 'select(.severity == "critical" or .severity == "high" or .severity == "medium").raw_url' output/30days.json > output/30days_medium_high_critical_raw_urls.txt
jq -r 'select(.severity == "critical" or .severity == "high" or .severity == "medium").raw_url' output/7days.json > output/7days_medium_high_critical_raw_urls.txt
jq -r 'select(.severity == "critical" or .severity == "high" or .severity == "medium").raw_url' output/1day.json > output/1day_medium_high_critical_raw_urls.txt
jq -r 'select(.severity == "critical" or .severity == "high" or .severity == "medium").raw_url' output/4hours.json > output/4hours_medium_high_critical_raw_urls.txt

jq -r '.raw_url' output/30days.json > output/30days_raw_urls.txt
jq -r '.raw_url' output/7days.json > output/7days_raw_urls.txt
jq -r '.raw_url' output/1day.json > output/1day_raw_urls.txt
jq -r '.raw_url' output/4hours.json > output/4hours_raw_urls.txt

git config user.email "you@example.com" && git config user.name "Your Name"
/usr/bin/git add .
/usr/bin/git commit -am "updates"
/usr/bin/git push
