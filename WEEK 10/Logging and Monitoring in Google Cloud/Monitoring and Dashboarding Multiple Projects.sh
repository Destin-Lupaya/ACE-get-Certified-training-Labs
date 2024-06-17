# Monitoring and Dashboarding Multiple Projects
# experiment
# Lab
# schedule
# 2 hours
# universal_currency_alt
# 5 Credits
# show_chart
# Intermediate
# Overview
# Google Cloud Monitoring empowers users with the ability to monitor multiple projects from a single metrics scope. In this exercise, you start with three Google Cloud projects, two with monitorable resources, and the third you use to host a metrics scope. You attach the two resource projects to the metrics scope, build uptime checks, and construct a centralized dashboard.

# Objectives
# Configure a Worker project.
# Create a metrics scope and link the two worker projects into it.
# Create and configure Monitoring Groups.
# Create and test an uptime check.
# Setup and requirements
# For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

# Sign in to Qwiklabs using an incognito window.

# Note the lab's access time (for example, 1:15:00), and make sure you can finish within that time.
# There is no pause feature. You can restart if needed, but you have to start at the beginning.

# When ready, click Start lab.

# Note your lab credentials (Username and Password). You will use them to sign in to the Google Cloud Console.

# Click Open Google Console.

# Click Use another account and copy/paste credentials for this lab into the prompts.
# If you use other credentials, you'll receive errors or incur charges.

# Accept the terms and skip the recovery resource page.

# Note: Do not click End Lab unless you have finished the lab or want to restart it. This clears your work and removes the project.

# After you complete the initial sign-in steps, the project dashboard appears.

# The Project Dashboard which includes tiles for Project Info, APIs, Resources, Trace, Billing, and Error reporting 

# Activate Google Cloud Shell
# Google Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud.

# Google Cloud Shell provides command-line access to your Google Cloud resources.

# In Cloud console, on the top right toolbar, click the Open Cloud Shell button.

# Highlighted Cloud Shell icon

# Click Continue.

# It takes a few moments to provision and connect to the environment. When you are connected, you are already authenticated, and the project is set to your PROJECT_ID. For example:

# Project ID highlighted in the Cloud Shell Terminal

# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# You can list the active account name with this command:
# gcloud auth list
# Copied!
# Output:

# Credentialed accounts:
#  - @.com (active)
# Example output:

# Credentialed accounts:
#  - google1623327_student@qwiklabs.net
# You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = 
# Example output:

# [core]
# project = qwiklabs-gcp-44776a13dea667a6
# Note: Full documentation of gcloud is available in the gcloud CLI overview guide .
# Task 1. Configure the resource projects
# Your lab environment has three projects pre-created in it, the project IDs are displayed in the upper-left corner of the lab steps page.

# The Lab Details panel with credentials for multiple projects listed

# The first project (ID 1) will be the scoping project. Projects ID 2 and ID 3 will be the monitored/resource projects. Per Google's recommended best practices, the project we use to host the metrics scope will not be one of the projects actually housing monitored resources.

# In this task, you:

# Create an NGINX web server in each of your worker projects.
# Configure two resource projects
# Let's start by building some resources to monitor.

# Open a text document on your computer and in it, make note of the three project IDs.

# Label Project ID 1 as Monitoring Project.
# Label Project ID 2 as Worker 1.
# Label Project ID 3 as Worker 2.
# In the rest of this exercise, the project IDs are referred to by these names.

# In the Google Cloud Console page, use the project dropdown near the upper-left corner of the interface to switch to the Worker 1 project. Remember, it is the project with the ID you labeled Worker 1 in the text file you created in Step 1.

# Note: If you don't see all three projects, type qwiklabs in the search box and the missing projects should appear.
# In the Cloud console, on the Navigation menu (Navigation menu icon), click Compute Engine > VM Instances.

# This may take a minute to initialize for the first time.

# To create a new instance, click CREATE INSTANCE.

# There are many parameters you can configure when creating a new instance. Use the following for this lab:

