# A Tour of Google Cloud Sustainability
# schedule
# 1 hour
# universal_currency_alt
# No cost
# GSP995
# Google Cloud self-paced labs logo

# Overview
# In this lab, you will learn why Google Cloud is the cleanest cloud in the industry by exploring and utilizing sustainability tools.

# What you'll learn
# In this lab, you learn how to perform the following tasks:

# Explore your Carbon Footprint Data
# Use the Cloud Region Picker
# Reduce your cloud carbon footprint with Active Assist recommendations
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
# Task 1. Overview of Google Cloud sustainability
# Google is carbon neutral today, but aiming higher: our goal is to run on carbon-free energy, 24/7, at all of our data centers by 2030. Plus, we’re sharing technology, methods, and funding to enable organizations around the world to transition to more carbon-free and sustainable systems.

# We've built a collection of tools to help you accurately report the carbon emissions associated with your Google Cloud usage and take action to reduce your carbon footprint. The Carbon Sense suite brings together features from multiple Google Cloud products, like Active Assist and Carbon Footprint, to help users everywhere make progress towards ensuring a healthier planet.

# There are three key categories of carbon emissions associated with running workloads in the cloud:

# Electricity consumption
# Burning on-site fossil fuels
# Upstream and downstream activities
# Carbon-free energy includes wind, solar, geothermal, biomass, nuclear, hydropower, and pumped storage or battery storage discharge. For each region Google Cloud operates in, we measure the percentage of carbon free energy (CFE%) consumed in a particular location on an hourly basis.

# As a customer, the regional CFE score represents the average percentage of time your applications deployed in that cloud region will be running on carbon-free energy.

# To lower your carbon emissions, you need to reduce the electricity consumption of your cloud workloads from carbon-based sources. To lower your carbon emissions, we recommend the following primary strategies:

# Choose cloud regions with higher average hourly CFE%, and lower grid carbon intensity. For regions that have the same CFE%, use grid carbon intensity to further compare the emissions performance of those regions.
# Optimize cloud workloads to reduce carbon emissions. For example, increase efficiency by using elastic cloud services and autoscaling features to minimize unused compute resources, and run batch workloads during times when grid carbon intensity is lower.
# Set organizational policies to restrict the location of cloud resources to cleaner regions.
# Task 2. Explore carbon footprint
# In the Google Cloud console, in the navigation pane, click More Products > Tools > Carbon Footprint.
# Explore the provided graphs indicating yearly and monthly gross carbon footprint for the selected billing account. Notice the value of the metric Google Cloud's net operational greenhouse gas emissions.
# Provided graphs allow you to explore carbon emissions by month, project, service, and region.
# Learn more about how Google Cloud calculates these metrics from Carbon footprint reporting methodology.
# Export the carbon footprint data
# In the upper right pane, click Export.
# For Project, click Select Project.
# Select your Qwiklabs-generated project: Lab Project ID for project_0.
# Click Configure Export.
# Note: If the Configure Export button is disabled:

# Go to Navigation menu > IAM &Admin > IAM.
# Click Edit principal icon for your assigned lab username.
# Click +ADD ANOTHER ROLE and select BigQuery Data Editor as another role and click Save.
# Navigate back to the Carbon Footprint page and retry the steps to Export.
# Under Destination Settings, for Dataset, click Create New Dataset.
# For Dataset ID, enter carbon_footprint_export.
# Leave all fields with their default and click Create Dataset, then click Save.
# When prompted, select your Qwiklabs-generated account: Lab user name for user_0.
# Schedule the data backfill
# On the Transfer Details page, click Schedule Backfill on the top right.
# Select Run for a date range
# Select August 15, 2022 as the start date and September 15, 2022 as the end date.
# Click Ok to request the data backfill.
# Data backfills will be created for the selected range, exporting historical monthly data to the destination dataset.

# Once the transfer is complete, you can view and query the data in BigQuery.

# Click Check my progress to verify the objective.
# Export the carbon footprint data

# Task 3. Use the Cloud Region Picker
# To reduce your overall emissions, we recommend that you choose regions with higher CFE% where possible. To help you pick cleaner regions, Google Cloud includes a Low CO2 indicator on some of the location selectors of the Cloud Console and the "Locations" pages of the Google Cloud documentation. Learn more about the criteria that a region must meet in order to receive this indicator from Carbon free energy for Google Cloud regions.

# Using the Cloud Region picker, select your current location and select a region based on carbon footprint, cost, and latency:

# cloud region picker

# Task 4. Reduce your cloud carbon footprint with Active Assist recommendations
# You might observe that cost optimization practices that reduce idle (or inefficient use of) cloud resources also translate well to carbon footprint reduction. Idle resources create wastage by incurring unnecessary costs and emissions. Minimizing idle cloud resources can significantly improve your cloud sustainability.

# Active Assist is a portfolio of intelligent tools that helps you optimize your cloud operations with recommendations to reduce costs, increase performance, improve security, and even help you make more sustainable decisions.

# Unattended project recommender analyzes usage activity across all projects in your organization and provides you with the following features to help you discover, reclaim, and shut down unattended projects.

# Shutting down or reclaiming unattended projects can provide the following impact and benefits to your organization:

# Reduction in security risks (SECURITY)
# Reduction in unnecessary spending (COST)
# Reduction in carbon footprint associated with your workloads (SUSTAINABILITY)
# You can view unattended project recommendations using gcloud commands or the api. Because lab projects are created on-the-fly at lab launch, there are no unattended projects in this lab to view. Refer to unattended project recommender documentation for more details.

# Congratulations!
# In this lab, you explored and exported Carbon Footprint Data, explored the Cloud Region Picker, and reduced your cloud carbon footprint with Active Assist recommendations.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated September 25, 2023

# Lab Last Tested September 25, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# Ready for more?
# Here's another lab we think you'll like.