# Build and Deploy Machine Learning Solutions with Vertex AI: Challenge Lab
# experiment
# Lab
# schedule
# 2 hours
# universal_currency_alt
# No cost
# show_chart
# Intermediate
# GSP354
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students who have enrolled in the Building Machine Learning Solutions with Vertex AI course. Are you ready for the challenge?

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
# You were recently hired as a Machine Learning Engineer at a startup movie review website. Your manager has tasked you with building a machine learning model to classify the sentiment of user movie reviews as positive or negative. These predictions will be used as an input in downstream movie rating systems and to surface top supportive and critical reviews on the movie website application. The challenge: your business requirements are that you have just 6 weeks to productionize a model that achieves great than 75% accuracy to improve upon an existing bootstrapped solution. Furthermore, after doing some exploratory analysis in your startup's data warehouse, you found that you only have a small dataset of 50k text reviews to build a higher performing solution.

# Your challenge
# To build and deploy a high performance machine learning model with limited data quickly, you will walk through training and deploying a custom TensorFlow BERT sentiment classifier for online predictions on Google Cloud's Vertex AI platform. Vertex AI is Google Cloud's next generation machine learning development platform where you can leverage the latest ML pre-built components and AutoML to significantly enhance your development productivity, the ability to scale your workflow and decision making with your data, and accelerate time to value.

# Lab architecture diagram

# First, you will progress through a typical experimentation workflow where you will build your model from pre-trained BERT components from TF-Hub and tf.keras classification layers to train and evaluate your model in a Vertex Notebook. You will then package your model code into a Docker container to train on Google Cloud's Vertex AI. Lastly, you will define and run a Kubeflow Pipeline on Vertex Pipelines that trains and deploys your model to a Vertex Endpoint that you will query for online predictions.

# Task 1. Create a Vertex Notebooks instance
# Navigate to Vertex AI > Workbench > Instances.

# Since it is a brand new project, you should not have any instances listed. Click on the Create New button on the middle of the screen. Select the following options:

# Name: vertex-ai-challenge
# Region: filled in at lab start
# Zone: Leave the value as default
# Select Instance under Workbench Type then click Continue.

# Select Use a previous version. In the Version dropdown, select workbench-instances-v20240214 (M117). Click Continue.

# Select e2-standard-4 as the Machine Type. Click Create.

# Click Check my progress to verify the objective.

# Create the vertex AI notebook instance
# Task 2. Download the challenge notebook
# In your notebook, click the terminal.

# Clone the repo:

# git clone https://github.com/GoogleCloudPlatform/training-data-analyst
# Copied!
# Install the required packages for the lab:
# cd training-data-analyst/quests/vertex-ai/vertex-challenge-lab
# pip install -U -r requirements.txt --user
# Copied!
# Click Check my progress to verify the objective.

# Download the challenge Notebook
# Go to the enclosing folder: training-data-analyst/quests/vertex-ai/vertex-challenge-lab.

# Open the notebook file vertex-challenge-lab.ipynb. When asked which kernel to use, select the TensorFlow 2-11 kernel.

# In the Setup section, define your PROJECT_ID, REGION, and GCS_BUCKET variables.

# All the rest code to import and pre-process the dataset has been provided for you. The rest of the steps will be inside the notebook file. You should refer back to this lab guide to check your progress and get some hints.

# Note: Make sure you have installed the required packages as specified in step 3.
# Click Check my progress to verify the objective.

# Import dataset
# Task 3. Build and train your model locally in a Vertex notebook
# In this section, you will train your model locally using TensorFlow.

# Note: This lab adapts and extends the official TensorFlow BERT text classification tutorial to utilize Vertex AI services. See the tutorial for additional coverage on fine-tuning BERT models using TensorFlow.
# Build and compile a TensorFlow BERT sentiment classifier
# Fill out the #TODO section to add a hub.KerasLayer for BERT text preprocessing.

# Fill out the #TODO section to add a hub.KerasLayer for BERT text encoding.

