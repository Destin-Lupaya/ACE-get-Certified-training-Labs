# Introduction to Migration Center Assessments
# experiment
# Lab
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# No cost
# show_chart
# Intermediate
# GSP1095
# Google Cloud self-paced labs logo

# Overview
# In this hands-on lab you'll learn how to assess a customer's existing environment, collect information from a supported database as well as import data collected from Azure/AWS infrastructure. You'll generate inventory, cloud fit score, and financial reports including TCO and ROI analysis.

# Migration center diagram

# What you'll do
# Collect data automatically from an existing environment
# Collect data from MySQL, and Postgres databases
# Review data in Migration Center
# Review data in StratoZone
# Generate reports
# Note: If you're using a Chromebook, you will need to use a third-party RDP tool, like Remote Desktop 8 or [remmina], rather than the RDP button in the Cloud Console.
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

# student-04-da5963097874@qwiklabs.net
# Copied!
# You can also find the Username in the Lab Details panel.

# Click Next.

# Copy the Password below and paste it into the Welcome dialog.

# jYND8GZla9lF
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
# To begin, you will download and deploy the MC (Migration Center) collector in a simulated customer environment created for this purpose in Google Cloud.

# In the Console, from the Navigation menu (Navigation menu icon), select Compute Engine > VM instances.
# The navigation path to the option VM instances.

# If prompted, select the Google Cloud project assigned to your lab.

# Click the RDP button next to the lab-winvm01 instance.
# The Instances tabbed page, which includes the highlighted RDP button

# Note: If you're using a Chromebook, you will need to use a third-party RDP tool rather than the RDP button.
# Use the following credentials to complete the RDP login:
# User name

# stratozone

# Password

# $tr@t0z0n3

# Note: If you have any issues logging in, wait a minute and retry.
# Task 1. Create automatic asset discovery collector
# In this section, you will access Migration Center Assessments. Perform all the following steps from the RDP session.

# Open Chrome browser installed on the Windows system you connected to.

# Browse to the following url to login to Google Cloud:

# http://console.cloud.google.com
# Copied!
# In Google Cloud, from the Navigation menu, click More products to expand the menu.

# In the Tools section click the Pin icon next to Migration Center to add it to the Pinned menu section for quick access.

# Click Migration Center menu option.

# The highlighted Pin icon within the Tools section of the Migration Center.

# NOTE: When accessing Migration Center for first time you will be prompted to set some default values.

# When prompted, select us-central1 from the Geographical region dropdown and click Next.

# Click Skip on the Enter an Expert Request number prompt.

# Skip Expert Request number.

# Click Next on the Set Migration preferences prompt.
# Set Migration preferences defaults.

# Click Continue

# From the Migration Center overview dashboard click Discover Assets.

# The highlighted Discover assets tile.

# Click + Add Data button.
# Add Data button.

# Use the following information to complete the collector setup:
# Select how you would like to discover assets

# Scan your environment

# Client name

# mcc-lab-collector

# Service account

# migration-client@qwiklabs-gcp-03-f50613836064.iam.gserviceaccount.com

# Estimated number of assets

# 6

# The Collector setup, which includes the aforementioned fields.

# Click Add Data Source.

# Download MC Collector by clicking Download button.

# Wait for the download to complete.

# Click Check my progress to verify the objective.

# Verify data collector has been created.
# Task 2. Install MC Discovery Client
# Run the Migration Center Discovery Client installer (mcc_lab_setup.exe).

# Click Yes when prompted to confirm permitting changes to the system.

# If prompted, install .Net Core Desktop Runtime by clicking OK.

# Review and accept the license agreement.

# Follow the instructions on the screen using default settings to complete the installation.

# Note: Installation takes around 10 minutes to complete.
# Once the installation has completed, you will see a new application shortcut on your desktop.

# To run the Migration Center Discovery Client application, open the shortcut in the start menu.
# Discovery Client runs in administrative mode.

# When prompted to confirm user access control click Yes.
# The Migration Center Collector highlighted in the Start menu.

# Task 3. Authorize Discovery Client
# To start the authorization process, click Authorize with Migration Center.

# Under Connectivity check, click Run check.

# Click Continue.

# Under Log in with Google, click Log in with Google.

# Follow the instructions on the screen, select the Google account assigned to the lab, then click Continue on the next screen.

# Google login screen.

# Click Continue.
# The highlighted Continue button.

# Under Choose project, select the Google Cloud project assigned to your lab (name starts with qwiklabs-gcp ).

# Click Continue

