# Setting up a Private Kubernetes Cluster
# experiment
# Lab
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# 5 Credits
# show_chart
# Intermediate
# Lab instructions and tasks
# GSP178
# Overview
# Setup and requirements
# Task 1. Set the region and zone
# Task 2. Creating a private cluster
# Task 3. View your subnet and secondary address ranges
# Task 4. Enable master authorized networks
# Task 5. Clean Up
# Task 6. Create a private cluster that uses a custom subnetwork
# Congratulations!
# GSP178
# Google Cloud self-paced labs logo

# Overview
# In Kubernetes Engine, a private cluster is a cluster that makes your master inaccessible from the public internet. In a private cluster, nodes do not have public IP addresses, only private addresses, so your workloads run in an isolated environment. Nodes and masters communicate with each other using VPC peering.

# In the Kubernetes Engine API, address ranges are expressed as Classless Inter-Domain Routing (CIDR) blocks.

# In this lab, you learn how to create a private Kubernetes cluster.

# What you'll do
# Create a Private Kubernetes Cluster.
# Prerequisites
# Student should already have experience creating and launching Kubernetes Clusters and be thoroughly versed in IP addressing in CIDR Range formats.
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
# Task 1. Set the region and zone
# Set the project region for this lab:
# gcloud config set compute/zone "Zone"
# Copied!
# Create a variable for region:
# export REGION=Region
# Copied!
# Create a variable for zone:
# export ZONE=Zone
# Copied!
# Learn more from the Regions & Zones documentation.

# Note: When you run gcloud on your own machine, the config settings are persisted across sessions. But in Cloud Shell, you need to set this for every new session or reconnection.
# Task 2. Creating a private cluster
# When you create a private cluster, you must specify a /28 CIDR range for the VMs that run the Kubernetes master components and you need to enable IP aliases.
# Next you'll create a cluster named private-cluster, and specify a CIDR range of 172.16.0.16/28 for the masters. When you enable IP aliases, you let Kubernetes Engine automatically create a subnetwork for you.

# You'll create the private cluster by using the --private-cluster, --master-ipv4-cidr, and --enable-ip-alias flags.

# Run the following to create the cluster:
# gcloud beta container clusters create private-cluster \
#     --enable-private-nodes \
#     --master-ipv4-cidr 172.16.0.16/28 \
#     --enable-ip-alias \
#     --create-subnetwork ""
# Copied!
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully created a private cluster, you will see an assessment score.

# Create a private cluster
# Task 3. View your subnet and secondary address ranges
# List the subnets in the default network:
# gcloud compute networks subnets list --network default
# Copied!
# In the output, find the name of the subnetwork that was automatically created for your cluster. For example, gke-private-cluster-subnet-xxxxxxxx. Save the name of the cluster, you'll use it in the next step.

# Now get information about the automatically created subnet, replacing [SUBNET_NAME] with your subnet by running:

# gcloud compute networks subnets describe [SUBNET_NAME] --region=$REGION
# Copied!
# The output shows you the primary address range with the name of your GKE private cluster and the secondary ranges:

# ...
# ipCidrRange: 10.0.0.0/22
# kind: compute#subnetwork
# name: gke-private-cluster-subnet-163e3c97
# ...
# privateIpGoogleAccess: true
# ...
# secondaryIpRanges:
# - ipCidrRange: 10.40.0.0/14
#   rangeName: gke-private-cluster-pods-163e3c97
# - ipCidrRange: 10.0.16.0/20
#   rangeName: gke-private-cluster-services-163e3c97
# ...
# In the output you can see that one secondary range is for pods and the other secondary range is for services.

# Notice that privateIPGoogleAccess is set to true. This enables your cluster hosts, which have only private IP addresses, to communicate with Google APIs and services.

# Task 4. Enable master authorized networks
# At this point, the only IP addresses that have access to the master are the addresses in these ranges:

# The primary range of your subnetwork. This is the range used for nodes.
# The secondary range of your subnetwork that is used for pods.
# To provide additional access to the master, you must authorize selected address ranges.

