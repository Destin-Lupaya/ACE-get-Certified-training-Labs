# Getting Started with Cloud Shell and gcloud
# experiment
# Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# show_chart
# Introductory
# GSP002
# Google Cloud self-paced labs logo

# Overview
# Cloud Shell provides you with command-line access to computing resources hosted on Google Cloud. Cloud Shell is a Debian-based virtual machine with a persistent 5-GB home directory, which makes it easy for you to manage your Google Cloud projects and resources. The gcloud command-line tool and other utilities you need are pre-installed in Cloud Shell, which allows you to get up and running quickly.

# In this hands-on lab, you learn how to connect to computing resources hosted on Google Cloud via Cloud Shell with the gcloud tool.

# You are encouraged to type the commands themselves, which reinforces the core concepts. Many labs will include a code block that contains the required commands. You can easily copy and paste the commands from the code block into the appropriate places during the lab.

# What you'll do
# Practice using gcloud commands.
# Connect to compute services hosted on Google Cloud.
# Prerequisites
# Familiarity with standard Linux text editors such as vim, emacs, or nano.
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
# After Cloud Shell is activated, you can use the command line to invoke the Cloud SDK gcloud tool or other tools available on the virtual machine instance. Later in the lab, you will use your $HOME directory, which is used in persistent disk storage to store files across projects and between Cloud Shell sessions. Your $HOME directory is private to you and cannot be accessed by other users.

# Task 1. Configuring your environment
# In this section, you'll learn about aspects of the development environment that you can adjust.

# Understanding regions and zones
# Certain Google Compute Engine resources live in regions or zones. A region is a specific geographical location where you can run your resources. Each region has one or more zones. For example, the us-central1 region denotes a region in the Central United States that has zones us-central1-a, us-central1-b, us-central1-c, and us-central1-f. The following table shows zones in their respective regions:

# Western US	Central US	Eastern US	Western Europe	Eastern Asia
# us-west1-a	us-central1-a	us-east1-b	europe-west1-b	asia-east1-a
# us-west1-b	us-central1-b	us-east1-c	europe-west1c	asia-east1-b
# -	us-central1-c	us-east1-d	europe-west1-d	aisia-east1-c
# -	us-central1-f	-	-	-
# Resources that live in a zone are referred to as zonal resources. Virtual machine instances and persistent disks live in a zone. If you want to attach a persistent disk to a virtual machine instance, both resources must be in the same zone. Similarly, if you want to assign a static IP address to an instance, the instance must be in the same region as the static IP address.

# Note: Learn more about regions and zones and see a complete list in Google Cloud Compute Engine's Regions and Zones documentation.
# Set the region to <REGION>

# gcloud config set compute/region REGION
# Copied!
# To view the project region setting, run the following command:

# gcloud config get-value compute/region
# Copied!
# Set the zone to <ZONE>:

# gcloud config set compute/zone ZONE
# Copied!
# To view the project zone setting, run the following command:

# gcloud config get-value compute/zone
# Copied!
# Finding project information
# Copy your project ID to your clipboard or text editor. The project ID is listed in 2 places:

# In the Cloud Console, on the Dashboard, under Project info. (Click Navigation menu (Navigation menu icon), and then click Cloud overview > Dashboard.)
# On the lab tab near your username and password.
# In Cloud Shell, run the following gcloud command, to view the project id for your project:

# gcloud config get-value project
# Copied!
# In Cloud Shell, run the following gcloud command to view details about the project:

# gcloud compute project-info describe --project $(gcloud config get-value project)
# Copied!
# Find the zone and region metadata values in the output. You'll use the zone (google-compute-default-zone) from the output later in this lab.

# Note: When the google-compute-default-region and google-compute-default-zone keys and values are missing from the output, no default zone or region is set. The output includes other useful information regarding your project. Take some time to explore this in more detail.
# Setting environment variables
# Environment variables define your environment and help save time when you write scripts that contain APIs or executables.

# Create an environment variable to store your Project ID:

