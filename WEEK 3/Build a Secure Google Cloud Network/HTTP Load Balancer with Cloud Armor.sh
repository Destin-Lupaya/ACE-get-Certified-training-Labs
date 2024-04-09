# HTTP Load Balancer with Cloud Armor
# schedule
# 1 hour
# universal_currency_alt
# 5 Credits
# GSP215
# Google Cloud self-paced labs logo

# Overview
# Google Cloud HTTP(S) load balancing is implemented at the edge of Google's network in Google's points of presence (POP) around the world. User traffic directed to an HTTP(S) load balancer enters the POP closest to the user and is then load balanced over Google's global network to the closest backend that has sufficient capacity available.

# Cloud Armor IP allowlist/denylist enable you to restrict or allow access to your HTTP(S) load balancer at the edge of the Google Cloud, as close as possible to the user and to malicious traffic. This prevents malicious users or traffic from consuming resources or entering your Virtual Private Cloud (VPC) networks.

# In this lab, you configure an HTTP Load Balancer with global backends, as shown in the diagram below. Then, you stress test the Load Balancer and denylist the stress test IP with Cloud Armor.

# Network diagram that illustrates load balancing

# Objectives
# In this lab, you learn how to perform the following tasks:

# Create HTTP and health check firewall rules
# Configure two instance templates
# Create two managed instance groups
# Configure an HTTP Load Balancer with IPv4 and IPv6
# Stress test an HTTP Load Balancer
# Denylist an IP address to restrict access to an HTTP Load Balancer
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
# Task 1. Configure HTTP and health check firewall rules
# Configure firewall rules to allow HTTP traffic to the backends and TCP traffic from the Google Cloud health checker.

# Create the HTTP firewall rule
# Create a firewall rule to allow HTTP traffic to the backends.

# In the Cloud console, navigate to Navigation menu (Navigation menu icon) > VPC network > Firewall policies.

# Notice the existing ICMP, internal, RDP, and SSH firewall rules.

# Each Google Cloud project starts with the default network and these firewall rules.

# Click Create Firewall Rule.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	default-allow-http
# Network	default
# Targets	Specified target tags
# Target tags	http-server
# Source filter	IPv4 Ranges
# Source IPv4 ranges	0.0.0.0/0
# Protocols and ports	Specified protocols and ports, and then check TCP, type: 80
# Make sure to include the /0 in the Source IPv4 ranges to specify all networks.

# Click Create.
# Create the health check firewall rules
# Health checks determine which instances of a load balancer can receive new connections. For HTTP load balancing, the health check probes to your load balanced instances come from addresses in the ranges 130.211.0.0/22 and 35.191.0.0/16. Your firewall rules must allow these connections.

# Still in the Firewall policies page, click Create Firewall Rule.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	default-allow-health-check
# Network	default
# Targets	Specified target tags
# Target tags	http-server
# Source filter	IPv4 Ranges
# Source IPv4 ranges	130.211.0.0/22, 35.191.0.0/16
# Protocols and ports	Specified protocols and ports, and then check TCP
# Note: Make sure to enter the two Source IPv4 ranges one-by-one and press SPACE in between them.
# Click Create.

# Click Check my progress to verify the objective.
# Configure HTTP and health check firewall rules

# Task 2. Configure instance templates and create instance groups
# A managed instance group uses an instance template to create a group of identical instances. Use these to create the backends of the HTTP Load Balancer.

# Configure the instance templates
# An instance template is an API resource that you use to create VM instances and managed instance groups. Instance templates define the machine type, boot disk image, subnet, labels, and other instance properties.

# Create one instance template for Region 1 and one for Region 2.

# In the Cloud console, go to Navigation menu (Navigation menu icon) > Compute Engine > Instance templates, and then click Create instance template.
# For Name, type Region 1-template.
# NOTE: An instance template name can not have "space" in the name, remove any extra space if required.
# For Series, select E2.

# For Machine Type, select e2-micro.

# Click Advanced Options.

# Click Networking. Set the following value and leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Network tags	http-server
# Click default under Network interfaces. Set the following values and leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Network	default
# Subnetwork	default Region 1
# Click Done.

# The network tag http-server ensures that the HTTP and Health Check firewall rules apply to these instances.

# Click the Management tab.

# Under Metadata, click + ADD ITEM and specify the following:

