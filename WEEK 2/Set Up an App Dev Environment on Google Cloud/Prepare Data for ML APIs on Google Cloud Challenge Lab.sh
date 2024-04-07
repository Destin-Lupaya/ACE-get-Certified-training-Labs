# Prepare Data for ML APIs on Google Cloud: Challenge Lab
# schedule
# 1 hour 20 minutes
# universal_currency_alt
# 5 Credits
# GSP323
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students who have enrolled in the Prepare Data for ML APIs on Google Cloud skill badge. Are you ready for the challenge?

# Topics tested:

# Create a simple Dataproc job
# Create a simple DataFlow job
# Perform two Google machine learning backed API tasks
# Setup
# Before you click the Start Lab button
# Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click Start Lab, shows how long Google Cloud resources will be made available to you.

# This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

# To complete this lab, you need:

# Access to a standard internet browser (Chrome browser recommended).
# Note: Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.
# Time to complete the lab---remember, once you start, you cannot pause a lab.
# Note: If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.
# How to start your lab and sign in to the Google Cloud console
# Click the Start Lab button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is the Lab Details panel with the following:

# The Open Google Cloud console button
# Time remaining
# The temporary credentials that you must use for this lab
# Other information, if needed, to step through this lab
# Click Open Google Cloud console (or right-click and select Open Link in Incognito Window if you are running the Chrome browser).

# The lab spins up resources, and then opens another tab that shows the Sign in page.

# Tip: Arrange the tabs in separate windows, side-by-side.

# Note: If you see the Choose an account dialog, click Use Another Account.
# If necessary, copy the Username below and paste it into the Sign in dialog.

# student-03-bc25ff4c756a@qwiklabs.net
# Copied!
# You can also find the Username in the Lab Details panel.

# Click Next.

# Copy the Password below and paste it into the Welcome dialog.

# Of9UL8eTqUjB
# Copied!
# You can also find the Password in the Lab Details panel.

# Click Next.

# Important: You must use the credentials the lab provides you. Do not use your Google Cloud account credentials.
# Note: Using your own Google Cloud account for this lab may incur extra charges.
# Click through the subsequent pages:

# Accept the terms and conditions.
# Do not add recovery options or two-factor authentication (because this is a temporary account).
# Do not sign up for free trials.
# After a few moments, the Google Cloud console opens in this tab.

# Note: To view a menu with a list of Google Cloud products and services, click the Navigation menu at the top-left. Navigation menu icon
# Check project permissions
# Before you begin your work on Google Cloud, you need to ensure that your project has the correct permissions within Identity and Access Management (IAM).

# In the Google Cloud console, on the Navigation menu , select IAM & Admin > IAM.

# Confirm that the default compute Service Account {project-number}-compute@developer.gserviceaccount.com is present and has the editor and storage.admin role assigned. The account prefix is the project number, which you can find on Navigation menu > Cloud Overview > Dashboard.

# Note: If the account is not present in IAM or does not have the storage.admin role, follow the steps below to assign the required role.
# In the Google Cloud console, on the Navigation menu, click Cloud Overview > Dashboard.
# Copy the project number (e.g. 729328892908).
# On the Navigation menu, select IAM & Admin > IAM.
# At the top of the roles table, below View by Principals, click Grant Access.
# For New principals, type:
#   {project-number}-compute@developer.gserviceaccount.com
# Copied!
# Replace {project-number} with your project number.
# For Role, select Storage Admin.
# Click Save.
# Challenge scenario
# As a junior data engineer in Jooli Inc. and recently trained with Google Cloud and a number of data services you have been asked to demonstrate your newly learned skills. The team has asked you to complete the following tasks.

# You are expected to have the skills and knowledge for these tasks so don’t expect step-by-step guides.

# Task 1. Run a simple Dataflow job
# In this task, you use the Dataflow batch template Text Files on Cloud Storage to BigQuery under "Process Data in Bulk (batch)" to transfer data from a Cloud Storage bucket (gs://cloud-training/gsp323/lab.csv). The following table has the values you need to correctly configure the Dataflow job.

# You will need to make sure you have:

# Create a BigQuery dataset called lab_551 with a table called customers_159.
# Create a Cloud Storage Bucket called qwiklabs-gcp-04-f5c3001b210d-marking.
# Field	Value
# Cloud Storage input file(s)	gs://cloud-training/gsp323/lab.csv
# Cloud Storage location of your BigQuery schema file	gs://cloud-training/gsp323/lab.schema
# BigQuery output table	qwiklabs-gcp-04-f5c3001b210d:lab_551.customers_159
# Temporary directory for BigQuery loading process	gs://qwiklabs-gcp-04-f5c3001b210d-marking/bigquery_temp
# Temporary location	gs://qwiklabs-gcp-04-f5c3001b210d-marking/temp
# Optional Parameters > JavaScript UDF path in Cloud Storage	gs://cloud-training/gsp323/lab.js
# Optional Parameters > JavaScript UDF name	transform
# Optional Parameters > Machine Type	e2-standard-2
# Wait for the job to finish before trying to check your progress.

# Click Check my progress to verify the objective.
# Please create a correct BigQuery dataset.
# Run a simple Dataflow job
# Please create a correct BigQuery dataset.

# Task 2. Run a simple Dataproc job
# In this task, you run an example Spark job using Dataproc.

# Before you run the job, log into one of the cluster nodes and copy the /data.txt file into hdfs (use the command hdfs dfs -cp gs://cloud-training/gsp323/data.txt /data.txt).

# Run a Dataproc job using the values below.

# Field	Value
# Region	us-central1
# Job type	Spark
# Main class or jar	org.apache.spark.examples.SparkPageRank
# Jar files	file:///usr/lib/spark/examples/jars/spark-examples.jar
# Arguments	/data.txt
# Max restarts per hour	1
# Dataproc Cluster	Compute Engine
# Region	us-central1
# Machine Series	E2
# Manager Node	Set Machine Type to e2-standard-2
# Worker Node	Set Machine Type to e2-standard-2
# Max Worker Nodes	2
# Primary disk size	100 GB
# Internal IP only	Deselect "Configure all instances to have only internal IP addresses
# Wait for the job to finish before trying to check your progress.

# Click Check my progress to verify the objective.
# Run a simple Dataproc job

# Task 3. Use the Google Cloud Speech-to-Text API
# Use Google Cloud Speech-to-Text API to analyze the audio file gs://cloud-training/gsp323/task3.flac. Once you have analyzed the file, upload the resulting file to: gs://qwiklabs-gcp-04-f5c3001b210d-marking/task3-gcs-296.result
# Note: If you are facing issues in this task, you can refer to the respective lab for troubleshooting: Google Cloud Speech-to-Text API: Qwik Start
# Click Check my progress to verify the objective.
# Use the Google Cloud Speech-to-Text API

# Task 4. Use the Cloud Natural Language API
# Use the Cloud Natural Language API to analyze the sentence from text about Odin. The text you need to analyze is "Old Norse texts portray Odin as one-eyed and long-bearded, frequently wielding a spear named Gungnir and wearing a cloak and a broad hat." Once you have analyzed the text, upload the resulting file to: gs://qwiklabs-gcp-04-f5c3001b210d-marking/task4-cnl-661.result
# Note: If you are facing issues in this task, you can refer to the respective lab for troubleshooting: Cloud Natural Language API: Qwik Start
# Click Check my progress to verify the objective.
# Use the Cloud Natural Language API

# Congratulations!
# Congratulations! In this lab, you have demonstrated your skills by running a simple Dataflow job, a simple Dataproc job, and using the Google Cloud Speech-to-Text API and the Cloud Natural Language API.

# Prepare Data for ML APIs on Google Cloud Badge

# This self-paced lab is part of the Prepare Data for ML APIs on Google Cloud skill badge course. Completing this skill badge earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# This skill badge is part of Google Cloud’s Data Analyst and Data Engineer learning paths.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated March 25, 2024

# Lab Last Tested January 15, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# Ready for more?
# Here's another lab we think you'll like.

# Lab
# Cloud IAM: Qwik Start
# 0% complete

