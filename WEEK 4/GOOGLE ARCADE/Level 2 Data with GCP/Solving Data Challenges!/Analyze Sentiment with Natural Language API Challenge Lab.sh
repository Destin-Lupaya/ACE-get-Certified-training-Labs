# Analyze Sentiment with Natural Language API: Challenge Lab
# experiment
# Lab
# schedule
# 45 minutes
# universal_currency_alt
# No cost
# show_chart
# Introductory
# Lab instructions and tasks
# ARC130
# Overview
# Setup and requirements
# Challenge scenario
# Task 1. Create an API key
# Task 2. Set up Google Docs and call the Natural Language API
# Task 3. Analyze syntax and parts of speech with the Natural Language API
# Task 4. Perform multilingual natural language processing
# Congratulations!
# ARC130
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# Setup and requirements
# Before you click the Start Lab button
# Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click Start Lab, shows how long Google Cloud resources will be made available to you.

# This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

# To complete this lab, you need:

# Access to a standard internet browser (Chrome browser recommended).
# Note: Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.
# Time to complete the lab---remember, once you start, you cannot pause a lab.
# Note: If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.
# Challenge scenario
# You recently joined an organization and are working as a junior cloud engineer as part of a team. You have been assigned machine learning (ML) projects and one of your client requirements is to use the Cloud Natural Language API service in Google Cloud to perform tasks for the completion of a project.

# You are expected to have the skills and knowledge for the tasks that follow.

# Your challenge
# For this challenge, you are asked to set up Google Docs and perform sentiment analysis on some reviews provided by customers, analyze syntax and parts of speech using the Natural language API, and create a Natural Language API request for a language other than English.

# You need to:

# Create an API key.
# Set up Google Docs and call the Natural Language API.
# Analyze syntax and parts of speech with the Natural Language API.
# Perform multilingual natural language processing.
# For this challenge lab, a virtual machine (VM) instance named Instance name has been configured for you to complete tasks 3 and 4.

# Some standards you should follow:

# Ensure that any needed APIs (such as the Cloud Natural Language API) are successfully enabled.
# Each task is described in detail below, good luck!

# Task 1. Create an API key
# For this task, you need to create an API key to use in this and other tasks when sending a request to the Natural Language API.

# Save the API key to use in other tasks.

# Click Check my progress to verify the objective.
# Create an API key

# Task 2. Set up Google Docs and call the Natural Language API
# For this task, you need to set up Google Docs to use the Natural Language API and recognize the sentiment of selected text in a Google Docs document and highlight parts of it based on sentiment.

# Text is highlighted in red for negative sentiment, green for positive sentiment, and yellow for neutral sentiment.

# Create a new Google Docs document.

# Use the following code in Apps Script. Modify the code to add your API key and enter the URL of the Natural Language API to analyze entity sentiment.

#   /**
#   * @OnlyCurrentDoc
#   *
#   * The above comment directs Apps Script to limit the scope of file
#   * access for this add-on. It specifies that this add-on will only
#   * attempt to read or modify the files in which the add-on is used,
#   * and not all of the user's files. The authorization request message
#   * presented to users will reflect this limited scope.
#   */

#   /**
#   * Creates a menu entry in the Google Docs UI when the document is
#   * opened.
#   *
#   */
#   function onOpen() {
#     var ui = DocumentApp.getUi();
#     ui.createMenu('Natural Language Tools')
#       .addItem('Mark Sentiment', 'markSentiment')
#       .addToUi();
#   }
#   /**
#   * Gets the user-selected text and highlights it based on sentiment
#   * with green for positive sentiment, red for negative, and yellow
#   * for neutral.
#   *
#   */
#   function markSentiment() {
#     var POSITIVE_COLOR = '#00ff00';  //  Colors for sentiments
#     var NEGATIVE_COLOR = '#ff0000';
#     var NEUTRAL_COLOR = '#ffff00';
#     var NEGATIVE_CUTOFF = -0.2;   //  Thresholds for sentiments
#     var POSITIVE_CUTOFF = 0.2;

#     var selection = DocumentApp.getActiveDocument().getSelection();
#     if (selection) {
#       var string = getSelectedText();

#       var sentiment = retrieveSentiment(string);

#       //  Select the appropriate color
#       var color = NEUTRAL_COLOR;
#       if (sentiment <= NEGATIVE_CUTOFF) {
#         color = NEGATIVE_COLOR;
#       }
#       if (sentiment >= POSITIVE_CUTOFF) {
#         color = POSITIVE_COLOR;
#       }

#       //  Highlight the text
#       var elements = selection.getSelectedElements();
#       for (var i = 0; i < elements.length; i++) {
#         if (elements[i].isPartial()) {
#           var element = elements[i].getElement().editAsText();
#           var startIndex = elements[i].getStartOffset();
#           var endIndex = elements[i].getEndOffsetInclusive();
#           element.setBackgroundColor(startIndex, endIndex, color);

