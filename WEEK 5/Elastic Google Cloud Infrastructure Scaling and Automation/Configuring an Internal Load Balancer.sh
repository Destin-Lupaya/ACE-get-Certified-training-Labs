# Configuring an Internal Load Balancer
# experiment
# Lab
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# 5 Credits
# show_chart
# Introductory
# Overview
# Google Cloud offers Internal Load Balancing for your TCP/UDP-based traffic. Internal Load Balancing enables you to run and scale your services behind a private load balancing IP address that is accessible only to your internal virtual machine instances.

# In this lab, you create two managed instance groups in the same region. Then you configure and test an internal load balancer with the instances groups as the backends, as shown in this network diagram:

# Network architecture diagram

# Objectives
# In this lab, you will learn how to perform the following tasks:

# Create internal traffic and health check firewall rules.
# Create a NAT configuration using Cloud Router.
# Configure two instance templates.
# Create two managed instance groups.
# Configure and test an internal load balancer.
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

# Task 1. Configure internal traffic and health check firewall rules
# Configure firewall rules to allow internal traffic connectivity from sources in the 10.10.0.0/16 range. This rule allows incoming traffic from any client located in the subnet.

# Health checks determine which instances of a load balancer can receive new connections. For HTTP load balancing, the health check probes to your load-balanced instances come from addresses in the ranges 130.211.0.0/22 and 35.191.0.0/16. Your firewall rules must allow these connections.

# Explore the my-internal-app network
# The network my-internal-app with subnet-a and subnet-b and firewall rules for RDP, SSH, and ICMP traffic have been configured for you.

# In the Cloud Console, on the Navigation menu (Navigation menu icon), click VPC network > VPC networks.
# Notice the my-internal-app network with its subnets: subnet-a and subnet-b.

# Each Google Cloud project starts with the default network. In addition, the my-internal-app network has been created for you as part of your network diagram.

# You will create the managed instance groups in subnet-a and subnet-b. Both subnets are in the Region region because an internal load balancer is a regional service. The managed instance groups will be in different zones, making your service immune to zonal failures.

# Create the firewall rule to allow traffic from any sources in the 10.10.0.0/16 range
# Create a firewall rule to allow traffic in the 10.10.0.0/16 subnet.

# On the Navigation menu (Navigation menu icon), click VPC network > Firewall.
# Notice the app-allow-icmp and app-allow-ssh-rdp firewall rules.

# These firewall rules have been created for you.

# Click Create Firewall Rule.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (type value or select option as specified)
# Name	fw-allow-lb-access
# Network	my-internal-app
# Targets	Specified target tags
# Target tags	backend-service
# Source filter	IPv4 ranges
# Source IPv4 ranges	10.10.0.0/16
# Protocols and ports	Allow all
# Note: Make sure to include the /16 in the Source IPv4 ranges.
# Click Create.
# Create the health check rule
# Create a firewall rule to allow health checks.

# On the Navigation menu (Navigation menu icon), click VPC network > Firewall.

# Click Create Firewall Rule.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (type value or select option as specified)
# Name	fw-allow-health-checks
# Network	my-internal-app
# Targets	Specified target tags
# Target tags	backend-service
# Source filter	IPv4 Ranges
# Source IPv4 ranges	130.211.0.0/22 and 35.191.0.0/16
# Protocols and ports	Specified protocols and ports
# Note: Make sure to include the /22 and /16 in the Source IPv4 ranges.
# For tcp, check the checkbox and specify port 80.
# Click Create.
# Click Check my progress to verify the objective.
# Configure internal traffic and health check firewall rules

# Task 2. Create a NAT configuration using Cloud Router
# The Google Cloud VM backend instances that you setup in Task 3 will not be configured with external IP addresses.

# Instead, you will setup the Cloud NAT service to allow these VM instances to send outbound traffic only through the Cloud NAT, and receive inbound traffic through the load balancer.

# Create the Cloud Router instance
# In the Cloud Console, on the Navigation menu (Navigation menu icon), click Network services > Cloud NAT.

# Click Get started.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (type value or select option as specified)
# Gateway name	nat-config
# Network	my-internal-app
# Region	Region
# Click Cloud Router, and select Create new router.

# For Name, type nat-router-Region.

# Click Create.

# In Create Cloud NAT gateway, click Create.

# Note: Wait until the NAT Gateway Status changes to Running before moving onto the next task.
# Click Check my progress to verify the objective.
# Create a NAT configuration using Cloud Router

# Task 3. Configure instance templates and create instance groups
# A managed instance group uses an instance template to create a group of identical instances. Use these to create the backends of the internal load balancer.

# This task has been performed for you at the start of this lab. You will need to SSH into each instance group VM and run the following command to setup the environment.

# On the Navigation menu, click Compute Engine > VM instances.
# Notice the instances that start with instance-group-1 and instance-group-2.

# Select the SSH button next to instance-group-1 to SSH into the VM.

# If prompted allow SSH-in-browser to connect to VMs, click Authorize.

# Run the following command to re-run the instance's startup script:

# sudo google_metadata_script_runner startup
# Copied!
# Repeat the previous steps for instance-group-2.

# Wait for both startup scripts to finish executing, then close the SSH terminal to each VM. The output of the startup script should state the following:

# Finished running startup scripts.
# Verify the backends
# Verify that VM instances are being created in both subnets and create a utility VM to access the backends' HTTP sites.

# On the Navigation menu, click Compute Engine > VM instances.
# Notice the instances that start with instance-group-1 and instance-group-2.

# These instances are in separate zones, and their internal IP addresses are part of the subnet-a and subnet-b CIDR blocks.

