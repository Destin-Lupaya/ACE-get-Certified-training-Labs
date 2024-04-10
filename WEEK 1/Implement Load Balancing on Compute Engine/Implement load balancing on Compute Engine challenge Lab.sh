# Implement Load Balancing on Compute Engine: Challenge Lab
# schedule
# 1 hour
# universal_currency_alt
# 1 Credit
# Lab instructions and tasks
# GSP313
# Overview
# Challenge scenario
# Task 1. Create a project jumphost instance
# Task 2. Set up an HTTP load balancer
# Congratulations!
# GSP313
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students who have enrolled in the Implement Load Balancing on Compute Engine skill badge. Are you ready for the challenge?

# Topics tested:

# Create an instance
# Create an HTTP(s) load balancer in front of two web servers
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

# student-00-22143ad4dc62@qwiklabs.net
# Copied!
# You can also find the Username in the Lab Details panel.

# Click Next.

# Copy the Password below and paste it into the Welcome dialog.

# JdlMubGWZ8bA
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
# Challenge scenario
# You have started a new role as a Junior Cloud Engineer for Jooli, Inc. You are expected to help manage the infrastructure at Jooli. Common tasks include provisioning resources for projects.

# You are expected to have the skills and knowledge for these tasks, so step-by-step guides are not provided.

# Some Jooli, Inc. standards you should follow:

# Create all resources in the default region or zone, unless otherwise directed. The default region is us-west4, and the default zone is us-west4-c.
# Naming normally uses the format team-resource; for example, an instance could be named nucleus-webserver1.
# Allocate cost-effective resource sizes. Projects are monitored, and excessive resource use will result in the containing project's termination (and possibly yours), so plan carefully. This is the guidance the monitoring team is willing to share: unless directed, use e2-micro for small Linux VMs, and use e2-medium for Windows or other applications, such as Kubernetes nodes.
# Your challenge
# As soon as you sit down at your desk and open your new laptop, you receive several requests from the Nucleus team. Read through each description, and then create the resources.

# Task 1. Create a project jumphost instance
# You will use this instance to perform maintenance for the project.

# Requirements:

# Name the instance nucleus-jumphost-852.
# Create the instance in the us-west4-c zone.
# Use an e2-micro machine type.
# Use the default image type (Debian Linux).
# Click Check my progress to verify the objective.
# Create a project jumphost instance

# Task 2. Set up an HTTP load balancer
# You will serve the site via nginx web servers, but you want to ensure that the environment is fault-tolerant. Create an HTTP load balancer with a managed instance group of 2 nginx web servers. Use the following code to configure the web servers; the team will replace this with their own configuration later.

# cat << EOF > startup.sh
# #! /bin/bash
# apt-get update
# apt-get install -y nginx
# service nginx start
# sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
# EOF
# Copied!
# Note: There is a limit to the resources you are allowed to create in your project, so do not create more than 2 instances in your managed instance group. If you do, the lab might end and you might be banned.
# You need to:

# Create an instance template. Don't use the default machine type. Make sure you specify e2-medium as the machine type.
# Create a managed instance group based on the template.
# Create a firewall rule named as accept-tcp-rule-600 to allow traffic (80/tcp).
# Create a health check.
# Create a backend service and add your instance group as the backend to the backend service group with named port (http:80).
# Create a URL map, and target the HTTP proxy to route the incoming requests to the default backend service.
# Create a target HTTP proxy to route requests to your URL map
# Create a forwarding rule.
# Note: You may need to wait for 5 to 7 minutes to get the score for this task.
# Click Check my progress to verify the objective.
# Create the website behind the HTTP load balancer

# Congratulations!
# In this lab, you created a project jumphost instance and an HTTP load balancer.

# Implement Load Balancing on Compute Engine

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated March 26, 2024

# Lab Last Tested March 26, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# Ready for more?
# Here's another lab we think you'll like.

RESOLUTION

https://github.com/quiccklabs/Labs_solutions/blob/abfb97e25e85694d40b10bc608c148a295eea078/Implement%20Load%20Balancing%20on%20Compute%20Engine%20Challenge%20Lab/quicklab.md




## ***```Implement Load Balancing on Compute Engine: Challenge Lab```***

### Export all the values carefully

```bash
export INSTANCE_NAME=

export ZONE=

export PORT=

export FIREWALL_NAME=
```
###
###

### ***NOW JUST COPY THE CODE AND PASTE ON YOUR CLOUD SHELL***
###
###

```bash 
curl -LO raw.githubusercontent.com/quiccklabs/Labs_solutions/master/Implement%20Load%20Balancing%20on%20Compute%20Engine%20Challenge%20Lab/quicklabgsp313.sh
sudo chmod +x quicklabgsp313.sh
./quicklabgsp313.sh
```

### Lab might task 10 - 15 mintues to updated the score so don't worry!

# [![Screenshot-2024-03-25-at-7-47-33-PM.png](https://i.postimg.cc/Vk2hdZfK/Screenshot-2024-03-25-at-7-47-33-PM.png)](https://postimg.cc/zyS7QjRh)


### Congratulations !!!