# Securing Virtual Machines using BeyondCorp Enterprise (BCE)
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# No cost
# GSP1036
# Google Cloud self-paced labs logo

# Overview
# In this lab, you will explore how you can use BeyondCorp Enterprise (BCE) and Identity-Aware Proxy (IAP) TCP forwarding to enable administrative access to VM instances that do not have external IP addresses or do not permit direct access over the internet.

# You can read more about BeyondCorp Enterprise (BCE) and the zero trust security model at the following cloud documentation site.

# What You’ll Do
# Enable IAP TCP forwarding in your Google Cloud project
# Create Linux and Windows Instances
# Test connectivity to your Linux and Windows instances
# Configure the required firewall rules for BCE
# Grant permissions to use IAP TCP forwarding
# Demonstrate tunneling using SSH and RDP connections
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
# You will need a RDP client pre-installed so that you can connect and test Windows instances.

# Task 1. Enable IAP TCP forwarding in your Google Cloud project
# Open the Navigation Menu and select APIs and Services > Library.

# Search for IAP and select Cloud Identity-Aware Proxy API.

# Click Enable.

# Cloud Identity-Aware Proxy API

# Task 2. Create Linux and Windows Instances
# You will create three instances for this lab

# Two for demonstration purposes (Linux and Windows)
# One for testing connectivity (Windows)
# Open the Navigation Menu and select Compute Engine

# To create the Linux Demo VM. Click Create instance and use the following configuration to create a VM. Leave the rest as default.

# Name: linux-iap

# Zone: Zone

# Click on Advanced options and select Networking. Under network interfaces click the defult network to edit. Then change the External IPV4 address to None.

# Click Done.

# network interface fillout out

# Then click create.

# This VM will be referred to as linux-iap

# To create the Windows Demo VM. Click Create instance and use the following configuration to create a VM. Leave the rest as default.

# Name: windows-iap

# Zone: Zone

# Under the boot disk section, click on Change

# For the OS, select the following:

# Public Images > Operating system > Windows Server
# Version > Windows Server 2016 Datacenter
# Windows Version Select

# Click Select.

# Click on Advanced options and select Networking. Under network interfaces click the defult network to edit. Then change the External IPV4 address to None. Click Done.

# Then click create.

# This VM will be referred to as windows-iap

# To create the Windows Connectivity VM. Click Create instance and use the following configuration to create a VM. Leave the rest as default.

# Name: windows-connectivity

# Zone: Zone

# Under the boot disk section, click on Change

# For the OS, set the following on the Custom Images tab:

# Source project for images: Qwiklabs Resources
# Image: iap-desktop-v001
# Click Select.

# For access scopes, select Allow full access to all Cloud APIs

# Do not disable external IP for this instance

# Then click create.

# This VM will be referred to as windows-connectivity

# Check if all 3 instances have been created
# Test connectivity to your Linux and Windows instances
# After the instances are created, You will test access to linux-iap and windows-iap to ensure that you aren’t able to access the VMs without the external IP.

# For linux-iap click on the SSH button to get into the machine and ensure you get a message similar to the following.

# linux connection failed

# For windows-iap: click the RDP button and ensure you get a message similar to the following:

# windows connection failed

# The following steps for configuring and using IAP will allow you to connect to the instances that don’t have external IPs.
# Task 3. Configure the required firewall rules for BCE
# Open the Navigation Menu and select VPC Network > Firewall and click Create Firewall Rule

# Configure the following settings:

# Name: allow-ingress-from-iap

# Direction of traffic: Ingress

# Target: All instances in the network

# Source filter: IPv4 Ranges

# Source IPv4 Ranges: 35.235.240.0/20

# Protocols and ports: Select TCP and enter 22, 3389 to allow both SSH and RDP respectively

# Click CREATE to create the firewall rule.
# Check proper firewall rules have been created.
# Task 4. Grant permissions to use IAP TCP forwarding
# Follow the following steps to configure the iap.tunnelResourceAccessor role by VM.
# Open Navigation Menu and select Security > Identity-Aware Proxy, switch to the SSH and TCP Resources tab (safely ignore the Oauth Consent screen error in the HTTPS section).

# Select the linux-iap and windows-iap VM instances

# Click Add principal

# Enter in the service account associated with your Windows connectivity VM. This should be of the form Project_number-compute@developer.gserviceaccount.com.

# Select Cloud IAP > IAP-Secured Tunnel User for the role.

# Click SAVE.

