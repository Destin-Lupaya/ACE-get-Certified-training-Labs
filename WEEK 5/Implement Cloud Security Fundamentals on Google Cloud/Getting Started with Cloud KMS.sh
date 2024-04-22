# Getting Started with Cloud KMS
# experiment
# Lab
# schedule
# 45 minutes
# universal_currency_alt
# 1 Credit
# show_chart
# Introductory
# Lab instructions and tasks
# GSP079
# Overview
# Setup and requirements
# Task 1. Create a Cloud Storage bucket
# Task 2. Review the data
# Task 3. Enable Cloud KMS
# Task 4. Create a Keyring and Cryptokey
# Task 5. Encrypt your data
# Task 6. Configure IAM permissions
# Task 7. Back up data on the command line
# Task 8. View Cloud Audit logs
# Task 9. Test your knowledge
# Congratulations!
# GSP079
# Google Cloud self-paced labs logo

# Overview
# In this lab, you learn how to use some advanced features of Google Cloud Security and Privacy APIs, including:

# Setting up a secure Cloud Storage bucket
# Managing keys and encrypted data using Key Management Service
# Viewing Cloud Storage audit logs
# You use abridged data from the Enron Corpus, encrypt it, and load it into Cloud Storage.

# What you'll learn
# How to encrypt data and manage encryption keys using Cloud Key Management Service (KMS).
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
# Task 1. Create a Cloud Storage bucket
# In order to store the data for this lab you need to create your own Cloud Storage bucket.

# Pick a name for your Cloud Storage bucket, such as <filled in at lab start>-enron_corpus. For more information on naming buckets, see the Cloud Storage bucket naming guidelines. Run the following command in Cloud Shell to set a variable to your bucket name:
# BUCKET_NAME="-enron_corpus"
# Copied!
# Now create the bucket by running the following command:
# gsutil mb gs://${BUCKET_NAME}
# Copied!
# Running this command should also help to verify that you've got the gsutil command line client set up correctly, authentication is working, and you have write access to the cloud project you're operating under.

# After your bucket has been created, move on to the next step to download the Enron Corpus.
# Click Check my progress to verify the objective.

# Create a Cloud Storage bucket.
# Task 2. Review the data
# The Enron Corpus is a large database of over 600,000 emails generated by 158 employees of the Enron Corporation. This data has been copied to the Cloud Storage bucket gs://enron_emails/.

# Download one of the source files locally so that you can see what it looks like by running:
# gsutil cp gs://enron_emails/allen-p/inbox/1. .
# Copied!
# Now tail the downloaded file to verify the email text is there:
# tail 1.
# Copied!
# You should receive the following output:

# Attached is the Delta position for 1/18, 1/31, 6/20, 7/16, 9/24

#  << File: west_delta_pos.xls >>

# Let me know if you have any questions.
# This should display the contents of a plaintext mail file. There are two types of files you'll be looking for: plaintext mail files and image files. If you're interested, use the same mechanism to check out what is in those other files.

# Task 3. Enable Cloud KMS
# Cloud KMS is a cryptographic key management service on Google Cloud. Before using KMS you need to enable it in your project. In this lab you have been provisioned KMS should already have been enabled. You can make sure of this by using one of the gcloud CLI commands.

# Run the following in your Cloud Shell session:
# gcloud services enable cloudkms.googleapis.com
# Copied!
# Note: KMS and other services can also be enabled on your project using the Cloud Console UI as well.
# You shouldn't have received any output. Cloud KMS is now enabled in your project!

# Task 4. Create a Keyring and Cryptokey
# In order to encrypt the data, you need to create a KeyRing and a CryptoKey. KeyRings are useful for grouping keys. Keys can be grouped by environment (like test, staging, and prod) or by some other conceptual grouping. For this lab, your KeyRing will be called test and your CryptoKey will be called qwiklab.

# Run the following command in Cloud Shell to set environment variables:
# KEYRING_NAME=test CRYPTOKEY_NAME=qwiklab
# Copied!
# Execute the gcloud command to create the KeyRing. For this lab you will be using a global location, but it could also be set to a specific region:
# gcloud kms keyrings create $KEYRING_NAME --location global
# Copied!
# Next, using the new KeyRing, create a CryptoKey named qwiklab:
# gcloud kms keys create $CRYPTOKEY_NAME --location global \
#       --keyring $KEYRING_NAME \
#       --purpose encryption
# Copied!
# Note: CryptoKeys and KeyRings cannot be deleted in Cloud KMS!
# You shouldn't see any output. Just like that, you've created a KeyRing and CryptoKey!