# Create a VM instance
# Create a source instance which you'll use to check the connectivity to Kubernetes clusters:
# gcloud compute instances create source-instance --zone=$ZONE --scopes 'https://www.googleapis.com/auth/cloud-platform'
# Copied!
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully created a VM instance, you will see an assessment score.

# Create a VM instance
# Get the <External_IP> of the source-instance with:
# gcloud compute instances describe source-instance --zone=$ZONE | grep natIP
# Copied!
# Example Output:

# natIP: 35.192.107.237
# Copy the <nat_IP> address and save it to use in later steps.

# Run the following to Authorize your external address range, replacing [MY_EXTERNAL_RANGE] with the CIDR range of the external addresses from the previous output (your CIDR range is natIP/32). With CIDR range as natIP/32, we are allowlisting one specific IP address:

# gcloud container clusters update private-cluster \
#     --enable-master-authorized-networks \
#     --master-authorized-networks [MY_EXTERNAL_RANGE]
# Copied!
# Note: In a production environment replace [MY_EXTERNAL_RANGE] with your network external address CIDR range.
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully authorized external address range, you will see an assessment score.

# Authorize your external address range
# Now that you have access to the master from a range of external addresses, you'll install kubectl so you can use it to get information about your cluster. For example, you can use kubectl to verify that your nodes do not have external IP addresses.

# SSH into source-instance with:
# gcloud compute ssh source-instance --zone=$ZONE
# Copied!
# Press Y to continue. Enter through the passphrase questions.

# In SSH shell install kubectl component of Cloud-SDK:

# sudo apt-get install kubectl
# Copied!
# Configure access to the Kubernetes cluster from SSH shell with:
# sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
# gcloud container clusters get-credentials private-cluster --zone=$ZONE
# Copied!
# Note: Please make sure that the assigned zone has been exported in the ZONE variable.
# Verify that your cluster nodes do not have external IP addresses:
# kubectl get nodes --output yaml | grep -A4 addresses
# Copied!
# The output shows that the nodes have internal IP addresses but do not have external addresses:

# ...
# addresses:
# - address: 10.0.0.4
#   type: InternalIP
# - address: ""
#   type: ExternalIP
# ...
# Here is another command you can use to verify that your nodes do not have external IP addresses:
# kubectl get nodes --output wide
# Copied!
# The output shows an empty column for EXTERNAL-IP:

# STATUS ... VERSION        EXTERNAL-IP   OS-IMAGE ...
# Ready      v1.8.7-gke.1                 Container-Optimized OS from Google
# Ready      v1.8.7-gke.1                 Container-Optimized OS from Google
# Ready      v1.8.7-gke.1                 Container-Optimized OS from Google
# Close the SSH shell by typing:
# exit
# Copied!
# Task 5. Clean Up
# Delete the Kubernetes cluster:
# gcloud container clusters delete private-cluster --zone=$ZONE
# Copied!
# Press Y to continue.
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully deleted the Kubernetes cluster, you will see an assessment score.

# Delete the Kubernetes cluster
# Task 6. Create a private cluster that uses a custom subnetwork
# In the previous section Kubernetes Engine automatically created a subnetwork for you. In this section, you'll create your own custom subnetwork, and then create a private cluster. Your subnetwork has a primary address range and two secondary address ranges.

# Create a subnetwork and secondary ranges:
# gcloud compute networks subnets create my-subnet \
#     --network default \
#     --range 10.0.4.0/22 \
#     --enable-private-ip-google-access \
#     --region=$REGION \
#     --secondary-range my-svc-range=10.0.32.0/20,my-pod-range=10.4.0.0/14
# Copied!
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully created a subnetwork and secondary ranges in region, you will see an assessment score.

# Create a subnetwork and secondary ranges in filled in at lab start region
# Create a private cluster that uses your subnetwork:
# gcloud beta container clusters create private-cluster2 \
#     --enable-private-nodes \
#     --enable-ip-alias \
#     --master-ipv4-cidr 172.16.0.32/28 \
#     --subnetwork my-subnet \
#     --services-secondary-range-name my-svc-range \
#     --cluster-secondary-range-name my-pod-range \
#     --zone=$ZONE
# Copied!
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully created a private cluster that uses your subnetwork, you will see an assessment score.

