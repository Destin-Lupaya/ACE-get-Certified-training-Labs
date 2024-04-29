# Store, Process, and Manage Data on Google Cloud: Challenge Lab
# experiment
# Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# show_chart
# Introductory
# ARC100
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
# You are asked to help a newly formed development team with some of their initial work on a new project around storing and organizing photographs, called Memories. You have been asked to assist the Memories team with initial configuration for their application development environment; you receive the following request to complete the following tasks:

# Create a bucket for storing the photographs.
# Create a Pub/Sub topic that will be used by a Cloud Function you create.
# Create a Cloud Function.
# Some standards you should follow:

# Create all resources in the us-west1 region unless otherwise directed.
# Use the project VPCs.
# Naming is normally team-resource, e.g. an instance could be named kraken-webserver1
# Allocate cost effective resource sizes. Projects are monitored and excessive resource use will result in the containing project's termination (and possibly yours), so beware. This is the guidance the monitoring team is willing to share; unless directed, use f1-micro for small Linux VMs and n1-standard-1 for Windows or other applications such as Kubernetes nodes.
# Each task is described in detail below, good luck!

# Task 1. Create a bucket
# Create a bucket called memories-bucket-qwiklabs-gcp-03-7eacad96e7aa for the storage of the photographs. Ensure the resource is created in the us-west1 region.

# Click Check my progress to verify the objective.
# Assessment Completed!
# Create a bucket called memories-bucket-qwiklabs-gcp-03-7eacad96e7aa
# Assessment Completed!

# Task 2. Create a Pub/Sub topic
# Create a Pub/Sub topic called memories-topic-163 for the Cloud Function to send messages.

# Click Check my progress to verify the objective.
# Assessment Completed!
# Create a Pub/Sub topic called memories-topic-163
# Assessment Completed!

# Task 3. Create the thumbnail Cloud Function
# Create a Cloud Function called memories-thumbnail-generator that will create a thumbnail from an image added to the memories-bucket-qwiklabs-gcp-03-7eacad96e7aa bucket. Ensure the Cloud Function is created using the 2nd Generation environment and in the us-west1 region.

# Create a Cloud Function called memories-thumbnail-generator.
# Note: The Cloud Function is required to execute every time an object is created in the bucket created in Task 1. During the process, Cloud Function may request permission to enable APIs. Please enable each of the required APIs as requested.
# Make sure you create a Cloud Storage trigger using the bucket created in Task 1, and set the Entry point (Function to execute) to memories-thumbnail-generator and the runtime to Node.js 20.
# index.js:

# const functions = require('@google-cloud/functions-framework');
# const crc32 = require("fast-crc32c");
# const { Storage } = require('@google-cloud/storage');
# const gcs = new Storage();
# const { PubSub } = require('@google-cloud/pubsub');
# const imagemagick = require("imagemagick-stream");

# functions.cloudEvent('memories-thumbnail-generator', cloudEvent => {
#   const event = cloudEvent.data;

#   console.log(`Event: ${event}`);
#   console.log(`Hello ${event.bucket}`);

#   const fileName = event.name;
#   const bucketName = event.bucket;
#   const size = "64x64"
#   const bucket = gcs.bucket(bucketName);
#   const topicName = "memories-topic-163";
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
# });
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
#     "@google-cloud/functions-framework": "^3.0.0",
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
# Task 4. Test the Infrastructure
# To test the function, upload a JPG or PNG image into the bucket.

# Upload a PNG or JPG image to memories-bucket-qwiklabs-gcp-03-7eacad96e7aa bucket.
# Note: You need to upload one JPG or PNG image into the bucket to verify the thumbnail was created (after creating the function successfully). Use any JPG or PNG image, or use this image https://storage.googleapis.com/cloud-training/gsp315/map.jpg by downloading the image to your machine and then uploading that file to your bucket.
# You will see a thumbnail image appear shortly afterwards (use REFRESH in the bucket details).
# Click Check my progress to verify the objective.
# Assessment Completed!
# Verify the thumbnail was successfully created by the Cloud Function
# Assessment Completed!

# Congratulations!
# Store, Process, and Manage Data on Google Cloud badge

# Earn your next skill badge
# This self-paced lab is part of the Store, Process, and Manage Data on Google Cloud - Console course. Completing this course earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 13, 2024

# Lab Last Tested February 13, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.