# Key	Value
# startup-script-url	gs://cloud-training/gcpnet/httplb/startup.sh
# The startup-script-url specifies a script that executes when instances are started. This script installs Apache and changes the welcome page to include the client IP and the name, region, and zone of the VM instance. Feel free to explore this script.

# Click Create.
# Wait for the instance template to be created.
# Now create another instance template for subnet-b by copying Region 1-template:

# Click on Region 1-template and then click on the +CREATE SIMILAR option from the top.
# For Name, type Region 2-template.
# Click Advanced Options.
# Click Networking.
# Ensure http-server is added as a network tag.
# In Network interfaces, for Subnetwork, select default (Region 2).
# Click Done.
# Click Create.
# Create the managed instance groups
# Create a managed instance group in Region 1 and one in Region 2.

# Still in Compute Engine, click Instance groups in the left menu.

# Click Create instance group.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	Region 1-mig (if required, remove extra space from the name)
# Location	Multiple zones
# Region	Region 1
# Instance template	Region 1-template
# Minimum number of instances	1
# Maximum number of instances	2
# Autoscaling signals > Click dropdown > Signal type	CPU utilization
# Target CPU utilization	80, click Done.
# Initialization period	45
# Managed instance groups offer autoscaling capabilities that allow you to automatically add or remove instances from a managed instance group based on increases or decreases in load. Autoscaling helps your applications gracefully handle increases in traffic and reduces cost when the need for resources is lower. You just define the autoscaling policy and the autoscaler performs automatic scaling based on the measured load.

# Click Create.
# Now repeat the same procedure to create a second instance group for Region 2-mig in Region 2:

# Click Create Instance group.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	Region 2-mig
# Location	Multiple zones
# Region	Region 2
# Instance template	Region 2-template
# Minimum number of instances	1
# Maximum number of instances	2
# Autoscaling signals > Click dropdown > Signal type	CPU utilization
# Target CPU utilization	80, click Done.
# Initialization period	45
# Click Create.

# Click Check my progress to verify the objective.
# Configure instance templates and instance group

# Verify the backends
# Verify that VM instances are being created in both regions and access their HTTP sites.

# Still in Compute Engine, click VM instances in the left menu.

# Notice the instances that start with Region 1-mig and Region 2-mig.

# These instances are part of the managed instance groups.

# Click on the External IP of an instance of Region 1-mig.

# You should see the Client IP (your IP address), the Hostname (starts with Region 1-mig) and the Server Location (a zone in Region 1).

# Click on the External IP of an instance of Region 2-mig.

# You should see the Client IP (your IP address), the Hostname (starts with Region 2-mig) and the Server Location (a zone in Region 2).

# Note: The Hostname and Server Location identifies where the HTTP Load Balancer sends traffic.

# Which of these fields identify the region of the backend?

# Server Location

# Hostname

# Client IP

# Task 3. Configure the HTTP Load Balancer
# Configure the HTTP Load Balancer to balance traffic between the two backends (Region 1-mig in Region 1 and Region 2-mig in Region 2), as illustrated in the network diagram:

# Network diagram that illustrates load balancing

# Start the configuration
# In the Cloud console, click Navigation menu (Navigation menu icon) > click Network Services > Load balancing.

# click Create load balancer.

# Under Application Load Balancer HTTP(S), click Next.

# For Public facing or internal, select Public faucet (external) and click Next.

# For Global or single region deployment, select Best for global workloads and click Next.

# For Create load balancer, click Configure

# Set the New HTTP(S) Load Balancer Name to http-lb.

# Configure the frontend
# The host and path rules determine how your traffic will be directed. For example, you could direct video traffic to one backend and static traffic to another backend. However, you are not configuring the Host and path rules in this lab.

# Click on Frontend configuration.

# Specify the following, leaving all other values at their defaults:

# Property	Value (type value or select option as specified)
# Protocol	HTTP
# IP version	IPv4
# IP address	Ephemeral
# Port	80
# Click Done.

# Click Add Frontend IP and port.

# Specify the following, leaving all other values at their defaults:

# Property	Value (type value or select option as specified)
# Protocol	HTTP
# IP version	IPv6
# IP address	Auto-allocate
# Port	80
# Click Done.

# HTTP(S) load balancing supports both IPv4 and IPv6 addresses for client traffic. Client IPv6 requests are terminated at the global load balancing layer, then proxied over IPv4 to your backends.

# Configure the backend
# Backend services direct incoming traffic to one or more attached backends. Each backend is composed of an instance group and additional serving capacity metadata.

