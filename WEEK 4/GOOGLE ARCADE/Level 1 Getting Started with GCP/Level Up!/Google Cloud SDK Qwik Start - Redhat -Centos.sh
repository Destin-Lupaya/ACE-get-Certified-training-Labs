# Google Cloud SDK: Qwik Start - Redhat/Centos
# experiment
# Lab
# schedule
# 30 minutes
# universal_currency_alt
# No cost
# show_chart
# Introductory
# Lab instructions and tasks
# GSP122
# Setup and requirements
# Task 1. Set up a VM to use
# Task 2. Update the Cloud SDK RPM packages
# Task 3. Initialize the SDK in your instance
# Task 4. Run core gcloud commands
# Congratulations!
# GSP122
# Google Cloud self-paced labs logo

# In this lab you will learn how to install Cloud SDK to a virtual machine, initialize it and run core gcloud commands from the command-line. The Cloud SDK RPM packages are supported for Red Hat Enterprise Level 7 and CentOS 7.

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
# Set the region
# Set the project region for this lab:

# gcloud config set compute/region "REGION"
# Copied!
# Task 1. Set up a VM to use
# Create a VM with either Centos or Redhat. You can choose which one to use, the steps will be the same.

# In the Cloud Console, go to Compute Engine > VM instances, then click Create instance.
# The VM instances page displaying the Create Instance button

# Select REGION region and ZONE zone.

# In the Boot disk section, click Change to begin configuring your boot disk:

# The Boot disk section displaying the name, type, size, and image, as well as the Change button

# Choose CentOS for Operating system and select CentOS 7 for Version, then click the Select button.

# In the Firewall section, select Allow HTTP traffic.

# Click Create.

# Click Check my progress to verify the objective.

# Create a Compute Engine instance, allow HTTP traffic.
# Then click on the SSH button for your instance.
# Now you're ready to set this instance up with Cloud SDK.

# Task 2. Update the Cloud SDK RPM packages
# The Cloud SDK RPM packages are supported for Red Hat Enterprise Level 7 and CentOS 7. They may also work on Fedora systems using yum or dnf, but this has not been tested.

# Run the following in the SSH window to set up Cloud SDK:
# # Update YUM with Cloud SDK repo information:
# sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
# [google-cloud-sdk]
# name=Google Cloud SDK
# baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
# enabled=1
# gpgcheck=1
# repo_gpgcheck=0
# gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
#        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
# EOM

# # The indentation for the 2nd line of gpgkey is important.

# # Install the Cloud SDK
# sudo yum install google-cloud-sdk
# Copied!
# Respond Y when prompted to confirm the total download size.
# Task 3. Initialize the SDK in your instance
# Use the gcloud init command to perform several common SDK setup tasks. These include authorizing the SDK tools to access Google Cloud using your user account credentials and setting up the default SDK configuration.

# To initialize the SDK, run the following:
# gcloud init --console-only
# Copied!
# This prevents the gcloud init command from launching a web browser. Choose option 2, to log in with a new account.

# Type the number for adding a new account.
# Pick cloud project to use:
#  [1] XXXXXxXXX-compute@developer.gserviceaccount.com
#  [2] log in with new account
#  ...
#  Please enter your numeric choice or text value:
# You will get confirmation that you're running on a virtual machine.

# Type Y to allow the credentials you logged into the lab with (this is your personal account for this lab) to be used to authenticate your account.
# You are running on a Google Compute Engine virtual machine. It is recommended that you use service accounts for authentication. You can run:
# $ gcloud config set account ‘ACCOUNT'
# To switch accounts as necessary.

# Y to authenticate with your personal acct
# Do you want to continue (Y/n)?
# You'll be given a long URL click on it or paste it into a new browser.

# You may be asked to select your lab credentials again, and Allow access to your account.
# This URL will give you your authentication code.

# Copy the code and paste it into the SSH window at the command prompt, then press Enter.

# Now type the number corresponding to your Project ID.

# You will see a confirmation that you have completed the setup steps successfully that will look like this:

# Your current project has been set to [qwiklabs-gcp-fe1e6438a8b814c2].
# ...

# This gcloud configuration is called [default]
# Click Check my progress to verify the objective.

# Initialize the SDK in your instance
# Task 4. Run core gcloud commands
# Run these gcloud commands to view information about your SDK installation.

# List accounts whose credentials are stored on this VM:
# gcloud auth list
# Copied!
# A list of credentialed accounts displays:

#       Credentialed Accounts
# ACTIVE             ACCOUNT
# *                  xxxxxxxx-compute@developer.gserviceaccount.com
#                    gcpxxxxxxxxxx_student@qwiklabs.net
# This command will list the properties in your active SDK configuration:
# gcloud config list
# Copied!
# The list of properties will display:

# [compute]
# Region = "REGION"
# Zone = "ZONE"
# [core]
# Account = gcpstaging10738_student@qwiklabs.net
# Disable_usage_reporting = True
# Project = qwiklabs-gcp-fe1e6438a8b814c2
# Run the following to view information on your Cloud SDK installation and the active SDK configuration:
# gcloud info
# Copied!
# The summary includes information about:

# Your system
# The installed SDK components
# The active user account and current project
# The properties in the active SDK configuration
# You can see information about gcloud commands and other topics from the command line by running the following:
# gcloud help
# Copied!
# Press Enter or the spacebar to scroll down the Help content.

# Press q to exit Help.

# In Help you can specify a command. For example, the help for gcloud compute instances create would be this:

# gcloud help compute instances create
# Copied!
# You'll see a help topic that contains a description of the command, a list of command flags and arguments, and examples of how to use it.

# Congratulations!
# You have learned how to install Cloud SDK to a virtual Red Hat or CentOS machine, initialized it, and ran core gcloud commands from the command-line.

# Finish your quest
# Continue your quest with Baseline: Deploy & Develop. A quest is a series of related labs that form a learning path. Completing this quest earns you a badge to recognize your achievement. You can make your badge or badges public and link to them in your online resume or social media account. Enroll in this quest and get immediate completion credit. Refer to the Google Cloud Skills Boost catalog for all available quests.

# Next steps / Learn more
# This lab is also part of a series of labs called Qwik Starts. These labs are designed to give you a little taste of the many features available with Google Cloud. Search for "Qwik Starts" in the lab catalog to find the next lab you'd like to take!

# Learn more about Google SDK.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated: November 22, 2023

# Lab Last Tested: November 22, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION

export ZONE=us-west1-c

curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Google%20Cloud%20SDK%20Qwik%20Start%20-%20RedhatCentos/gsp122.sh

sudo chmod +x gsp122.sh

./gsp122.sh