# Field	Value	Additional Information
# Name	worker-1-server	Name for the VM instance
# Region	us-central1	For more information about regions, see the Compute Engine guide, Regions and Zones.
# Zone	us-central1-f	Note: Remember the zone that you selected to use later. For more information about zones, see the Compute Engine guide, Regions and Zones.
# Series	E2	Name of the series
# Machine Type	2 vCPU	This is an (e2-medium), 2-CPU, 4GB RAM instance. Several machine types are available, ranging from micro instance types to 32-core/208GB RAM instance types. For more information, see the Compute Engine guide, About machine families. Note: A new project has a default resource quota, which may limit the number of CPU cores. You can request more when you work on projects outside this lab.
# Boot Disk	New 10 GB balanced persistent disk OS Image: Debian GNU/Linux 11 (bullseye) x86/64, amd64 built on 20240213	Several images are available, including Debian, Ubuntu, CoreOS, and premium images such as Red Hat Enterprise Linux and Windows Server. For more information, see Operating System documentation.
# Firewall	Allow HTTP traffic	Select this option in order to access a web server that you install later. Note: This automatically creates a firewall rule to allow HTTP traffic on port 80.
# Click Create.

# It should take about a minute for the VM, worker-1-server, to be created. After worker-1-server is created, the VM Instances page lists it in the VM instances list.

# To use SSH to connect to the VM, click SSH to the right of the instance name, worker-1-server.

# This launches an SSH client directly from your browser.

# Note: Learn more about how to use SSH to connect to an instance from the Compute Engine guide, Connect to Linux VMs using Google tools.
# Now you install an NGINX web server, one of the most popular web servers in the world, to connect your VM to something.

# Update the OS:

# sudo apt-get update
# Copied!
# Expected output:

#  Get:1 http://security.debian.org stretch/updates InRelease [94.3 kB]
#  Ign http://deb.debian.org strech InRelease
#  Get:2 http://deb.debian.org strech-updates InRelease [91.0 kB]
#  ...
# Install NGINX:

# sudo apt-get install -y nginx
# Copied!
# Expected output:

#  Reading package lists... Done
#  Building dependency tree
#  Reading state information... Done
#  The following additional packages will be installed:
#  ...
# Confirm that NGINX is running:

# ps auwx | grep nginx
# Copied!
# Expected output:

#  root      2330  0.0  0.0 159532  1628 ?        Ss   14:06   0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
#  www-data  2331  0.0  0.0 159864  3204 ?        S    14:06   0:00 nginx: worker process
#  www-data  2332  0.0  0.0 159864  3204 ?        S    14:06   0:00 nginx: worker process
#  root      2342  0.0  0.0  12780   988 pts/0    S+   14:07   0:00 grep nginx
# To see the web page, return to the Cloud console and click the External IP link in the row for your machine, or add the External IP value to http://EXTERNAL_IP/ in a new browser window or tab.
# This default web page should open.

# Default nginx page; Welcome to nginx!

# Use the project dropdown to switch to Worker 2 project.

# Perform similar steps in Worker 2:

# Create a VM instance with worker-2-server.
# Allow HTTP traffic.
# SSH the VM instance.
# Install NGINX.
# Use the project dropdown to switch back to Worker 1 project.

# Use the Navigation menu to view your new Compute Engine > VM instances.

# Copy the External IP and paste it in a new browser tab. Make sure you can see your new Worker 1 web server.

# In the text file you created in Step 1, add a new entry worker-1-server, and next to it, paste your copied external IP.

# Use the project dropdown to switch to Worker 2 project. You should still be on the VM instances page. Again:

# Copy the External IP value.
# Paste it in the browser and view the new server 2 home page
# Add a new worker-2-server entry into your text file and add its IP.
# To check your progress in this lab, click Check my progress below. A checkmark means you're successful.

# Click Check my progress to verify the objective.
# Configure two resource projects

# Task 2. Create a metrics scope and link the two worker projects into it
# There are a number of ways you might want to configure the relationship between the host project doing the monitoring, and the project or projects being monitored.

# In general, if you're going for the multiple projects being centrally monitored approach, then it's recommended that the monitoring project contains nothing but monitoring related resources and configurations. That's exactly the approach taken here.

# In this task, you:

