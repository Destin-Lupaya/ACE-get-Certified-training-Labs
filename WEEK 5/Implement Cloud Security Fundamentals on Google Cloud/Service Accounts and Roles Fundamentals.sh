# Service Accounts and Roles: Fundamentals
# experiment
# Lab
# schedule
# 1 hour 15 minutes
# universal_currency_alt
# 1 Credit
# show_chart
# Introductory
# GSP199
# Google Cloud self-paced labs logo

# Overview
# Service accounts are a special type of Google account that grant permissions to virtual machines instead of end users. Service accounts are primarily used to ensure safe, managed connections to APIs and Google Cloud services. Granting access to trusted connections and rejecting malicious ones is a must-have security feature for any Google Cloud project. In this lab, you get hands-on practice with the ins and outs of service accounts.

# What you'll learn
# In this lab, you learn how to:

# Create and manage service accounts.
# Create a virtual machine and associate it with a service account.
# Use client libraries to access BigQuery from a service account.
# Run a query on a BigQuery public dataset from a Compute Engine instance.
# Prerequisites
# Some experience with Cloud IAM is recommended, but little to no prior knowledge with service accounts is assumed. If you're looking for more advanced hands-on practice in this topic area, be sure to check out the following labs:

# VPC Network Peering
# Setting up a Private Kubernetes Cluster
# Building a High-throughput VPN
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

# student-04-5536dec9fa15@qwiklabs.net
# Copied!
# You can also find the Username in the Lab Details panel.

# Click Next.

# Copy the Password below and paste it into the Welcome dialog.

# sWkvYet6TTP9
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
# When you are connected, you are already authenticated, and the project is set to your Project_ID, qwiklabs-gcp-03-fcb7d42d2f84. The output contains a line that declares the Project_ID for this session:

# Your Cloud Platform project in this session is set to qwiklabs-gcp-03-fcb7d42d2f84
# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# (Optional) You can list the active account name with this command:
# gcloud auth list
# Copied!
# Click Authorize.
# Output:

# ACTIVE: *
# ACCOUNT: student-04-5536dec9fa15@qwiklabs.net

# To set the active account, run:
#     $ gcloud config set account `ACCOUNT`
# (Optional) You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = qwiklabs-gcp-03-fcb7d42d2f84
# Note: For full documentation of gcloud, in Google Cloud, refer to the gcloud CLI overview guide.
# Set the region for your project
# Run the following command to set the region for your project:

# gcloud config set compute/region us-west4
# Copied!
# What are service accounts?
# A service account is a special Google account that belongs to your application or a virtual machine (VM) instead of an individual end user. Your application uses the service account to call the Google API of a service, so that the users aren't directly involved.

# For example, a Compute Engine VM may run as a service account, and that account can be given permissions to access the resources it needs. This way the service account is the identity of the service, and the service account's permissions control which resources the service can access.

# A service account is identified by its email address, which is unique to the account.

# Types of service accounts
# User-managed service accounts
# When you create a new Cloud project using Google Cloud console and if Compute Engine API is enabled for your project, a Compute Engine Service account is created for you by default. It is identifiable using the email:

# PROJECT_NUMBER-compute@developer.gserviceaccount.com
# If your project contains an App Engine application, the default App Engine service account is created in your project by default. It is identifiable using the email:

# PROJECT_ID@appspot.gserviceaccount.com
# Google-managed service accounts
# In addition to the user-managed service accounts, you might see some additional service accounts in your project’s IAM policy or in the console. These service accounts are created and owned by Google. These accounts represent different Google services and each account is automatically granted IAM roles to access your Google Cloud project.

# Google APIs service account
# An example of a Google-managed service account is a Google API service account identifiable using the email:

# PROJECT_NUMBER@cloudservices.gserviceaccount.com
# This service account is designed specifically to run internal Google processes on your behalf and is not listed in the Service Accounts section of the console. By default, the account is automatically granted the project editor role on the project and is listed in the IAM section of the console. This service account is deleted only when the project is deleted.

