# VPC Networks - Controlling Access
# schedule
# 1 hour
# universal_currency_alt
# 5 Credits
# Lab instructions and tasks
# GSP213
# Overview
# Setup and requirements
# Task 1. Create the web servers
# Task 2. Create the firewall rule
# Task 3. Explore the Network and Security Admin roles
# Congratulations!
# GSP213
# Google Cloud self-paced labs logo

# Overview
# In the real-world you need to protect sensitive data and ensure the continued availability of your web applications at all times. Learn how to use the Google Cloud VPC network to create a more secure, scalable, and manageable web server deployment within your Google Cloud environment.

# In this lab, you create two nginx web servers on the default VPC network and control external HTTP access to the web servers using tagged firewall rules. Then, you explore IAM roles and service accounts.

# Two web servers gives you redundancy - if one web server fails, the other can continue serving web traffic, preventing downtime.
# Tagged firewall rules provide granular control over which traffic is allowed to reach specific web servers.
# By assigning a service account permission to perform tasks, you're upholding the principal of least priviledge, keeping your Cloud resources safe.
# Objectives
# In this lab, you learn how to perform the following tasks:

# Create an nginx web server on a vpc network
# Create tagged firewall rules
# Create a service account with IAM roles
# Explore permissions for the Network Admin and Security Admin roles
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
# Task 1. Create the web servers
# In this section, you will create two web servers (blue and green) in the default VPC network. Then, you will install nginx on the web servers and modify the welcome page to distinguish the servers.

# Create the blue server
# Create the blue server with a network tag.

# In the Cloud console, navigate to Navigation menu (Navigation menu icon) > Compute Engine > VM instances.

# Click Create Instance.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	blue
# Region	REGION
# Zone	ZONE
# For more information on available regions and zones, in the Google Cloud Compute Engine Region and Zone guide, see the Available regions and zones section of the Compute Engine Guides.

# Click Advanced Options > Networking.

# For Network tags, type web-server.

# Note: Networks use network tags to identify which VM instances are subject to certain firewall rules and network routes. Later in this lab, you create a firewall rule to allow HTTP access for VM instances with the web-server tag. Alternatively, you could check the Allow HTTP traffic checkbox, which would tag this instance as http-server and create the tagged firewall rule for tcp:80 for you.
# Click Create.
# Test Completed Task
# Click Check my progress to verify your performed task. If you have completed the task successfully you will be granted an assessment score.

# Create the blue server.
# Create the green server
# Create the green server without a network tag.

# Still in the Console, on the VM instances page, click Create Instance.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	green
# Region	REGION
# Zone	ZONE
# Click Create.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have completed the task successfully you will be granted an assessment score.

# Create the green server.
# Install nginx and customize the welcome page
# Install nginx on both VM instances and modify the welcome page to distinguish the servers.

# Still in the VM instances dialog, for blue, click SSH to launch a terminal and connect.

# In the SSH terminal to blue, run the following command to install nginx:

# sudo apt-get install nginx-light -y
# Copied!
# Open the welcome page in the nano editor:
# sudo nano /var/www/html/index.nginx-debian.html
# Copied!
# Replace the <h1>Welcome to nginx!</h1> line with <h1>Welcome to the blue server!</h1>.
# Press CTRL+o, ENTER, CTRL+x.
# Verify the change:
# cat /var/www/html/index.nginx-debian.html
# Copied!
# The output should contain the following:

# <h1>Welcome to the blue server!</h1>
# <p>If you see this page, the nginx web server is successfully installed and
# working. Further configuration is required.</p>
# Close the SSH terminal to blue:
# exit
# Copied!
# Repeat the same steps for the green server:

# For green, click SSH to launch a terminal and connect.
# Install nginx:
# sudo apt-get install nginx-light -y
# Copied!
# Open the welcome page in the nano editor:
# sudo nano /var/www/html/index.nginx-debian.html
# Copied!
# Replace the <h1>Welcome to nginx!</h1> line with <h1>Welcome to the green server!</h1>.
# Press CTRL+o, ENTER, CTRL+x.
# Verify the change:
# cat /var/www/html/index.nginx-debian.html
# Copied!
# The output should contain the following:

# <h1>Welcome to the green server!</h1>
# <p>If you see this page, the nginx web server is successfully installed and
# working. Further configuration is required.</p>
# Close the SSH terminal to green:
# exit
# Copied!
# Test Completed Task
# Click Check my progress to verify your performed task. If you have completed the task successfully you will be granted an assessment score.

# Install Nginx and customize the welcome page.
# Task 2. Create the firewall rule
# Create the tagged firewall rule and test HTTP connectivity.

# Create the tagged firewall rule
# Create a firewall rule that applies to VM instances with the web-server network tag.

# In the Cloud console, navigate to Navigation menu (Navigation menu icon) > VPC network > Firewall.
# Notice the default-allow-internal firewall rule.
# Note: The default-allow-internal firewall rule allows traffic on all protocols/ports within the default network. You want to create a firewall rule to allow traffic from outside this network to only the blue server, by using the network tag web-server.
# Click Create Firewall Rule.

