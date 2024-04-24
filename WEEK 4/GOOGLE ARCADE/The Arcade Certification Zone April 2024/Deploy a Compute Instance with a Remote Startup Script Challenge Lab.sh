Deploy a Compute Instance with a Remote Startup Script: Challenge Lab
experiment
Lab
schedule
1 hour
universal_currency_alt
No cost
show_chart
Intermediate
GSP301
Google Cloud self-paced labs logo

Overview
In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

To score 100% you must successfully complete all tasks within the time period!

This lab is recommended for students who have enrolled in the Cloud Architecture: Design, Implement, and Manage skill badge or preparing for the Google Cloud Certified Professional Cloud Architect certification exam. Are you up for the challenge?

Challenge scenario
You have been given the responsibility of managing the configuration of your organization's Google Cloud virtual machines. You have decided to make some changes to the framework used for managing the deployment and configuration machines - you want to make it easier to modify the startup scripts used to initialize a number of the compute instances. Instead of storing startup scripts directly in the instances' metadata, you have decided to store the scripts in a Cloud Storage bucket and then configure the virtual machines to point to the relevant script file in the bucket.

A basic bash script that installs the Apache web server software called install-web.sh has been provided for you as a sample startup script. You can download this from the Student Resources links on the left side of the page. You can also find the startup script in a public Cloud Storage bucket at gs://spls/gsp301/install-web.sh.

Your challenge
Configure a Linux Compute Engine instance that installs the Apache web server software using a remote startup script. In order to confirm that a compute instance Apache has successfully installed, the Compute Engine instance must be accessible via HTTP from the internet. You must create your instance in the following zone: ZONE.

Note: In order to ensure accurate activity tracking you should not modify or change any of the pre-created lab resources, in particular the lab-monitor Compute Engine instance.
Task 1. Create a storage bucket
Create a storage bucket
Task 2. Create a VM instance with a remote startup script
Create a VM instance with a remote startup script
Task 3. Create a firewall rule to allow traffic (80/tcp)
Create a firewall rule to allow traffic (80/tcp)
Task 4. Test that the VM is serving web content
Test that the VM is serving web content
Tips and Tricks
Configure Instance Metadata. The Running Startup Scripts documentation page explains how Compute Engine instance metadata can be used to configure startup scripts.
Check if your Compute Engine instance is executing the startup script. Use the Serial Console for the running virtual machine to look at the startup events to make sure that the startup script is being executed.
Check permissions. Your Compute Engine instance might not have the correct permissions required to read the startup script from the storage bucket. The virtual machine needs to be given permissions that align with the storage permissions.
Check firewalls. If the startup script has installed the software you may be unable to connect if a firewall has not been correctly configured.
Check the URL and address. You will be unable to connect to the Apache web server if you are trying to access the Compute Engine instance using an HTTPS address rather than HTTP; or you are using the incorrect IP address. Check that your URL is http://[EXTERNAL_IP] rather than https://[EXTERNAL_IP] or http://[INTERNAL_IP]
Congratulations!
Congratulations! In this lab, you configured a Linux Compute Engine instance that installs the Apache web server software using a remote startup script. You also configured the Compute Engine instance to be accessible via HTTP from the internet.

Google Cloud training and certification
...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

Manual Last Updated April 4, 2024

Lab Last Tested April 4, 2024

Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

