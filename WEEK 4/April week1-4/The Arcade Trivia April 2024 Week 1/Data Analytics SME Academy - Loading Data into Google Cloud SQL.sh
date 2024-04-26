# Data Analytics SME Academy - Loading Data into Google Cloud SQL
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# No cost
# show_chart
# Advanced
# GSP196
# Google Cloud Self-Paced Labs

# Overview
# In this lab, you will learn how to import data from CSV text files into Cloud SQL and then carry out some basic data analysis using simple queries.

# The dataset used in this lab comes from the US Bureau of Transport Statistics and contains historical information about internal flights in the United States. This dataset can be used to demonstrate a wide range of data science concepts and techniques and is used in all of the labs in the Data Science on Google Cloud Platform Quest.

# Objectives
# Create Cloud SQL instance
# Create a Cloud SQL database
# Import text data into Cloud SQL
# Build an initial data model using queries
# Setup and Requirements
# Before you click the Start Lab button
# Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click Start Lab, shows how long Google Cloud resources will be made available to you.

# This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

# To complete this lab, you need:

# Access to a standard internet browser (Chrome browser recommended).
# Note: Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.
# Time to complete the lab---remember, once you start, you cannot pause a lab.
# Note: If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.
# How to start your lab and sign in to the Google Cloud console
# Click the Start Lab button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is the Lab details pane, which is populated with the temporary credentials that are needed for this lab.

# Lab details pane

# Copy the Password and then click Open Google Cloud console. The lab spins up resources, then opens another tab that shows the Sign in page.

# Tip: Open the tabs in separate windows, side by side.
# Note: If you see the Choose an account page, click Use another account.
# On the Sign in page, verify that the username from the Lab details pane is auto-filled. Click Next.

# Paste the password in the Enter your password field. Click Next.

# Important: Use the credentials from the Lab details pane. Using your personal Google Cloud account may incur charges to your account.
# Click through the subsequent pages:

# Understand your account management.

# Accept the terms and conditions.

# After a few moments, the console opens.

# Note: You can view the menu with a list of Google Cloud products and services by clicking the Navigation menu in the top left. Google Cloud console menu with the Navigation menu icon highlighted
# Activate Cloud Shell
# Cloud Shell is a virtual machine (VM) that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud. Cloud Shell provides command-line access to your Google Cloud resources.

# In the Cloud Console, in the top-right toolbar, click the Activate Cloud Shell button.
# Cloud Shell icon

# Click Continue.
# cloudshell_continue.png

# It takes a few moments to provision and connect to the environment. When you are connected, you are already authenticated, and the project is set to your PROJECT_ID. For example:

# Cloud Shell Terminal

# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# You can list the active account name with this command:
# gcloud auth list
# Copied!
# Output:

# Credentialed accounts:
#  - <myaccount>@<mydomain>.com (active)
# Example output:

# Credentialed accounts:
#  - google1623327_student@qwiklabs.net
# You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = <project_ID>
# Example output:

# [core]
# project = qwiklabs-gcp-44776a13dea667a6
# Note: For full documentation of gcloud see the gcloud command-line tool overview.
# Preparing your Environment
# This lab uses a set of code samples and scripts developed for the Data Science on Google Cloud Platform book from O'Reilly Media, Inc. and specifically covers the configuration of Google Cloud SQL and importing data tasks covered in the first part of Chapter 3, "Creating Compelling Dashboards". You will clone the sample repository used in Chapter 2 from Github to the Cloud Shell and carry out all of the lab tasks from there.

# Clone the Data Science on Google Cloud Repository
# In Cloud Shell enter the following commands to clone the repository:
# git clone \
#    https://github.com/GoogleCloudPlatform/data-science-on-gcp/
# Copied!
# Change to the repository directory:
# cd data-science-on-gcp/03_sqlstudio
# Copied!
# Create environment variables that will be used later in the lab for your project ID and the storage bucket that will contain your data:
# export PROJECT_ID=$(gcloud info --format='value(config.project)')
# export BUCKET=${PROJECT_ID}-ml
# Copied!
# Enter following command to stage the file into Cloud Storage bucket:
# gsutil cp create_table.sql \
#     gs://$BUCKET/create_table.sql
# Copied!
# Create a Cloud SQL instance
# Enter the following commands to create a Cloud SQL instance:
# gcloud sql instances create flights \
#     --database-version=POSTGRES_13 --cpu=2 --memory=8GiB \
#     --region="REGION" --root-password=Passw0rd
# Copied!
# This will take a few minutes to complete.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created a Cloud SQL instance, you will see an assessment score.

# Create a Cloud SQL instance.
# Create an environment variable with the Cloud Shell IP address:
# export ADDRESS=$(curl -s http://ipecho.net/plain)/32
# Copied!
# Allowlist the Cloud Shell instance for management access to your SQL instance:
# gcloud sql instances patch flights --authorized-networks $ADDRESS
# Copied!
# When prompted press Y to accept the change.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully allowlisted Cloud Shell to access SQL instance, you will see an assessment score.

# Allowlist the Cloud Shell instance to access your SQL instance.
# Create database and table
# To import data into a Postgres table, you first create an empty database and a table with the correct schema.

# In the Cloud Console, on the Navigation menu (Navigation menu icon), click SQL.

# To open the Overview page of an instance, click the instance name flights.

# Select Databases from the SQL navigation menu on the left.

# Click Create database.

# In the New database dialog, name the database bts.

# Click Create.

# To open the Overview page of an instance, select Overview from the SQL navigation menu.

# Click IMPORT on the top.

# In the Cloud Storage file field, click Browse.

# In the Buckets section, click the arrow opposite your bucket name.

