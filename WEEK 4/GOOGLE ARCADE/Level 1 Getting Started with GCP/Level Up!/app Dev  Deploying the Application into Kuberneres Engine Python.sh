# App Dev: Deploying the Application into Kubernetes Engine - Python
# schedule
# 50 minutes
# universal_currency_alt
# No cost
# Lab instructions and tasks
# GSP188
# Overview
# What you'll learn
# Setup and requirements
# Prepare the Quiz application
# Review the code
# Create and connect to a Kubernetes Engine Cluster
# Build Docker images using Container Builder
# Create Kubernetes deployment and service resources
# Test the Quiz Application
# Congratulations!
# GSP188
# Google Cloud self-paced labs logo

# Overview
# Google Kubernetes Engine provides a managed environment for deploying, managing, and scaling your containerized applications using Google infrastructure. The environment Kubernetes Engine provides consists of multiple machines (specifically, Compute Engine instances) grouped together to form a cluster.

# Kubernetes provides the mechanisms through which you interact with your cluster. You use Kubernetes commands and resources to deploy and manage your applications, perform administration tasks and set policies, and monitor the health of your deployed workloads.

# In this lab, you deploy the Quiz application into Kubernetes Engine, leveraging Google Cloud resources, including Container Builder and Container Registry, and Kubernetes resources, such as Deployments, Pods, and Services.

# What you'll learn
# In this lab, you learn how to perform the following tasks:

# Create Dockerfiles to package up the Quiz application frontend and backend code for deployment.
# Harness Container Builder to produce Docker images.
# Provision a Kubernetes Engine cluster to host the Quiz application.
# Employ Kubernetes deployments to provision replicated Pods into Kubernetes Engine.
# Leverage a Kubernetes service to provision a load balancer for the quiz frontend.
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
# Launch the Cloud Shell Code Editor
# From Cloud Shell, click Open Editor to launch the code editor.

# editor.png

# Note: The code editor launches in a separate tab of your browser, along with Cloud Shell.
# Prepare the Quiz application
# In this section, you access Cloud Shell, clone the git repository containing the Quiz application, configure environment variables, and run the application.

# Clone source code in Cloud Shell
# Click Open Terminal and clone the repository for the lab.

# git clone https://github.com/GoogleCloudPlatform/training-data-analyst
# Copied!
# Create a soft link as a shortcut to the working directory.

# ln -s ~/training-data-analyst/courses/developingapps/v1.2/python/kubernetesengine ~/kubernetesengine
# Copied!
# Configure the Quiz application
# Change the directory that contains the sample files for this lab.

# cd ~/kubernetesengine/start
# Copied!
# Configure the Quiz application.

# . prepare_environment.sh
# Copied!
# This script file:

# Creates a Google App Engine application.
# Exports environment variables GCLOUD_PROJECT and GCLOUD_BUCKET.
# Updates pip then runs pip install -r requirements.txt.
# Creates entities in Google Cloud Datastore.
# Creates a Google Cloud Pub/Sub topic.
# Creates a Cloud Spanner Instance, Database, and Table.
# Prints out the Project ID.
# The Quiz application is configured when you see the following message:

# Example output message

# Creating Cloud Pub/Sub topic
# Created topic [projects/qwiklabs-gcp-92b7e5716e0cbf7e/topics/feedback].
# Created subscription [projects/qwiklabs-gcp-92b7e5716e0cbf7e/subscriptions/worker-subscription].
# Creating Cloud Spanner Instance, Database, and Table
# Creating instance...done.
# Creating database...done.
# Project ID: qwiklabs-gcp-92b7e5716e0cbf7e
# Click Check my progress to verify the objective.
# Configure the Quiz application

# Review the code
# In this section you examine the application files.

# To view and edit files, you can use the shell editors that are installed in Cloud Shell, such as nano or vim or the Cloud Shell code editor. This lab uses the Cloud Shell code editor.

# Examine the code
# Navigate to training-data-analyst/courses/developingapps/v1.2/python/kubernetesengine/start.

# The folder structure for the Quiz application reflects how it will be deployed in Kubernetes Engine.

# The web application is in a folder called frontend.

# The worker application code that subscribes to Cloud Pub/Sub and processes messages is in a folder called backend.

# There are configuration files for Docker (a Dockerfile in the frontend and backend folder) and backend-deployment and frontend-deployment Kubernetes Engine .yaml files.

