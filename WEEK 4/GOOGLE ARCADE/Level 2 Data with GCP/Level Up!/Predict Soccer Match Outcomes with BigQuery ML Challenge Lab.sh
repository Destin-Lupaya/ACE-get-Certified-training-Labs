# Predict Soccer Match Outcomes with BigQuery ML: Challenge Lab
# experiment
# Lab
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# No cost
# show_chart
# Advanced
# GSP374
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students who have enrolled in the Predict Soccer Match Outcomes with BigQuery ML skill badge course. Are you ready for the challenge?

# Topics tested:

# Upload files from Cloud Storage into BigQuery tables using the Cloud Console
# Write and execute queries that join information from multiple tables
# Analyze soccer event data using various BigQuery features
# Write functions in BigQuery to help with calculations to be performed on soccer shot data
# Create and evaluate an expected goals model using BigQuery ML
# Apply an expected goals model to make a prediction from new data using BigQuery ML
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
# Challenge scenario
# Use BigQuery to load the data from the Cloud Storage bucket, write and execute queries in BigQuery, analyze soccer event data. Then use BigQuery ML to train an expected goals model on the soccer event data and evaluate the impressiveness of World Cup goals.

# Task 1. Data ingestion
# Load the tables created with JavaScript Object Notation (JSON) and CSV data format into the dataset using the following information:
# Field	Value
# Source	Cloud Storage
# Select file from Cloud Storage bucket	spls/bq-soccer-analytics/events.json
# File format	JSONL (Newline delimited JSON)
# Table name	Table name
# Schema	Check the box marked Schema Auto detect
# Load another table of soccer data format CSV into the dataset using the following information below:
# Field	Value
# Source	Cloud Storage
# Select file from Cloud Storage bucket	spls/bq-soccer-analytics/tags2name.csv
# File format	CSV
# Table name	Table name
# Schema	Check the box marked Auto detect
# Click Check my progress to verify the objective
# Check tables are created

# Task 2. Analyze soccer data
# Build a query that shows the success rate on penalty kicks by each player.
# Points to consider:

# Join the Table name table with the players table to get player names from their IDs
# Filter on penalty kicks
# Group by player ID and player name
# Player should attempt at least 5 penalty kicks
# Order by penalty kick success rate
# Note: Tag 101 represents a goal using the Table name table.
# Click Check my progress to verify the objective:
# Check penalty kick success rate

# Task 3. Gain insight by analyzing soccer data
# Create a new query to analyze shot distance. For shots, use (x, y) values from the positions field in the Table name table.
# Points to consider:

# Calculate shot distance using the midpoint of the goal mouth (X-axis goal mouth length, Y-axis goal mouth length) as the ending location.
# Calculate pass distance by x-coordinate and y-coordinate differences, then convert to estimated meters using the average dimensions of a soccer field (X-axis length x Y-axis length).
# Add an isGoal field by looking "inside" the tags field.
# Filter the Table name table to shots only.
# Shot distance must be less than 50.
# The final SELECT statement aggregates the number of shots, the number of goals and the percentage of goals from shots by distance rounded to the nearest meter.
# Note: The approximate dimensions of a soccer field are used with the x-coordinate and y-coordinate distances as inputs to the distance formula.
# Click Check my progress to verify the objective:
# Analyze shot distance

# Task 4. Create a regression model using soccer data
# Create some user-defined functions in BigQuery that help with shot distance and angle calculations, which help to prepare the soccer event data for eventual use in an ML model.

# Calculate shot distance from (x,y) coordinates
# Define a function shot distance to goal for calculating the shot distance from (x,y) coordinates in the soccer dataset using the following code-blocks:
# CREATE FUNCTION `shot distance to goal`(x INT64, y INT64)
# RETURNS FLOAT64
# AS (
#  /* Translate 0-100 (x,y) coordinate-based distances to absolute positions
#  using "average" field dimensions of X-axis lengthxY-axis length before combining in 2D dist calc */
#  SQRT(
#    POW((X-axis goal mouth length - x) * X-axis length/100, 2) +
#    POW((Y-axis goal mouth length - y) * Y-axis length/100, 2)
#    )
#  );
# Copied!
# Click Check my progress to verify the objective
# Calculate shot distance

