# Pub/Sub: Qwik Start - Python
# schedule
# 30 minutes
# universal_currency_alt
# 1 Credit
# GSP094
# Google Cloud self-paced labs logo

# Overview
# The Pub/Sub service allows applications to exchange messages reliably, quickly, and asynchronously. To accomplish this, a data producer publishes messages to a Cloud Pub/Sub topic. A subscriber client then creates a subscription to that topic and consumes messages from the subscription. Cloud Pub/Sub persists messages that could not be delivered reliably for up to seven days.

# In this lab, you will learn how to get started publishing messages with Pub/Sub using the Python client library.

# What you'll do
# In this lab, you'll do the following:

# Learn the basics of Pub/Sub
# Create, delete, and list Pub/Sub topics and subscriptions
# Publish messages to a topic.
# Use a pull subscriber to output individual topic messages.
# Setup and Requirements
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
# Task 1. Create a virtual environment
# Python virtual environments are used to isolate package installation from the system.

# Install the virtualenv environment:
# sudo apt-get install -y virtualenv
# Copied!
# Build the virtual environment:
# python3 -m venv venv
# Copied!
# Activate the virtual environment.
# source venv/bin/activate
# Copied!
# Task 2. Install the client library
# Run the following to install the client library:
# pip install --upgrade google-cloud-pubsub
# Copied!
# Get the sample code by cloning a GitHub repository:
# git clone https://github.com/googleapis/python-pubsub.git
# Copied!
# Navigate to the directory:
# cd python-pubsub/samples/snippets
# Copied!
# Task 3. Pub/Sub - the Basics
# Pub/Sub is an asynchronous global messaging service. There are three terms in Pub/Sub that appear often: topics, publishing, and subscribing.

# A topic is a shared string that allows applications to connect with one another through a common thread.

# Publishers push (or publish) a message to a Pub/Sub topic. Subscribers will then make a subscription to that thread, where they will either pull messages from the topic or configure webhooks for push subscriptions. Every subscriber must acknowledge each message within a configurable window of time.

# In sum, a publisher creates and sends messages to a topic and a subscriber creates a subscription to a topic to receive messages from it.

# Pub/Sub in Google CLoud
# Pub/Sub comes preinstalled in Cloud Shell, so there are no installations or configurations required to get started with this service. In this lab you use Python to create the topic, subscriber, and then view the message. You use a gcloud command to publish the message to the topic.

# Task 4. Create a topic
# To publish data to Pub/Sub you create a topic and then configure a publisher to the topic.

# In Cloud Shell, your Project ID should automatically be stored in the environment variable GOOGLE_CLOUD_PROJECT:
# echo $GOOGLE_CLOUD_PROJECT
# Copied!
# Ensure the output is the same as the Project ID in your CONNECTION DETAILS.
# publisher.py is a script that demonstrates how to perform basic operations on topics with the Cloud Pub/Sub API. View the content of publisher script:

# cat publisher.py
# Copied!
# Note: Alternatively, you can use the shell editors that are installed on Cloud Shell, such as nano or vim or use the Cloud Shell code editor to view python-pubsub/samples/snippets/publisher.py.
# For information about the publisher script:
# python publisher.py -h
# Copied!
# Example output:

# usage: publisher.py [-h]
#                     project
#                     {list,create,delete,publish,publish-with-custom-attributes,publish-with-futures,publish-with-error-handler,publish-with-batch-settings}
#                     ...

# This application demonstrates how to perform basic operations on topics
# with the Cloud Pub/Sub API.

# For more information, see the README.md under /pubsub and the documentation
# at https://cloud.google.com/pubsub/docs.

# positional arguments:
#   project               Your Google Cloud project ID
#   {list,create,delete,publish,publish-with-custom-attributes,publish-with-futures,publish-with-error-handler,publish-with-batch-settings}
#     list                Lists all Pub/Sub topics in the given project.
#     create              Create a new Pub/Sub topic.
#     delete              Deletes an existing Pub/Sub topic.
#     publish             Publishes multiple messages to a Pub/Sub topic.
#     publish-with-custom-attributes
#                         Publishes multiple messages with custom attributes to
#                         a Pub/Sub topic.
#     publish-with-futures
#                         Publishes multiple messages to a Pub/Sub topic and
#                         prints their message IDs.
#     publish-with-error-handler
#                         Publishes multiple messages to a Pub/Sub topic with an
#                         error handler.
#     publish-with-batch-settings
#                         Publishes multiple messages to a Pub/Sub topic with
#                         batch settings.

# optional arguments:
#   -h, --help            show this help message and exit
# Run the publisher script to create Pub/Sub Topic:
# python publisher.py $GOOGLE_CLOUD_PROJECT create MyTopic
# Copied!
# Example output:

# Topic created: name: "projects/qwiklabs-gcp-fe27729bc161fb22/topics/MyTopic"
# Test Completed Task

# Click Check my progress to verify your performed task. If you have successfully created a Cloud Pub/Sub topic, you will see an assessment score.

# Create a topic.
# This command returns a list of all Pub/Sub topics in a given project:
# python publisher.py $GOOGLE_CLOUD_PROJECT list
# Copied!
# Example output:

# name: "projects/qwiklabs-gcp-fe27729bc161fb22/topics/MyTopic"
# You can also view the topic you just made in the Cloud Console.

