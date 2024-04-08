
# Pub/Sub: Qwik Start - Console
# schedule
# 30 minutes
# universal_currency_alt
# No cost
# Lab instructions and tasks
# GSP096
# Overview
# Setup and requirements
# Task 1. Setting up Pub/Sub
# Task 2. Add a subscription
# Task 3. Test your understanding
# Task 4. Publish a message to the topic
# Task 5. View the message
# Congratulations!
# GSP096
# Google Cloud self-paced labs logo

# Overview
# Pub/Sub is a messaging service for exchanging event data among applications and services. A producer of data publishes messages to a Pub/Sub topic. A consumer creates a subscription to that topic. Subscribers either pull messages from a subscription or are configured as webhooks for push subscriptions. Every subscriber must acknowledge each message within a configurable window of time.

# What you'll learn
# Set up a topic to hold data.
# Subscribe to a topic to access the data.
# Publish and then consume messages with a pull subscriber.
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
# Task 1. Setting up Pub/Sub
# To use Pub/Sub, you create a topic to hold data and a subscription to access data published to the topic.

# From the Navigation menu (Navigation menu icon) go to Pub/Sub > Topics.
# Navigation menu

# Click Create topic.
# Create topic button

# The topic must have a unique name. For this lab, name your topic MyTopic. In the Create a topic dialog:
# For Topic ID, type MyTopic.
# Leave other fields at their default value.
# Click CREATE.
# Create a topic dialog box

# You've created a topic.

# Test completed task
# Click Check my progress to verify your performed task. If you have successfully created a Cloud Pub/Sub topic, you will see an assessment score.

# Create a Pub/Sub topic.
# Task 2. Add a subscription
# Now you'll make a subscription to access the topic.

# Click Topics in the left panel to return to the Topics page. For the topic you just made click the three dot icon > Create subscription.
# Topics page

# In the Add subscription to topic dialog:
# Type a name for the subscription, such as MySub
# Set the Delivery Type to Pull.
# Leave all other options at the default values.
# Add subscription to topic dialog box

# Click Create.
# Your subscription is listed in the Subscription list.

# Test completed task
# Click Check my progress to verify your performed task. If you have successfully created a subscription for Cloud Pub/Sub topic, you will see an assessment score.

# Add a subscription.
# Task 3. Test your understanding
# Below are multiple choice questions to reinforce your understanding of this lab's concepts. Answer them to the best of your abilities.


# A publisher application creates and sends messages to a ____. Subscriber applications create a ____ to a topic to receive messages from it.

# subscription, topic

# subscription, subscription

# topic, subscription

# topic, topic


# Cloud Pub/Sub is an asynchronous messaging service designed to be highly reliable and scalable.

# True

# False

# Task 4. Publish a message to the topic
# Navigate back to pub/sub > Topics and open MyTopics page.

# In the Topics details page, click Messages tab and then click Publish Message.

# Enter Hello World in the Message field and click Publish.

# Hello World in the Message field

# Task 5. View the message
# To view the message, use the subscription (MySub) to pull the message (Hello World) from the topic (MyTopic).

# Enter the following command in Cloud Shell:
# gcloud pubsub subscriptions pull --auto-ack MySub
# Copied!
# The message appears in the DATA field of the command output.

# Command output

# You created a Pub/Sub topic, published to the topic, created a subscription, then used the subscription to pull data from the topic.

# Congratulations!
# You created a Pub/Sub topic, published to the topic, created a subscription, then used the subscription to pull data from the topic.

# Take your next lab
# This lab is also part of a series of labs called Qwik Starts. These labs are designed to give you a little taste of the many features available with Google Cloud. Search for "Qwik Starts" in the lab catalog to find the next lab you'd like to take!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 13, 2024

# Lab Last Tested August 10, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