# Fill out the #TODO section to save your BERT sentiment classifier locally. You should save it to the ./bert-sentiment-classifier-local directory.

# Click Check my progress to verify the objective.

# Build and train the model
# Task 4. Use Cloud Build to build and submit your model container to Google Cloud Artifact Registry
# Create Artifact Registry for custom container images
# Fill out the #TODO section to create a Docker Artifact Registry using the gcloud CLI. Learn more about it from the gcloud artifacts repositories create documentation.
# Note: Make sure you specify the location, repository-format, and description flags.
# Build and submit your container image to Artifact Registry using Cloud Build
# Fill out the #TODO section to use Cloud Build to build and submit your custom model container to Artifact Registry. Learn more about it from the gcloud builds submit documentation.
# Note: Make sure the config flag is pointed at {MODEL_DIR}/cloudbuild.yaml, defined above, and you include your model directory.
# Click Check my progress to verify the objective.

# Build and submit your container image to Artifact Registry
# Task 5. Define a pipeline using the KFP SDK
# Fill out the #TODO section to add and configure CustomContainerTrainingJobOp component defined in the cell above.
# Note: The arguments will be the same as the CustomContainerTrainingJob earlier.
# Note: This training can take around 30-40 minutes to train and deploy the model.
# Click Check my progress to verify the objective.

# Define a pipeline using the KFP SDK
# Task 6. Query deployed model on Vertex Endpoint for online predictions
# Fill out the #TODO section to generate online predictions using your Vertex Endpoint.
# Congratulations!
# Congratulations! In this lab, you have learned how to build and deploy a custom BERT sentiment classifier using Vertex AI. You have also learned how to use Cloud Build to build and submit your custom model container to Artifact Registry, and how to define a pipeline using the KFP SDK. You are now ready to build and deploy your own custom models using Vertex AI.

# ML Vertex AI badge

# Earn your next skill badge
# This self-paced lab is part of the Building Machine Learning Solutions with Vertex AI course. Completing this skill badge course earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# This skill badge course is part of Google’s Data Scientist/Machine Learning Engineer learning path. If you have already completed the other skill badge courses in this learning path, search the catalog for 20+ other skill badge courses in which you can enroll.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated February 16, 2024

# Lab Last Tested February 16, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

# RESOLUTION
# https://www.youtube.com/watch?v=5YOvpPtWMnI&t=19s
# Build and Deploy Machine Learning Solutions with Vertex AI: Challenge Lab || GSP354 ||
# Solution here
# Task 1: Create a Vertex Notebooks instance
# Navigate to Vertex AI > Workbench > Instances.

# Click on the Create New button.

# Fill out the form with the following options:

# Name: vertex-ai-challenge
# Region: Check Lab Instruction
# Zone: Leave the value as default
# Click on Environment.

# Select Use a previous version. In the Version dropdown, select workbench-instances-v20240214 (M117)

# Click Continue.

# Select e2-standard-4 as the Machine Type.

# Click Create.

# Task 2: Download the challenge notebook
# In your notebook, click the terminal.

# Clone the repo by running this command:

# git clone https://github.com/QUICK-GCP-LAB/training-data-analyst.git
# Install the required packages for the lab:
# cd training-data-analyst/quests/vertex-ai/vertex-challenge-lab
# pip install -U -r requirements.txt --user
# Go to the enclosing folder: training-data-analyst/quests/vertex-ai/vertex-challenge-lab.

# Open the notebook file vertex-challenge-lab.ipynb. When asked which kernel to use, select the TensorFlow 2-11 kernel.

# In the Setup section, define your PROJECT_ID, REGION, and GCS_BUCKET variables.

# For Tasks 3,4,5 & 6 Follow Video Instructions.
# Note: This training can take around 30-40 minutes to train and deploy the model.
# Congratulations 🎉 for Completing the Lab !
# You Have Successfully Demonstrated Your Skills And Determination.
# Well done!
# Don't Forget to Join the Telegram Channel & Discussion group
# QUICK GCP LAB