# Open the Key management through the Console by going to the Navigation menu > Security > Key Management.
# The Key Management web UI allows you to view and manage your CryptoKeys and KeyRings. You will use this UI later when you manage permissions.

# Click Check my progress to verify the objective.

# Create a Keyring and Crypto key.
# Task 5. Encrypt your data
# Next, try to encrypt some data!

# Take the contents of the email you looked at earlier and base64 encode it by running the following:
# PLAINTEXT=$(cat 1. | base64 -w0)
# Copied!
# Note: Base64 encoding allows binary data to be sent to the API as plaintext. This command works for images, videos, or any other kind of binary data.
# Using the encrypt endpoint, you can send the base64-encoded text you want to encrypt to the specified key.

# Run the following:
# curl -v "https://cloudkms.googleapis.com/v1/projects/$DEVSHELL_PROJECT_ID/locations/global/keyRings/$KEYRING_NAME/cryptoKeys/$CRYPTOKEY_NAME:encrypt" \
#   -d "{\"plaintext\":\"$PLAINTEXT\"}" \
#   -H "Authorization:Bearer $(gcloud auth application-default print-access-token)"\
#   -H "Content-Type: application/json"
# Copied!
# Note: The encrypt action will return a different result each time even when using the same text and key.
# The response will be a JSON payload containing the encrypted text in the attribute ciphertext.

# Now that your data is encrypted, you can save it to a file and upload it to your Cloud Storage bucket. To grab the encrypted text from the JSON response and save it to a file, use the command-line utility jq. The response from the previous call can be piped into jq, which can parse out the ciphertext property to the file 1.encrypted. Run the following:
# curl -v "https://cloudkms.googleapis.com/v1/projects/$DEVSHELL_PROJECT_ID/locations/global/keyRings/$KEYRING_NAME/cryptoKeys/$CRYPTOKEY_NAME:encrypt" \
#   -d "{\"plaintext\":\"$PLAINTEXT\"}" \
#   -H "Authorization:Bearer $(gcloud auth application-default print-access-token)"\
#   -H "Content-Type:application/json" \
# | jq .ciphertext -r > 1.encrypted
# Copied!
# To verify the encrypted data can be decrypted, call the decrypt endpoint to verify the decrypted text matches the original email. The encrypted data has information on which CryptoKey version was used to encrypt it, so the specific version is never supplied to the decrypt endpoint. Run the following:
# curl -v "https://cloudkms.googleapis.com/v1/projects/$DEVSHELL_PROJECT_ID/locations/global/keyRings/$KEYRING_NAME/cryptoKeys/$CRYPTOKEY_NAME:decrypt" \
#   -d "{\"ciphertext\":\"$(cat 1.encrypted)\"}" \
#   -H "Authorization:Bearer $(gcloud auth application-default print-access-token)"\
#   -H "Content-Type:application/json" \
# | jq .plaintext -r | base64 -d
# Copied!
# Note: Usually decryption is performed at the application layer. For a walkthrough on how to encrypt and decrypt data in multiple programming languages, read the Cloud KMS Quickstart.
# Now that you have verified the text has been encrypted successfully, upload the encrypted file to your Cloud Storage bucket.
# gsutil cp 1.encrypted gs://${BUCKET_NAME}
# Copied!
# Click Check my progress to verify the objective.

# Encrypt Your Data with the Cloud KMS key and upload it on the storage bucket.
# Task 6. Configure IAM permissions
# In KMS, there are two major permissions to focus on. One permissions allows a user or service account to manage KMS resources, the other allows a user or service account to use keys to encrypt and decrypt data.

# The permission to manage keys is cloudkms.admin, and allows anyone with the permission to create KeyRings and create, modify, disable, and destroy CryptoKeys. The permission to encrypt and decrypt is cloudkms.cryptoKeyEncrypterDecrypter, and is used to call the encrypt and decrypt API endpoints.

# For this exercise, you will use the current authorized user to assign IAM permissions.

# To get the current authorized user, run the command below:
# USER_EMAIL=$(gcloud auth list --limit=1 2>/dev/null | grep '@' | awk '{print $2}')
# Copied!
# Next, assign that user the ability to manage KMS resources. Run the following gcloud command to assign the IAM permission to manage the KeyRing you just created:
# gcloud kms keyrings add-iam-policy-binding $KEYRING_NAME \
#     --location global \
#     --member user:$USER_EMAIL \
#     --role roles/cloudkms.admin
# Copied!
# Since CryptoKeys belong to KeyRings, and KeyRings belong to Projects, a user with a specific role or permission at a higher level in that hierarchy inherits the same permissions on the child resources. For example, a user who has the role of Owner on a Project is also an Owner on all the KeyRings and CryptoKeys in that project. Similarly, if a user is granted the cloudkms.admin role on a KeyRing, they have the associated permissions on the CryptoKeys in that KeyRing.