# Create a private cluster that uses your subnetwork
# Retrieve the external address range of the source instance:
# gcloud compute instances describe source-instance --zone=$ZONE | grep natIP
# Copied!
# Example Output:

# natIP: 35.222.210.67
# Copy the <nat_IP> address and save it to use in later steps.

# Run the following to Authorize your external address range, replacing [MY_EXTERNAL_RANGE] with the CIDR range of the external addresses from the previous output (your CIDR range is natIP/32). With CIDR range as natIP/32, we are allowlisting one specific IP address:

# gcloud container clusters update private-cluster2 \
#     --enable-master-authorized-networks \
#     --zone=$ZONE \
#     --master-authorized-networks [MY_EXTERNAL_RANGE]
# Copied!
# Test completed task

# Click Check my progress to verify your performed task. If you have successfully authorized your external address range for a private cluster in a custom subnetwork, you will see an assessment score.

# Authorize your external address range for private cluster in custom subnetwork
# SSH into source-instance with:
# gcloud compute ssh source-instance --zone=$ZONE
# Copied!
# Configure access to the Kubernetes cluster from SSH shell with:
# gcloud container clusters get-credentials private-cluster2 --zone=$ZONE
# Copied!
# Note: Please make sure that the assigned zone has been exported in the ZONE variable.
# Verify that your cluster nodes do not have external IP addresses:
# kubectl get nodes --output yaml | grep -A4 addresses
# Copied!
# The output shows that the nodes have internal IP addresses but do not have external addresses:

# ...
# addresses:
# - address: 10.0.4.3
#   type: InternalIP
# ...
# At this point, the only IP addresses that have access to the master are the addresses in these ranges:

# The primary range of your subnetwork. This is the range used for nodes. In this example, the range for nodes is 10.0.4.0/22.
# The secondary range of your subnetwork that is used for pods. In this example, the range for pods is 10.4.0.0/14.
# Congratulations!
# You learned how to create a private Kubernetes cluster.

# Next steps / Learn more
# Check out these labs:
# Building a High-throughput VPN
# Continuous Delivery with Jenkins in Kubernetes Engine
# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated April 15, 2024

# Lab Last Tested September 20, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# resolution

export ZONE=
gcloud config set compute/zone $ZONE
export REGION=${ZONE%-*}
gcloud beta container clusters create private-cluster \
    --enable-private-nodes \
    --master-ipv4-cidr 172.16.0.16/28 \
    --enable-ip-alias \
    --create-subnetwork ""
gcloud compute instances create source-instance --zone=$ZONE --scopes 'https://www.googleapis.com/auth/cloud-platform'
NAT_IAP_CLOUDHUSTLER=$(gcloud compute instances describe source-instance --zone=$ZONE | grep natIP | awk '{print $2}')
gcloud container clusters update private-cluster \
    --enable-master-authorized-networks \
    --master-authorized-networks $NAT_IAP_CLOUDHUSTLER/32
gcloud container clusters delete private-cluster --zone=$ZONE --quiet
gcloud compute networks subnets create my-subnet \
    --network default \
    --range 10.0.4.0/22 \
    --enable-private-ip-google-access \
    --region=$REGION \
    --secondary-range my-svc-range=10.0.32.0/20,my-pod-range=10.4.0.0/14
gcloud beta container clusters create private-cluster2 \
    --enable-private-nodes \
    --enable-ip-alias \
    --master-ipv4-cidr 172.16.0.32/28 \
    --subnetwork my-subnet \
    --services-secondary-range-name my-svc-range \
    --cluster-secondary-range-name my-pod-range \
    --zone=$ZONE
NAT_IAP_Cloud=$(gcloud compute instances describe source-instance --zone=$ZONE | grep natIP | awk '{print $2}')
gcloud container clusters update private-cluster2 \
    --enable-master-authorized-networks \
    --zone=$ZONE \
    --master-authorized-networks $NAT_IAP_Cloud/32