# Configure the central monitoring link to the Worker 1 and 2 projects.
# Configure the monitoring link to the Worker 1 and 2 projects
# Use the project dropdown to switch to the Monitoring Project.

# Use the Navigation menu to switch to the Monitoring > Overview page. Because this is the first time you visited Monitoring in this project, Google Cloud will automatically create a metrics scope. You may have to wait for the metrics scope to be created.

# Once the metrics scope is created and the Cloud Monitoring overview displays, in the left-hand menu, click Monitoring Settings.

# Settings page with the summary tab selected

# Click ADD GCP PROJECTS.

# Click Select Project and select the Worker 1 and Worker 2 projects.

# Click ADD PROJECTS.

# Switch to the Dashboards page.

# Note: If you don't see anything, refresh the page and after a minute or two, you'll see the Disks, Firewalls, Infrastructure Summary, and VM Instances from the other two projects.
# Click VM Instances. Take a few minutes and explore the dashboard.

# Click Dashboards and take a few minutes exploring the other available dashboards, especially Infrastructure Summary.

# Task 3. Create and configure Monitoring groups
# Google Cloud Monitoring lets you monitor a set of resources together as a single group. Groups can then be linked to alerting policies, dashboards, etc. Each metrics scope can support up to five-hundred groups and up to six layers of sub-groups. Groups can be created using a variety of criteria, including labels, regions, and applications.

# You add a label component=frontend to each of the web servers as a way to track your servers that are externally facing. In this case, it also allow you to easily add them to the same group.

# In this task, you:

# Assign labels to the web servers to make them easier to track.
# Create a resource group and place the servers into it.
# Create a sub-group just for frontend dev servers.
# Assign labels to your web servers to make them easier to track
# Use the Navigation menu to navigate to the Cloud overview > Dashboard page.

# Use the project dropdown to switch to the Worker 1 project.

# Use the Navigation menu to navigate to your Compute Engine > VM instances.

# Click the link to navigate to the worker-1-server settings.

# Click the Edit button.

# Click the Manage labels button.

# Click the +Add label button and create a label with the key component and the value frontend.

# Click the +Add label button and create a label with the key stage and the value dev.

# Click Save.

# Save the configuration changes.

# Use the project dropdown to switch to the Worker 2 project.

# Perform similar tasks:

# Edit the settings for the worker-2-server.
# Click the Manage labels button.
# Click the +Add label button and create a label with the key component and the value frontend.
# Click the +Add label button and create a label with the key stage and the value test. (Note the test value)
# Save the changes.
# Create a resource group and place the servers into it
# Use the project dropdown to switch to the Monitoring Project, then navigate to the Monitoring > Overview.

# In the left-hand menu, navigate to Groups.

# Create a new monitoring group using the +CREATE GROUP link.

# Name the group Frontend Servers.

# For the criteria, use:

# Setting	Value
# Type	Tag
# Tag	component
# Operator	Equals
# Value	frontend
# Make sure that Resources Selected on the right hand of the page is displaying 2 VM Instances currently selected. If not, double-check your criteria.

# Create the group.

# Refresh the page and after a minute or so, you should see several metrics and charts for your two VMs.

# Create a sub-group just for frontend dev servers
# In the Frontend Servers group, locate the Subgroups section and click CREATE SUBGROUP.

# Configure the subgroup with the following settings:

# Setting	Value
# Name	Frontend Dev
# Criteria 1	
# Type	Tag
# Tag	component
# Operator	Equals
# Value	frontend
# Click Done for the first criteria, then Add a criterion:
# Setting	Value
# Criteria 2	
# Type	Tag
# Tag	stage
# Operator	Equals
# value	dev
# Click Done for the second criteria, then select the And combine criteria operator to join them.

# Click Create.

# Navigate back to the Groups home page. Notice how the Frontend Servers group can now be expanded to show its sub-group. The UI also displays a clickable link containing a little information about the types of resources contained by the group.

# Click Check my progress to verify the objective.
# Create and configure Monitoring groups

# Task 4. Create and test an uptime check
# Google Cloud uptime checks test the liveliness of externally facing HTTP, HTTPS, or TCP applications by accessing said applications from multiple locations around the world. The subsequent report includes information on uptime, latency, and status. Uptime checks can also be used in alerting policies and dashboards.