# Calculate shot angle from (x,y) coordinates
# Define a function shot angle to goal for calculating the shot angle from (x,y) coordinates in the soccer dataset using the following code-blocks:
# CREATE FUNCTION `shot angle to goal`(x INT64, y INT64)
# RETURNS FLOAT64
# AS (
#  SAFE.ACOS(
#    /* Have to translate 0-100 (x,y) coordinates to absolute positions using
#    "average" field dimensions of X-axis lengthxY-axis length before using in various distance calcs */
#    SAFE_DIVIDE(
#      ( /* Squared distance between shot and 1 post, in meters */
#        (POW(X-axis length - (x * X-axis length/100), 2) + POW(Y-axis half + (7.32/2) - (y * Y-axis length/100), 2)) +
#        /* Squared distance between shot and other post, in meters */
#        (POW(X-axis length - (x * X-axis length/100), 2) + POW(Y-axis half - (7.32/2) - (y * Y-axis length/100), 2)) -
#        /* Squared length of goal opening, in meters */
#        POW(7.32, 2)
#      ),
#      (2 *
#        /* Distance between shot and 1 post, in meters */
#        SQRT(POW(X-axis length - (x * X-axis length/100), 2) + POW(Y-axis half + 7.32/2 - (y * Y-axis length/100), 2)) *
#        /* Distance between shot and other post, in meters */
#        SQRT(POW(X-axis length - (x * X-axis length/100), 2) + POW(Y-axis half - 7.32/2 - (y * Y-axis length/100), 2))
#      )
#     )
#   /* Translate radians to degrees */
#   ) * 180 / ACOS(-1)
#  )
# ;
# Copied!
# Click Check my progress to verify the objective
# Calculate shot angle

# Create an expected goals model using BigQuery ML
# Use BigQuery ML to create and execute a machine learning model model name in BigQuery using standard SQL queries.
# In this case, you build an expected goals model from the soccer event data to predict the likelihood of a shot going in for a goal given its type, distance, and angle.

# Expected goals models are commonly used in soccer analytics to measure the quality of shots and finishing/saving ability given shot quality, and they have a variety of applications in both retrospective match analysis and making projections.

# Points to consider:

# The top section will be the actual model creation code, specify the type of model and label for the outcome variable.
# 101 is a known Tag for 'goals' from the goals table.
# The SELECT statement aggregates isGoal outcome variable along with features of interest from the event data, shot distance, and angle calculated using the user-defined functions defined in the previous step.
# Join enables the determination of which competition each shot came from.
# Filter out World Cup matches for model fitting purposes and include both "open play" & free kick shots (including penalties).
# Click Check my progress to verify the objective
# Create BigQuery logistic regression model

# Once the model is done training - look for a "Query complete" notification in the Query results section - click Go to model at the far right next to the message about model creation.
# This opens up a new tab that has information about the model that was just trained.

# Click to EVALUATION tab and look at the metrics, particularly Log loss and ROC AUC under Aggregate Metrics.
# Task 5. Make predictions from new data with the BigQuery model
# Now that you've fit an expected goals model of reasonable accuracy and explainability, you can apply it to "new" data - in this case, the 2018 World Cup (which was left out of the model fitting).

# The logistic regression model model name created in the previous step is used to assess the difficulty of each shot and goal in that competition, enabling the identification of the most "impressive" goals in the tournament.

# Get probabilities for all shots in the 2018 World Cup
# Use BigQuery ML's prediction functionality with the logistic regression model fit in the previous step to look at the probability of each shot scoring in the World Cup.
# Points to consider:

# The top section is the actual model prediction code, specifying the type of model.
# The SELECT statement aggregates isGoal outcome variable along with features of interest from the event data, shot distance, and angle calculated using the user-defined functions defined in the previous step.
# Join enables the determination of which competition each shot came from.
# Look only at World Cup matches for model predictions and include both "open play" and free kick shots (including penalties).
# Click Check my progress to verify the objective
# Make predictions from the model

# Congratulations!
# You have successfully completed the Predict Soccer Match Outcomes with BigQuery ML: Challenge Lab by engaging in various tasks involving soccer data and machine learning models. During this challenge, you uploaded files from Cloud Storage into BigQuery tables and executed queries to analyze the data within these tables. Additionally, you created user-defined functions in BigQuery to calculate the shot distance and shot angle. Utilizing BigQuery ML, you built an expected goals model and applied BigQuery ML's prediction functionality on "new" data from the 2018 World Cup to identify some of the most impressive goals in the tournament.

# Earn your next skill badge
# This self-paced lab is part of the Predict Soccer Match Outcomes with BigQuery ML skill badge course. Enroll in any course that contains this lab and get immediate completion credit. Refer to the Google Cloud Skills Boost catalog for all available courses.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated January 24, 2024

# Lab Last Tested January 24, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# resolution



export EVENT_TABLE=events739

export TAG_TABLE=tags5name

export X_1=90

export Y_1=60

export X_2=108

export Y_2=74

export FUNCTION_1=soccer.GetShotDistanceToGoal739

export FUNCTION_2=soccer.GetShotAngleToGoal739

export MODEL_NAME=soccer.xg_logistic_reg_model_739

curl -LO raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Predict%20Soccer%20Match%20Outcomes%20with%20BigQuery%20ML%20Challenge%20Lab/gsp374.sh

sudo chmod +x gsp374.sh

./gsp374.sh