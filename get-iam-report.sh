#!/bin/bash

if [ $# -ne 1 ]; then
    echo '[!] ERROR: Must provide save path for report'
    echo '[!] USAGE: ./get-iam-report.sh <path to save report>'
    exit
fi

echo "[*] Let's check out the IAM report!"

# Tell AWS to generate report
echo '[-] Requesting report to be generated...'
aws iam generate-credential-report

echo '[-] Waiting for report to generate'
sleep 2

timestamp=$(date +%s)

# Download the report
echo "[-] Saving report to $1/aws_iam_report_<timestamp>.csv"
aws iam get-credential-report --output text --query Content | base64 -D >> $1/aws_iam_report_$timestamp.csv

echo '[*] All done!'
