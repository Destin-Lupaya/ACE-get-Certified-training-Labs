# Explore and Evaluate Models using Model Garden
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# No cost
# show_chart
# Intermediate
# GSP1166
# Google Cloud self-paced labs logo

# Overview
# Model Garden on Vertex AI provides a single place to search, discover, and interact with a wide variety of models from Google and Google partners. Model Garden is available on Vertex AI and can be accessed from the Google Cloud console.

# This lab provides a use case for you to explore Model Garden and then use Vertex AI Studio to create and experiment with prompts.

# Objectives
# In this lab, you explore the following:

# Model Garden on Vertex AI to find the appropriate model for your use case.
# Types of Vertex AI Model in the Model Garden.
# Use case
# You work for a real estate firm as a marketing analyst. Your company is interested in using large language models (LLMs) to return brief text descriptions of homes they are interested in and mortgage information.

# You have been tasked with creating prompts that will summarize text from very long home descriptions on your real estate site. The home descriptions are stored in a file in a Google Cloud Storage bucket.

# Begin by using Model Garden to explore available pre-built models to save time, and implement a solution as quickly as possible.

# Vertex AI
# Vertex AI is Google Cloud's unified artificial intelligence platform for managing machine learning and generative AI projects.

# Model Garden
# Model Garden on Vertex AI is a collection of pre-trained machine learning models and tools that are designed to simplify the process of building and deploying machine learning models.

# These models could be in a wide variety of model types and sizes. Model Garden offers first-party models such as multimodal models from Google across vision, dialog, code generation, and code completion; or a wide variety of enterprise-ready open source models.

# Model Garden also provides a variety of tools to help you use these models, including:

# Model cards: Model cards provide detailed information about each model, including its accuracy, performance, and training data.
# Prompt design: Prompt design allows you to interact with a model via a simple UI and tune the model with your own data.
# One of the models available through Model Garden is the Cloud Natural Language API. The Cloud Natural Language API lets you extract entities from text, perform sentiment and syntactic analysis, and classify text into categories.

# Vertex AI Studio
# Vertex AI Studio is a Google Cloud console tool for rapidly prototyping and testing generative AI models. You can test sample prompts, design your own prompts, and customize foundation models to handle tasks that meet your application's needs. You can perform the following:

# Test models using prompt samples.
# Design and save your own prompts.
# Tune a foundation model.
# Convert between speech and text.
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
# Enable APIs
# In the Google Cloud console, from the Navigation menu (Navigation menu), click More products, and then select Vertex AI from the Artificial Intelligence section.

# From the Vertex AI dashboard, click Enable all Recommended APIs.

# Task 1: Explore Model Garden
# To view the list of available Vertex AI and open source foundation, tunable, and task-specific models, go to Model Garden.

# In the Vertex AI Dashboard, in the Tools pane on the left, click Model Garden.
# The model categories available in Model Garden are:

# Category	Description
# Foundation models	Pre-trained multitask large models that can be tuned or customized for specific tasks using AI Studio, Vertex AI API, and the Vertex AI SDK for Python.
# Fine-tunable models	Models that you can fine-tune using a custom notebook or pipeline.
# Task-specific solutions	Most of these pre-built models are ready to use. Many can be customized using your own data.
# Model cards are listed on the Vertex AI Model Garden page. Explore a Model card from each category. For example, explore the Task Sentiment analysis model, which inspects the provided text and identifies the prevailing emotional opinion within the text. This would be helpful to analyze the sentiment of Google reviews your real estate firm receives to keep track of your customer's happiness.

# Models in the AI Studio
# From the Vertex AI Dashboard, in the Tools pane on the left, click Model Garden to return to the Model Garden main page.
# In the Foundation Models section click Show All and then click the View Details link on the PaLM 2 Text Bison model card.
# The details page provides an overview of the PaLM 2 for Text model, including a description of what it is, an introduction to potential use cases, and documentation for the model.