# Select the file create_table.sql.

# Click Select.

# In the File format section, select SQL.

# Specify the Database bts in your Cloud SQL instance.

# Click Import start the import.

# A few seconds later, the empty table will be created.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created a bts database and flights table using the create_table.sql file, you will see an assessment score.

# Create a bts database and flights table using the create_table.sql file.
# Add data to a Cloud SQL instance
# You created the empty database and table, now load the CSV files into this table. Loading the January data by browsing to 201501.csv in your bucket and specifying CSV as the format, bts as the database, and flights as the table.

# In your Cloud SQL instance page, click IMPORT.

# In the Cloud Storage file field, click Browse, and then click the arrow opposite your bucket name, and then click 201501.csv.

# Click Select.

# Select CSV as File format.

# Select the bts database and type in flights as your table.

# Click IMPORT.

# Interact with the database
# Connect to the Cloud SQL instance from Cloud Shell using:
# gcloud sql connect flights --user=postgres
# Copied!
# When prompted for a password enter Passw0rd. You may not see the letters as you type.

# In the prompt that comes up, connect to the bts database:

# \c bts;
# Copied!
# When prompted for a password enter Passw0rd.

# Then, run a query to obtain the 5 busiest airports:

# SELECT "Origin", COUNT(*) AS num_flights 
# FROM flights GROUP BY "Origin" 
# ORDER BY num_flights DESC 
# LIMIT 5;
# Copied!
# While this query is performant because the dataset is relatively small (only January!), the database will slow as you add more months.

# Relational databases are suited to smallish datasets on which you perform ad hoc queries that return a small a subset of the data. For larger datasets, you tune the performance of a relational database by indexing the columns of interest. Further, because relational databases typically support transactions and guarantee strong consistency, they are an excellent choice for data that will be updated often.

# However, a relational database is a poor choice if:

# Your data is primarily read-only
# If your dataset sizes go into the terabyte range
# You have a need to scan the full table (such as to compute the maximum value of a column) or if your data streams in at high rates.
# This describes the flight delay use case. For this case you would switch from a relational database to an analytics data warehouse – BigQuery. The analytics data warehouse will allow us to use SQL and is much more capable of dealing with large datasets and ad hoc queries (i.e. doesn’t need the columns to be indexed).

# Test your Understanding
# Below are multiple-choice questions to reinforce your understanding of this lab's concepts. Answer them to the best of your abilities.


# The Tiers resource represents a service configuration that can be used to define a Cloud SQL instance. Which type of tier resource is used while creating a Cloud SQL instance in the lab?

# db-n1-highmem-2

# db-n1-standard-1

# db-f1-micro

# Congratulations!
# Now you know how to create tables and import text data that has been stored on Cloud Storage into Google Cloud SQL.

# Finish Your Quest
# 2ea99a2e13bf2db4.png cloudsql-quest-badge.png

# This self-paced lab is part of the Qwiklabs Quest Data Science on Google Cloud and Cloud SQL. A Quest is a series of related labs that form a learning path. Completing this Quest earns you the badge above, to recognize your achievement. You can make your badge (or badges) public and link to them in your online resume or social media account. Enroll in Data Science on Google Cloud or Cloud SQL and get immediate completion credit if you've taken this lab. See other available Qwiklabs Quests.

# Take Your Next Lab
# Continue your Quest with Visualizing Data with Google Data Studio, or check out these suggestions:

# Processing Data with Google Cloud Dataflow
# Visualize Real Time Geospatial Data with Google Data Studio
# Next Steps / Learn More
# Here are some follow-up steps:

# Data Science on the Google Cloud: O'Reilly Media, Inc.
# Google Cloud Training & Certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated April 04, 2024
# Lab Last Tested April 04, 2024
# Copyright 2023 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# Lab instructions and tasks





# resolution

export REGION=us-east1

curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Data%20Analytics%20SME%20Academy%20-%20Loading%20Data%20into%20Google%20Cloud%20SQL/gsp196.sh

sudo chmod +x gsp196.sh

./gsp196.sh




#!/bin/bash
# Define color variables

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

gcloud auth list

git clone \
   https://github.com/GoogleCloudPlatform/data-science-on-gcp/

cd data-science-on-gcp/03_sqlstudio

export PROJECT_ID=$(gcloud info --format='value(config.project)')
export BUCKET=${PROJECT_ID}-ml

gsutil cp create_table.sql \
    gs://$BUCKET/create_table.sql

gcloud sql instances create flights \
    --database-version=POSTGRES_13 --cpu=2 --memory=8GiB \
    --region=$REGION --root-password=Passw0rd

export ADDRESS=$(curl -s http://ipecho.net/plain)/32

gcloud sql instances patch flights --authorized-networks $ADDRESS --quiet

export INSTANCE_NAME=flights
export DATABASE_NAME=bts
export SQL_FILE=create_table.sql

# Create a database
gcloud sql databases create $DATABASE_NAME --instance=$INSTANCE_NAME

SERVICE_ACCOUNT_EMAIL=$(gcloud sql instances describe $INSTANCE_NAME --format='value(serviceAccountEmailAddress)')

gsutil iam ch serviceAccount:$SERVICE_ACCOUNT_EMAIL:roles/storage.objectViewer gs://$BUCKET

# Import the SQL file into the database
gcloud sql import sql $INSTANCE_NAME \
    gs://$BUCKET/$SQL_FILE \
    --database=$DATABASE_NAME \
    --quiet

echo "${RED}${BOLD}Congratulations${RESET}" "${WHITE}${BOLD}for${RESET}" "${GREEN}${BOLD}Completing the Lab !!!${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#