# Under Choose collector, select the collector for you created from the list (mcc-lab-collector).

# To confirm, click Authorize.

# Note: The Migration center collector activation takes a few minutes.

# Click Check my progress to verify the objective.

# Verify data collector has been activated.
# Task 4. Configure asset collection
# Once activation completes, the MC Discovery Client dashboard will open.

# Click the Add Credentials button in the upper left menu.
# Multiple credentials can be stored within MC Discovery Client to allow the collector to access systems belonging to different Active Directory domains, or having local accounts, or SSH keys.

# Choose OS Scan as the scanning method and click Configure.
# The highlighted scan method and Configure button.

# Use the following values to set up a credential group:
# Credential Name

# Lab

# Credential Type

# Username and Password

# Username

# stratozone

# Password

# $tr@t0z0n3

# Group Scheduling

# Accept Defaults

# Click Add Credential button.
# You will also use user/key authentication to collect on some linux VMs.

# Download SSH key provided with the lab by going to the lab instruction page and clicking Download PEM link.
# The highlighted SSH Key User and Download PEM button.

# Copy the downloaded file to the Windows system where Collector is installed (Copy and paste the file using Remote Desktop session).

# Click Add Credentials button in the upper left menu.

# Choose OS Scan as the scanning method and click Configure.

# Use the following values to set up a credential group:

# Credential Name

# Lab-key

# Credential Type

# SSH Key / Certificate (Linux Only)

# Username for this key

# Value from "SSH Key User" field in lab instructions (see above)

# Upload New Key/Certificate

# Click Browse button and select the PEM file copied in step 6

# Click Add Credential button.

# From the Add Assets dropdown, click Machine and select Scan IP address ranges from Machine sub-menu.

# IP address range scan allows for discovery of assets across the network.

# The highlighted option Scan IP address ranges.

# On the scan warning screen checking the I agree box and clicking Continue.
# Important: Make a note of the Internal IP address configured for the lab VM Instances (e.g. 10.128.0.2). You will use the first three octets in the bulk scan.

# The highlighted IP addresses, which includes 10.128.0.2, 10.128.0.3, and 10.128.4.

# From the Add IP Address Ranges dropdown select Enter ranges.
# The expanded Add IP Address Ranges dropdown menu.

# For the beginning IP address, use the first three octets plus .1 (10.128.0.1 in this example), for the ending IP address, use the first three octets plus .8 (10.128.0.8 in this example).

# Click the Start IP scan button.

# On the Start to scan IP address range popup click the Start Scan button.

# Start Scan button

# Click on the arrow button to go back to the dashboard.
# Back button

# Note: It may take up to 2 minutes for the scan to start and complete.
# Task 5. Enable data copy to StratoZone
# Users need to agree to data copy between Migration Center and StratoZone for data to be available in both systems.

# In Google Cloud, from the Navigation menu, select Migration Center and click on Reports catalog sub-menu.
# The navigation path to the option Assets.

# In the upper right corner click Go to StratoZone link.

# Select any reason you want for please tell us why you're going to StratoZone popup.

# When prompted, select account assigned to the lab.

# The sign in page, which lists one account.

# If prompted to select services, ensure all boxes are checked on the access screen and click Continue.
# The access screen, which displays all the categories checked.

# Ensure you see a message stating that project is successfully onboarded.
# Stratozone confirmation message; The selected project is successfully onboarded.

# Click on the provided login link.

# Accept the terms and conditions.

# Verify data copy to StratoZone has been configured.
# Task 6. Start Database Collection
# Note: MC Collector can collect data at-scale (many concurrent databases) from MS SQL Server, MySql and Postgres. This additional level of scanning allows for granular analysis of configurations and drives target modernization insights.
# In this lab you will perform collection on Databases of type PostgreSQL and MySQL databases.

# To begin, create credentials for every database type. Back in the Migration Center Discovery Client:

# Click Add Credentials button.

# From the popup select Database Scan and click Configure.

# Use the following values for first set of credentials:

# Credential Name

# lab-mysql

# Database Type

# MySQL

# Username

# collectionuser

# Password

# $tr@t0z0n3

# Click Add Credential.

# Repeat the steps above with following values for PostgreSQL:

# Credential Name

# lab-postgresql

# Database Type

# PostgreSQL

# Username

# dbuser

# Password

# $tr@t0z0n3

# Once all database credentials are saved, you can proceed to adding database resources.

# From the top menu click Add Assets, click Database and select Enter connection strings.

# Enter the following values to complete connection configuration for MySQL database and click Add Asset:

# Credential Name