# Without the cloudkms.cryptoKeyEncrypterDecrypter permission, the authorized user will not be able to use the keys to encrypt or decrypt data.

# Run the following gcloud command to assign the IAM permission to encrypt and decrypt data for any CryptoKey under the KeyRing you created:
# gcloud kms keyrings add-iam-policy-binding $KEYRING_NAME \
#     --location global \
#     --member user:$USER_EMAIL \
#     --role roles/cloudkms.cryptoKeyEncrypterDecrypter
# Copied!
# Now you can view the assigned permissions in the Cryptographic Keys section of Key Management.

# Check the box by the name of the key ring (test), then click Principals in the right info panel.
# This will open up a menu where you can see the accounts and permissions for the key ring you just added.

# Task 7. Back up data on the command line
# Now that you have an understanding of how to encrypt a single file, and have permission to do so, you can run a script to backup all files in a directory. For this example, copy all emails for allen-p, encrypt them, and upload them to a Cloud Storage bucket.

# First, copy all emails for allen-p into your current working directory:
# gsutil -m cp -r gs://enron_emails/allen-p .
# Copied!
# Now copy and paste the following into Cloud Shell to back up and encrypt all the files in the allen-p directory to your Cloud Storage bucket:
# MYDIR=allen-p
# FILES=$(find $MYDIR -type f -not -name "*.encrypted")
# for file in $FILES; do
#   PLAINTEXT=$(cat $file | base64 -w0)
#   curl -v "https://cloudkms.googleapis.com/v1/projects/$DEVSHELL_PROJECT_ID/locations/global/keyRings/$KEYRING_NAME/cryptoKeys/$CRYPTOKEY_NAME:encrypt" \
#     -d "{\"plaintext\":\"$PLAINTEXT\"}" \
#     -H "Authorization:Bearer $(gcloud auth application-default print-access-token)" \
#     -H "Content-Type:application/json" \
#   | jq .ciphertext -r > $file.encrypted
# done
# gsutil -m cp allen-p/inbox/*.encrypted gs://${BUCKET_NAME}/allen-p/inbox
# Copied!
# This script loops over all the files in a given directory, encrypts them using the KMS API, and uploads them to Cloud Storage.

# Click Check my progress to verify the objective.

# Encrypt multiple files using KMS API and upload to Cloud Storage.
# After the script completes, you can view the encrypted files when you click Storage from the Console's left menu.

# To find the files, go to Navigation menu > Cloud Storage > Buckets > YOUR_BUCKET > allen-p > inbox. You should see something like this:
# Bucket content

# Note: Cloud Storage supports Server Side Encryption, which supports key rotation of your data and is the recommended way to encrypt data in Cloud Storage. The above example is for demonstration purposes only.
# Task 8. View Cloud Audit logs
# Google Cloud Audit Logging consists of two log streams, Admin Activity and Data Access, which are generated by Google Cloud services to help you answer the question "who did what, where, and when?" within your Google Cloud projects.

# To view the activity for any resource in KMS, go to Navigation menu > Cloud Overview > Activity tab. This will take you to the Cloud Activity UI and then click on View Log Explorer, Select Cloud KMS Key Ring as the Resource Type and you should see the creation and all modifications made to the KeyRing.
# You've now encrypted and uploaded data using KMS and Cloud Storage!

# What was covered
# Using IAM to manage KMS permissions.
# Using KMS to encrypt data.
# Using Cloud Storage to store encrypted data.
# Using Cloud Audit Logging to view all activity for CryptoKeys and KeyRings.
# Task 9. Test your knowledge
# # Test your knowledge about Cloud KMS by taking this quiz.


# Cloud KMS is integrated with Cloud IAM and Cloud Audit Logging so that you can manage permissions on individual keys and monitor how these are used.

# True

# False

# Congratulations!
# You learned how to encrypt data and manage encryption keys using Cloud Key Management Service (KMS).

# Next steps / Learn more
# Learn more about rotating encryption keys.
# Read about envelope encryption.
# Read more about data encryption options.
# Manual Last Updated April 15, 2024

# Lab Last Tested August 31, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.