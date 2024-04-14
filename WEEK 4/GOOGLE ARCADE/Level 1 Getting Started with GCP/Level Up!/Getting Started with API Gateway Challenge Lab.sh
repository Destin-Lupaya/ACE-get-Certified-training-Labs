# Getting Started with API Gateway: Challenge Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# ARC109
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
# You are just starting your junior data analyst role. So far you have been helping teams create, manage and access backend data resources.

# You are expected to have the skills and knowledge for these tasks.

# Your challenge
# You are asked to help a newly formed development team with some of their initial work on a new project around exposing backend services as APIs. You have been asked to assist the team with their efforts using API Gateway, you receive a request to complete the following tasks:

# Develop the backend system using a Cloud Function
# Deploy and manage an API exposing the backend service with a fully managed gateway
# Subscribe to messages published on a Pub/Sub topic to react to events
# Each task is described below, good luck!

# Task 1. Create a Cloud Function
# Note: 2nd gen Cloud Functions depend on the Cloud Run Admin APIs. The Cloud Run Admin APIs have been enabled for you at the start of this lab. It may however take a few minutes for all of the enabled services to propogate. If you experience an issue when deploying your 2nd gen Cloud Function, wait a few minutes then try again.
# Create a new 2nd gen Cloud Function called GCFunction in the <filled in at lab start> and deploy it. For now, have the function return "Hello World!" when invoked. Ensure that you allow the function to be called unauthenticated by running the following in Cloud Shell once the deployment has completed.

# gcloud functions add-invoker-policy-binding GCFunction \
#     --region="filled in at lab start" \
#     --member="allUsers"
# Copied!
# Click Check my progress to verify the objective.
# Create a Cloud Function

# Task 2. Create an API Gateway
# Once the Cloud Function is deployed, configure an API Gateway to proxy requests to the backend.

# Use the following openapispec.yaml file to reference the Cloud Function deployed in Task 1.

# Deploy the API Gateway with the following properties:

# Name	Value
# Display Name	GCFunction API (wherever requested)
# API ID	gcfunction-api
# Select a service account	Compute Engine default service account
# Location	<filled in at lab start>
# Config Name	gcfunction-api
# swagger: '2.0'
# info:
#   title: GCFunction API
#   description: Sample API on API Gateway with a Google Cloud Functions backend
#   version: 1.0.0
# schemes:
#   - https
# produces:
#   - application/json
# paths:
#   /GCFunction:
#     get:
#       summary: gcfunction
#       operationId: gcfunction
#       x-google-backend:
#         address: https://REGION-.cloudfunctions.net/GCFunction
#       responses:
#        '200':
#           description: A successful response
#           schema:
#             type: string
# Copied!
# Note: It will take several minutes (~10 minutes) for the Create Gateway operation to complete. To check the status of the creation and deployment process, you can click the Notification icon in the main navigation bar to display a status notification, as shown in the image below. Please ensure that the icon status has a green check next to it before proceeding.
# Click Check my progress to verify the objective.
# Create an API Gateway

# Task 3. Create a Pub/Sub Topic and Publish Messages via API Backend
# The development team would like the API backend to publish messages to a new Pub/Sub topic named demo-topic.

# Create a new Pub/Sub topic (demo-topic) and push messages to it in the Cloud Function deployed earlier. Be sure to keep the option to create a default subscription enabled when creating the topic.

# Use the snippet below to update the package.json file and index.js code in the Cloud Function deployed in Task 1.

# package.json
# {
#   "dependencies": {
#     "@google-cloud/functions-framework": "^3.0.0",
#     "@google-cloud/pubsub": "^3.4.1"
#   }
# }
# Copied!
# index.js
# /**
#  * Responds to any HTTP request.
#  *
#  * @param {!express:Request} req HTTP request context.
#  * @param {!express:Response} res HTTP response context.
#  */
# const {PubSub} = require('@google-cloud/pubsub');
# const pubsub = new PubSub();
# const topic = pubsub.topic('demo-topic');
# const functions = require('@google-cloud/functions-framework');

# exports.helloHttp = functions.http('helloHttp', (req, res) => {

#   // Send a message to the topic
#   topic.publishMessage({data: Buffer.from('Hello from Cloud Functions!')});
#   res.status(200).send("Message sent to Topic demo-topic!");
# });
# Copied!
# Redeploy the Cloud Function once the index.js and package.json files have been updated.

# Next, invoke the Cloud Function via API Gateway. If done correctly, a message will be published to the topic demo-topic you've created in this task.

# Note: It will take several minutes (~5 minutes) for the messages published to appear in the Messages section of the subscription after invoking the API Gateway endpoint.
# Click Check my progress to verify the objective.
# Create a Pub/Sub Topic and Publish Messages via API Backend

# Congratulations!
# You have completed the Challenge! Congratulations!!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated October 2nd, 2023

# Lab Last Tested October 2nd, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION
# https://www.youtube.com/watch?v=iWRh0xCKwRQ

export REGION=us-central1

curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Getting%20Started%20with%20API%20Gateway%20Challenge%20Lab/arc109.sh

sudo chmod +x arc109.sh

./arc109.sh