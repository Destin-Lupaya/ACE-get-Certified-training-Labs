# Deploy and Troubleshoot a Website: Challenge Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# GSP101
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students preparing for the Google Cloud Certified Professional Cloud Architect certification exam. Are you up for the challenge?

# Setup and requirements
# Before you click the Start Lab button
# Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click Start Lab, shows how long Google Cloud resources will be made available to you.

# This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

# To complete this lab, you need:

# Access to a standard internet browser (Chrome browser recommended).
# Note: Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.
# Time to complete the lab---remember, once you start, you cannot pause a lab.
# Note: If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.
# Challenge scenario
# Your company is ready to launch a brand new product! Because you are entering a totally new space, you have decided to deploy a new website as part of the product launch. The new site is complete, but the person who built the new site left the company before they could deploy it.

# Your challenge
# Your challenge is to deploy the site in the public cloud by completing the tasks below. You will use a simple Apache web server as a placeholder for the new site in this exercise. Good luck!

# Running a basic Apache web server
# A virtual machine instance on Compute Engine can be controlled like any standard Linux server. Deploy a simple Apache web server (a placeholder for the new product site) to learn the basics of running a server on a virtual machine instance.

# Task 1. Create a Linux VM instance
# Create a Linux virtual machine, name it Instance name and specify the zone as Compute zone.
# Task 2. Enable public access to VM instance
# While creating the Linux instance, make sure to apply the appropriate firewall rules so that potential customers can find your new product.
# Click Check my progress to verify the objective.

# Create a Compute Engine instance, add necessary firewall rules.
# Task 3. Running a basic Apache Web Server
# A virtual machine instance on Compute Engine can be controlled like any standard Linux server.

# Deploy a simple Apache web server (a placeholder for the new product site) to learn the basics of running a server on a virtual machine instance.
# Click Check my progress to verify the objective.

# Add Apache2 HTTP Server to your instance
# Task 4. Test your server
# Test that your instance is serving traffic on its external IP.
# You should see the "Hello World!" page (a placeholder for the new product site).

# Click Check my progress to verify the objective.

# Test your server
# Troubleshooting
# Receiving a Connection Refused error:
# Your VM instance is not publicly accessible because the VM instance does not have the proper tag that allows Compute Engine to apply the appropriate firewall rules, or your project does not have a firewall rule that allows traffic to your instance's external IP address.
# You are trying to access the VM using an https address. Check that your URL is http:// EXTERNAL_IP and not https:// EXTERNAL_IP.
# Congratulations!
# You have deployed a new website!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated March 25, 2024

# Lab Last Tested September 27, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION

# https://www.youtube.com/watch?v=_sk76bLQGxI


============================================================================================================================

export INSTANCE_NAME=

export ZONE=


curl -LO raw.githubusercontent.com/quiccklabs/Labs_solutions/master/Deploy%20and%20Troubleshoot%20a%20Website%20Challenge%20Lab/quicklabgsp101.sh

sudo chmod +x quicklabgsp101.sh

./quicklabgsp101.sh

============================================================================================================================

