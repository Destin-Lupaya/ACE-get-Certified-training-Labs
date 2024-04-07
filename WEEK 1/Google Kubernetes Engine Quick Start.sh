# Google Kubernetes Engine: Qwik Start
# schedule
# 45 minutes
# universal_currency_alt
# 1 Credit
# GSP100
# Google Cloud self-paced labs logo

# Overview
# Google Kubernetes Engine (GKE) provides a managed environment for deploying, managing, and scaling your containerized applications using Google infrastructure. The GKE environment consists of multiple machines (specifically Compute Engine instances) grouped to form a container cluster.

# In this lab, you get hands-on practice with container creation and application deployment with GKE.

# Objectives
# In this lab you will learn how to:

# Create a GKE cluster
# Deploy an application to the cluster
# Delete the cluster
# Cluster orchestration with Google Kubernetes Engine
# Google Kubernetes Engine (GKE) clusters are powered by the Kubernetes open source cluster management system. Kubernetes provides the mechanisms through which you interact with your container cluster. You use Kubernetes commands and resources to deploy and manage your applications, perform administrative tasks, set policies, and monitor the health of your deployed workloads.

# Kubernetes draws on the same design principles that run popular Google services and provides the same benefits: automatic management, monitoring and liveness probes for application containers, automatic scaling, rolling updates, and more. When you run your applications on a container cluster, you're using technology based on Google's 10+ years of experience with running production workloads in containers.

# Kubernetes on Google Cloud
# When you run a GKE cluster, you also gain the benefit of advanced cluster management features that Google Cloud provides. These include:

# Load balancing for Compute Engine instances
# Node pools to designate subsets of nodes within a cluster for additional flexibility
# Automatic scaling of your cluster's node instance count
# Automatic upgrades for your cluster's node software
# Node auto-repair to maintain node health and availability
# Logging and Monitoring with Cloud Monitoring for visibility into your cluster
# Now that you have a basic understanding of Kubernetes, you will learn how to deploy a containerized application with GKE in less than 30 minutes. Follow the steps below to set up your lab environment.

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
# Task 1. Set a default compute zone
# Your compute zone is an approximate regional location in which your clusters and their resources live. For example, us-central1-a is a zone in the us-central1 region.

# In your Cloud Shell session, run the following commands.

# Set the default compute region:

# gcloud config set compute/region "REGION"
# Copied!
# Expected output:

# Updated property [compute/region].
# Set the default compute zone:

# gcloud config set compute/zone "ZONE"
# Copied!
# Expected output:

# Updated property [compute/zone].
# Task 2. Create a GKE cluster
# A cluster consists of at least one cluster master machine and multiple worker machines called nodes. Nodes are Compute Engine virtual machine (VM) instances that run the Kubernetes processes necessary to make them part of the cluster.

# Note: Cluster names must start with a letter and end with an alphanumeric, and cannot be longer than 40 characters.
# Run the following command:

# Create a cluster:

# gcloud container clusters create --machine-type=e2-medium --zone=ZONE lab-cluster
# Copied!
# You can ignore any warnings in the output. It might take several minutes to finish creating the cluster.

# Expected output:

# NAME: lab-cluster
# LOCATION: ZONE
# MASTER_VERSION: 1.22.8-gke.202
# MASTER_IP: 34.67.240.12
# MACHINE_TYPE: e2-medium
# NODE_VERSION: 1.22.8-gke.202
# NUM_NODES: 3
# STATUS: RUNNING
# Click Check my progress to verify the objective.
# Create a GKE cluster

# Task 3. Get authentication credentials for the cluster
# After creating your cluster, you need authentication credentials to interact with it.

# Authenticate with the cluster:

# gcloud container clusters get-credentials lab-cluster
# Copied!
# Expected output:

# Fetching cluster endpoint and auth data.
# kubeconfig entry generated for my-cluster.
# Task 4. Deploy an application to the cluster
# You can now deploy a containerized application to the cluster. For this lab, you'll run hello-app in your cluster.

# GKE uses Kubernetes objects to create and manage your cluster's resources. Kubernetes provides the Deployment object for deploying stateless applications like web servers. Service objects define rules and load balancing for accessing your application from the internet.

# To create a new Deployment hello-server from the hello-app container image, run the following kubectl create command:

# kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
# Copied!
# Expected output:

# deployment.apps/hello-server created
# This Kubernetes command creates a deployment object that represents hello-server. In this case, --image specifies a container image to deploy. The command pulls the example image from a Container Registry bucket. gcr.io/google-samples/hello-app:1.0 indicates the specific image version to pull. If a version is not specified, the latest version is used.

# Click Check my progress to verify the objective.
# Create a new Deployment: hello-server

# To create a Kubernetes Service, which is a Kubernetes resource that lets you expose your application to external traffic, run the following kubectl expose command:

# kubectl expose deployment hello-server --type=LoadBalancer --port 8080
# Copied!
# In this command:

# --port specifies the port that the container exposes.
# type="LoadBalancer" creates a Compute Engine load balancer for your container.
# Expected output:

# service/hello-server exposed
# To inspect the hello-server Service, run kubectl get:

# kubectl get service
# Copied!
# Expected output:

# NAME             TYPE            CLUSTER-IP      EXTERNAL-IP     PORT(S)           AGE
# hello-server     loadBalancer    10.39.244.36    35.202.234.26   8080:31991/TCP    65s
# kubernetes       ClusterIP       10.39.240.1               433/TCP           5m13s
# Note: It might take a minute for an external IP address to be generated. Run the previous command again if the EXTERNAL-IP column status is pending.
# To view the application from your web browser, open a new tab and enter the following address, replacing [EXTERNAL IP] with the EXTERNAL-IP for hello-server.

# http://[EXTERNAL-IP]:8080
# Copied!
# Expected output: The browser tab displays the message Hello, world! as well as the version and hostname.

# Click Check my progress to verify the objective.
# Create a Kubernetes Service

# Task 5. Deleting the cluster
# To delete the cluster, run the following command:

# gcloud container clusters delete lab-cluster
# Copied!
# When prompted, type Y to confirm.

# Deleting the cluster can take a few minutes. For more information on deleted GKE clusters from the Google Kubernetes Engine (GKE) article, Deleting a cluster.

# Click Check my progress to verify the objective.
# Delete the cluster

# Congratulations!
# You have just deployed a containerized application to Google Kubernetes Engine! In this lab, you created a GKE cluster, deployed a containerized application to the cluster, and deleted the cluster. You can now apply this knowledge to deploy your own applications with GKE.

# Next steps / Learn more
# This lab is part of a series of labs called Qwik Starts. These labs are designed to give you some experience with the many features available with Google Cloud. Search for "Qwik Starts" in the Google Cloud Skill Boost catalog to find the next lab you'd like to take!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 13, 2024

# Lab Last Tested January 26, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# Ready for more?
# Here's another lab we think you'll like.