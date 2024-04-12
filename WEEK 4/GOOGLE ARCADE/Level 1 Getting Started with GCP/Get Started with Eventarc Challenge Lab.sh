# Get Started with Eventarc: Challenge Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# ARC118
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# Setup
# Before you click the Start Lab button
# Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click Start Lab, shows how long Google Cloud resources will be made available to you.

# This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

# To complete this lab, you need:

# Access to a standard internet browser (Chrome browser recommended).
# Note: Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.
# Time to complete the lab---remember, once you start, you cannot pause a lab.
# Note: If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.
# Challenge scenario
# You are just starting your junior cloud DevOps role. So far you have been helping teams create and manage Cloud Functions, Cloud Run services, and Pub/Sub topics.

# You are expected to have the skills and knowledge for these tasks.

# Your challenge
# You are asked to help a newly formed development team with some of their initial work on a new project using Pub/Sub to manage messages. Specifically, they need to create a new Pub/Sub topic with an event trigger to a Cloud Run sink using Eventarc; you receive the following request to complete the following tasks:

# Create a Pub/Sub topic.
# Create a Cloud Run sink.
# Create and test a Pub/Sub event trigger using Eventarc.
# Some standards you should follow:

# Ensure that any needed APIs (such as Eventarc, Logging, Cloud Build, Cloud Run, and Pub/Sub) are successfully enabled.
# Create all resources in the <filled in at lab start> region, unless otherwise directed.
# Each task is described in detail below, good luck!

# Task 1. Create a Pub/Sub topic
# Create a Pub/Sub topic named project_id-topic with a subscription named project_id-topic-sub.
# Click Check my progress to verify the objective.
# Create a Pub/Sub topic

# Task 2. Create a Cloud Run sink
# Create a Cloud Run sink with the following requirements:
# Service name: pubsub-events
# Image name: gcr.io/cloudrun/hello
# Click Check my progress to verify that you've performed the above task.
# Create a Cloud Run sink

# Task 3. Create and test a Pub/Sub event trigger using Eventarc
# Create a Pub/Sub event trigger named pubsub-events-trigger with the following requirements:
# Use the Cloud Run sink and Pub/Sub topic created in the previous tasks.
# To create the trigger on an existing Pub/Sub topic, add the following argument to the command used to create the trigger: --transport-topic=project_id-topic
# Test the Pub/Sub event trigger by publishing a message to the Pub/Sub topic.
# Click Check my progress to verify that you've performed the above task.
# Create and test a Pub/Sub event trigger

# Congratulations!
# Get Started with Eventarc badge

# Earn your next skill badge
# This self-paced lab is part of the Get Started with Eventarc skill badge quest. Completing this skill badge quest earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated May 23, 2023

# Lab Last Tested May 23, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION

# https://www.youtube.com/watch?v=XZZYppIoeO8

export REGION=us-east4


gcloud pubsub topics create $DEVSHELL_PROJECT_ID-topic

gcloud  pubsub subscriptions create --topic $DEVSHELL_PROJECT_ID-topic $DEVSHELL_PROJECT_ID-topic-sub

gcloud run deploy pubsub-events \
  --image=gcr.io/cloudrun/hello \
  --platform=managed \
  --region=$REGION \
  --allow-unauthenticated


gcloud eventarc triggers create pubsub-events-trigger \
  --location=$REGION \
  --destination-run-service=pubsub-events \
  --destination-run-region=$REGION \
  --transport-topic=$DEVSHELL_PROJECT_ID-topic \
  --event-filters="type=google.cloud.pubsub.topic.v1.messagePublished"

gcloud pubsub topics publish $DEVSHELL_PROJECT_ID-topic \
  --message="Test message"