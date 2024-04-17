# Build Custom Processors with Document AI: Challenge Lab
# experiment
# Lab
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# No cost
# show_chart
# Intermediate
# GSP513
# Google Cloud self-paced labs logo

# Introduction
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students who have enrolled in the Build Custom Processors with Document AI: Challenge Lab course. Are you ready for the challenge?

# Before you click the Start Lab button
# Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click Start Lab, shows how long Google Cloud resources will be made available to you.

# This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

# To complete this lab, you need:

# Access to a standard internet browser (Chrome browser recommended).
# Note: Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.
# Time to complete the lab---remember, once you start, you cannot pause a lab.
# Note: If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.
# Challenge scenario
# You were onboarded at Cymbal Labs just a few months ago. Cymbal Labs is a leading bioscience firm dedicated to advancing innovation in biotechnology. Cymbal Labs researches, manufactures, and distributes a wide variety of healthcare solutions across a range of medical disciplines, including internal medicine, oncology, immunology, and cardiology.

# cymbal labs logo

# By harnessing Document AI Workbench, a powerful tool for creating custom document processors, Cymbal Labs accelerates its discoveries and gains valuable insights from scientific publications, patents, and research documents. By employing Document AI trained on patents, Cymbal Labs can prioritize research focus, streamline the R&D process, identify licensing and collaboration opportunities, and manage intellectual property relating to its own patents.

# Your team has been working to create a Custom Document Extractor that can extract key information from public patent documents. Your job is to give them a hand and help them get their Document AI workflows up and running. As part of this demonstration, they have a list of tasks they would like to see you do in an allotted period of time in a sandbox environment.

# Your challenge
# Your tasks include the following:

# Create a custom processor.
# Import a document into a dataset.
# Define processor schema.
# Label a document.
# Assign an annotated document to the training set.
# Import pre-labeled data to the training and test sets.
# Kick off a training job.
# Task 1. Enable the Document AI API
# Before you can begin using Document AI, you must enable the API.

# Enable the Document AI API.
# Enable the Document AI API
# Task 2. Create a processor
# You must first create an Custom Extractor processor to use for this lab.

# Create a Custom Extractor processor with the name <filled in at lab start>. Use the region closest to you.
# Create a Processor
# Note: The processor takes a few minutes to create and is ready once the dataset has been initialized.
# Task 3. Define processor fields
# In this section, you define the fields for your custom processor. The schema provides labels that you use to annotate documents.

# Create each of the following labels for the processor schema.
# Name	Data Type	Occurrence
# applicant_line_1	Plain Text	Required once
# application_number	Number	Required once
# class_international	Plain Text	Required once
# class_us	Plain Text	Required once
# filing_date	Datetime	Required once
# inventor_line_1	Plain text	Required once
# issuer	Plain text	Required once
# patent_number	Number	Required once
# publication_date	Datetime	Required once
# title_line_1	Plain text	Required once
# Create Labels
# Task 4. Import a document into a dataset
# Next, you import a test document into your dataset.

# Import the following document into your dataset:
# gs://cloud-samples-data/documentai/codelabs/challenge/unlabeled/us_001.pdf
# Copied!
# Import a Test Document
# Task 5. Label a document
# The process of selecting text in a document, and applying labels is known as annotation. In this section, you will annotate a document with the labels you defined in the previous section.

# The generative AI model should have populated most of the labels for you. You can use and edit the suggested labels as needed.
# Add the following labels to the us_001 document:
# applicant_line_1 = Colby Green
# application_number = 679,694
# class_international = H04W 64/00
# class_us = H04W 64/003
# filing_date = Aug. 17, 2017
# inventor_line_1 = Colby Green
# issuer = US
# patent_number = 10,136,408
# publication_date = Nov. 20, 2018
# title_line_1 = DETERMINING HIGH VALUE
# The labeled patent document should look like this when complete:

# document labeled

# Label a Document
# Task 6. Assign an annotated document to the training set
# Now that you have labeled this example document, you can assign it to the training set.

# Assign the us_001 document to the training set.
# Assign Document to Training Set
# Task 7. Import pre-labeled data to the training and test sets
# Import the following pre-labeled documents into your dataset. For Data split, use Auto-split. Leave Import with auto-labeling unchecked.
# gs://cloud-samples-data/documentai/codelabs/challenge/labeled
# Copied!
# Import pre-labeled data
# Task 8. Train the processor
# Now that you have imported the training and test data, you can kick off a training job for the processor.

# Train a new version of the processor. Use the following name for the processor version: <filled in at lab start>.
# Train the Processor
# Congratulations!
# Congratulations! In this lab you verified your skills on Document AI Workbench by creating a custom processor and dataset, importing documents, labeling documents, and training a processor. You can now use Document AI Workbench to create custom processors for your own use cases.

# skill badge

# Earn your next skill badge
# This self-paced lab is part of the Build Custom Processors with Document AI course. Completing this skill badge quest earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated November 09, 2023

# Lab Last Tested November 09, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.