# Navigate to Navigation menu > Pub/Sub > Topics.
# You should see MyTopic.

# Task 5. Create a subscription
# Create a Pub/Sub subscription for topic with subscriber.py script:
# python subscriber.py $GOOGLE_CLOUD_PROJECT create MyTopic MySub
# Copied!
# Test Completed Task

# Click Check my progress to verify your performed task. If you have successfully created a Cloud Pub/Sub subscription, you will see an assessment score.

# Create a subscription.
# This command returns a list of subscribers in given project:
# python subscriber.py $GOOGLE_CLOUD_PROJECT list-in-project
# Copied!
# You'll see only one subscription because you've made only one subscription.

# Example output:

# projects/qwiklabs-gcp-7877af129f04d8b3/subscriptions/MySub
# Check out the subscription you just made in the console. In the left pane, click Subscriptions. You should see the subscription name and other details.

# For information about the subscriber script:

# python subscriber.py -h
# Copied!
# Output:

# usage: subscriber.py [-h]
#                      project
#                      {list_in_topic,list_in_project,create,create-push,delete,update,receive,receive-custom-attributes,receive-flow-control,receive-synchronously,listen_for_errors}
#                      ...

# This application demonstrates how to perform basic operations on
# subscriptions with the Cloud Pub/Sub API.

# For more information, see the README.md under /pubsub and the documentation
# at https://cloud.google.com/pubsub/docs.

# positional arguments:
#   project               Your Google Cloud project ID
#   {list_in_topic,list_in_project,create,create-push,delete,update,receive,receive-custom-attributes,receive-flow-control,receive-synchronously,listen_for_errors}
#     list_in_topic       Lists all subscriptions for a given topic.
#     list_in_project     Lists all subscriptions in the current project.
#     create              Create a new pull subscription on the given topic.
#     create-push         Create a new push subscription on the given topic.
#     delete              Deletes an existing Pub/Sub topic.
#     update              Updates an existing Pub/Sub subscription's push
#                         endpoint URL. Note that certain properties of a
#                         subscription, such as its topic, are not modifiable.
#     receive             Receives messages from a pull subscription.
#     receive-custom-attributes
#                         Receives messages from a pull subscription.
#     receive-flow-control
#                         Receives messages from a pull subscription with flow
#                         control.
#     receive-synchronously
#                         Pulling messages synchronously.
#     listen_for_errors   Receives messages and catches errors from a pull
#                         subscription.

# optional arguments:
#   -h, --help            show this help message and exit
# Task 6. Publish messages
# Now that you've set up MyTopic (the topic) and a subscription to MyTopic (MySub), use gcloud commands to publish a message to MyTopic.

# Publish the message "Hello" to MyTopic:
# gcloud pubsub topics publish MyTopic --message "Hello"
# Copied!
# Publish a few more messages to MyTopic—run the following commands (replacing <YOUR NAME> with your name and <FOOD> with a food you like to eat):
# gcloud pubsub topics publish MyTopic --message "Publisher's name is <YOUR NAME>"
# Copied!
# gcloud pubsub topics publish MyTopic --message "Publisher likes to eat <FOOD>"
# Copied!
# gcloud pubsub topics publish MyTopic --message "Publisher thinks Pub/Sub is awesome"
# Copied!
# Task 7. View messages
# Now that you've published messages to MyTopic, pull and view the messages using MySub.

# Use MySub to pull the message from MyTopic:
# python subscriber.py $GOOGLE_CLOUD_PROJECT receive MySub
# Copied!
# Example output:

# Listening for messages on projects/qwiklabs-gcp-7877af129f04d8b3/subscriptions/MySub
# Received message: Message {
#   data: 'Publisher thinks Pub/Sub is awesome'
#   attributes: {}
# }
# Received message: Message {
#   data: 'Hello'
#   attributes: {}
# }
# Received message: Message {
#   data: "Publisher's name is Harry"
#   attributes: {}
# }
# Received message: Message {
#   data: 'Publisher likes to eat cheese'
#   attributes: {}
# }
# Click Ctrl+c to stop listening.
# Task 8. Test your understanding
# Below are multiple-choice questions to reinforce your understanding of this lab's concepts. Answer them to the best of your abilities.


# Google Cloud Pub/Sub service allows applications to exchange messages reliably, quickly, and asynchronously.

# True

# False

# A _____ is a shared string that allows applications to connect with one another.

# subscription

# topic

# message

# Congratulations!
# You used Python to create a Pub/Sub topic, published to the topic, created a subscription, then used the subscription to pull data from the topic.

# Next steps /Learn more
# Complementing Pub/Sub, Pub/Sub Lite is a zonal service for messaging systems with predictable traffic patterns. If you publish 1 MiB-1 GiB of messages per second, Pub/Sub Lite is a low cost option for high-volume event ingestion. Try Pub/Sub Lite with this lab:

# Pub/Sub Lite: Qwik Start
# This lab is part of a series of labs called Qwik Starts. These labs are designed to give you a little taste of the many features available with Google Cloud. Search for "Qwik Starts" in the Google Cloud Skills Boost catalog to find the next lab you'd like to take!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 13, 2024

# Lab Last Tested September 22, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.