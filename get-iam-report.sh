#!/bin/bash

echo "[*] Let's check out the IAM report!"

# Tell AWS to generate report
echo '[-] Requesting report to be generated...'
aws iam generate-credential-report

timestamp=$(date +%s)

# Download the report
echo '[-] Saving report to ~/Documents/reports/aws/aws_iam_report_<timestamp>.csv'
aws iam get-credential-report --output text --query Content | base64 -D >> ~/Documents/Reports/aws/aws_iam_report_$timestamp.csv

echo '[*] All done!'