# Click on Backend configuration.

# For Backend services & backend buckets, click Create a backend service.

# Set the following values, leave all other values at their defaults:

# Property	Value (select option as specified)
# Name	http-backend
# Instance group	Region 1-mig
# Port numbers	80
# Balancing mode	Rate
# Maximum RPS	50
# Capacity	100
# This configuration means that the load balancer attempts to keep each instance of Region 1-mig at or below 50 requests per second (RPS).

# Click Done.

# Click Add a backend.

# Set the following values, leave all other values at their defaults:

# Property	Value (select option as specified)
# Instance group	Region 2-mig
# Port numbers	80
# Balancing mode	Utilization
# Maximum backend utilization	80
# Capacity	100
# This configuration means that the load balancer attempts to keep each instance of Region 2-mig at or below 80% CPU utilization.

# Click Done.

# For Health Check, select Create a health check.

# Set the following values, leave all other values at their defaults:

# Property	Value (select option as specified)
# Name	http-health-check
# Protocol	TCP
# Port	80
# Health checks determine which instances receive new connections. This HTTP health check polls instances every 5 seconds, waits up to 5 seconds for a response and treats 2 successful or 2 failed attempts as healthy or unhealthy, respectively.

# Click Save.
# Check the Enable Logging box.
# Set the Sample Rate to 1.
# Click Create to create the backend service.
# Click Ok.
# Review and create the HTTP Load Balancer
# Click on Review and finalize.
# Review the Backend and Frontend services.
# Click on Create.
# Wait for the load balancer to be created.
# Click on the name of the load balancer (http-lb).
# Note the IPv4 and IPv6 addresses of the load balancer for the next task. They will be referred to as [LB_IP_v4] and [LB_IP_v6], respectively.
# Note: The IPv6 address is the one in hexadecimal format.
# Click Check my progress to verify the objective.
# Configure the HTTP Load Balancer

# Task 4. Test the HTTP Load Balancer
# Now that you created the HTTP Load Balancer for your backends, verify that traffic is forwarded to the backend service.


# The HTTP load balancer should forward traffic to the region that is closest to you.

# True

# False

# Access the HTTP Load Balancer
# To test IPv4 access to the HTTP Load Balancer, open a new tab in your browser and navigate to http://[LB_IP_v4]. Make sure to replace [LB_IP_v4] with the IPv4 address of the load balancer.

# Note: It might take up to 5 minutes to access the HTTP Load Balancer. In the meantime, you might get a 404 or 502 error. Keep trying until you see the page of one of the backends.
# Note: Depending on your proximity to Region 1 and Region 2, your traffic is either forwarded to a Region 1-mig or Region 2-mig instance.
# If you have a local IPv6 address, try the IPv6 address of the HTTP Load Balancer by navigating to http://[LB_IP_v6]. Make sure to replace [LB_IP_v6] with the IPv6 address of the load balancer.

# Stress test the HTTP Load Balancer
# Create a new VM to simulate a load on the HTTP Load Balancer using siege. Then, determine if traffic is balanced across both backends when the load is high.

# In the console, navigate to Navigation menu (Navigation menu icon) > Compute Engine > VM instances.

# Click Create instance.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	siege-vm
# Region	Region 3
# Zone	Zone 3
# Series	E2
# Given that Region 3 is closer to Region 1 than to Region 2, traffic should be forwarded only to Region 1-mig (unless the load is too high).

# Click Create.
# Wait for the siege-vm instance to be created.
# For siege-vm, click SSH to launch a terminal and connect.
# Run the following command, to install siege:
# sudo apt-get -y install siege
# Copied!
# To store the IPv4 address of the HTTP Load Balancer in an environment variable, run the following command, replacing [LB_IP_v4] with the IPv4 address:
# export LB_IP=[LB_IP_v4]
# Copied!
# To simulate a load, run the following command:
# siege -c 150 -t120s http://$LB_IP
# Copied!
# In the Cloud console, on the Navigation menu (Navigation menu icon), click Network Services > Load balancing.
# Click Backends.
# Click http-backend.
# Navigate to http-lb.
# Click on the Monitoring tab.
# Monitor the Frontend Location (Total inbound traffic) between North America and the two backends for 2 to 3 minutes.
# At first, traffic should just be directed to Region 1-mig but as the RPS increases, traffic is also directed to Region 2.

# This demonstrates that by default traffic is forwarded to the closest backend but if the load is very high, traffic can be distributed across the backends.

