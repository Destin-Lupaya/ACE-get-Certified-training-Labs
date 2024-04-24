# Configure Secure RDP using a Windows Bastion Host: Challenge Lab
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# No cost
# show_chart
# Intermediate
# GSP303
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students preparing for the Google Cloud Certified Professional Cloud Architect certification exam. Are you up for the challenge?

# Challenge scenario
# Your company has decided to deploy new application services in the cloud and your assignment is developing a secure framework for managing the Windows services that will be deployed. You will need to create a new VPC network environment for the secure production Windows servers.

# Production servers must initially be completely isolated from external networks and cannot be directly accessed from, or be able to connect directly to, the internet. In order to configure and manage your first server in this environment, you will also need to deploy a bastion host, or jump box, that can be accessed from the internet using the Microsoft Remote Desktop Protocol (RDP). The bastion host should only be accessible via RDP from the internet, and should only be able to communicate with the other compute instances inside the VPC network using RDP.

# Your company also has a monitoring system running from the default VPC network, so all compute instances must have a second network interface with an internal only connection to the default VPC network.

# Your challenge
# Deploy the secure Windows machine that is not configured for external communication inside a new VPC subnet, then deploy the Microsoft Internet Information Server on that secure machine. For the purposes of this lab, all resources should be provisioned in the following region and zone:

# Region: region
# Zone: zone
# Tasks
# The key tasks are listed below. Good luck!

# Create a new VPC network with a single subnet.
# Create a firewall rule that allows external RDP traffic to the bastion host system.
# Deploy two Windows servers that are connected to both the VPC network and the default network.
# Create a virtual machine that points to the startup script.
# Configure a firewall rule to allow HTTP access to the virtual machine.
# Task 1. Create the VPC network
# Create a new VPC network called securenetwork.
# Click Check my progress to verify the objective.
# Create the VPC network.

# Create a new VPC subnet inside securenetwork in the region region.
# Click Check my progress to verify the objective.
# Create the VPC subnet.

# Once the network and subnet have been configured, configure a firewall rule that allows inbound RDP traffic (TCP port 3389) from the internet to the bastion host. This rule should be applied to the appropriate host using network tags.
# Click Check my progress to verify the objective.
# Create the firewall rule.

# Task 2. Deploy your Windows instances and configure user passwords
# Deploy a Windows 2016 server (Server with Desktop Experience) instance called vm-securehost with two network interfaces in the zone zone.
# Configure the first network interface with an internal only connection to the newly created VPC subnet.
# The second network interface with an internal only connection to the default VPC network. This is the secure server.
# Click Check my progress to verify the objective.
# Create the vm-securehost instance.

# Deploy a second Windows 2016 server (Server with Desktop Experience) instance called vm-bastionhost with two network interfaces in the zone zone.
# Configure the first network interface to connect to the newly created VPC subnet with an ephemeral public (external NAT) address.
# The second network interface with an internal only connection to the default VPC network. This is the jump box or bastion host.
# Click Check my progress to verify the objective.
# Create the vm-bastionhost instance.

# Configure user passwords
# After your Windows instances have been created, create a user account and reset the Windows passwords in order to connect to each instance.
# NOTE: Copy the User name and Password of both instances for later use.
# The following gcloud command creates a new user called app-admin and resets the password for a host called vm-bastionhost located in the placeholder zone:
# gcloud compute reset-windows-password vm-bastionhost --user app_admin --zone "placeholder"
# Copied!
# The following gcloud command creates a new user called app-admin and resets the password for a host called vm-securehost located in the placeholder zone:
# gcloud compute reset-windows-password vm-securehost --user app_admin --zone "placeholder"
# Copied!
# Alternatively, you can force a password reset from the Compute Engine console. You will have to repeat this for the second host as the login credentials for that instance will be different.
# Task 3. Connect to the secure host and configure Internet Information Server
# To connect to the secure host, you have to RDP into the bastion host first. A Windows Compute Instance with an external address can be connected to via RDP using the RDP button that appears next to Windows Compute instances in the Compute Instance summary page.

# Once you are connected to the bastion host using RDP session then open a new RDP session inside the bastion host to connect to the internal private network address of the secure host.

# When connected to a Windows server, you can launch the Microsoft RDP client using the command mstsc.exe, or you can search for Remote Desktop Manager from the Start menu. This will allow you to connect from the bastion host to other compute instances on the same VPC even if those instances do not have a direct internet connection themselves.

# Once you connect to the vm-securehost machine through RDP then configure Internet Information Server.

# Once you log in to the vm-securehost machine, Open the Server Management window. And Configure the local server to Add roles and features.

# Use the Role-based or feature-based installation to add the Web Server (IIS) role.

# Click Check my progress to verify the objective.
# Configure the IIS web server software.

# Troubleshooting
# Unable to connect to the Bastion host: Make sure you are attempting to connect to the external address of the bastion host. If the address is correct you may not be able to connect to the bastion host if the firewall rule is not correctly configured to allow TCP port 3389 (RDP) traffic from the internet, or your own system's public IP-address, to the network interface on the bastion host that has an external address. Finally, you might have issues connecting via RDP if your own network does not allow access to internet addresses via RDP. If everything else is definitely OK, you will need to talk to the owner of the network you are connected to the internet with to open up port 3389 or connect using a different network.
# Unable to connect to the Secure Host from the Bastion host: If you can successfully connect to the bastion host but are unable to make the internal RDP connection using Microsoft Remote Desktop Connection application, check that both instances are connected to the same VPC network.
# Congratulations!
# Congratulations! In this lab, you configured a secure Windows server environment using a bastion host and a VPC network. You also configured a firewall rule to allow HTTP access to the virtual machine, and deployed the Microsoft Internet Information Server on the secure machine.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 9, 2024

# Lab Last Tested December 6, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.