# Create and connect to a Kubernetes Engine Cluster
# Create a Kubernetes Engine cluster
# In the Cloud Platform Console, click Navigation menu (Navigation menu icon)> Kubernetes Engine > Clusters.

# Click Create.

# Click Switch to the Standard cluster on the top right corner. Set the following fields to the provided values, leave all others at the default value:

# Property

# Value

# Name

# quiz-cluster

# Zone

# ZONE

# default Pool > Security > Access scopes

# Select Allow full access to all Cloud APIs

# Click Create. The cluster takes a few minutes to provision.

# Click Check my progress to verify the objective.
# Create Kubernetes engine cluster

# Connect to the cluster
# In this section you connect the Quiz application to the kubernetes cluster.

# When the cluster is ready, click on the Actions icon and select Connect.
# Kubernetes clusters list with Connect option highlighted

# In Connect to the cluster, click Run in Cloud Shell to populated Cloud shell with the command that resembles.
# gcloud container clusters get-credentials quiz-cluster --zone "ZONE" --project [Project-ID]
# Copied!
# Press ENTER to run the command in Cloud Shell.

# Run the following command to list the pods in the cluster:
# kubectl get pods
# Copied!
# The response should be No resources found because there are no pods in the cluster. It confirms that you have configured security to allow the kubectl command-line tool to perform operations against the cluster.

# Build Docker images using Container Builder
# In this section, you create a Dockerfile for the application frontend and backend, and then employ Container Builder to build images and store them in the Container Registry.

# Create the Dockerfile for the frontend and backend
# In the Cloud Shell code editor, open frontend/Dockerfile.
# Now add a block of code that does the following:
# Enter the Dockerfile command to initialize the creation of a custom Docker image using Google's Python App Engine image as the starting point.
# Writes the Dockerfile commands to activate a virtual environment.
# Writes the Dockerfile command to execute pip install as part of the build process.
# Writes the Dockerfile command to add the contents of the current folder to the /app path in the container.
# Completes the Dockerfile by entering the statement, gunicorn ..., that executes when the container runs. Gunicorn (Green Unicorn) is an HTTP server that supports the Python Web Server Gateway Interface (WSGI) specification.
# Copy and paste the following to Dockerfile:

# FROM gcr.io/google_appengine/python

# RUN virtualenv -p python3.7 /env

# ENV VIRTUAL_ENV /env
# ENV PATH /env/bin:$PATH

# ADD requirements.txt /app/requirements.txt
# RUN pip install -r /app/requirements.txt

# ADD . /app

# CMD gunicorn -b 0.0.0.0:$PORT quiz:app
# Copied!
# Open the backend/Dockerfile file and copy and paste the following code:
# FROM gcr.io/google_appengine/python

# RUN virtualenv -p python3.7 /env

# ENV VIRTUAL_ENV /env
# ENV PATH /env/bin:$PATH

# ADD requirements.txt /app/requirements.txt
# RUN pip install -r /app/requirements.txt

# ADD . /app

# CMD python -m quiz.console.worker
# Copied!
# Build Docker images with Container Builder
# In Cloud Shell, make sure you are in the start folder:
# cd ~/kubernetesengine/start
# Copied!
# Run the following command to build the frontend Docker image:
# gcloud builds submit -t gcr.io/$DEVSHELL_PROJECT_ID/quiz-frontend ./frontend/
# Copied!
# The files are staged into Cloud Storage, and a Docker image is built and stored in the Container Registry. It takes a few minutes.

# Ignore any incompatibility messages you see in the output messages.

# Now run the following command to build the backend Docker image:
# gcloud builds submit -t gcr.io/$DEVSHELL_PROJECT_ID/quiz-backend ./backend/
# Copied!
# When the backend Docker image is ready you see these last messages:

# DONE
# -----------------------------------------------------------------------------------------------------------------------
# ID                                    CREATE_TIME                DURATION  SOURCE                                      
#                                                              IMAGES                                                    
#    STATUS
# be0326f4-3f6f-42d6-850f-547e260dd4d7  2018-06-13T22:20:16+00:00  50S       gs://qwiklabs-gcp-3f89d0745056ee31_cloudbuil
# d/source/1528928414.79-4914d2a972f74e188f40ced135662b7d.tgz  gcr.io/qwiklabs-gcp-3f89d0745056ee31/quiz-backend (+1 more
# )  SUCCESS
# In the Cloud Platform console, from the Navigation menu menu, click Container Registry. You should see two pods: quiz-frontend and quiz-backend.