# Set the following values, leave all other values at their defaults.

# Property	Value (type value or select option as specified)
# Name	allow-http-web-server
# Network	default
# Targets	Specified target tags
# Target tags	web-server
# Source filter	IPv4 Ranges
# Source IPv4 ranges	0.0.0.0/0
# Protocols and ports	Specified protocols and ports, and then check tcp, type: 80; and check Other protocols, type: icmp.
# Note: Make sure to include the /0 in the Source IP ranges to specify all networks.
# Click Create.
# Test Completed Task
# Click Check my progress to verify your performed task. If you have completed the task successfully you will be granted an assessment score.

# Create the tagged firewall rule.
# Create a test-vm
# Create a test-vm instance using the Cloud Shell command line.

# Open a new Cloud Shell terminal.

# Run the following command to create a test-vm instance, in the ZONE zone:

# gcloud compute instances create test-vm --machine-type=e2-micro --subnet=default --zone=ZONE
# Copied!
# The output should look like this:

# NAME     ZONE           MACHINE_TYPE  PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
# test-vm  ZONE  e2-micro                   10.142.0.4   35.237.134.68  RUNNING
# Note: You can easily create VM instances from the Console or the gcloud command line.
# Test Completed Task
# Click Check my progress to verify your performed task. If you have completed the task successfully you will be granted an assessment score.

# Create a test-vm.
# Test HTTP connectivity
# From the test-vm, curl the internal and external IP addresses of blue and green.

# In the Console, navigate to Navigation menu (Navigation menu icon) > Compute Engine > VM instances.
# Note the internal and external IP addresses of blue and green.
# For test-vm, click SSH to launch a terminal and connect.
# To test HTTP connectivity to blue's internal IP, run the following command, replacing blue's internal IP:
# curl <Enter blue's internal IP here>
# Copied!
# You should see the Welcome to the blue server! header.

# To test HTTP connectivity to green's internal IP, run the following command, replacing green's internal IP:
# curl -c 3 <Enter green's internal IP here>
# Copied!
# You should see the Welcome to the green server! header.

# Note: You are able to HTTP access both servers using their internal IP addresses. The connection on tcp:80 is allowed by the default-allow-internal firewall rule, as test-vm is on the same VPC network as the web server's default network.
# To test HTTP connectivity to blue's external IP, run the following command, replacing blue's external IP:
# curl <Enter blue's external IP here>
# Copied!
# You should see the Welcome to the blue server! header.

# To test HTTP connectivity to green's external IP, run the following command, replacing green's external IP:
# curl -c 3 <Enter green's external IP here>
# Copied!
# Note: This should not work! The request hangs.
# Press CTRL+c to stop the HTTP request.
# Note: As expected, you are only able to HTTP access the external IP address of the blue server as the allow-http-web-server only applies to VM instances with the web-server tag.
# You can verify the same behavior from your browser by opening a new tab and navigating to http://[External IP of server].

# Task 3. Explore the Network and Security Admin roles
# Cloud IAM lets you authorize who can take action on specific resources, giving you full control and visibility to manage cloud resources centrally. The following roles are used in conjunction with single-project networking to independently control administrative access to each VPC Network:

# Network Admin: Permissions to create, modify, and delete networking resources, except for firewall rules and SSL certificates.
# Security Admin: Permissions to create, modify, and delete firewall rules and SSL certificates.
# Explore these roles by applying them to a service account, which is a special Google account that belongs to your VM instance, instead of to an individual end user. Rather than creating a new user, you will authorize test-vm to use the service account to demonstrate the permissions of the Network Admin and Security Admin roles.

# Verify current permissions
# Currently, test-vm uses the Compute Engine default service account, which is enabled on all instances created by Cloud Shell command-line and the Cloud Console.

# Try to list or delete the available firewall rules from test-vm.

# Return to the SSH terminal of the test-vm instance.
# Try to list the available firewall rules:
# gcloud compute firewall-rules list
# Copied!
# The output should look like this:

# ERROR: (gcloud.compute.firewall-rules.list) Some requests did not succeed:
#  - Insufficient Permission
# Note: This should not work!
# Try to delete the allow-http-web-server firewall rule:
# gcloud compute firewall-rules delete allow-http-web-server
# Copied!
# Enter Y, if asked to continue.
# The output should look like this:

# ERROR: (gcloud.compute.firewall-rules.delete) Could not fetch resource:
#  - Insufficient Permission
# Note: This should not work!
# Note: The Compute Engine default service account does not have the right permissions to allow you to list or delete firewall rules. The same applies to other users who do not have the right roles.
# Create a service account
# Create a service account and apply the Network Admin role.

# In the Console, navigate to Navigation menu (Navigation menu icon) > IAM & admin > Service Accounts.

# Notice the Compute Engine default service account.

# Click Create service account.

# Set the Service account name to Network-admin and click CREATE AND CONTINUE.

# For Select a role, select Compute Engine > Compute Network Admin and click CONTINUE then click DONE.

