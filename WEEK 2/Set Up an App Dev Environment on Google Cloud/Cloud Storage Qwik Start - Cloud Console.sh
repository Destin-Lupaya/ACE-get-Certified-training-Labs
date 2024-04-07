# Cloud Storage: Qwik Start - Cloud Console
# edule
# 30 minutes
# universal_currency_alt
# No cost
# Lab instructions and tasks
# GSP073
# Overview
# Setup and requirements
# Task 1. Create a bucket
# Task 2. Upload an object into the bucket
# Task 3. Share a bucket publicly
# Task 4. Create folders
# Task 5. Delete a folder
# Congratulations!
# GSP073
# Google Cloud self-paced labs logo

# Overview
# Cloud Storage allows world-wide storage and retrieval of any amount of data at any time. You can use Cloud Storage for a range of scenarios including serving website content, storing data for archival and disaster recovery, or distributing large data objects to users via direct download.

# What you'll do
# In this hands-on lab you will learn how to use the Cloud console to:

# Create a storage bucket
# Upload objects to the bucket
# Create folders and subfolders in the bucket
# Make objects in a storage bucket publicly accessible
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
# Task 1. Create a bucket
# Buckets are the basic containers that hold your data in Cloud Storage.

# To create a bucket:

# In the Cloud console, go to Navigation menu > Cloud Storage > Buckets.

# Click + Create:

#  Cloud Console Storage Browser. Create Bucket button is highlighted.

# Enter your bucket information and click Continue to complete each step:

# Name your bucket: Enter a unique name for your bucket. For this lab, you can use your Project ID as the bucket name because it will always be unique.
# Bucket naming rules:

# Do not include sensitive information in the bucket name, because the bucket namespace is global and publicly visible.

# Bucket names must contain only lowercase letters, numbers, dashes (-), underscores (_), and dots (.). Names containing dots require verification.

# Bucket names must start and end with a number or letter.

# Bucket names must contain 3 to 63 characters. Names containing dots can contain up to 222 characters, but each dot-separated component can be no longer than 63 characters.

# Bucket names cannot be represented as an IP address in dotted-decimal notation (for example, 192.168.5.4).

# Bucket names cannot begin with the "goog" prefix. Bucket names cannot contain "google" or close misspellings of "google".*

# Also, for DNS compliance and future compatibility, you should not use underscores (_) or have a period adjacent to another period or dash. For example, ".." or "-." or ".-" are not valid in DNS names.

# Choose Region for Location type and <filled in at lab start> for Location.

# Choose Standard for default storage class.

# Choose Uniform for Access control and uncheck Enforce public access prevention on this bucket to turn it off.

# Leave the rest of the fields as their default values and click Create.

# That's it — you've just created a Cloud Storage bucket!

# Note: If you are prompted with Public access will be prevented, uncheck Enforce public access prevention on this bucket and click Confirm.
# Test completed task
# Click Check my progress to verify your performed task. If you have successfully created a Cloud Storage bucket, you will see an assessment score.

# Create a bucket
# Test your understanding
# Below are multiple choice questions to reinforce your understanding of this lab's concepts. Answer them to the best of your ability.


# Every bucket must have a unique name across the entire Cloud Storage namespace.
# check
# True

# False

# Task 2. Upload an object into the bucket
# Kitten image

# To upload the image above into your new bucket:

# Right-click on the image above and download it to your computer. Save the image as kitten.png, renaming it on download.

# In the Cloud Storage browser page, click the name of the bucket that you created.

# In the Objects tab, click Upload files.

# In the file dialog, go to the file that you downloaded and select it.

# Ensure the file is named kitten.png. If it is not, click the three dot icon for your file, select Rename from the dropdown, and rename the file to kitten.png.

# After the upload completes, you should see the file name and information about the file, such as its size and type.

# Test completed task
# Click Check my progress to verify your performed task. If you have successfully uploaded an object to your bucket, you will see an assessment score.

# Upload an object into the bucket (kitten.png)
# Test your understanding
# Below are multiple choice questions to reinforce your understanding of this lab's concepts. Answer them to the best of your ability.


# Object names must be unique only within a given bucket.
# check
# True

# False

# Task 3. Share a bucket publicly
# To allow public access to the bucket and create a publicly accessible URL for the image:

# Click the Permissions tab above the list of files.

# Ensure the view is set to Principals. Click Grant Access to view the Add principals pane.

# In the New principals box, enter allUsers.

# In the Select a role drop-down, select Cloud Storage > Storage Object Viewer.

# Click Save.

# In the Are you sure you want to make this resource public? window, click Allow public access.

# Test completed task
# Click Check my progress to verify your performed task. If you have successfully shared an object publicly from your bucket, you will see an assessment score.

# Share a kitten.png object publicly
# To verify, click the Objects tab to return to the list of objects. Your object's Public access column should read Public to internet.
# Note: If your object does not appear to be public after following the previous steps, you may need to refresh your browser page.
# Press the Copy URL button for your object and paste it into a separate tab to view your image.
# The Copy URL button provides a shareable URL similar to the following:

# https://storage.googleapis.com/YOUR_BUCKET_NAME/kitten.png
# Task 4. Create folders
# In the Objects tab, click Create folder.

# Enter folder1 for Name and click Create.

# You should see the folder in the bucket with an image of a folder icon to distinguish it from objects.

# Create a subfolder and upload a file to it:

# Click folder1.

# Click Create folder.

# Enter folder2 for Name and click Create.

# Click folder2.

# Click Upload files.

# In the file dialog, navigate to the screenshot that you downloaded and select it.

# After the upload completes, you should see the file name and information about the file, such as its size and type.

# Task 5. Delete a folder
# Click the arrow next to Bucket details to return to the buckets level.

# Select the bucket.

# Click on the Delete button.

# In the window that opens, type DELETE to confirm the deletion of the folder.

# Click Delete to permanently delete the folder and all objects and subfolders in it.

# Congratulations!
# You have learned how to create a Cloud Storage bucket, add objects to it, organize your assets with folders, and make objects publicly accessible.

# Next steps / Learn more
# This lab is also part of a series of labs called Qwik Starts. These labs are designed to give you a little taste of the many features available with Google Cloud. Search for "Qwik Starts" in the Google Cloud Skills Boost catalog to find the next lab you'd like to take!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated January 26, 2024

# Lab Last Tested September 19, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