# export PROJECT_ID=$(gcloud config get-value project)
# Copied!
# Create an environment variable to store your Zone:

# export ZONE=$(gcloud config get-value compute/zone)
# Copied!
# To verify that your variables were set properly, run the following commands:

# echo -e "PROJECT ID: $PROJECT_ID\nZONE: $ZONE"
# Copied!
# If the variables were set correctly, the echo commands will output your Project ID and Zone.

# Creating a virtual machine with the gcloud tool
# Use the gcloud tool to create a new virtual machine (VM) instance.

# To create your VM, run the following command:

# gcloud compute instances create gcelab2 --machine-type e2-medium --zone $ZONE
# Copied!
# Output:

# Created [https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-04-326fae68bc3d/zones/us-east1-c/instances/gcelab2].
# NAME     ZONE           MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP   STATUS
# gcelab2  ZONE     e2-medium               10.128.0.2   34.67.152.90  RUNNING
# Command details

# gcloud compute allows you to manage your Compute Engine resources in a format that's simpler than the Compute Engine API.
# instances create creates a new instance.
# gcelab2 is the name of the VM.
# The --machine-type flag specifies the machine type as e2-medium.
# The --zone flag specifies where the VM is created.
# If you omit the --zone flag, the gcloud tool can infer your desired zone based on your default properties. Other required instance settings, such as machine type and image, are set to default values if not specified in the create command.
# Test completed task
# Click Check my progress to verify your performed task. If you have successfully created a virtual machine with the gcloud tool, an assessment score is displayed.

# Create a virtual machine with gcloud
# To open help for the create command, run the following command:
# gcloud compute instances create --help
# Copied!
# Note: Press Enter or the spacebar to scroll through the help content. To exit the content, type Q.
# Exploring gcloud commands
# The gcloud tool offers simple usage guidelines that are available by adding the -h flag (for help) onto the end of any gcloud command.

# Run the following command:

# gcloud -h
# Copied!
# You can access more verbose help by appending the --help flag onto a command or running the gcloud help command.

# Run the following command:

# gcloud config --help
# Copied!
# To exit type Q and hit Enter.

# Run the following command:

# gcloud help config
# Copied!
# The results of the gcloud config --help and gcloud help config commands are equivalent. Both return long, detailed help.

# There are global flags in gcloud that govern the behavior of commands on a per-invocation level. Flags override any values set in SDK properties.

# View the list of configurations in your environment:

# gcloud config list
# Copied!
# To see all properties and their settings:

# gcloud config list --all
# Copied!
# List your components:

# gcloud components list
# Copied!
# This command displays the gcloud components that are ready for you to use in this lab.

# Task 2. Filtering command-line output
# The gcloud command-line interface (CLI) is a powerful tool for working at the command line. You may want specific information to be displayed.

# List the compute instance available in the project:

# gcloud compute instances list
# Copied!
# Note: Having multiple resources deployed in a project is very common. Fortunately gcloud has some clever formatting that can help identify specific resources.
# Example Output:

# NAME: gcelab2
# ZONE: ZONE
# MACHINE_TYPE: e2-medium
# PREEMPTIBLE:
# INTERNAL_IP: 10.142.0.2
# EXTERNAL_IP: 35.237.43.111
# STATUS: RUNNING
# List the gcelab2 virtual machine:

# gcloud compute instances list --filter="name=('gcelab2')"
# Copied!
# Example Output:

# NAME: gcelab2
# ZONE: ZONE
# MACHINE_TYPE: e2-medium
# PREEMPTIBLE:
# INTERNAL_IP: 10.142.0.2
# EXTERNAL_IP: 35.237.43.111
# STATUS: RUNNING
# In the above command, you asked gcloud to only show the information matching the criteria i.e. a virtual instance name matching the criteria.

# List the firewall rules in the project:

# gcloud compute firewall-rules list
# Copied!
# Output:

# NAME                         NETWORK      DIRECTION  PRIORITY  ALLOW                         DENY  DISABLED
# default-allow-icmp           default      INGRESS    65534     icmp                                False
# default-allow-internal       default      INGRESS    65534     tcp:0-65535,udp:0-65535,icmp        False
# default-allow-rdp            default      INGRESS    65534     tcp:3389                            False
# default-allow-ssh            default      INGRESS    65534     tcp:22                              False
# dev-net-allow-ssh            dev-network  INGRESS    1000      tcp:22                              False
# serverless-to-vpc-connector  dev-network  INGRESS    1000      icmp,udp:665-666,tcp:667            False
# vpc-connector-egress         dev-network  INGRESS    1000      icmp,udp,tcp                        False
# vpc-connector-health-check   dev-network  INGRESS    1000      tcp:667                             False
# vpc-connector-to-serverless  dev-network  EGRESS     1000      icmp,udp:665-666,tcp:667            False
# List the firewall rules for the default network:

# gcloud compute firewall-rules list --filter="network='default'"
# Copied!
# Output:

# NAME                         NETWORK      DIRECTION  PRIORITY  ALLOW                         DENY  DISABLED
# default-allow-icmp           default      INGRESS    65534     icmp                                False
# default-allow-internal       default      INGRESS    65534     tcp:0-65535,udp:0-65535,icmp        False
# default-allow-rdp            default      INGRESS    65534     tcp:3389                            False
# default-allow-ssh            default      INGRESS    65534     tcp:22                              False
# List the firewall rules for the default network where the allow rule matches an ICMP rule:

# gcloud compute firewall-rules list --filter="NETWORK:'default' AND ALLOW:'icmp'"
# Copied!
# Output:

# NAME                         NETWORK      DIRECTION  PRIORITY  ALLOW                         DENY  DISABLED
# default-allow-icmp           default      INGRESS    65534     icmp                                False
# default-allow-internal       default      INGRESS    65534     tcp:0-65535,udp:0-65535,icmp        False
# Task 3. Connecting to your VM instance
# gcloud compute makes connecting to your instances easy. The gcloud compute ssh command provides a wrapper around SSH, which takes care of authentication and the mapping of instance names to IP addresses.

# To connect to your VM with SSH, run the following command:

# gcloud compute ssh gcelab2 --zone $ZONE
# Copied!
# Output:

# WARNING: The public SSH key file for gcloud does not exist.
# WARNING: The private SSH key file for gcloud does not exist.
# WARNING: You do not have an SSH key for gcloud.
# WARNING: [/usr/bin/ssh-keygen] will be executed to generate a key.
# This tool needs to create the directory
# [/home/gcpstaging306_student/.ssh] before being able to generate SSH Keys.
# Do you want to continue? (Y/n)
# To continue, type Y.

# Generating public/private rsa key pair.
# Enter passphrase (empty for no passphrase)
# To leave the passphrase empty, press Enter twice.

# Note: You have connected to the virtual machine created earlier in the lab. Did you notice how the command prompt changed?
# The prompt now says something similar to sa_107021519685252337470@gcelab2.
# The reference before the @ indicates the account being used.
# After the @ sign indicates the host machine being accessed.
# Install nginx web server on to virtual machine:

# sudo apt install -y nginx
# Copied!
# You don't need to do anything here. To disconnect from SSH and exit the remote shell, run the following command:

# exit
# Copied!
# You should be back at your project's command prompt.

# Task 4. Updating the firewall
# When using compute resources such as virtual machines, it's important to understand the associated firewall rules.

# List the firewall rules for the project:

# gcloud compute firewall-rules list
# Copied!
# Output:

# NAME                         NETWORK      DIRECTION  PRIORITY  ALLOW                         DENY  DISABLED
# default-allow-icmp           default      INGRESS    65534     icmp                                False
# default-allow-internal       default      INGRESS    65534     tcp:0-65535,udp:0-65535,icmp        False
# default-allow-rdp            default      INGRESS    65534     tcp:3389                            False
# default-allow-ssh            default      INGRESS    65534     tcp:22                              False
# dev-net-allow-ssh            dev-network  INGRESS    1000      tcp:22                              False
# serverless-to-vpc-connector  dev-network  INGRESS    1000      icmp,udp:665-666,tcp:667            False
# vpc-connector-egress         dev-network  INGRESS    1000      icmp,udp,tcp                        False
# vpc-connector-health-check   dev-network  INGRESS    1000      tcp:667                             False
# vpc-connector-to-serverless  dev-network  EGRESS     1000      icmp,udp:665-666,tcp:667            False
# From the above you can see there are two networks available. The default network is where the virtual machine gcelab2 is located.

# Try to access the nginx service running on the gcelab2 virtual machine.

# Note: Communication with the virtual machine will fail as it does not have an appropriate firewall rule. The nginx web server is expecting to communicate on tcp:80. To get communication working you need to:

# Add a tag to the gcelab2 virtual machine
# Add a firewall rule for http traffic
# Add a tag to the virtual machine:

# gcloud compute instances add-tags gcelab2 --tags http-server,https-server
# Copied!
# Update the firewall rule to allow:

# gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server
# Copied!
# List the firewall rules for the project:

# gcloud compute firewall-rules list --filter=ALLOW:'80'
# Copied!
# Output:

# NAME                NETWORK  DIRECTION  PRIORITY  ALLOW   DENY  DISABLED
# default-allow-http  default  INGRESS    1000      tcp:80        False
# Verify communication is possible for http to the virtual machine:

# curl http://$(gcloud compute instances list --filter=name:gcelab2 --format='value(EXTERNAL_IP)')
# Copied!
# You will see the default nginx output.

# Task 5. Viewing the system logs
# Viewing logs is essential to understanding the working of your project. Use gcloud to access the different logs available on Google Cloud.

# View the available logs on the system:

# gcloud logging logs list
# Copied!
# Output:

# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/GCEGuestAgent
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/OSConfigAgent
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/autoscaler.googleapis.com%2Fstatus_change
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/cloudaudit.googleapis.com%2Factivity
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/cloudaudit.googleapis.com%2Fdata_access
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/cloudaudit.googleapis.com%2Fsystem_event
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/compute.googleapis.com%2Fautoscaler
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/compute.googleapis.com%2Finstance_group_manager_events
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/compute.googleapis.com%2Fshielded_vm_integrity
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/run.googleapis.com%2Fstderr
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/run.googleapis.com%2Fstdout
# View the logs that relate to compute resources:

# gcloud logging logs list --filter="compute"
# Copied!
# Output:

# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/compute.googleapis.com%2Fautoscaler
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/compute.googleapis.com%2Finstance_group_manager_events
# NAME: projects/qwiklabs-gcp-01-4b75909db302/logs/compute.googleapis.com%2Fshielded_vm_integrity
# Read the logs related to the resource type of gce_instance:

# gcloud logging read "resource.type=gce_instance" --limit 5
# Copied!
# Read the logs for a specific virtual machine:

# gcloud logging read "resource.type=gce_instance AND labels.instance_name='gcelab2'" --limit 5
# Copied!
# Task 6. Testing your understanding
# The following multiple-choice question should reinforce your understanding of this lab's concepts.


# Three basic ways to interact with Google Cloud services and resources are:
# check
# Command-line interface
# check
# Client libraries

# GStreamer

# GLib
# check
# Cloud Console

# Congratulations!
# You learned how to launch Cloud Shell and run some sample gcloud commands.

# Next steps / Learn more
# To learn more about Cloud Shell, refer to the Cloud Shell documentation or the YouTube video, Using Google Cloud Shell.

# To learn more about gcloud, refer to the gcloud documentation or the YouTube video, Getting Help with gcloud.

# Continue learning by taking these labs:

# Provision Services with Google Cloud Marketplace
# Creating a Persistent Disk
# Configuring Networks via gcloud
# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated January 26, 2024

# Lab Last Tested September 15, 2022

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.