#         } else {
#           var element = elements[i].getElement().editAsText();
#           foundText = elements[i].getElement().editAsText();
#           foundText.setBackgroundColor(color);
#         }
#       }
#     }
#   }
#   /**
#   * Returns a string with the contents of the selected text.
#   * If no text is selected, returns an empty string.
#   */
#   function getSelectedText() {
#     var selection = DocumentApp.getActiveDocument().getSelection();
#     var string = "";
#     if (selection) {
#       var elements = selection.getSelectedElements();

#       for (var i = 0; i < elements.length; i++) {
#         if (elements[i].isPartial()) {
#           var element = elements[i].getElement().asText();
#           var startIndex = elements[i].getStartOffset();
#           var endIndex = elements[i].getEndOffsetInclusive() + 1;
#           var text = element.getText().substring(startIndex, endIndex);
#           string = string + text;

#         } else {
#           var element = elements[i].getElement();
#           // Only translate elements that can be edited as text; skip
#           // images and other non-text elements.
#           if (element.editAsText) {
#             string = string + element.asText().getText();
#           }
#         }
#       }
#     }
#     return string;
#   }

#   /** Given a string, will call the Natural Language API and retrieve
#     * the sentiment of the string.  The sentiment will be a real
#     * number in the range -1 to 1, where -1 is highly negative
#     * sentiment and 1 is highly positive.
#   */
#   function retrieveSentiment (line) {
#   var apiKey = "your key here";
#   var apiEndpoint =
# 'Enter the URL of Natural Language API to Analyze Entity Sentiment'
# + apiKey;
#   //  Create a structure with the text, its language, its type,
#   //  and its encoding
#   var docDetails = {
#     language: 'en-us',
#     type: 'PLAIN_TEXT',
#     content: line
#   };
#   var nlData = {
#     document: docDetails,
#     encodingType: 'UTF8'
#   };
#   //  Package all of the options and the data together for the call
#   var nlOptions = {
#     method : 'post',
#     contentType: 'application/json',
#     payload : JSON.stringify(nlData)
#   };
#   //  And make the call
#   var response = UrlFetchApp.fetch(apiEndpoint, nlOptions);
#   var data = JSON.parse(response);
#   var sentiment = 0.0;
#   //  Ensure all pieces were in the returned value
#   if (data && data.documentSentiment
#           && data.documentSentiment.score){
#      sentiment = data.documentSentiment.score;
#   }
#   return sentiment;
# }
# Copied!
# Add text to your document. You can use the sample that comes from Charles Dickens' novel, A Tale of Two Cities.
# Click Check my progress to verify the objective.
# Set up Google Docs and call the Natural Language API

# Task 3. Analyze syntax and parts of speech with the Natural Language API
# To complete this task, connect via SSH to the VM instance named Instance name that has been provisioned for you.

# Create a JSON file called analyze-request.json using the code that follows.
# {
#   "document":{
#     "type":"PLAIN_TEXT",
#     "content": "Google, headquartered in Mountain View, unveiled the new Android phone at the Consumer Electronic Show.  Sundar Pichai said in his keynote that users love their new Android phones."
#   },
#   "encodingType": "UTF8"
# }
# Copied!
# Pass your request (along with the API key environment variable you saved earlier in task 1) to the Natural Language API using the curl command or analyze syntax using gcloud ML commands.

# Save the response in a file called analyze-response.txt.

# Click Check my progress to verify the objective.
# Analyze syntax and parts of speech with the Natural Language API

# Task 4. Perform multilingual natural language processing
# To complete this task, connect via SSH to the VM instance named Instance name that has been provisioned for you.

# Create a JSON file called multi-nl-request.json using the code that follows, which contains a sentence in the French language.
# {
#   "document":{
#     "type":"PLAIN_TEXT",
#     "content":"Le bureau japonais de Google est situé à Roppongi Hills, Tokyo."
#   }
# }
# Copied!
# Pass your request (along with the API key environment variable you saved earlier in task 1) to the Natural Language API using the curl command or analyze syntax using gcloud ML commands.

# Save the output in a file called multi-response.txt.

# Click Check my progress to verify the objective.
# Perform multilingual natural language processing

# Congratulations!

# RESOLUTION

# https://www.youtube.com/watch?v=KqEXYzmCo8U

export ZONE=
export API_KEY=

gcloud compute ssh lab-vm --zone=$ZONE --quiet --command "curl -LO https://raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Analyze%20Sentiment%20with%20Natural%20Language%20API%20Challenge%20Lab/arc130.sh && sudo chmod +x arc130.sh && ./arc130.sh"
