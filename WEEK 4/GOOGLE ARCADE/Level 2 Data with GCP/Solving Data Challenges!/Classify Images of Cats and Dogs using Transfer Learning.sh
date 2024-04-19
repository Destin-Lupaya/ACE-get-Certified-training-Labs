# Classify Images of Cats and Dogs using Transfer Learning
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# No cost
# show_chart
# Introductory
# GSP900
# Google Cloud self-paced labs logo

# Overview
# TensorFlow is an end-to-end open source platform for machine learning. It has a comprehensive, flexible ecosystem of tools, libraries and community resources that lets researchers push the state-of-the-art in ML and developers easily build and deploy ML powered applications.

# This lab uses transfer learning to train your machine. In transfer learning, when you build a new model to classify your original dataset, you reuse the feature extraction part and re-train the classification part with your dataset. This method uses less computational resources and training time. Deep learning from scratch can take days, but transfer learning can be done in short order.

# What you'll do
# Examine and understand your image data
# Build an input pipeline using Keras ImageDataGenerator
# Use a pre-trained model for feature extraction
# Fine-tune a pre-trained model
# Setup
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
# Task 1. Launch AI platform notebooks
# An managed notebook instance using the latest TensorFlow Enterprise image was pre-provisioned using Vertex AI Workbench for this lab.

# To access your notebook instance, follow these steps:

# Click on the Navigation Menu. Navigate to Vertex AI > Workbench.

# Click on User-Managed Notebook.

# In the following page, you should see the qwiklabs-tensorflow-notebook instance with a green check mark by it.

# Note: If you do not see any instances appear, wait a minute and refresh the page.
# Click Open JupyterLab. A JupyterLab window will open in a new tab.
# Launcher window displaying action tiles under the Notebook, Console and Other sections

# Task 2. Download lab notebook
# To download the transfer_learning notebook in your JupyterLab instance:

# In JupyterLab, click the Terminal icon to open a new terminal.
# The Launcher window with the Terminal tile highlighted in the Other section

# At the command-line prompt, type in the following command and press Enter:
# curl https://storage.googleapis.com/tensorflow_docs/docs/site/en/tutorials/images/transfer_learning.ipynb --output transfer_learning.ipynb
# Copied!
# Run this command to clear all outputs in the transfer_learning notebook's cells:
# jupyter nbconvert --clear-output --inplace transfer_learning.ipynb
# Copied!
# Click Check my progress to verify the objective.
# Download lab notebook

# Task 3. Open and execute the notebook
# From within the Jupyter console, select transfer_learning.ipynb to begin the lab. Now you're ready to start!
# From here, read the instructions in the notebook to complete the lab.

# Execute the cells one by one and observe the results. A convenient way to progress through the cells is by clicking in a cell, then click Shift + Enter, waiting for each cell to complete before progressing.

# Read the instructions and the comments in the code blocks carefully. You will be asked to edit some of the code blocks before running them. For example, you will be setting environment variables in the notebook, so add your bucket name and project ID before running the cell.

# Congratulations!
# You've compiled a model which accurately classifies images of dogs and cats within a reasonable amount of time!

# Finish your quest
# This self-paced lab is part of the Google Cloud Solutions ll: Data and Machine Learning and Intermediate ML: TensorFlow on Google Cloud quests. A quest is a series of related labs that form a learning path. Completing a quest earns you the badge above, to recognize your achievement. You can make your badge or badges public and link to them in your online resume or social media account. Enroll in any quest that contains this lab and get immediate completion credit. See the Google Cloud Skills Boost catalog to see all available quests.

# Take your next lab
# Continue your quest with Creating an Object Detection Application Using TensorFlow, or try one of these suggestions:

# Creating Custom Interactive Dashboards with Bokeh and BigQuery
# Running Distributed TensorFlow on Compute Engine
# Next steps / learn more
# For more information about using TensorFlow, go to the TensorFlow website or the TensorFlow Github project. There are lots of other resources available for TensorFlow, including a discussion group and whitepaper.
# Go have some fun in the TensorFlow Playground!
# Sign up for a full Coursera Course on Machine Learning
# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual last updated March 20, 2024

# Lab last tested March 20, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.