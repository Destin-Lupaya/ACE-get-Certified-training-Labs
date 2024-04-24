# Cloud Audit Logs
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# No cost
# show_chart
# Intermediate
# Overview
# In this lab, you investigate Google Cloud Audit Logs. Cloud Audit Logging maintains multiple audit logs for each project, folder, and organization, all of which help answer the question, "Who did what, when, and where?"

# Objectives
# In this lab, you learn how to:

# Enable data access logs on Cloud Storage.
# Generate admin and data access activity.
# View Audit logs.
# Setup and requirements
# For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

# Sign in to Qwiklabs using an incognito window.

# Note the lab's access time (for example, 1:15:00), and make sure you can finish within that time.
# There is no pause feature. You can restart if needed, but you have to start at the beginning.

# When ready, click Start lab.

# Note your lab credentials (Username and Password). You will use them to sign in to the Google Cloud Console.

# Click Open Google Console.

# Click Use another account and copy/paste credentials for this lab into the prompts.
# If you use other credentials, you'll receive errors or incur charges.

# Accept the terms and skip the recovery resource page.

# Note: Do not click End Lab unless you have finished the lab or want to restart it. This clears your work and removes the project.

# After you complete the initial sign-in steps, the project dashboard appears.

# The Project Dashboard which inlcudes tiles for Project info, Resources, APIs, Billing, and Error Reporting.

# Activate Google Cloud Shell
# Google Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud.

# Google Cloud Shell provides command-line access to your Google Cloud resources.

# In Cloud console, on the top right toolbar, click the Open Cloud Shell button.

# Highlighted Cloud Shell icon

# Click Continue.

# It takes a few moments to provision and connect to the environment. When you are connected, you are already authenticated, and the project is set to your PROJECT_ID. For example:

# Project ID highlighted in the Cloud Shell Terminal

# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# You can list the active account name with this command:
# gcloud auth list
# Copied!
# Output:

# Credentialed accounts:
#  - @.com (active)
# Example output:

# Credentialed accounts:
#  - google1623327_student@qwiklabs.net
# You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = 
# Example output:

# [core]
# project = qwiklabs-gcp-44776a13dea667a6
# Note: Full documentation of gcloud is available in the gcloud CLI overview guide .
# Task 1. Enable data access logs on Cloud Storage
# Data Access audit logs (except for BigQuery) are disabled by default. Let's start by enabling data access logs on Cloud Storage.

# In the Google Cloud Console window, use the Navigation menu (Navigation menu icon) to navigate to IAM & Admin > Audit Logs.

# Scroll or use Filter to locate Google Cloud Storage, then check the box next to it. This should display the Info Panel with options on LOG TYPES.

# Data Access audit logs are divided into different categories:

# Admin Read: Records operations that read metadata or configuration information. Admin Activity audit logs record writes of metadata and configuration information. They can't be disabled.
# Data Read: Records operations that read user-provided data.
# Data Write: Records operations that write user-provided data.
# Select Admin Read, Data Read and Data Write, and then click SAVE.
# Click Check my progress to verify the objective.
# Enable data access logs on Cloud Storage

# Task 2. Generate some admin and data access activity
# The data access logs are now enabled for Cloud Storage. Use Cloud Shell to upload a file to a new storage bucket, create a network, create a VM, and then examine the Cloud Audit Logs.

# Open or switch to your Cloud Shell terminal.

# Use gsutil to create a Cloud Storage bucket with the same name as your project:

# gsutil mb gs://$DEVSHELL_PROJECT_ID
# Copied!
# Make sure the bucket successfully created:
# gsutil ls
# Copied!
# Create a simple "Hello World" type of text file and upload it to your bucket:
# echo "Hello World!" > sample.txt
# gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID
# Copied!
# Verify the file is in the bucket:
# gsutil ls gs://$DEVSHELL_PROJECT_ID
# Copied!
# Create a new auto mode network named mynetwork, then create a new virtual machine and place it on the new network:
# gcloud compute networks create mynetwork --subnet-mode=auto
# Copied!
# gcloud compute instances create default-us-vm \
# --zone=Zone --network=mynetwork \
# --machine-type=e2-medium
# Copied!
# Click Check my progress to verify the objective.
# Check the creation of bucket, network and virtual machine instance

