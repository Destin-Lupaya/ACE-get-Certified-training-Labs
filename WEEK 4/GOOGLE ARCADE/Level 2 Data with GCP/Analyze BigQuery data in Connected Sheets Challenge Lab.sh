# Analyze BigQuery data in Connected Sheets: Challenge Lab
# experiment
# Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# show_chart
# Introductory
# Lab instructions and tasks
# ARC103
# Overview
# Setup
# Challenge scenario
# Task 1. Open Google Sheets and connect to a BigQuery dataset
# Task 2. Use a formula to count rows that meet a specific criteria
# Task 3. Create charts to visualize BigQuery data
# Task 4. Extract data from BigQuery to Connected Sheets
# Task 5. Calculate new columns to transform existing column data
# Congratulations!
# ARC103
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
# You are just starting your junior data analyst role. So far you have been helping teams create and manage Google Sheets and data resources.

# You are expected to have the skills and knowledge for these tasks.

# Your challenge
# You are asked to help a newly formed development team with some of their initial work on a new project around analyzing taxi data in New York City. You have been asked to assist the Taxi team with their analysis using Google Sheets; you receive the following request to complete the following tasks:

# Connect a BigQuery dataset to Google Sheets.
# Use a formula to find the number of taxi trips that include an airport fee.
# Create a chart of the percentages of all payment types.
# Extract raw data from BigQuery to Connected Sheets.
# Calculate a column to create a new column from transformations/combinations of existing columns.
# Each task is described in detail below, good luck!

# Task 1. Open Google Sheets and connect to a BigQuery dataset
# Log in to Sheets using the credentials provided, and connect to <filled in at lab start> > Public datasets > new_york_taxi_trips > tlc_yellow_trips_2022.
# Task 2. Use a formula to count rows that meet a specific criteria
# Use a formula to count the number of taxi trips that include an airport fee.
# Click Check my progress to verify the objective.
# Use formulas in Connected Sheets

# Task 3. Create charts to visualize BigQuery data
# Create a pie chart to identify which payment type is most frequently used to pay the fare amount.
# Payment type code	Payment type description
# 1	Credit Card
# 2	Cash
# 3	No charge
# 4	Dispute
# 5	Unknown
# 6	Voided trip
# Click Check my progress to verify the objective.
# Use charts in Connected Sheets

# Task 4. Extract data from BigQuery to Connected Sheets
# Extract 10,000 rows of data from the columns pickup_datetime, dropoff_datetime, trip_distance, and fare_amount, ordered by longest trip first.
# Click Check my progress to verify the objective.
# Extract BigQuery data in Connected Sheets

# Task 5. Calculate new columns to transform existing column data
# Calculate a new column that displays the percentage of each fare amount that was used to pay toll fees (based on the toll_amount column).
# Click Check my progress to verify the objective.
# Calculate columns in Connected Sheets

# Congratulations!
# Analyze BigQuery Data in Connected Sheets badge

# Earn your next skill badge
# This self-paced lab is part of the Analyze BigQuery data in Connected Sheets skill badge quest. Completing this skill badge quest earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated March 14, 2024

# Lab Last Tested March 14 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION

# https://www.youtube.com/watch?v=QA8aNNuESJE

IF THIS VIDEO HELPFULL DO LIKE SO THAT YT PROMOTE TO OTHER & IT WILL HELP THEM TO SOLVE THIS LAB




TASK 2:- 

=COUNTIF(tlc_yellow_trips_2022!airport_fee, "1")


TASK 5:-

=IF(fare_amount>0,tip_amount/fare_amount*100,0)




# THANKS FOR WATCHING :O


# or

Task 1. Open Google Sheets and connect to a BigQuery dataset
Select Data > Data Connectors > Connect to BigQuery.

If you see a Connect and Analyze big data in Sheets pop-up, click Get Connected.

Select YOUR PROJECT ID > Public datasets > new_york_taxi_trips.

Select tlc_yellow_trips_2022 and click Connect.

Task 2. Use a formula to count rows that meet a specific criteria
Select Function > COUNTIF and add it to a new sheet.

Ensure New Sheet is selected and click Create to add it to a new sheet.

Specify the company column by changing the value of your cell at row 1, column A to this:

=COUNTIF(tlc_yellow_trips_2022!airport_fee, "1")
Task 3. Create charts to visualize BigQuery data
Return to the tlc_yellow_trips_2022 tab by clicking on it at the bottom of your Google Sheets page.

Click on the Chart button. Ensure New Sheet is selected and click Create.

In the Chart editor window, under Chart type, select Pie chart.

Various columns of the data are listed to the right. Drag payment_type to the Label field. Then drag fare_amount into the Value field and click Apply.

Task 4. Extract data from BigQuery to Connected Sheets
1.Return to the tlc_yellow_trips_2022 tab by clicking on it at the bottom of your Google Sheets page.

Click on the Extract button.

Ensure New sheet is selected and click Create.

In the Extract editor window, click Edit under the Columns section and select the pickup_datetime, dropoff_datetime, trip_distance, and fare_amount. Click outside the dropdown box to continue.

Click Add under the Sort section and select trip_distance.

Click on Desc to toggle between ascending and descending order.

Under Row limit, leave 10,000 as it is to import 10,000 rows.

Click Apply.

Task 5. Calculate new columns to transform existing column data
1.Return to the tlc_yellow_trips_2022 tab by clicking on it at the bottom of your Google Sheets page.

Click on the Calculated columns button.

Enter your COLUMN NAME.

Then copy and paste the following formula into the formula field:

=IF(fare_amount>0,tip_amount/fare_amount*100,0)
Click Add

Click Apply.

# Congratulations 🎉 for completing the Lab !