# Return to the SSH terminal of siege-vm.
# Press CTRL+C to stop siege if it's still running.
# The output should look like this:

# New configuration template added to /home/student-02-dd02c94b8808/.siege
# Run siege -C to view the current settings in that file
# {       "transactions":                        24729,
#         "availability":                       100.00,
#         "elapsed_time":                       119.07,
#         "data_transferred":                     3.77,
#         "response_time":                        0.66,
#         "transaction_rate":                   207.68,
#         "throughput":                           0.03,
#         "concurrency":                        137.64,
#         "successful_transactions":             24729,
#         "failed_transactions":                     0,
#         "longest_transaction":                 10.45,
#         "shortest_transaction":                 0.03
# }
# Task 5. Denylist the siege-vm
# Use Cloud Armor to denylist the siege-vm from accessing the HTTP Load Balancer.

# Create the security policy
# Create a Cloud Armor security policy with a denylist rule for the siege-vm.

# In the console, navigate to Navigation menu (Navigatio menu icon) > Compute Engine > VM instances.
# Note the External IP of the siege-vm. This will be referred to as [SIEGE_IP].
# Note: There are ways to identify the external IP address of a client trying to access your HTTP Load Balancer. For example, you could examine traffic captured by VPC Flow Logs in BigQuery to determine a high volume of incoming requests.
# In the Cloud console, navigate to Navigation menu > Network Security > Cloud Armor Policies.

# Click Create policy.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	denylist-siege
# Default rule action	Allow
# Click Next step.

# Click Add a rule.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Condition > Match	Enter the SIEGE_IP
# Action	Deny
# Response code	403 (Forbidden)
# Priority	1000
# Click Done.

# Click Next step.

# Click Add Target.

# For Type, select Backend service (external application load balancer).

# For Target, select http-backend.

# Click Create policy.

# Note: Alternatively, you could set the default rule to Deny and only allowlist or allow traffic from authorized users/IP addresses.
# Wait for the policy to be created before moving to the next step.
# Click Check my progress to verify the objective.
# Denylist the siege-vm

# Verify the security policy
# Verify that the siege-vm cannot access the HTTP Load Balancer.

# Return to the SSH terminal of siege-vm.
# To access the load balancer, run the following:
# curl http://$LB_IP
# Copied!
# The output should look like this:

# <!doctype html><meta charset="utf-8"><meta name=viewport content="width=device-width, initial-scale=1"><title>403</title>403 Forbidden
# Note: It might take a couple of minutes for the security policy to take effect. If you are able to access the backends, keep trying until you get the 403 Forbidden error.
# Open a new tab in your browser and navigate to http://[LB_IP_v4]. Make sure to replace [LB_IP_v4] with the IPv4 address of the load balancer.
# Note: You can access the HTTP Load Balancer from your browser because of the default rule to allow traffic; however, you cannot access it from the siege-vm because of the deny rule that you implemented.
# Back in the SSH terminal of siege-vm, to simulate a load, run the following command:
# siege -c 150 -t120s http://$LB_IP
# Copied!
# The command will not generate any output.

# Explore the security policy logs to determine if this traffic is also blocked.

# In the console, navigate to Navigation menu > Network Security > Cloud Armor Policies.
# Click denylist-siege.
# Click Logs.
# Click View policy logs.
# On the Logging page, make sure to clear all the text in the Query preview. Select resource to Application Load Balancer > http-lb-forwarding-rule > http-lb then click Apply.
# Now click Run Query.
# Expand a log entry in Query results.
# Expand httpRequest.
# The request should be from the siege-vm IP address. If not, expand another log entry.

# Expand jsonPayload.
# Expand enforcedSecurityPolicy.
# Notice that the configuredAction is to DENY with the name denylist-siege.
# Query results page

# Cloud Armor security policies create logs that can be explored to determine when traffic is denied and when it is allowed, along with the source of the traffic.

# Congratulations!
# You configured an HTTP Load Balancer with backends in Region 1 and Region 2. Then, you stress tested the Load Balancer with a VM and denylisted the IP address of that VM with Cloud Armor. You were able to explore the security policy logs to identify why the traffic was blocked.

# Next steps / Learn more
# For information on the basic concepts of Cloud Armor, see Cloud Armor documentation.

# For more information on Load Balancing, see Load Balancing documentation.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated April 1, 2024

# Lab Last Tested April 1, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.