# From the top-right of the page click the "S" icon to open your profile and copy the email of the student account

# Click Add principal again to add your student account

# Enter in the student account. You can copy this value from the lab details pane.

# Select Cloud IAP > IAP-Secured Tunnel User for the role.

# Click SAVE.

# The IAP-Secured Tunnel User role will grant the windows-connectivity instance to connect to resources using IAP. Adding the student account will help verify the step was done correctly.

# Add Principals

# Check that IAM roles have been set for the service account.
# Task 5. Use IAP Desktop to Connect to the Windows and Linux Instances
# It is possible to use IAP Desktop to connect to instances using a graphical user interface from an instance with Windows Desktop. You can read more about IAP Desktop on the GitHub repository hosting the download for the tool.

# To use IAP Desktop to connect to the instances in this lab:

# RDP to the windows-connectivity instance by downloading the RDP file. Go to the Compute Engine > VM Instances page. Select the down arrow next to the windows-connectivity instance on the Compute Engine landing page and download the file.

# Open the RDP file to connect to the instance via Remote Desktop Protocol. You will use the credentials below to connect to the instance once prompted:

# Username: student
# Password: Learn123!
# Once connected to the windows-connectivity instance, locate and open the IAP Desktop application on the desktop of the instance.

# Once the application opens, click on the sign in with Google button to log in. Use the username and password provided in the lab console to authenticate with IAP Desktop. Make sure you select the option to "See, edit, configure and delete Google Cloud data."

# oauth_permissions.png

# You will need to add the project to connect to Compute Engine instances within IAP Desktop after authentication. Select the lab project associated with your lab instance:
# add_project.png

# Double click on the windows-iap instance in the IAP Desktop application to log into the the instance.

# You may be prompted to provide credentials for the instance the first time you try to connect to it through IAP Desktop. Select "Generate new credentials" the first time logging into the instance.
# credentials.png

# After the credentials are created you will be taken to the desktop of the windows-iap instance and can see the end user experience.
# windows_iap.png

# Task 6. Demonstrate tunneling using SSH and RDP connections
# You will testconnectivity to the RDP instance using an RDP client. This is because you need to connect to the instance via an IAP tunnel locally.

# Go to the Compute Engine > VM Instances page.

# For the windows-connectivity instance click the down arrow and select Set windows password. Copy the password and save it.

# Then click down arrow next to connect and click download the RDP file. Open the RDP file with your client and enter in your password.

# Once you have connected to the windows-connectivity instance. Open the Google Cloud Shell SDK:
# 7
# Now from the command line enter the following command to see if you can connect to the linux-iap instance:

# gcloud compute ssh linux-iap
# Copied!
# Click Y when promopted to continue and to select the zone.

# Make sure that you select the right zone for the instance when prompted.

# Then Accept the Putty security alert.

# You should receive a message that no external IP address was found and that it will use IAP tunneling.
# Output showing external IP address not found

# Update Putty Settings to allow Tunnel connections locally. Click the top left corner of the Putty Window > Change Settings.

# Putty Settings

# Allow local ports to accept connections from other hosts by checking the checkbox "Local ports accept connections from other hosts". Tunnel Settings

# Close the Putty session and click Apply. Use the following command to create an encrypted tunnel to the RDP port of the VM instance:
# gcloud compute start-iap-tunnel windows-iap 3389 --local-host-port=localhost:0  --zone=Zone
# Copied!


# Once you see the message about “Listening on port [XXX].” Copy the tunnel port number.

# Return to the Google Cloud Console and go to the Compute Engine > VM Instances page.
# Set and copy the password for the windows-iap instance.

# Return to the RDP session now.

# Leave gcloud running and open the Microsoft Windows Remote Desktop Connection app.

# Enter the tunnel endpoint where the endpoint is the tunnel port number from the earlier step like so:

# localhost:endpoint

# 6
# Click Connect.

# Then enter the previous credentials you copied earlier. You will be successfully RDPed into your instance now!

# If prompted click Yes.

# Windows 10 RDP instance page

# You were able to access the instance even without an external IP address using IAP
# Confirm VM is accessible via IAP enabled SA
# Congratulations! You were able to successfully connect to both instances using IAP.
# Congratulations
# In this lab, you deployed 2 VM's, windows-iap and linux-iap, without IP addresses. Then you configured an IAP tunnel and were able to access both instances using a third VM, windows-connectivity.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 2, 2024

# Lab Last Tested December 5th, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.