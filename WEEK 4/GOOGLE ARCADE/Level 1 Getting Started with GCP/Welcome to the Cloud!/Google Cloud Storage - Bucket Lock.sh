# Google Cloud Storage - Bucket Lock
# schedule
# 40 minutes
# universal_currency_alt
# No cost
# GSP297
# Google Cloud self-paced labs logo

# Overview
# In this lab, you learn how to use Cloud Storage Bucket Lock feature which allows you to configure a data retention policy for a Cloud Storage bucket that governs how long objects in the bucket must be retained. The feature also allows you to lock the data retention policy, permanently preventing the policy from being reduced or removed.

# Combined with Cloud Storage detailed audit logging mode, which logs Cloud Storage request and response details, or Object Lifecycle Management, Bucket Lock can help with regulatory and compliance requirements, such as those associated with FINRA, SEC, and CFTC. You can also use Bucket Lock to address certain health care industry retention regulations.

# What you'll learn
# In this lab you will learn how to:

# Create a bucket
# Define an object retention policy
# Remove a retention policy
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
# Activate Cloud Shell
# Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud. Cloud Shell provides command-line access to your Google Cloud resources.

# Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.
# When you are connected, you are already authenticated, and the project is set to your Project_ID, PROJECT_ID. The output contains a line that declares the Project_ID for this session:

# Your Cloud Platform project in this session is set to "PROJECT_ID"
# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# (Optional) You can list the active account name with this command:
# gcloud auth list
# Copied!
# Click Authorize.
# Output:

# ACTIVE: *
# ACCOUNT: "ACCOUNT"

# To set the active account, run:
#     $ gcloud config set account `ACCOUNT`
# (Optional) You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = "PROJECT_ID"
# Note: For full documentation of gcloud, in Google Cloud, refer to the gcloud CLI overview guide.
# Set the region for this lab
# gcloud config set compute/region "REGION"
# Copied!
# The Cloud Storage utility tool, gsutil , is installed and ready to use in Google Cloud. In this lab you use gsutil in Cloud Shell.

# Task 1. Create a new bucket
# Define an environment variable named Cloud Storage_BUCKET and use your Project ID as the bucket name. Use the following command which uses the Cloud SDK to get your Project ID:
# export BUCKET=$(gcloud config get-value project)
# Copied!
# Next, make a new bucket using the following gsutil command:
# gsutil mb "gs://$BUCKET"
# Copied!
# Click Authorize.
# Click Check my progress to verify the objective.
# Create a storage bucket

# Task 2. Define a Retention Policy
# Consider a financial institution branch with a SEC Rule 17a-4 requirement to retain financial transaction records for 6 years (10 seconds for this lab). The Branch IT Administrator, a technical administrator responsible for day-to-day records management and retention within the branch, wants to create a Cloud Storage bucket with a 10 second Retention Policy to help with this requirement.

# Look at how to set up a Retention Policy on a bucket.

# You can define the Retention Policy using seconds, days, months, and years with the Cloud Storage gsutil tool. As an example, create a Retention Policy for 10 seconds:
# gsutil retention set 10s "gs://$BUCKET"
# Copied!
# Note: You can also use 10d for 10 days, 10m for 10 months or 10y for 10 years. To learn more, use the command: gsutil help retention set.
# Verify the Retention Policy for a bucket:
# gsutil retention get "gs://$BUCKET"
# Copied!
# Sample output:

# Retention Policy (UNLOCKED):
#   Duration: 10 Second(s)
#   Effective Time: Tue, 23 Jan 2018 01:04:05 GMT
# The Effective Time defines when the policy took effect on the bucket.

# Now that the bucket has a Retention Policy, add a transaction record object to test it:
# gsutil cp gs://spls/gsp297/dummy_transactions "gs://$BUCKET/"
# Copied!
# Review the retention expiration:
# gsutil ls -L "gs://$BUCKET/dummy_transactions"
# Copied!
# Sample output:

# gs://YOUR_BUCKET_NAME/dummy_transactions:
#     Creation time:          Tue, 23 Jan 2018 00:45:21 GMT
#     Update time:            Thu, 25 Jan 2018 20:14:49 GMT
#     Retention Expiration:   Thu, 25 Jan 2018 20:14:59 GMT
# When the Retention Policy expires for the given object, it can then be deleted.

# To extend a Retention Policy, use the gsutil retention set command to update the Retention Policy.

# Click Check my progress to verify the objective.
# Set up Retention Policy

# Task 3. Lock the Retention Policy
# While unlocked, you can remove the Retention Policy from the bucket or reduce the retention time. After you lock the Retention Policy, it cannot be removed from the bucket or the retention time reduced.

# Lock the Retention Policy:
# gsutil retention lock "gs://$BUCKET/"
# Copied!
# Sample output to confirm the lock:

# This will PERMANENTLY set the Retention Policy on gs://YOUR-BUCKET-NAME to:

#   Retention Policy (UNLOCKED):
#     Duration: 10 Second(s)
#     Effective Time: Wed, 07 Feb 2018 01:37:52 GMT

# This setting cannot be reverted!  Continue? [y|N]:
# Enter y to confirm.
# Note: To view the Retention Policy for a bucket recall the following command:
# gsutil retention get "gs://$Cloud Storage_BUCKET/"
# Once locked the Retention Policy can't be unlocked and can only be extended. The Effective Time is updated if the amount of time since it was set or last updated has exceeded the Retention Policy.