# In this task, you:

# Create an uptime check for the Frontend Servers group.
# Investigate out how an uptime check handles failure.
# Create an uptime check for the Frontend Servers group
# If you've already created a group that contains the same resources that need to be uptime checked, then it's easy to create a single uptime check for multiple servers.

# In the Monitoring section of your Monitoring Project, click Uptime checks.

# At the top of the page, follow the link to +CREATE UPTIME CHECK.

# Configure a new uptime check with the following settings (don't press Save yet):

# Setting	Value
# Protocol	HTTP
# Resource Type	Instance
# Applies To	Group
# Group	Frontend Servers
# Path	/
# Check Frequency	1 minute
# Click Continue, to leave other options as defaults.

# Click Continue, in the Response Validation section.

# If you like, in the Alert & Notification section, click Notification Channels dropdown and use Manage Notification Channels to add your email address as a valid notification option. The Alert will be enabled by default but won't actually notify anyone otherwise.

# Click Continue.

# Set Title as Frontend Servers Uptime.

# Click Test and verify a 200 response.

# Create the uptime check.

# In the list of uptime checks, click your new Frontend Servers Uptime to view its dashboard.

# Wait a few minutes and refresh. The dashboard populates information about the check results. Explore the charts and data.

# On the right side of the page in the Configuration box, copy the Check ID value and paste it in your notes text file. It should read frontend-servers-uptime.

# Check out how an uptime check handles failure
# Our uptime check is working, but how about if there was a failure? Let's trigger a failure and investigate the resulting uptime check and alert behavior.

# Make sure you have a few minutes of data in your uptime check's dashboard before proceeding.

# Using the Navigation menu to navigate to the Cloud overview > Dashboard page.

# Use the project dropdown to switch to the Worker 1 project.

# Use the Navigation menu to navigate to your Compute Engine > VM instances.

# Select the checkbox next to worker-1-server and STOP it running.

# Refresh the VM instances page and wait until you see the server has stopped running.

# Use the project dropdown to switch to the Monitoring Project, then navigate to Monitoring > Uptime checks > Frontend Servers Uptime.

# Examine the Uptime Check Latency and the Passed Checks chart. It could take a minute for the failures to start displaying.

# What can Cloud Monitoring, Logging, and Alerting tell us?
# Navigate to Monitoring > Metrics explorer.

# Click Select a metric dropdown, select VM Instance > Uptime_check > Check passed and click Apply. On a side note, after you investigate the Check passed metric, you might try searching for "uptime_check" will display some of the other metrics you might like to investigate.

# Click ADD FILTER:

# Setting	Value
# Metric labels	checked_resource_id
# Value	Select from dropdown
# Take a moment to examine the results.

# Use the Navigation menu to navigate to Logging > Logs Explorer.

# Enable Show query, and delete anything there. Click Log name. Locate and add the uptime_checks log, then select Apply. Click Run query.

# Expand and examine one of the log entries. What useful information does it provide?

# In the same entry, examine the labels section and locate the check_id. Consult your text notes document and compare the id you recorded there. They should match.

# Use the Navigation menu to navigate to Monitoring > Alerting.

# Investigate the firing alert. If you added yourself as a notification channel, review the email.

# Note: If a Monitoring group is created based on labels, then the group will keep checking for powered off server for 5 minutes. After 5 minutes, Google Cloud determines the server should no longer be counted as a member of the group.
# This is important because if an uptime check is tied to the group, then it will only report failures while the group reports that missing server.
# When the group quits reporting the off server, the uptime check quits checking for it, and suddenly the check starts passing again. This can be a real issue if you're not careful.
# Click Check my progress to verify the objective.
# Create and test an uptime check

# Task 5. Create a custom dashboard
# There will be times when the humans running a Google Cloud system want to investigate its status. This may be related to curiosity, capacity planning, or perhaps in response to an alert.

# Regardless, when data is expressed in chart form, as opposed to a list of items or values, it tends to be easier to spot trends, anomalies, and highs or lows. In this task, we add a chart for our developers to use as a way to track some of the happenings on the frontend servers.