# Click quiz-frontend.

# Note: >You should see the image Name and Tags (latest).
# Click Check my progress to verify the objective.
# Build Docker Images using Container Builder

# Create Kubernetes deployment and service resources
# In this section, you modify the template yaml files that contain the specification for Kubernetes Deployment and Service resources, and then create the resources in the Kubernetes Engine cluster.

# Create a Kubernetes deployment file
# In the Cloud Shell Code Editor, open the frontend-deployment.yaml file.
# Note: The file skeleton has been created for you. Your job is to replace placeholders with values specific to your project.
# Replace the placeholders in the frontend-deployment.yaml file using the following values:
# Placeholder Name

# Value

# [GCLOUD_PROJECT]

# Project ID
# (Display the Project ID by entering
# echo $GCLOUD_PROJECT in Cloud Shell)

# [GCLOUD_BUCKET]

# Cloud Storage bucket name for the media bucket in your project
# (Display the bucket name by entering
# echo $GCLOUD_BUCKET in Cloud Shell)

# [FRONTEND_IMAGE_IDENTIFIER]

# The frontend image identified in the form gcr.io/[Project_ID]/quiz-frontend

# Note: The quiz-frontend deployment provisions three replicas of the frontend Docker image in Kubernetes pods, distributed across the three nodes of the Kubernetes Engine cluster.
# Save the file.
# Replace the placeholders in the backend-deployment.yaml file using the following values:
# Placeholder Name

# Value

# [GCLOUD_PROJECT]

# Project ID

# [GCLOUD_BUCKET]

# Cloud Storage bucket ID for the media bucket in your project

# [BACKEND_IMAGE_IDENTIFIER]

# The backend image identified in the form gcr.io/[Project_ID]/quiz-backend

# Note: The quiz-backend deployment provisions two replicas of the backend Docker image in Kubernetes pods, distributed across two of the three nodes of the Kubernetes Engine cluster.
# Save the file.
# Review the contents of the frontend-service.yaml file.
# Note: The service exposes the frontend deployment using a load balancer. The load balancer sends requests from clients to all three replicas of the frontend pod.
# Execute the deployment and service Files
# In Cloud Shell, provision the quiz frontend deployment.
# kubectl create -f ./frontend-deployment.yaml
# Copied!
# Provision the quiz backend Deployment.
# kubectl create -f ./backend-deployment.yaml
# Copied!
# Provision the quiz frontend Service.
# kubectl create -f ./frontend-service.yaml
# Copied!
# Note: Each command provisions resources in the Kubernetes Engine. It takes a few minutes to complete the process.
# Click Check my progress to verify the objective.
# Create Kubernetes Deployment and Service Resources

# Test the Quiz Application
# In this section you review the deployed Pods and Service and navigate to the Quiz application.

# Review the deployed resources
# In the Cloud Console, select Navigation menu > Kubernetes Engine.
# Click Workloads in the left menu.
# Note: You should see two containers: quiz-frontend and quiz-backend. You may see that the status is OK or in the process of being created.
# If the status of one or both containers is Does not have minimum availability, refresh the window.

# Click quiz-frontend. In the Managed pods section, there are three quiz-frontend pods.

# In the Exposing services section near the bottom, find the Endpoints section and copy the IP address and paste it into the URL field of a new browser tab or window:

# app.png

# This opens the Quiz application, which means you successfully deployed the application! You can end your lab here or use the remainder of the time to build some quizzes.
# Congratulations!
# This concludes the self-paced lab, App Dev: Deploying the Application into Kubernetes Engine - Python. You leveraged Google Cloud resources and Kubenetes resources to deploy a Quiz application.

# Finish your quest
# This self-paced lab is part of the Application Development - Python and Cloud Development quests. A quest is a series of related labs that form a learning path. Completing a quest earns you a badge to recognize your achievement. You can make your badge or badges public and link to them in your online resume or social media account. Enroll in any quest that contains this lab and get immediate completion credit. Refer to the Google Cloud Skills Boost catalog for all available quests.

# Next steps / Learn more
# Learn more about Kubernetes Engine.

# Manual Last Updated November 03, 2023

# Lab Last Tested November 03, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION

export ZONE=us-east4-c

curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/App%20Dev%20Deploying%20the%20Application%20into%20Kubernetes%20Engine%20-%20Python/gsp188.sh

sudo chmod +x gsp188.sh

./gsp188.sh