# Click Check my progress to verify the objective.
# Lock the Retention Policy

# Task 4. Temporary hold
# Continuing the example above, consider the bucket already configured with a 10 second locked Retention Policy.

# Financial regulators decide to perform an audit of one of the branch's customers, and require that those records are retained for the duration of the audit. Some of the Cloud Storage objects for this customer are close to their expiration date, and will soon be automatically deleted.

# To handle this, when regulatory investigation begins, the Branch IT Administrator sets the temporary hold flag for each of the objects related to the audit. While that flag is set, the objects will continue to be protected from deletion, even if they are older than 10 seconds.

# Set a temporary hold on the transactions object:
# gsutil retention temp set "gs://$BUCKET/dummy_transactions"
# Copied!
# By placing a temporary hold on the object, delete operations are not possible unless the object is released from the hold. As an example, attempt to delete the object:
# gsutil rm "gs://$BUCKET/dummy_transactions"
# Copied!
# You should see the following error message:

# AccessDeniedException: 403 Object 'YOUR-BUCKET-NAME/dummy_transactions is under active Temporary hold and cannot be deleted, overwritten or archived until hold is removed.
# Once regulators conclude their audit, the Branch IT Administrator removes the temporary hold. Use the following command to release the hold:
# gsutil retention temp release "gs://$BUCKET/dummy_transactions"
# Copied!
# Click Check my progress to verify the objective.
# Set up Temporary Hold

# Now you can delete the file unless the Retention Policy for the file hasn't expired. Otherwise wait a few moments and try again.
# gsutil rm "gs://$BUCKET/dummy_transactions"
# Copied!
# Task 5. Event-based holds
# Continuing the example above, consider the bucket already configured with a 10 second locked Retention Policy.

# In addition to retaining financial transaction records for 10 seconds, the branch also needs to retain loan records for 10 seconds starting from the date that the loan is paid off. To accomplish this, the Branch IT Administrator uploads loan records as new Cloud Storage objects with the event-based hold flag set.

# Each day, as the loans are paid off, the Branch IT Administrator unsets the event-based hold flag on the corresponding Cloud Storage objects. No further action is necessary, since Cloud Storage automatically calculates a new Retention Policy expiring 10 seconds from that day.

# Event-based holds allow you to delay a Retention Policy from counting down until the hold is released. Event-based holds can be managed per object and set by default in bucket properties when new objects are added to a bucket.

# Look at enabling event-based holds for a loan.

# Enable the default event-based hold for your bucket using the following command:
# gsutil retention event-default set "gs://$BUCKET/"
# Copied!
# Add an example loan into the bucket using the following command:
# gsutil cp gs://spls/gsp297/dummy_loan "gs://$BUCKET/"
# Copied!
# Verify that the event-based hold is enabled for your newly added loan using the following command:
# gsutil ls -L "gs://$BUCKET/dummy_loan"
# Copied!
# You should see a similar output:

# gs://YOUR-BUCKET-NAME/dummy_loan:
#     Creation time:          Fri, 26 Jan 2018 07:40:28 GMT
#     Update time:            Fri, 26 Jan 2018 07:40:28 GMT
#     Event-Based Hold:       Enabled
# Notice that Retention Expiration isn't defined. The Retention Expiration time is not available until the Event-Based hold is released on the object.

# When the loan is paid off, the Branch IT Administrator then releases the event-based hold using the following command:
# gsutil retention event release "gs://$BUCKET/dummy_loan"
# Copied!
# You should see a similar output:

# Releasing Event-Based Hold on gs://YOUR-BUCKET-NAME/dummy_loan...
# After an event-based hold is released, the bucket Retention Policy takes effect. Verify that the example loan now has a Retention Expiration field using the following command:
# gsutil ls -L "gs://$BUCKET/dummy_loan"
# Copied!
# You should see the following:

# dummy_loan:
#     Creation time:          Fri, 26 Jan 2018 08:14:16 GMT
#     Update time:            Fri, 26 Jan 2018 08:14:25 GMT
#     Retention Expiration:   Fri, 26 Jan 2018 08:14:45 GMT
# Note: You can also set an event-based hold for a specific object by using the following command:
# gsutil retention event set "gs://bucket-name/object-name"
# Click Check my progress to verify the objective.
# Create Event-based holds

# Task 6. How to remove a Retention Policy
# Unfortunately, the branch shuts down its lending operations. The Branch IT Administrator still needs to maintain the existing records for their full duration, but no longer expects to produce records in the bucket. After the last loan Retention Period has expired and no longer subject to a hold, the Branch IT Administrator can then delete the empty bucket. The bucket can be deleted even though it has a locked Retention Policy because it contains no data subject to retention.

# Delete an empty bucket using the following command:
# gsutil rb "gs://$BUCKET/"
# Copied!
# Congratulations!
# In this lab you learned how to manage object retention using policies defined by time, temporary holds, event-based holds, and finally how to delete a bucket with a locked Retention Policy.

# Take your next lab
# Learn more about Cloud Storage:

# Getting Started with Cloud KMS
# Cloud Filestore: Qwik Start
# Next steps / Learn more
# Learn about Cloud Storage Bucket Lock.
# Learn about Cloud Storage Managing Object Lifecycles.
# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated September 20, 2023

# Lab Last Tested September 20, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

RESOLUTION

https://www.youtube.com/watch?v=s-psIayBLg8


================================

sudo chmod +x quicklabgsp297.sh 
./quicklabgsp297.sh 

================================