# In this task, you:

# Create a developer dashboard and add an uptime chart to it.
# Add and test a CPU utilization chart to the dashboard.
# Create a developer dashboard and add an uptime chart to it
# If you were interested in what was happening on your developer webserver, it would be helpful to have a dashboard of charts just for that single server. In this section, you create a dashboard with an uptime check summary chart.

# Using the Navigation menu, navigate to the Cloud overview > Dashboard page.

# Use the project dropdown to switch to the Worker 1 project.

# Use the Navigation menu to navigate to your Compute Engine > VM instances.

# Select the checkbox next to worker-1-server and START it running.

# Use the project dropdown to switch to the Monitoring Project, then navigate to Monitoring > Dashboards.

# At the top of the page, press +CREATE DASHBOARD.

# For New Dashboard Name, type Developer's Frontend.

# Click + ADD WIDGET and click Line chart.

# Setting	Value
# Widget Title	Dev Server Uptime
# Select a metric	VM Instance > Uptime_check > check_passed
# Click Apply.

# Examine the values displayed on the chart. Our worker-1-server is our core development server. Take note of the checked_resource_id value from one of its check response rows. You must pick the value from a list in the next step.

# Click ADD FILTER:

# Setting	Value
# Resource labels	instance_id
# Value	Select from dropdown
# For Aggregation select Configure Aligner, set the Alignment function to Count true.

# Click the Plus icon (Add query element) and set Min interval period 5m.

# Click Apply.

# Add and test a CPU utilization chart to the dashboard
# Another key piece of information about what's going on inside your development server is its CPU load. Overall it is nice to know what's happening with the NGINX server itself, but without the installation of the logging and monitoring agents, you can't do that yet.

# Add another chart to our dashboard. Click + ADD WIDGET and click Line chart.

# In the Select a metric, search/select VM Instance > Instance > cpu utilization.

# Click Apply.

# Click ADD FILTER:

# Setting	Value
# Metric labels	instance_name
# Value	worker-1-server
# Click Apply.

# Cloud Shell doesn't always work well as a platform for generating load test traffic, since it sometimes thinks you're doing something malicious and terminates your session. Use your second web server to generate the load instead. Expand the Navigation menu, right-click Compute Engine, and open the link in a new tab or window.

# Use the project dropdown to switch to the Worker 2 project.

# SSH into your worker-2-server.

# Update the server's package database and install the apache2-utils. Apache Bench is a quick easy tool you can use to generate HTTP load:

# sudo apt-get update
# sudo apt-get install apache2-utils
# Copied!
# Enter Y if asked "Do you want to continue? [Y/n]"

# Before you use Bench, set up a URL to your server. Find your worker-1-server external IP in your notes file and use it to construct the URL environmental variable below. Don't omit the "http://":
# URL=http://[worker-1-server ip]
# Copied!
# Throw some load at your server. The following command executes 100 requests at a time and continues to do so up to a total of 100,000 requests. Don't miss the trailing "/" after the URL:
# ab -s 120 -n 100000 -c 100 $URL/
# Copied!
# Once Bench finishes its run, wait a minute or so and then execute:
# ab -s 120 -n 500000 -c 500 $URL/
# Copied!
# While the second series of traffic is generated, switch back to your dashboard. After a little time, you see the two distinct spikes in CPU load.
# Click Check my progress to verify the objective.
# Create a custom dashboard

# Review
# Congratulations!
# You now know how to set up a central project for monitoring other projects, can create monitoring resource groups, uptime checks, and custom dashboards. You are well on your way. Nice job.

# End your lab
# When you have completed your lab, click End Lab. Google Cloud Skills Boost removes the resources you’ve used and cleans the account for you.

# You will be given an opportunity to rate the lab experience. Select the applicable number of stars, type a comment, and then click Submit.

# The number of stars indicates the following:

# 1 star = Very dissatisfied
# 2 stars = Dissatisfied
# 3 stars = Neutral
# 4 stars = Satisfied
# 5 stars = Very satisfied
# You can close the dialog box if you don't want to provide feedback.

# For feedback, suggestions, or corrections, please use the Support tab.

# Copyright 2022 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.