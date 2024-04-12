# Get Started with Dataplex: Challenge Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# ARC117
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
# You are just starting your junior data engineer role. So far you have been helping teams create and manage Dataplex assets.

# You are expected to have the skills and knowledge for these tasks.

# Your challenge
# You are asked to help a newly formed development team with some of their initial work on a new project. Specifically, they need to create a new Dataplex lake and organize and tag assets in the new lake; you receive the following request to complete the following tasks:

# Create a lake with a raw zone.
# Create and attach a Cloud Storage bucket to the zone.
# Create and apply a tag template to tag an entire zone as protected data.
# Some standards you should follow:

# Ensure that any needed APIs (such as Dataplex and Data Catalog) are successfully enabled.
# Create all resources in the <filled in at lab start> region, unless otherwise directed.
# Each task is described in detail below, good luck!

# Task 1. Create a lake with a raw zone
# Create a lake named Customer Engagements with a regional raw zone named Raw Event Data.
# Click Check my progress to verify the objective.
# Create a lake with a raw zone in Dataplex

# Task 2. Create and attach a Cloud Storage bucket to the zone
# Create a regional Cloud Storage bucket named Project ID and attach it as a regional asset named Raw Event Files to the Raw Event Data zone.
# Click Check my progress to verify the objective.
# Create and attach a Cloud Storage bucket to the zone

# Task 3. Create and apply a tag template to a zone
# Create a public tag template named Protected Raw Data Template with an enumerated field named Protected Raw Data Flag that contains two values: Y and N.
# Use this template to tag the zone named Raw Event Data as protected raw data.
# Click Check my progress to verify the objective.
# Create and apply a tag template to a zone

# Congratulations!
# Get Started with Dataplex badge

# Earn your next skill badge
# This self-paced lab is part of the Get Started with Dataplex skill badge quest. Completing this skill badge quest earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated May 11, 2023

# Lab Last Tested May 5, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.


# RESOLUTION

# https://www.youtube.com/watch?v=NzRcltfHzu0
# https://github.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/blob/main/Get%20Started%20with%20Dataplex%20Challenge%20Lab/Get%20Started%20with%20Dataplex%20Challenge%20Lab.md

export LOCATION=us-west1

curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Get%20Started%20with%20Dataplex%20Challenge%20Lab/arc117.sh

sudo chmod +x arc117.sh

./arc117.sh