# lab-mysql
# OS machine asset

# from dropdown select vm starting with lab-mysql01.*

# Host

# 10.128.0.2

# Port number

# 3306
# Click the Test Connection String button.

# For the PostgreSQL database type you will import the settings from provided csv file.

# In the windows-vm, Open Chrome, then go to the following URL and download the file.

# http://storage.googleapis.com/spls/gsp804/postgresql_import.csv
# Copied!
# From the top menu click Add Assets, click Database and select Upload CSV of connection strings.

# From the credential dropdown select lab-postgresql.

# Click Browse and select the postgresql_import.csv file from the location it was downloaded to and click Save.

# Dismiss the popup after import completes.

# Verify the status of all assets

# Click the Resources tab on the MC Collector home screen and verify that the Scan Status shows a green check box next to all resources. If there are any errors, verify the credentials used, delete the resource, then recreate it.
# The Assets tabbed page, which includes a list of assets, their credentials, and scan status.

# Note: Verification may take up to 20 minutes. If you receive an indication that a step has not been completed, you can proceed with the lab and return here to retry the verification.
# Verify database collection is configured and data is transmitted to Migration Center.
# Task 7. Import AWS data
# In the windows-vm, using Chrome navigate to the following URL:
# https://storage.googleapis.com/spls/gsp1095/vm-aws-import-files.zip
# Copied!
# this will start download of the file generated from AWS account.

# Decompress the downloaded zip file by right-clicking on it and selecting Extract ALL....

# Click Extract.

# In Google Cloud, from the Navigation menu, select Migration Center and click on Data import sub-menu item.

# Click + Add Data button under the FILE UPLOADS.

# Add Data button.

# Select Upload files option.

# Enter aws-account-import into File upload name field.

# From File format dropdown select AWS exports.

# File upload options.

# Click Select files to upload button

# Navigate to directory where zip file was downloaded to (Default location: C:\Users\stratozone\Downloads\vm-aws-import-files)

# Select all 4 files in the directory, click Open button. This will bring all the selected file names to the import page.

# Select files to import.

# Click Upload Files.

# Once upload completes there should be green check next to every file.

# View uploaded files.

# Click Import Data button to finish the import.
# Finish import button.

# Click Confirm on the confirmation popup.
# Verify AWS file was imported successfully.
# Task 8. Review data in Migration Center
# In Google Cloud, from the Navigation menu, select Migration Center and click on Assets sub-menu.
# The navigation path to the option Assets.

# View list of collected assets.

# Select one or more assets to bring up the additional options like Select all button, for all available assets selection, based on applied filter.

# Select all assets option.

# Unselect previously selected assets and click on Export button and choose Export assets details in order to export the list of all assets, based on applied filter into Google Drive in google sheets format.
# Export assets details and assets performance data.

# Authorize with the QwikLab user when Google Authorization window appears.

# Click on Open Spreadsheet button to open generated report in the Google Drive.

# Open assets details report.

# Go back to Migration Center tab and select Export performance data option in order to export the performance data of all assets, based on applied filter into Google Drive in google sheets format.
# Export assets performance data popup.

# Click on Export button when popup appears - it is possible to choose how many days of performance data you want to see using slider option.
# Export assets performance data popup.

# View Performance data report in the Google Drive by clicking Open spreadsheet button.
# Open assets performance data report.

# Note: Performance data is not available for assets created using provided AWS import data file
# Select several assets and bring them out of scope by clicking the Out of scope button.
# Put assets Out of scope.

# Provide any relevant reason, like "Old Servers" and click on Confirm button.
# Populate Out of Scope reason.

# View Out Of Scope assets in the dedicated Out of Scope assets tab.
# View Out of Scope assets.

# Select the Out of Scope assets and bring them back in scope by clicking on Put back in scope button
# Note: Out of scope assets will be excluded from the TCO report and will only be available for viewing in the dedicated tab
# Click on the name of any of the assets to bring up details page.

# Switch between different tabs inside asset details page to view more assets details

# Assets details page.

# Note: Performance data is not available for assets created using provided AWS import data file
# Task 9. Generate TCO Report
# In order to generate TCO report in Migration Center groups and migration preferences will have to be set.

# In Google Cloud, from the Navigation menu, select Migration Center and click on Groups sub-menu.

# Click + Create Group

# Create group button.

# Enter All Assets in Group name field, Click Next

# From the list select all assets by clicking check box next to VM name label.

# Click Create button.

# Repeat the steps above to create two more groups. Use filters to help select VMs.

