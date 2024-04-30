# Manage Bigtable on Google Cloud: Challenge Lab
# experiment
# Lab
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# No cost
# show_chart
# Introductory
# GSP380
# Google Cloud Self-Paced Labs logo

# Overview
# In a challenge lab, you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students who have enrolled in the Manage Bigtable on Google Cloud skill badge. Are you ready for the challenge?

# Topics tested
# Create a new Bigtable instance.
# Create and populate Bigtable tables.
# Query data in Bigtable.
# Configure node autoscaling and replication in Bigtable.
# Back up and restore data in Bigtable.
# Delete Bigtable data.
# Setup and requirements
# Before you click the Start Lab button
# Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click Start Lab, shows how long Google Cloud resources will be made available to you.

# This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

# What you need
# To complete this lab, you need:

# Access to a standard internet browser (Chrome browser recommended).
# Time to complete the lab.
# Note: If you have a personal Google Cloud account or project, do not use it for this lab.
# Note: If you are using a Pixelbook, open an Incognito window to run this lab.
# Challenge scenario
# You have been hired as a database engineer for an ecommerce company that is interested in personalized sales. The company is interested in Bigtable to store online user interactions with products and personalized recommendations from machine learning models.

# For your first assignment, you have been tasked with setting up the Bigtable instance and tables to store sample data for the user interactions with products and the personalized recommendations for each user, so that your team can explore these ideas further.

# You are expected to have the skills and knowledge for these tasks, so step-by-step guides are not provided. Unless instructed otherwise, you can use any workflow or tool to accomplish the tasks.

# Task 1. Create a new Bigtable instance
# To begin your project, create a new Bigtable instance named ecommerce-recommendations with the following requirements:

# Property	Value
# Instance ID	ecommerce-recommendations
# Storage Type	SSD



# Your instance must have one cluster, configured with autoscaling, and use the following requirements:

# Property	Value
# Cluster ID	ecommerce-recommendations-c1
# Region	____
# Zone	____
# Minimum number of nodes	1
# Maximum number of nodes	5
# CPU utilization target	60



# Click Check my progress to verify the objective.
# Create a new Bigtable instance.

# Task 2. Create and populate Bigtable tables
# User engagements
# To store the user engagements with products, create a table named SessionHistory.

# To load data into the table, create a Dataflow job named import-sessions, and use the following SequenceFile file:
# gs://cloud-training/OCBL377/retail-engagements-sales-00000-of-00001
# Review the schema below to identify the necessary column families for this table.
# ...	Engagements	...	...	Sales
# ...	red_skirt	red_hat	orange_shoes	sale
# orange4029#1638940844261		purchased		orange_shoes#orange_hat
# purple3137#1638940844261	seen		seen	purple_hat
# green1032#1638940844261			seen	green_blouse



# After you successfully load data into the table, run the appropriate queries to answer the following question.

# Which product was purchased during the session identified as red3016#1638940844357?

# red_shoes

# red_hat

# red_backpack

# red_skirt

# Click Check my progress to verify the objective.
# Create and populate a Bigtable table for user engagements.

# Product recommendations
# To store the product recommendations by user, create a table named PersonalizedProducts.

# To load data into the table, create a Dataflow job named import-recommendations, and use the following SequenceFile file:
# gs://cloud-training/OCBL377/retail-recommendations-00000-of-00001
# Review the schema below to identify the necessary column families for this table.
# ...	Recommendations	...	...	...
# ...	Recommendation0	Recommendation1	Recommendation2	Recommendation3
# purple3103	purple_hat	purple_blouse	purple_skirt	purple_jacket
# yellow4744	yellow_dress	yellow_jacket	yellow_shoes	yellow_hat
# blue1936	blue_shoes	blue_blouse	blue_dress	blue_hat



# After you successfully load data into the table, run the appropriate queries to answer the following question.

# Which products were recommended to the user identified as green4467? Choose two options.

# green_backpack

# green_jacket

# green_blouse

# green_hat

# Click Check my progress to verify the objective.
# Create and populate a Bigtable table for user recommendations.

# Task 3. Configure replication in Bigtable
# To configure replication, use the following requirements:

# Property	Value
# Cluster ID	ecommerce-recommendations-c2
# Region	____
# Zone	Select any available zone



# Apply node autoscaling to match the cluster you created in Task 1.

# Click Check my progress to verify the objective.
# Configure replication in Bigtable.

# Task 4. Back up and restore data in Bigtable
# To support data recovery, create a backup of the PersonalizedProducts table:

# Set the Backup ID to PersonalizedProducts_7.
# Set the expiration date to be 1 week.
# After you create the backup, restore the backup as a new table named PersonalizedProducts_7_restored.

# Click Check my progress to verify the objective.
# Create a backup and restore data in Bigtable.

# Task 5. Delete Bigtable data
# For your final task, delete all Bigtable tables and backups, and then delete the Bigtable instance to conserve company resources.

# Click Check my progress to verify the objective.
# Delete Bigtable data.

# Congratulations!
# In this challenge lab, you proved your Bigtable skills by creating a new Bigtable instance, creating and populating new tables, configuring node autoscaling and replication, and backing up and restoring data in Bigtable.

# Manage Bigtable on Google Cloud skill badge

# Earn your next skill badge
# This self-paced lab is part of the Manage Bigtable on Google Cloud skill badge. Completing this skill badge earns you the badge above to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# This skill badge is part of Google Cloud’s Database Engineer learning path. Continue your learning journey by enrolling in the Migrate MySQL Data to Cloud SQL Using Database Migration Service skill badge or the Manage PostgreSQL Databases on Cloud SQL skill badge.

# Manual Last Updated April 25, 2024

# Lab Last Tested February 06, 2023

# Copyright 2022 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