# After creating the service account Network-admin, click on the three dots at the right corner and click Manage Keys in the dropdown, then click on Add Key and select Create new key from the dropdown. Click Create to download your JSON output.

# Click Close.

# A JSON key file download to your local computer. Find this key file, you will upload it into the VM in a later step.

# Rename the JSON key file on your local machine to credentials.json

# Test Completed Task
# Click Check my progress to verify your performed task. If you have completed the task successfully you will be granted an assessment score.

# Create a Network-admin service account.
# Authorize test-vm and verify permissions
# Authorize test-vm to use the Network-admin service account.


# The Network Admin role provides permissions to:

# Modify the available firewall rules

# List the available firewall rules

# Neither list, create, modify, or delete the available firewall rules

# Create a firewall rules

# Delete the available firewall rules

# Return to the SSH terminal of the test-vm instance.
# To upload credentials.json through the SSH VM terminal, click on the Upload file icon in the upper-right corner.
# Select credentials.json and upload it.
# Click Close in the File Transfer window.
# Note: If prompted, click Retry on the Connection via Cloud Identity-Aware Proxy Failed dialog and re-upload the file.
# Authorize the VM with the credentials you just uploaded:
# gcloud auth activate-service-account --key-file credentials.json
# Copied!
# Note: The image you are using has the Cloud SDK pre-installed; therefore, you don’t need to initialize the Cloud SDK. If you are attempting this lab in a different environment, make sure you have followed the procedures regarding installing the Cloud SDK.
# Try to list the available firewall rules:
# gcloud compute firewall-rules list
# Copied!
# The output should look like this:

# NAME                    NETWORK  DIRECTION  PRIORITY  ALLOW     DENY
# allow-http-web-server   default  INGRESS    1000      tcp:80
# default-allow-icmp      default  INGRESS    65534     icmp
# default-allow-internal  default  INGRESS    65534     all
# default-allow-rdp       default  INGRESS    65534     tcp:3389
# default-allow-ssh       default  INGRESS    65534     tcp:22
# This should work!

# Try to delete the allow-http-web-server firewall rule:
# gcloud compute firewall-rules delete allow-http-web-server
# Copied!
# Enter Y, if asked to continue.
# The output should look like this:

# ERROR: (gcloud.compute.firewall-rules.delete) Could not fetch resource:
#  - Required 'compute.firewalls.delete' permission for 'projects/[PROJECT_ID]/global/firewalls/allow-http-web-server'
# Note: This should not work!
# Note: As expected, the Network Admin role has permissions to list but not modify/delete firewall rules.
# Update service account and verify permissions
# Update the Network-admin service account by providing it the Security Admin role.


# The Security Admin role, provides permissions to:

# Modify the available firewall rules

# List the available firewall rules

# Delete the available firewall rules

# Create a firewall rules

# Neither list, create, modify, or delete the available firewall rules

# In the Console, navigate to Navigation menu (Navigation menu icon) > IAM & admin > IAM.

# Find the Network-admin account. Focus on the Name column to identify this account.

# Click on the pencil icon for the Network-admin account.

# Change Role to Compute Engine > Compute Security Admin.

# Click Save.

# Return to the SSH terminal of the test-vm instance.

# Try to list the available firewall rules:

# gcloud compute firewall-rules list
# Copied!
# The output should look like this:

# NAME                    NETWORK  DIRECTION  PRIORITY  ALLOW     DENY
# allow-http-web-server   default  INGRESS    1000      tcp:80
# default-allow-icmp      default  INGRESS    65534     icmp
# default-allow-internal  default  INGRESS    65534     all
# default-allow-rdp       default  INGRESS    65534     tcp:3389
# default-allow-ssh       default  INGRESS    65534     tcp:22
# This should work!

# Try to delete the allow-http-web-server firewall rule:
# gcloud compute firewall-rules delete allow-http-web-server
# Copied!
# Enter Y, if asked to continue.
# The output should look like this:

# Deleted [https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-00e186e4b1cec086/global/firewalls/allow-http-web-server].
# This should work!

# Note: As expected, the Security Admin role has permissions to list and delete firewall rules.
# Verify the deletion of the firewall rule
# Verify that you can no longer HTTP access the external IP of the blue server, because you deleted the allow-http-web-server firewall rule.

# Return to the SSH terminal of the test-vm instance.
# To test HTTP connectivity to blue's external IP, run the following command, replacing blue's external IP:
# curl -c 3 <Enter blue's external IP here>
# Copied!
# Note: This should not work!
# Press CTRL+c to stop the HTTP request.
# Note: Provide the Security Admin role to the right user or service account to avoid any unwanted changes to your firewall rules!
# Congratulations!
# In this lab, you created two nginx web servers and controlled external HTTP access using a tagged firewall rule. Then, you created a service account with first the Network Admin role and used the Security Admin role to explore the different permissions of these roles.

# Next steps / Learn more
# Learn more about service acconts and roles with this lab:

# Service Accounts and Roles: Fundamentals
# For information on the basic concepts of Google Cloud Identity and Access Management, see Google Cloud Identity and Access Management Overview

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 2, 2024

# Lab Last Tested September 19, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

