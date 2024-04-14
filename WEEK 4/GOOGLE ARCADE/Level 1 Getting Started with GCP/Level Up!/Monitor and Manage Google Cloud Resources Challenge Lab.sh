# Monitor and Manage Google Cloud Resources: Challenge Lab
# schedule
# 1 hour
# universal_currency_alt
# No cost
# ARC101
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
# You are just starting your junior cloud engineer role. So far you have been helping teams create and manage Google Cloud resources.

# You are expected to have the skills and knowledge for these tasks.

# Your challenge
# You are asked to help a newly formed development team with some of their initial work on a new project around storing and organizing travel photographs, called Travel. You have been asked to assist the Travel team with initial configuration for their application development environment.

# You need to:

# Create a Cloud Storage bucket and share with a second user.
# Create a Pub/Sub topic for the Cloud Function to send messages.
# Create a Cloud Function that executes every time a new object is created in the Cloud Storage bucket.
# Create an alerting policy to send a notification email about the number of active Cloud Function instances.
# Some standards you should follow:

# Create all resources in the us-east1 region unless otherwise directed.
# Use the project VPCs.
# Naming is normally team-resource, e.g. an instance could be named kraken-webserver1
# Allocate cost effective resource sizes. Projects are monitored and excessive resource use will result in the containing project's termination (and possibly yours), so beware. This is the guidance the monitoring team is willing to share; unless directed, use f1-micro for small Linux VMs and e2-medium for Windows or other applications such as Kubernetes nodes.
# Each task is described in detail below, good luck!

# Task 1. Create a bucket
# Create a bucket named travel-bucket-qwiklabs-gcp-03-a3bceda66bba for the storage of the photographs.

# Grant Storage Object Viewer to student-01-9c5f437f00d3@qwiklabs.net on the project containing this new bucket.

# Click Check my progress to verify the objective.
# Create a bucket called travel-bucket-qwiklabs-gcp-03-a3bceda66bba and grant access to student-01-9c5f437f00d3@qwiklabs.net.

# Task 2. Create a Pub/Sub topic
# Create a Pub/Sub topic called travel-topic-781 for the Cloud Function to send messages.
# Click Check my progress to verify the objective.
# Create a Pub/Sub topic called travel-topic-781.

# Task 3. Create the thumbnail Cloud Function
# Create a Cloud Function called travel-thumbnail-generator that executes every time an object is created in the bucket travel-bucket-qwiklabs-gcp-03-a3bceda66bba you created in task 1. The function is written in Node.js 14.

# Make sure you set the Entry point (Function to execute) to thumbnail and Trigger to Cloud Storage.

# In line 15 of index.js replace the text REPLACE_WITH_YOUR_TOPIC ID with the travel-topic-781 you created in task 2.

# index.js:

# /* globals exports, require */
# //jshint strict: false
# //jshint esversion: 6
# "use strict";
# const crc32 = require("fast-crc32c");
# const { Storage } = require('@google-cloud/storage');
# const gcs = new Storage();
# const { PubSub } = require('@google-cloud/pubsub');
# const imagemagick = require("imagemagick-stream");

# exports.thumbnail = (event, context) => {
#   const fileName = event.name;
#   const bucketName = event.bucket;
#   const size = "64x64"
#   const bucket = gcs.bucket(bucketName);
#   const topicName = "REPLACE_WITH_YOUR_TOPIC ID";
#   const pubsub = new PubSub();
#   if ( fileName.search("64x64_thumbnail") == -1 ){
#     // doesn't have a thumbnail, get the filename extension
#     var filename_split = fileName.split('.');
#     var filename_ext = filename_split[filename_split.length - 1];
#     var filename_without_ext = fileName.substring(0, fileName.length - filename_ext.length );
#     if (filename_ext.toLowerCase() == 'png' || filename_ext.toLowerCase() == 'jpg'){
#       // only support png and jpg at this point
#       console.log(`Processing Original: gs://${bucketName}/${fileName}`);
#       const gcsObject = bucket.file(fileName);
#       let newFilename = filename_without_ext + size + '_thumbnail.' + filename_ext;
#       let gcsNewObject = bucket.file(newFilename);
#       let srcStream = gcsObject.createReadStream();
#       let dstStream = gcsNewObject.createWriteStream();
#       let resize = imagemagick().resize(size).quality(90);
#       srcStream.pipe(resize).pipe(dstStream);
#       return new Promise((resolve, reject) => {
#         dstStream
#           .on("error", (err) => {
#             console.log(`Error: ${err}`);
#             reject(err);
#           })
#           .on("finish", () => {
#             console.log(`Success: ${fileName} → ${newFilename}`);
#               // set the content-type
#               gcsNewObject.setMetadata(
#               {
#                 contentType: 'image/'+ filename_ext.toLowerCase()
#               }, function(err, apiResponse) {});
#               pubsub
#                 .topic(topicName)
#                 .publisher()
#                 .publish(Buffer.from(newFilename))
#                 .then(messageId => {
#                   console.log(`Message ${messageId} published.`);
#                 })
#                 .catch(err => {
#                   console.error('ERROR:', err);
#                 });
#           });
#       });
#     }
#     else {
#       console.log(`gs://${bucketName}/${fileName} is not an image I can handle`);
#     }
#   }
#   else {
#     console.log(`gs://${bucketName}/${fileName} already has a thumbnail`);
#   }
# };
# Copied!
# package.json:

# {
#   "name": "thumbnails",
#   "version": "1.0.0",
#   "description": "Create Thumbnail of uploaded image",
#   "scripts": {
#     "start": "node index.js"
#   },
#   "dependencies": {
#     "@google-cloud/pubsub": "^2.0.0",
#     "@google-cloud/storage": "^5.0.0",
#     "fast-crc32c": "1.0.4",
#     "imagemagick-stream": "4.1.1"
#   },
#   "devDependencies": {},
#   "engines": {
#     "node": ">=4.3.2"
#   }
# }
# Copied!
# Note: You must upload one JPG or PNG image into the bucket to verify the thumbnail was created (after creating the function successfully). Use this image https://storage.googleapis.com/cloud-training/arc101/travel.jpg; download the image to your machine and then upload that file to your bucket. You will see a thumbnail image appear shortly afterwards (use REFRESH in the bucket details).
# Click Check my progress to verify the objective.
# Verify that the Cloud Function works.

# Task 4. Create an alerting policy
# Create an alerting policy named Active Cloud Function Instances that notifies your personal email account when the number of active Cloud Function instances is greater than zero (0).

# For the metric, be sure to select Cloud Function > Function > Active Instances.

# Click Check my progress to verify the objective.
# Verify that a Cloud Function alert has been created.

# Congratulations!
# Monitor and Manage Data Resources on Google Cloud badge

# Earn your next skill badge
# This self-paced lab is part of the Monitor and Manage Google Cloud Resources skill badge quest. Completing this skill badge quest earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated September 20, 2023

# Lab Last Tested September 20, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION

# https://www.youtube.com/watch?v=S_CtfMWkgy4

export BUCKET_NAME=travel-bucket-qwiklabs-gcp-03-a3bceda66bba
export TOPIC_NAME=travel-topic-781
export FUNCTION_NAME=travel-thumbnail-generator
export REGION=us-east1
export BUCKET_USER=student-01-9c5f437f00d3@qwiklabs.net

curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Monitor%20and%20Manage%20Google%20Cloud%20Resources%20Challenge%20Lab/arc101.sh

sudo chmod +x arc101.sh

./arc101.sh