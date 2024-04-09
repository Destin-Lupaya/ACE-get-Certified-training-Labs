# Cloud SQL for MySQL: Qwik Start
# schedule
# 30 minutes
# universal_currency_alt
# 1 Credit
# GSP151
# Google Cloud self-paced labs logo

# Overview
# In this lab, you learn how to create and connect to a Cloud SQL for MySQL instance and perform basic SQL operations using the Cloud console and the mysql client.

# What you'll do
# Create a Cloud SQL instance
# Connect to the instance in Cloud Shell
# Create a database and upload data
# Setup and requirements
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

# "Username"
# Copied!
# You can also find the Username in the Lab Details panel.

# Click Next.

# Copy the Password below and paste it into the Welcome dialog.

# "Password"
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
# Activate Cloud Shell
# Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud. Cloud Shell provides command-line access to your Google Cloud resources.

# Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.
# When you are connected, you are already authenticated, and the project is set to your Project_ID, PROJECT_ID. The output contains a line that declares the Project_ID for this session:

# Your Cloud Platform project in this session is set to "PROJECT_ID"
# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# (Optional) You can list the active account name with this command:
# gcloud auth list
# Copied!
# Click Authorize.
# Output:

# ACTIVE: *
# ACCOUNT: "ACCOUNT"

# To set the active account, run:
#     $ gcloud config set account `ACCOUNT`
# (Optional) You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = "PROJECT_ID"
# Note: For full documentation of gcloud, in Google Cloud, refer to the gcloud CLI overview guide.
# Task 1. Create a Cloud SQL instance
# From the Navigation menu (Navigation menu icon) click on SQL.

# Click Create Instance.

# Choose MySQL database engine.

# Enter Instance ID as myinstance.

# In the password field click on the Generate link and the eye icon to see the password. Save the password to use in the next section.

# Select the database version as MySQL 8.

# For Choose a Cloud SQL edition, select Enterprise edition.

# For Preset choose Development (4 vCPU, 16 GB RAM, 100 GB Storage, Single zone).

# Warning: if you choose a preset larger than Development, your project will be flagged and your lab will be terminated.
# Set Region as <REGION>.

# Set the Multi zones (Highly available) > Primary Zone field as <ZONE>.

# Click CREATE INSTANCE.

# It might take a few minutes for the instance to be created. Once it is, you will see a green checkmark next to the instance name.

# Click on the Cloud SQL instance. The SQL Overview page opens.
# Test Completed Task

# Click Check my progress to verify your performed task. If you have successfully created a Cloud SQL instance, you will see an assessment score.

# Create a Cloud SQL instance
# Test your understanding

# Below is a true/false question to reinforce your understanding of this lab's concepts. Answer it to the best of your ability.


# Instance ID is used to uniquely identify your instance within the project.
# check
# True

# False

# Task 2. Connect to your instance using the mysql client in Cloud Shell
# In the Cloud Console, click the Cloud Shell icon in the upper right corner.
# Click Continue.

# At the Cloud Shell prompt, connect to your Cloud SQL instance by running the following:

# gcloud sql connect myinstance --user=root
# Copied!
# Click Authorize.

# Enter your root password when prompted. Note: The cursor will not move.

# Press the Enter key when you're done typing.

# You should now see the mysql prompt.

# Task 3. Create a database and upload data
# Create a SQL database called guestbook on your Cloud SQL instance:
# CREATE DATABASE guestbook;
# Copied!
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully created a custom database on the Cloud SQL instance, you will see an assessment score.

# Create a database.
# Insert the following sample data into the guestbook database:
# USE guestbook;
# CREATE TABLE entries (guestName VARCHAR(255), content VARCHAR(255),
#     entryID INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(entryID));
#     INSERT INTO entries (guestName, content) values ("first guest", "I got here!");
# INSERT INTO entries (guestName, content) values ("second guest", "Me too!");
# Copied!
# Now retrieve the data:
# SELECT * FROM entries;
# Copied!
# You should see:

# +--------------+-------------------+---------+
# | guestName    | content           | entryID |
# +--------------+-------------------+---------+
# | first guest  | I got here!       |       1 |
# | second guest | Me too!           |       2 |
# +--------------+-------------------+---------+
# 2 rows in set (0.00 sec)
# mysql>
# Congratulations!
# You have created a Cloud SQL for MySQL instance and database, and then uploaded data.

# Next steps / Learn more
# This lab is also part of a series of labs called Qwik Starts. These labs are designed to give you a little taste of the many features available with Google Cloud. Search for "Qwik Starts" in the Google Cloud Skills Boost catalog to find the next lab you'd like to take!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated April 5, 2024

# Lab Last Tested November 27, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# Ready for more?
# Here's another lab we think you'll like.