# Group Name	Select criteria
# windows-only	All VMs running Windows OS
# Windows filter.
# linux-only	All VMs running Linux OS
# Linux filter.
# From the Navigation menu, select Migration Center and click on Migration preferences sub-menu.

# Click + Create migration preferences button.

# Use the following values (the rest leave default values):

# Preferences name	aggressive-optimization-3-year-commit
# Machine series	N2, N2D
# Sizing method	Aggressive
# Click Create.

# Repeat the steps to create one more preference set using following values:

# Preferences name	moderate-optimization-1-year-commit
# Machine series	C2, C2D
# Disk type	SSD persistent disk
# Sizing method	Moderate
# Pricing track	1-year resource-based committed use discount (USD)
# From the Navigation menu, select Migration Center and click on TCO & pricing sub-menu.

# TCO report menu.

# Click + Create report.

# Enter lab-tco-report for report name, click Next

# Select All-assets, windows-only and linux-only groups, click Next.

# Select groups.

# Click down arrow on the all-assets group to show assigned preferences.

# Select moderate-optimization-1-year-commit from dropdown for preference 2.

# Select aggressive-optimization-3-year-commit from dropdown for preference 3.

# Set preferences.

# Click Assign to all groups.

# Click Generate Report

# Green checkbox when report is ready.

# Report will can take up tot 5 min to generate. Green checkbox indicates that report is ready to view.

# Click on the report name to view details.

# NOTE: Both TCO and Detailed Pricing report have an export to Google slides option however this feature is not available in the lab.

# TCO export:

# Export TCO report to Google Slides.

# Detailed Pricing Report export:

# Export TCO report to Google Slides.

# Verify Inventory TCO report has been generated.
# Task 10. Review data in StratoZone
# Note: It may take up to 15 minutes before data is visible in StratoZone portal.
# Click View in StratoZone link in the upper right corner.

# Login via Sign in with Google, using the qwiklab user.

# Click on the Results tab, then click the Inventory link in the left menu.

# Confirm that the assets are visible in the Migration Center are also visible in StratoZone.

# Task 11. Run an Assessment Summary and Proposal report
# Click on the Reports tab, then click the Generate Report link on the Assessment Summary and Proposal title.

# Use the following values for the report:

# Report Name

# assessment-summary-report

# Report Format

# Google Slides

# Select Filters

# Select All

# Vendor Catalog 1

# Private Data Center

# Vendor Catalog 2

# On-Demand

# Vendor Catalog 3

# 1 Year Commit

# Vendor Catalog 4

# 3 Year Commit

# Click the Create Report button.

# Open the report and view the available data.

# Verify Assessment Summary and Proposal report has been generated.
# Task 12. Generate database pricing report
# Click on the Results tab, then click the Databases link in the left menu.

# Review data available for the collected databases. Use the tabs to switch between databases.

# The Database page displaying the highlighted tabs; Overview, PostgreSQL and MySQL.

# Click Download Pricing Report link in the Estimated cloud spend section.
# The Download pricing report link.

# Use the following values for the report:
# Report Name

# mysql-pricing-report

# Report Format

# Google Sheets

# Select Filters

# MySQL

# Commit Term 1

# On-Demand

# Commit Term 2

# 1 Year Commit

# Commit Term 3

# 3 Year Commit

# Click the Create Report button.

# Open the report and view the available data.

# Verify database pricing report has been generated.
# Task 13. Review database level data
# Click on the Results tab, then click the Database Inventory link in the left menu.
# The navigation path to the option Database Inventory.

# The list of collected databases should be visible along with Cloud Fit score.

# Click on AdventureWorks database hosted on LAB-WINVM01 server.

# View data for other collected databases.

# Review the presented details paying attention especially to the list of Cloud fit factors section.

# Task 14. Run a Container Fit Assessment report.
# Click on the Reports tab, then click the View More link at the bottom of the page.

# Click the Generate Report link on Container Fit Assessment report title.

# Note: It may take up to 10 minutes for Container Fit Assessment report to appear in Report tab.
# Use the following values for the report:
# Report Name

# fit-report

# Report Format

# HTML

# Report Type

# Standard

# Select Filters

# Collector

# Click Create Report button.

# Open report and view available data.

# Verify Container Fit Assessment report has been generated.
# Congratulations!
# You've successfully collected and analyzed the deployed infrastructure by using Migration Center and StratoZone.

# Next steps/Learn more
# To learn more about Migration Centers, refer to the Migration Center Collector User Guide.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated April 05, 2024

# Lab Last Tested April 05, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