# Note: Google services rely on the account having access to your project, so you should not remove or change the service account’s role on your project.
# Understanding IAM roles
# When an identity calls a Google Cloud API, Google Cloud Identity and Access Management requires that the identity has the appropriate permissions to use the resource. You can grant permissions by granting roles to a user, a group, or a service account.

# Types of roles
# There are three types of roles in Cloud IAM:

# Primitive roles, which include the Owner, Editor, and Viewer roles that existed prior to the introduction of Cloud IAM.
# Predefined roles, which provide granular access for a specific service and are managed by Google Cloud.
# Custom roles, which provide granular access according to a user-specified list of permissions.
# Learn more about roles from the Understanding roles Guide.

# Task 1. Create and manage service accounts
# When you create a new Cloud project, Google Cloud automatically creates one Compute Engine service account and one App Engine service account under that project. You can create up to 98 additional service accounts to your project to control access to your resources.

# Creating a service account
# Creating a service account is similar to adding a member to your project, but the service account belongs to your applications rather than an individual end user.

# To create a service account, run the following command in Cloud Shell:
# gcloud iam service-accounts create my-sa-123 --display-name "my service account"
# Copied!
# The output of this command is the service account, which looks similar to the following:

# Created service account [my-sa-123]
# Granting roles to service accounts
# When granting IAM roles, you can treat a service account either as a resource or as an identity.

# Your application uses a service account as an identity to authenticate to Google Cloud services. For example, if you have a Compute Engine Virtual Machine (VM) running as a service account, you can grant the editor role to the service account (the identity) for a project (the resource).

# At the same time, you might also want to control who can start the VM. You can do this by granting a user (the identity) the serviceAccountUser role for the service account (the resource).

# Granting roles to a service account for specific resources
# You grant roles to a service account so that the service account has permission to complete specific actions on the resources in your Cloud Platform project. For example, you might grant the storage.admin role to a service account so that it has control over objects and buckets in Cloud Storage.

# Run the following in Cloud Shell to grant roles to the service account you just made:
# gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
#     --member serviceAccount:my-sa-123@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --role roles/editor
# Copied!
# The output displays a list of roles the service account now has:

# bindings:
# - members:
#   - user:email1@gmail.com
#     role: roles/owner
# - members:
#   - serviceAccount:our-project-123@appspot.gserviceaccount.com
#   - serviceAccount:123456789012-compute@developer.gserviceaccount.com
#   - serviceAccount:my-sa-123@my-project-123.iam.gserviceaccount.com
#   - user:email3@gmail.com
#     role: roles/editor
# - members:
#   - user:email2@gmail.com
# role: roles/viewer
# etag: BwUm38GGAQk=
# version: 1
# Click Check my progress to verify the objective.
# Assessment Completed!
# Create and Manage Service Accounts
# Assessment Completed!

# Task 2. Use the client libraries to access BigQuery using a service account
# In this section, you query the BigQuery public datasets from an instance with the help of a service account that has the necessary roles.

# Create a service account
# First create a new service account from the console.

# Go to Navigation menu > IAM & Admin, select Service accounts and click on + Create Service Account.

# Fill necessary details with:

# Service account name: bigquery-qwiklab
# Now click Create and Continue and then add the following roles:
# Role: Bigquery > BigQuery Data Viewer and BigQuery > BigQuery User
# Your console should resemble the following:

# Create service account tabbed page

# Click Continue and then click Done.
# Create a VM instance
# In the console, go to Compute Engine > VM Instances, and click Create Instance.

# Create your VM with the following information:

# Configuration	Value
# Name	bigquery-instance
# Region	us-west4
# Zone	us-west4-c
# Series	E2
# Machine Type	e2-medium
# Boot Disk	Debian GNU/Linux 11 (bullseye)
# Service account	bigquery-qwiklab
# Note: If the `bigquery-qwiklab` service account doesn't appear in the drop-down list, try typing the name into the "Filter" section.
# Click Create.
# Put the example code on a Compute Engine instance
# In the console, go to Compute Engine > VM Instances.
# SSH into bigquery-instance by clicking on the SSH button.
# Note: While connecting to SSH, you can click on Connect without Identity-Aware Proxy.
# In the SSH window, install the necessary dependencies by running the following commands:

    # EQUIVALENT COMMANDLINE

    gcloud compute instances create bigquery-instance --project=qwiklabs-gcp-03-fcb7d42d2f84 --zone=us-west4-c --machine-type=e2-medium --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=bigquery-qwiklab@qwiklabs-gcp-03-fcb7d42d2f84.iam.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --create-disk=auto-delete=yes,boot=yes,device-name=bigquery-instance,image=projects/debian-cloud/global/images/debian-11-bullseye-v20240312,mode=rw,size=10,type=projects/qwiklabs-gcp-03-fcb7d42d2f84/zones/us-west4-c/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any
    
    # EQUIVALENT REST
    POST https://compute.googleapis.com/compute/v1/projects/qwiklabs-gcp-03-fcb7d42d2f84/zones/us-west4-c/instances
{
  "canIpForward": false,
  "confidentialInstanceConfig": {
    "enableConfidentialCompute": false
  },
  "deletionProtection": false,
  "description": "",
  "disks": [
    {
      "autoDelete": true,
      "boot": true,
      "deviceName": "bigquery-instance",
      "diskEncryptionKey": {},
      "initializeParams": {
        "diskSizeGb": "10",
        "diskType": "projects/qwiklabs-gcp-03-fcb7d42d2f84/zones/us-west4-c/diskTypes/pd-balanced",
        "labels": {},
        "sourceImage": "projects/debian-cloud/global/images/debian-11-bullseye-v20240312"
      },
      "mode": "READ_WRITE",
      "type": "PERSISTENT"
    }
  ],
  "displayDevice": {
    "enableDisplay": false
  },
  "guestAccelerators": [],
  "instanceEncryptionKey": {},
  "keyRevocationActionType": "NONE",
  "labels": {
    "goog-ec-src": "vm_add-rest"
  },
  "machineType": "projects/qwiklabs-gcp-03-fcb7d42d2f84/zones/us-west4-c/machineTypes/e2-medium",
  "metadata": {
    "items": [
      {
        "key": "enable-oslogin",
        "value": "true"
      }
    ]
  },
  "name": "bigquery-instance",
  "networkInterfaces": [
    {
      "accessConfigs": [
        {
          "name": "External NAT",
          "networkTier": "PREMIUM"
        }
      ],
      "stackType": "IPV4_ONLY",
      "subnetwork": "projects/qwiklabs-gcp-03-fcb7d42d2f84/regions/us-west4/subnetworks/default"
    }
  ],
  "params": {
    "resourceManagerTags": {}
  },
  "reservationAffinity": {
    "consumeReservationType": "ANY_RESERVATION"
  },
  "scheduling": {
    "automaticRestart": true,
    "onHostMaintenance": "MIGRATE",
    "provisioningModel": "STANDARD"
  },
  "serviceAccounts": [
    {
      "email": "bigquery-qwiklab@qwiklabs-gcp-03-fcb7d42d2f84.iam.gserviceaccount.com",
      "scopes": [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
  ],
  "shieldedInstanceConfig": {
    "enableIntegrityMonitoring": true,
    "enableSecureBoot": false,
    "enableVtpm": true
  },
  "tags": {
    "items": []
  },
  "zone": "projects/qwiklabs-gcp-03-fcb7d42d2f84/zones/us-west4-c"
}

# EQUIVALENT TERRAFORM

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "bigquery-instance" {
  boot_disk {
    auto_delete = true
    device_name = "bigquery-instance"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20240312"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-medium"

  metadata = {
    enable-oslogin = "true"
  }

  name = "bigquery-instance"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/qwiklabs-gcp-03-fcb7d42d2f84/regions/us-west4/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "bigquery-qwiklab@qwiklabs-gcp-03-fcb7d42d2f84.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-west4-c"
}


# sudo apt-get update
# Copied!
# sudo apt-get install -y git python3-pip
# Copied!
# pip3 install --upgrade pip
# Copied!
# pip3 install google-cloud-bigquery
# Copied!
# pip3 install pyarrow
# Copied!
# pip3 install pandas
# Copied!
# pip3 install db-dtypes
# Copied!
# Now create the example Python file:

# echo "
# from google.auth import compute_engine
# from google.cloud import bigquery

# credentials = compute_engine.Credentials(
#     service_account_email='YOUR_SERVICE_ACCOUNT')

# query = '''
# SELECT
#   year,
#   COUNT(1) as num_babies
# FROM
#   publicdata.samples.natality
# WHERE
#   year > 2000
# GROUP BY
#   year
# '''

# client = bigquery.Client(
#     project='qwiklabs-gcp-03-fcb7d42d2f84',
#     credentials=credentials)
# print(client.query(query).to_dataframe())
# " > query.py
# Copied!
# Add the Project ID to query.py with:

# sed -i -e "s/qwiklabs-gcp-03-fcb7d42d2f84/$(gcloud config get-value project)/g" query.py
# Copied!
# Run the following to make sure that the sed command has successfully changed the Project ID in the file:

# cat query.py
# Copied!
# Example output (yours may differ):

# from google.auth import compute_engine
# from google.cloud import bigquery

# credentials = compute_engine.Credentials(
#     service_account_email='YOUR_SERVICE_ACCOUNT')

# query = '''
# SELECT
#   year,
#   COUNT(1) as num_babies
# FROM
#   publicdata.samples.natality
# WHERE
#   year > 2000
# GROUP BY
#   year
# '''

# client = bigquery.Client(
#     project=qwiklabs-gcp-03-fcb7d42d2f84,
#     credentials=credentials)
# print(client.query(query).to_dataframe())
# Add the service account email to query.py with:

# sed -i -e "s/YOUR_SERVICE_ACCOUNT/bigquery-qwiklab@$(gcloud config get-value project).iam.gserviceaccount.com/g" query.py
# Copied!
# Run the following to make sure that the sed command has successfully changed the service account email in the file:

# cat query.py
# Copied!
# Example output (yours may differ):

# from google.auth import compute_engine
# from google.cloud import bigquery
# credentials = compute_engine.Credentials(
#     service_account_email='bigquery-qwiklab@qwiklabs-gcp-03-fcb7d42d2f84.iam.gserviceaccount.com')

# query = '''
# SELECT
#   year,
#   COUNT(1) as num_babies
# FROM
#   publicdata.samples.natality
# WHERE
#   year > 2000
# GROUP BY
#   year
# '''

# client = bigquery.Client(
#     project=qwiklabs-gcp-03-fcb7d42d2f84,
#     credentials=credentials)
# print(client.query(query).to_dataframe())
# The application now uses the permissions that are associated with this service account. Run the query with the following Python command:

# python3 query.py
# Copied!
# The query should return the following output (your numbers may vary):

# Row year  num_babies
# 0   2008  4255156
# 1   2006  4273225
# 2   2003  4096092
# 3   2004  4118907
# 4   2002  4027376
# 5   2005  4145619
# 6   2001  4031531
# 7   2007  4324008
# Note: Your row values might not map to the years in the above output. However, make sure that the babies per year are the same.
# Awesome work! You made a request to a BigQuery public dataset with a bigquery-qwiklab service account.

# Click Check my progress to verify the objective.
# Access BigQuery using a Service Account

# Congratulations!
# In this lab, you learned how to use service accounts.

# Next steps / Learn more
# Read more about creating and managing service accounts in the Creating and managing service accounts Guide.
# Check out these labs:
# Securing Google Cloud with CFT Scorecard
# Cloud Security Scanner: Qwik Start
# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated April 15, 2024

# Lab Last Tested June 30, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.