# Delete the storage bucket:
# gsutil rm -r gs://$DEVSHELL_PROJECT_ID
# Copied!
# Task 3. Viewing audit logs
# Admin Activity logs contain log entries for API calls or other administrative actions that modify the configuration or metadata of resources. For example, the logs record when VM instances and App Engine applications are created, or when permissions are changed. To view the logs, you must have the Cloud Identity and Access Management roles Logging/Logs Viewer or Project/Viewer.

# Admin Activity logs are always enabled so there is no need to enable them. There is no charge for your Admin Activity audit logs.

# Use the Navigation menu to navigate to Logging > Logs Explorer.

# Enable Show query and delete the contents of Query box.

# Click the Log name dropdown and use the filter to locate the activity log under CLOUD AUDIT section and Apply it to the query.

# Press the Run query button, and then use the Log fields explorer to filter to GCS Bucket entries.

# Locate the log entry for when the Cloud Storage was deleted.

# Expand the delete entry, then drill into protoPayload > authenticationInfo field and notice you can see the email address of the user that performed this action.

# Feel free to explore other fields in the entry. Also, notice how many of the values can be clicked to add inclusions/exclusions to the query.

# Delete the existing query and use Log Name to view the data_access logs.

# What operations can you see now?

# Click Check my progress to verify the objective.
# Viewing audit logs

# Using the Cloud SDK
# Log entries can also be read using the Cloud SDK command:

# Example:

# gcloud logging read [FILTER]
# Copied!
# Switch to or reopen a Cloud Shell terminal.

# If we wanted to see those same data access logs using the command line, we could run the following:

# gcloud logging read \
# "logName=projects/$DEVSHELL_PROJECT_ID/logs/cloudaudit.googleapis.com%2Fdata_access"
# Copied!
# Congratulations!
# In this exercise, you examined and worked with Google Cloud's Audit Logs. Now you can do a better job figuring out exactly who, did what, when. Nice job.

# End your lab
# When you have completed your lab, click End Lab. Google Cloud Skills Boost removes the resources you’ve used and cleans the account for you.

# You will be given an opportunity to rate the lab experience. Select the applicable number of stars, type a comment, and then click Submit.

# The number of stars indicates the following:

# 1 star = Very dissatisfied
# 2 stars = Dissatisfied
# 3 stars = Neutral
# 4 stars = Satisfied
# 5 stars = Very satisfied
# You can close the dialog box if you don't want to provide feedback.

# For feedback, suggestions, or corrections, please use the Support tab.

# Copyright 2022 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

Solution here
Got Audit Logs from here

Use Filter to locate Google Cloud Storage.

Then check the box next to it.

Select Admin Read, Data Read and Data Write, and then click SAVE.

Run the following Commands in CloudShell
export ZONE=
curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Cloud%20Audit%20Logs/Audit-Logs.sh

sudo chmod +x Audit-Logs.sh

./Audit-Logs.sh
Go to Logs Explorer from here

Click the Log name dropdown and use the filter to locate the activity log under CLOUD AUDIT section and Apply it to the query.

Press the Run query button.

Delete the existing query and use Log Name to view the data_access logs.


Press the Run query button.

Congratulations 🎉 for Completing the Lab !
You Have Successfully Demonstrated Your Skills And Determination.
Well done!
Don't Forget to Join the Telegram Channel & Discussion group






BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`
#----------------------------------------------------start--------------------------------------------------#

echo "${YELLOW}${BOLD}Starting${RESET}" "${GREEN}${BOLD}Execution${RESET}"

gsutil mb gs://$DEVSHELL_PROJECT_ID

echo "Hello World!" > sample.txt
gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID

gsutil ls gs://$DEVSHELL_PROJECT_ID

gcloud compute networks create mynetwork --subnet-mode=auto

gcloud compute instances create default-us-vm \
--zone=$ZONE --network=mynetwork \
--machine-type=e2-medium

echo "${RED}${BOLD}Congratulations${RESET}" "${WHITE}${BOLD}for${RESET}" "${GREEN}${BOLD}Completing the Lab !!!${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#