# Notice the Open Prompt Design button, which opens the AI Studio Language interface where you can interact with and experiment with the model. AI Studio is a feature of Vertex AI. It makes writing and tuning prompts for text, chats, and code generation simple and intuitive.

# Click Open Prompt Design to open PaLM2 for Text in the AI Studio Language interface.
# You can now explore this model to see how it responds to prompts.

# Test completed task
# Click Check my progress to verify your performed task.

# Explore model garden.
# Task 2: Explore Model types
# Model Garden is a single place to discover and interact with foundation models and popular open source models. With all of different enterprise-ready models you could use, Model Garden allows you to choose the right model for your use case, ML expertise, and budget.

# With Model Garden, you can use a variety of workflows, including:

# Using a model directly as an API.
# Tuning the model in the AI Studio.
# Using the model directly in a Jupyter notebook through Vertex AI Workbench.
# Helping you deploy model training pipelines.
# In this lab, you will explore some of these workflows.

# Models in a Jupyter notebook
# In the Tools pane on the left, click Model Garden to return to the Vertex AI Model Garden page.
# At the bottom of the Foundation Models section click Show All to expand the full list of foundation models.
# You can see quite a few model group types in the left pane, which allows you to filter for models that meet your specific needs. Display only those models related to vision and detection:

# Under Modalities click Vision.
# Under Tasks click Detection.
# Notice that there are now only a few models listed in the Foundation models section. The Owl ViT model is a zero-shot, text-conditioned, object detection model that can query an image with one or multiple text queries.

# Click the View Details link on the Owl ViT model card.
# Notice that the Vertex AI OWL-ViT page has an Open Notebook link to open a JupyterLab Notebook.

# Click Open Notebook to open the Owl ViT Colab in a new tab.
# Review the Colab notebook but you do not need to run it.

# This Colab notebook demonstrates how to deploy the pre-trained OWL-ViT model on Vertex AI for online prediction.

# To learn more about Colab notebooks, visit the homepage for Google Colaboratory.

# Close the Colab notebook tab to return to the Cloud Console tab.
# For the models you want to fine-tune, Model Garden on Vertex AI provides you an easy way to get started.

# Models as part of model model training pipelines:
# In the Tools pane on the left, click Model Garden to return to the Vertex AI Model Garden page.

# Clear the filter selections under Modalities and Tasks if it is not cleared already.

# Type "bert" in the Search Models search bar and select BERT model from the search list.

# Note: Depending on your browser width, you may have to click Show all or expand your window to view the BERT model card.
# Click the View Details link for the BERT model if required.

# Click Fine-Tune to open the bert-fine-tuning Vertex AI pipeline.

# Review the pipeline but you do not need to run it.

# Click Check my progress to verify your performed task.

# Explore model types.
# This brings you to a template that you can use to fine tune and deploy this model. You can see the various components of this pipeline that this template would execute.

# In your own production environment, you would click Create Pipeline, fill in or confirm the required information, and then click Submit. This deploys a pipeline without you ever having to write code.

# Congratulations!
# You have used Model Garden and AI Studio to create and experiment with prompts for various generative AI use cases. You also explored the AI Studio UI.

# Next steps / Learn more
# Get started with Vertex AI video
# Understand the terminology, refer to Machine Learning Glossary
# Read through the Vertex AI Studio official documentation.
# Learn more about Model Garden on Vertex AI:
# Model Garden on Vertex AI website
# Model Garden documentation
# AI & Machine Learning blog (scroll down for the Model Garden blog post)
# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated March 05, 2024

resolution
============================================================================================================================

curl -LO raw.githubusercontent.com/quiccklabs/Labs_solutions/master/Explore%20and%20Evaluate%20Models%20using%20Model%20Garden/quicklabgsp1166.sh


sudo chmod +x quicklabgsp1166.sh

./quicklabgsp1166.sh



============================================================================================================================