# Click Create Instance.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (type value or select option as specified)
# Name	utility-vm
# Region	Region
# Zone	Zone
# Series	E2
# Machine type	e2-medium (2 vCPU, 4 GB memory)
# Boot disk	Debian GNU/Linux 11 (bullseye)
# Click Advanced options.

# Click Networking.

# For Network interfaces, click the dropdown to edit.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (type value or select option as specified)
# Network	my-internal-app
# Subnetwork	subnet-a
# Primary internal IP	Ephemeral (Custom)
# Custom ephemeral IP address	10.10.20.50
# External IPv4 address	None
# Click Done.

# Click Create.

# Note that the internal IP addresses for the backends are 10.10.20.2 and 10.10.30.2.

# Note: If these IP addresses are different, replace them in the two curl commands below.
# Click Check my progress to verify the objective.
# Configure instance templates and create instance groups

# For utility-vm, click SSH to launch a terminal and connect.

# If prompted allow SSH-in-browser to connect to VMs, click Authorize.

# To verify the welcome page for instance-group-1-xxxx, run the following command:

# curl 10.10.20.2
# Copied!
# The output should look like this.

# Output:

# <h1>Internal Load Balancing Lab</h1><h2>Client IP</h2>Your IP address : 10.10.20.50<h2>Hostname</h2>Server Hostname:
#  instance-group-1-1zn8<h2>Server Location</h2>Region and Zone: us-central1-a
# To verify the welcome page for instance-group-2-xxxx, run the following command:
# curl 10.10.30.2
# Copied!
# The output should look like this.

# Output:

# <h1>Internal Load Balancing Lab</h1><h2>Client IP</h2>Your IP address : 10.10.20.50<h2>Hostname</h2>Server Hostname:
#  instance-group-2-q5wp<h2>Server Location</h2>Region and Zone: us-central1-b

# Which of these fields identify the location of the backend?

# Server Location

# Server Hostname

# Client IP

# Note: This will be useful when verifying that the internal load balancer sends traffic to both backends.
# Close the SSH terminal to utility-vm:
# exit
# Copied!
# Task 4. Configure the internal load balancer
# Configure the internal load balancer to balance traffic between the two backends (instance-group-1 in Zone and instance-group-2 in Zone), as illustrated in the network diagram.

# Network diagram

# Start the configuration
# In the Cloud Console, on the Navigation menu (Navigation menu icon), click Network Services > Load balancing.
# Click Create load balancer.
# Under Type of load balancer, select Network Load Balancer (TCP/UDP/SSL), click Next.
# For Proxy or passthrough, select Passthrough load balancer and click Next.
# For Public facing or internal, select Internal and click Next.
# Click Configure.
# For Name, type my-ilb.
# For Region, type Region.
# For Network, type my-internal-app.
# Configure the regional backend service
# The backend service monitors instance groups and prevents them from exceeding configured usage.

# Click Backend configuration.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (select option as specified)
# Instance group	instance-group-1 (Zone)
# Click Done.

# Click Add backend.

# For Instance group, select instance-group-2 (Zone).

# Click Done.

# For Health Check, select Create a health check.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (select option as specified)
# Name	my-ilb-health-check
# Protocol	TCP
# Port	80
# Check interval	10 sec
# Timeout	5 sec
# Healthy threshold	2
# Unhealthy threshold	3
# Note: Health checks determine which instances can receive new connections. This HTTP health check polls instances every 10 seconds, waits up to 5 seconds for a response, and treats 2 successful or 3 failed attempts as healthy threshold or unhealthy threshold, respectively.
# Click Save.
# Verify that there is a blue checkmark next to Backend configuration in the Cloud Console. If there isn't, double-check that you have completed all the steps above.
# Configure the frontend
# The frontend forwards traffic to the backend.

# Click Frontend configuration.

# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (type value or select option as specified)
# Subnetwork	subnet-b
# Internal IP > IP address	Create IP address
# Specify the following, and leave the remaining settings as their defaults.

# Property	Value (type value or select option as specified)
# Name	my-ilb-ip
# Static IP address	Let me choose
# Custom IP address	10.10.30.5
# Click Reserve.

# Under Ports, for Port number, type 80.

# Click Done.

# Review and create the internal load balancer
# Click Review and finalize.
# Review the Backend and Frontend.
# Click Create.
# Wait for the load balancer to be created before moving to the next task.
# Click Check my progress to verify the objective.
# Configure the Internal Load Balancer

# Task 5. Test the internal load balancer
# Verify that the my-ilb IP address forwards traffic to instance-group-1 in Zone and instance-group-2 in Zone.

# Access the internal load balancer
# On the Navigation menu, click Compute Engine > VM instances.
# For utility-vm, click SSH to launch a terminal and connect.
# If prompted allow SSH-in-browser to connect to VMs, click Authorize.
# To verify that the internal load balancer forwards traffic, run the following command:
# curl 10.10.30.5
# Copied!
# The output should look like this.

# Output:

# <h1>Internal Load Balancing Lab</h1><h2>Client IP</h2>Your IP address : 10.10.20.50<h2>Hostname</h2>Server Hostname:
#  instance-group-2-1zn8<h2>Server Location</h2>Region and Zone: us-central1-b
# Note: As expected, traffic is forwarded from the internal load balancer (10.10.30.5) to the backend.
# Run the same command a couple of times:
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# curl 10.10.30.5
# Copied!
# You should be able to see responses from instance-group-1 in Zone and instance-group-2 in Zone. If not, run the command again.

# Congratulations!
# In this lab, you created two managed instance groups in the Region region and a firewall rule to allow HTTP traffic to those instances and TCP traffic from the Google Cloud health checker. Then you configured and tested an internal load balancer for those instance groups.

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