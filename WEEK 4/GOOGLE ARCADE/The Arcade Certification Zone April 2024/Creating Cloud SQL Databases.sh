# Creating Cloud SQL Databases
# experiment
# Lab
# schedule
# 2 hours
# universal_currency_alt
# No cost
# show_chart
# Intermediate
# Overview
# In this lab, you use Cloud SQL to create databases that are managed by Google. You create both PostgreSQL and MySQL databases, and you connect to those databases using the Google Cloud CLI and from a virtual machine.

# Objectives
# In this lab, you learn how to perform the following tasks:

# Create a Cloud SQL PostgreSQL database.
# Connect to the database using the Cloud SDK.
# Create a Cloud SQL MySQL database using the CLI.
# Connect to the MySQL database from a virtual machine.
# Setup and requirements
# In this task, you use Qwiklabs and perform initialization steps for your lab.

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

# Task 1. Create a Cloud SQL PostgreSQL database
# Open a new web browser window and navigate to the Google Cloud Console (console.cloud.google.com). Use the project selector to choose the first project with a leading name of 'qwiklabs-gcp.'

# On the Navigation menu (Navigation menu icon), under Databases, click SQL.

# Click Create Instance and choose the PostgreSQL option.

# The Choose PostgreSQL button

# Name the instance ID postgresql-db and enter a password you can remember (or if you prefer, click the Generate button and copy the generated password to a text file).

# Under Choose a Cloud SQL edition select Enterprise.

# For Choose region and zonal availability set the region to region and select Multiple zones.

# Accept the rest of the defaults and click Create Instance.

# Note: It will take 5-10 minutes for your database to be ready.
# When the database is ready, click its name in the console to see its details.
# The SQL Instances page displaying the type, IP adresses, instance connection name, availability, location, and storage used details for postgresql-db

# Click Check my progress to verify the objective.
# Create a Cloud SQL PostgreSQL instance

# Task 2. Connect to the database using the Cloud SDK
# In the Connect to this instance section, click the Open Cloud Shell link.
# This opens Cloud Shell at the bottom of the window.

# If prompted, click Continue.
# The Connect to this instance dialog box displaying the Open Cloud Shell link

# Notice that the connection command is already entered at the prompt.

# Press ENTER to run the command and then click Authorize if prompted.
# It will take a little while for Cloud Shell's IP address to be allowlisted by the Cloud SQL network.

# When prompted, enter your password.

# To see the databases, type the following (a backslash and the lowercase letter L):

# \l
# Copied!
# To create a database, enter the following command:
# CREATE DATABASE petsdb;
# Copied!
# Confirm that it worked:
# \l
# Copied!
# To connect to the database, enter the following command, and then enter your password when prompted:
# \c petsdb;
# Copied!
# Create a table:
# CREATE TABLE Pets(ID INT PRIMARY KEY NOT NULL, Name TEXT, Breed TEXT);
# Copied!
# Add a record:
# INSERT INTO Pets (ID, Name, Breed) Values (1, 'Noir', 'Schnoodle');
# Copied!
# Run a query:
# SELECT * FROM Pets;
# Copied!
# To disconnect from the database, press CTRL+C and return to Cloud Shell.
# Click Check my progress to verify the objective.
# Create a database on Cloud SQL PostgreSQL instance

# Task 3. Create a Cloud SQL MySQL database using the CLI
# At the Cloud Shell command prompt, enter the following command to create a MySQL database using the CLI:
# gcloud sql instances create mysql-db --tier=db-n1-standard-1 --zone="ZONE"
# Copied!
# It will take a few minutes for the database to be ready.

# When the command completes, make note of the database server's primary IP address. Copy and paste this address in a text file, because you will need it later.

# Enter the following command to set the password for the root account. Make the password something you can remember.

# gcloud sql users set-password root --host=% --instance=mysql-db --password=your-password-here
# Copied!
# Enter the following command to connect to your Cloud SQL database using the CLI. It will take a little while for Cloud Shell's IP address to be allowlisted by the Cloud SQL network.
# gcloud sql connect mysql-db --user=root --quiet
# Copied!
# When prompted, enter your password.

# At the mysql prompt, type the following to ensure that it works:

# SHOW DATABASES;
# Copied!
# To return to the Cloud Shell command prompt, type exit.
# Click Check my progress to verify the objective.
# Create a Cloud SQL MySQL database using the CLI

# Task 4. Connect to the MySQL database from a virtual machine
# In Cloud Shell, enter the following command to create a Debian 11 virtual machine that you can use as a test client:
# gcloud compute instances create test-client  --zone="ZONE" --image-family=debian-11 --image-project=debian-cloud --machine-type=e2-micro
# Copied!
# When the command completes, copy the external IP address to the clipboard. You use this IP address to allow this machine to access to the database.

# Return to the Console and the Cloud SQL service, and then select the mysql-db database to see its details.

# Click Edit from the Overview list at the top of the page.

# Open the Connections section, and then click Add Network under Authorized networks. Name the new connection VM and paste the virtual machine's external IP address in the Network text box.

# Click Done, and then click Save.

# Once the update is complete, return to the Cloud Shell, enter the following command to SSH into the test client:

# gcloud compute ssh test-client --zone="ZONE"
# Copied!
# To install the MySQL client software on this machine, run the following commands:
# sudo apt-get update
# sudo apt-get install -y default-mysql-client
# Copied!
# To log on to the database server, use the command below but change the IP address to your Cloud SQL database's IP address. (You should have pasted this address in a text file earlier in the lab. If not, you can find it in the Cloud SQL console.)
# mysql --host=[Database Public IP Address] --user=root --password
# Copied!
# At the mysql prompt, type the following to ensure that it works:
# SHOW DATABASES;
# Copied!
# To return the the Cloud Shell command prompt, type exit.
# Click Check my progress to verify the objective.
# Connect to the MySQL database from a virtual machine

# Congratulations! You used Cloud SQL to create databases that are managed by Google. You created both PostgreSQL and MySQL databases, and you connected to those databases using the Google Cloud CLI and from a virtual machine.

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

