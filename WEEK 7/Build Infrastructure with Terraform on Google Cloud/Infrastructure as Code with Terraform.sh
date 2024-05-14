# Infrastructure as Code with Terraform
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# 5 Credits
# show_chart
# Intermediate
# This lab was developed with our partner, Hashicorp. Your personal information may be shared with Hashicorp, the lab sponsor, if you have opted-in to receive product updates, announcements, and offers in your Account Profile.

# GSP750
# Google Cloud self-paced labs logo

# Overview
# Terraform is the infrastructure as code offering from HashiCorp. It is a tool for building, changing, and managing infrastructure in a safe, repeatable way. Operators and Infrastructure teams can use Terraform to manage environments with a configuration language called the HashiCorp Configuration Language (HCL) for human-readable, automated deployments.

# Infrastructure as code is the process of managing infrastructure in a file or files rather than manually configuring resources in a user interface. A resource in this instance is any piece of infrastructure in a given environment, such as a virtual machine, security group, network interface, etc. At a high level, Terraform allows operators to use HCL to author files containing definitions of their desired resources on almost any provider (AWS, Google Cloud, GitHub, Docker, etc.) and automates the creation of those resources at the time of apply.

# A simple workflow for deployment will follow closely to the steps below:

# Scope - Confirm what resources need to be created for a given project.
# Author - Create the configuration file in HCL based on the scoped parameters.
# Initialize - Run terraform init in the project directory with the configuration files. This will download the correct provider plug-ins for the project.
# Plan & Apply - Run terraform plan to verify creation process and then terraform apply to create real resources as well as the state file that compares future changes in your configuration files to what actually exists in your deployment environment.
# Objectives
# In this lab, you will learn how to perform the following tasks:

# Build, change, and destroy infrastructure with Terraform
# Create Resource Dependencies with Terraform
# Provision infrastructure with Terraform
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

# student-04-0df5bb273541@qwiklabs.net
# Copied!
# You can also find the Username in the Lab Details panel.

# Click Next.

# Copy the Password below and paste it into the Welcome dialog.

# IfMdk6nkauCz
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
# When you are connected, you are already authenticated, and the project is set to your Project_ID, qwiklabs-gcp-00-9c769c40da22. The output contains a line that declares the Project_ID for this session:

# Your Cloud Platform project in this session is set to qwiklabs-gcp-00-9c769c40da22
# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# (Optional) You can list the active account name with this command:
# gcloud auth list
# Copied!
# Click Authorize.
# Output:

# ACTIVE: *
# ACCOUNT: student-04-0df5bb273541@qwiklabs.net

# To set the active account, run:
#     $ gcloud config set account `ACCOUNT`
# (Optional) You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = qwiklabs-gcp-00-9c769c40da22
# Note: For full documentation of gcloud, in Google Cloud, refer to the gcloud CLI overview guide.
# Task 1. Build infrastructure
# Terraform comes pre-installed in Cloud Shell. With Terraform already installed, you can dive right in and create some infrastructure.

# Start by creating your example configuration to a file named main.tf. Terraform recognizes files ending in .tf or .tf.json as configuration files and will load them when it runs.

# Create the main.tf file:
# touch main.tf
# Copied!
# Click the Open Editor button on the toolbar of Cloud Shell. (You can switch between Cloud Shell and the code editor by using the Open Editor and Open Terminal icons as required, or click the Open in new window button to leave the Editor open in a separate tab).

# In the Editor, add the following content to the main.tf file.

# terraform {
#   required_providers {
#     google = {
#       source = "hashicorp/google"
#       version = "3.5.0"
#     }
#   }
# }

# provider "google" {

#   project = "qwiklabs-gcp-00-9c769c40da22"
#   region  = "europe-west1"
#   zone    = "europe-west1-c"
# }

# resource "google_compute_network" "vpc_network" {
#   name = "terraform-network"
# }
# Copied!
# Note: To use this snippet with Terraform 0.12, remove the terraform {} block.
# Terraform block
# The terraform {} block is required so Terraform knows which provider to download from the Terraform Registry. In the configuration above, the google provider's source is defined as hashicorp/google which is shorthand for registry.terraform.io/hashicorp/google.

# You can also assign a version to each provider defined in the required_providers block. The version argument is optional, but recommended. It is used to constrain the provider to a specific version or a range of versions in order to prevent downloading a new provider that may possibly contain breaking changes. If the version isn't specified, Terraform will automatically download the most recent provider during initialization.

# To learn more, on the HashiCorp Terraform website, see Provider Requirements.

# Providers
# The provider block is used to configure the named provider, in this case google. A provider is responsible for creating and managing resources. Multiple provider blocks can exist if a Terraform configuration manages resources from different providers.

# Initialization
# The first command to run for a new configuration -- or after checking out an existing configuration from version control -- is terraform init, which initializes various local settings and data that will be used by subsequent commands.

# Initialize your new Terraform configuration by running the terraform init command in the same directory as your main.tf file:
# terraform init
# Copied!
# Creating resources
# Apply you configuration now by running the command terraform apply:
# terraform apply
# Copied!
# The output has a + next to resource "google_compute_network" "vpc_network", meaning that Terraform will create this resource. Beneath that, it shows the attributes that will be set. When the value displayed is (known after apply), it means that the value won't be known until the resource is created.

# If the plan was created successfully, Terraform will now pause and wait for approval before proceeding. If anything in the plan seems incorrect or dangerous, it is safe to abort here with no changes made to your infrastructure.

# If terraform apply failed with an error, read the error message and fix the error that occurred.

# The plan looks acceptable here, so type yes at the confirmation prompt to proceed.
# Executing the plan will take a few minutes since Terraform waits for the network to be created successfully:

# # ...
#   Enter a value: yes

# google_compute_network.vpc_network: Creating...
# google_compute_network.vpc_network: Still creating... [10s elapsed]
# google_compute_network.vpc_network: Still creating... [20s elapsed]
# google_compute_network.vpc_network: Still creating... [30s elapsed]
# google_compute_network.vpc_network: Still creating... [40s elapsed]
# google_compute_network.vpc_network: Still creating... [50s elapsed]
# google_compute_network.vpc_network: Creation complete after 58s [id=terraform-network]

# Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
# After this, Terraform is all done! You can go to the Cloud Console to see the network you have provisioned.

# In the Console, from the Navigation menu, navigate to VPC network. You will see the terraform-network has been provisioned.
# VPC networks page

# In Cloud Shell run the terraform show command to inspect the current state:
# terraform show
# Copied!
# These values can be referenced to configure other resources or outputs, which will be covered later in this lab.

# Click Check my progress to verify the objective.
# Creating Resources in terraform

# Task 2. Change infrastructure
# In the previous section, you created basic infrastructure with Terraform: a VPC network. In this section, you're going to modify your configuration, and see how Terraform handles change.

# Infrastructure is continuously evolving, and Terraform was built to help manage and enact that change. As you change Terraform configurations, Terraform builds an execution plan that only modifies what is necessary to reach your desired state.

# By using Terraform to change infrastructure, you can version control not only your configurations but also your state so you can see how the infrastructure evolves over time.

# Adding resources
# You can add new resources by adding them to your Terraform configuration and running terraform apply to provision them.

# In the Editor, add a compute instance resource to main.tf:
# resource "google_compute_instance" "vm_instance" {
#   name         = "terraform-instance"
#   machine_type = "e2-micro"

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }

#   network_interface {
#     network = google_compute_network.vpc_network.name
#     access_config {
#     }
#   }
# }
# Copied!
# This resource includes a few more arguments. The name and machine type are simple strings, but boot_disk and network_interface are more complex blocks. You can see all of the available options in the google_compute_instance documentation.

# For this example, your compute instance will use a Debian operating system, and will be connected to the VPC Network you created earlier. Notice how this configuration refers to the network's name property with google_compute_network.vpc_network.name -- google_compute_network.vpc_network is the ID, matching the values in the block that defines the network, and name is a property of that resource.

# The presence of the access_config block, even without any arguments, ensures that the instance will be accessible over the internet.

# Now run terraform apply to create the compute instance:
# terraform apply
# Copied!
# Once again, answer yes to the confirmation prompt.
# This is a fairly straightforward change - you added a "google_compute_instance" resource named "vm_instance" to your configuration, and Terraform created the resource in Google Cloud.

# Changing resources
# In addition to creating resources, Terraform can also make changes to those resources.

# Add a tags argument to your "vm_instance" so that it looks like this:
# resource "google_compute_instance" "vm_instance" {
#   name         = "terraform-instance"
#   machine_type = "e2-micro"
#   tags         = ["web", "dev"]
#   # ...
# }
# Copied!
# Run terraform apply again to update the instance:
# terraform apply
# Copied!
# The prefix ~ means that Terraform will update the resource in-place. You can go and apply this change now by responding yes, and Terraform will add the tags to your instance.
# Click Check my progress to verify the objective.
# Change Infrastructure

# Destructive changes
# A destructive change is a change that requires the provider to replace the existing resource rather than updating it. This usually happens because the cloud provider doesn't support updating the resource in the way described by your configuration.

# Changing the disk image of your instance is one example of a destructive change.

# Edit the boot_disk block inside the vm_instance resource in your configuration file and change it to the following:
#   boot_disk {
#     initialize_params {
#       image = "cos-cloud/cos-stable"
#     }
#   }
# Copied!
# Now run terraform apply again to see how Terraform will apply this change to the existing resources:
# terraform apply
# Copied!
# The prefix -/+ means that Terraform will destroy and recreate the resource, rather than updating it in-place. While some attributes can be updated in-place (which are shown with the ~ prefix), changing the boot disk image for an instance requires recreating it. Terraform and the Google Cloud provider handle these details for you, and the execution plan makes it clear what Terraform will do.

# Additionally, the execution plan shows that the disk image change is what required your instance to be replaced. Using this information, you can adjust your changes to possibly avoid destroy/create updates if they are not acceptable in some situations.

# Once again, Terraform prompts for approval of the execution plan before proceeding. Answer yes to execute the planned steps.
# As indicated by the execution plan, Terraform first destroyed the existing instance and then created a new one in its place. You can use terraform show again to see the new values associated with this instance.

# Destroy infrastructure
# You have now seen how to build and change infrastructure. Before moving on to creating multiple resources and showing resource dependencies, you will see how to completely destroy your Terraform-managed infrastructure.

# Destroying your infrastructure is a rare event in production environments. But if you're using Terraform to spin up multiple environments such as development, testing, and staging, then destroying is often a useful action.

# Resources can be destroyed using the terraform destroy command, which is similar to terraform apply but it behaves as if all of the resources have been removed from the configuration.

# Try the terraform destroy command. Answer yes to execute this plan and destroy the infrastructure:
# terraform destroy
# Copied!
# The - prefix indicates that the instance and the network will be destroyed. As with apply, Terraform shows its execution plan and waits for approval before making any changes.

# Just like with terraform apply, Terraform determines the order in which things must be destroyed. Google Cloud won't allow a VPC network to be deleted if there are resources still in it, so Terraform waits until the instance is destroyed before destroying the network. When performing operations, Terraform creates a dependency graph to determine the correct order of operations. In more complicated cases with multiple resources, Terraform will perform operations in parallel when it's safe to do so.

# Click Check my progress to verify the objective.
# Destructive Changes

# Task 3. Create resource dependencies
# In this section, you will learn more about resource dependencies and how to use resource parameters to share information about one resource with other resources.

# Real-world infrastructure has a diverse set of resources and resource types. Terraform configurations can contain multiple resources, multiple resource types, and these types can even span multiple providers.

# In this section, you will be shown a basic example of how to configure multiple resources and how to use resource attributes to configure other resources.

# Recreate your network and instance. After you respond to the prompt with yes, the resources will be created:
# terraform apply
# Copied!
# Assigning a static IP address
# Now add to your configuration by assigning a static IP to the VM instance in main.tf:
# resource "google_compute_address" "vm_static_ip" {
#   name = "terraform-static-ip"
# }
# Copied!
# This should look familiar from the earlier example of adding a VM instance resource, except this time you're creating a "google_compute_address" resource type. This resource type allocates a reserved IP address to your project.

# Next, run terraform plan:
# terraform plan
# Copied!
# You can see what will be created with terraform plan:

# $ terraform plan
# Refreshing Terraform state in-memory prior to plan...
# The refreshed state will be used to calculate this plan, but will not be
# persisted to local or remote state storage.

# google_compute_network.vpc_network: Refreshing state... [id=terraform-network]
# google_compute_instance.vm_instance: Refreshing state... [id=terraform-instance]

# ------------------------------------------------------------------------

# An execution plan has been generated and is shown below.
# Resource actions are indicated with the following symbols:
#   + create

# Terraform will perform the following actions:

#   # google_compute_address.vm_static_ip will be created
#   + resource "google_compute_address" "vm_static_ip" {
#       + address            = (known after apply)
#       + address_type       = "EXTERNAL"
#       + creation_timestamp = (known after apply)
#       + id                 = (known after apply)
#       + name               = "terraform-static-ip"
#       + network_tier       = (known after apply)
#       + project            = (known after apply)
#       + region             = (known after apply)
#       + self_link          = (known after apply)
#       + subnetwork         = (known after apply)
#       + users              = (known after apply)
#     }

# Plan: 1 to add, 0 to change, 0 to destroy.

# ------------------------------------------------------------------------

# Note: You didn't specify an "-out" parameter to save this plan, so Terraform can't guarantee that exactly these actions will be performed if
# "terraform apply" is subsequently run.
# Unlike terraform apply, the plan command will only show what would be changed, and never actually apply the changes directly. Notice that the only change you have made so far is to add a static IP. Next, you need to attach the IP address to your instance.

# Update the network_interface configuration for your instance like so:
#   network_interface {
#     network = google_compute_network.vpc_network.self_link
#     access_config {
#       nat_ip = google_compute_address.vm_static_ip.address
#     }
#   }
# Copied!
# The access_config block has several optional arguments, and in this case you'll set nat_ip to be the static IP address. When Terraform reads this configuration, it will:

# Ensure that vm_static_ip is created before vm_instance
# Save the properties of vm_static_ip in the state
# Set nat_ip to the value of the vm_static_ip.address property
# Run terraform plan again, but this time, save the plan:
# terraform plan -out static_ip
# Copied!
# Saving the plan this way ensures that you can apply exactly the same plan in the future. If you try to apply the file created by the plan, Terraform will first check to make sure the exact same set of changes will be made before applying the plan.

# In this case, you can see that Terraform will create a new google_compute_address and update the existing VM to use it.

# Run terraform apply "static_ip" to see how Terraform plans to apply this change:
# terraform apply "static_ip"
# Copied!
# As shown above, Terraform created the static IP before modifying the VM instance. Due to the interpolation expression that passes the IP address to the instance's network interface configuration, Terraform is able to infer a dependency, and knows it must create the static IP before updating the instance.

# Click Check my progress to verify the objective.
# Create Resource Dependencies

# Implicit and explicit dependencies
# By studying the resource attributes used in interpolation expressions, Terraform can automatically infer when one resource depends on another. In the example above, the reference to google_compute_address.vm_static_ip.address creates an implicit dependency on the google_compute_address named vm_static_ip.

# Terraform uses this dependency information to determine the correct order in which to create and update different resources. In the example above, Terraform knows that the vm_static_ip must be created before the vm_instance is updated to use it.

# Implicit dependencies via interpolation expressions are the primary way to inform Terraform about these relationships, and should be used whenever possible.

# Sometimes there are dependencies between resources that are not visible to Terraform. The depends_on argument can be added to any resource and accepts a list of resources to create explicit dependencies for.

# For example, perhaps an application you will run on your instance expects to use a specific Cloud Storage bucket, but that dependency is configured inside the application code and thus not visible to Terraform. In that case, you can use depends_on to explicitly declare the dependency.

# Add a Cloud Storage bucket and an instance with an explicit dependency on the bucket by adding the following to main.tf:
# # New resource for the storage bucket our application will use.
# resource "google_storage_bucket" "example_bucket" {
#   name     = "<UNIQUE-BUCKET-NAME>"
#   location = "US"

#   website {
#     main_page_suffix = "index.html"
#     not_found_page   = "404.html"
#   }
# }

# # Create a new instance that uses the bucket
# resource "google_compute_instance" "another_instance" {
#   # Tells Terraform that this VM instance must be created only after the
#   # storage bucket has been created.
#   depends_on = [google_storage_bucket.example_bucket]

#   name         = "terraform-instance-2"
#   machine_type = "e2-micro"

#   boot_disk {
#     initialize_params {
#       image = "cos-cloud/cos-stable"
#     }
#   }

#   network_interface {
#     network = google_compute_network.vpc_network.self_link
#     access_config {
#     }
#   }
# }
# Copied!
# Note: Storage buckets must be globally unique. Because of this, you will need to replace UNIQUE-BUCKET-NAME with a unique, valid name for a bucket. Using your name and the date is usually a good way to guess a unique bucket name.
# You may wonder where in your configuration these resources should go. The order that resources are defined in a terraform configuration file has no effect on how Terraform applies your changes. Organize your configuration files in a way that makes the most sense for you and your team.

# Now run terraform plan and terraform apply to see these changes in action:
# terraform plan
# terraform apply
# Copied!
# Click Check my progress to verify the objective.
# Create bucket dependent instance

# Before moving on, remove these new resources from your configuration and run terraform apply once again to destroy them. You won't use the bucket or the second instance any further in this lab.
# Task 4. Provision infrastructure
# The compute instance you launched at this point is based on the Google image given, but has no additional software installed or configuration applied.

# Google Cloud allows customers to manage their own custom operating system images. This can be a great way to ensure the instances you provision with Terraform are pre-configured based on your needs. Packer is the perfect tool for this and includes a builder for Google Cloud.

# Terraform uses provisioners to upload files, run shell scripts, or install and trigger other software like configuration management tools.

# Defining a provisioner
# To define a provisioner, modify the resource block defining the first vm_instance in your configuration to look like the following:
# resource "google_compute_instance" "vm_instance" {
#   name         = "terraform-instance"
#   machine_type = "e2-micro"
#   tags         = ["web", "dev"]

#   provisioner "local-exec" {
#     command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
#   }

#   # ...
# }
# Copied!
# This adds a provisioner block within the resource block. Multiple provisioner blocks can be added to define multiple provisioning steps. Terraform supports many provisioners, but for this example you are using the local-exec provisioner.

# The local-exec provisioner executes a command locally on the machine running Terraform, not the VM instance itself. You're using this provisioner versus the others so we don't have to worry about specifying any connection info right now.

# This also shows a more complex example of string interpolation than you've seen before. Each VM instance can have multiple network interfaces, so refer to the first one with network_interface[0], count starting from 0, as most programming languages do. Each network interface can have multiple access_config blocks as well, so once again you specify the first one.

# Run terraform apply:
# terraform apply
# Copied!
# At this point, the output may be confusing at first.

# Terraform found nothing to do - and if you check, you'll find that there's no ip_address.txt file on your local machine.

# Terraform treats provisioners differently from other arguments. Provisioners only run when a resource is created, but adding a provisioner does not force that resource to be destroyed and recreated.

# Use terraform taint to tell Terraform to recreate the instance:
# terraform taint google_compute_instance.vm_instance
# Copied!
# A tainted resource will be destroyed and recreated during the next apply.

# Run terraform apply now:
# terraform apply
# Copied!
# Verify everything worked by looking at the contents of the ip_address.txt file.
# It contains the IP address, just as you asked.

# Failed provisioners and tainted resources
# If a resource is successfully created but fails a provisioning step, Terraform will error and mark the resource as tainted. A resource that is tainted still exists, but shouldn't be considered safe to use, since provisioning failed.

# When you generate your next execution plan, Terraform will remove any tainted resources and create new resources, attempting to provision them again after creation.

# Destroy provisioners
# Provisioners can also be defined that run only during a destroy operation. These are useful for performing system cleanup, extracting data, etc.

# For many resources, using built-in cleanup mechanisms is recommended if possible (such as init scripts), but provisioners can be used if necessary.

# This lab won't show any destroyed provisioner examples. If you need to use destroy provisioners, please see the Provisioners documentation.

# Congratulations!
# In this lab, you learned how to build, change, and destroy infrastructure with Terraform. You then created resource dependencies, and provisioned basic infrastructure with Terraform configuration files.

# Next steps/Learn more
# Be sure to check out the following resources to receive more hands-on practice with Terraform:

# Hashicorp on the Google Cloud Marketplace!
# Hashicorp Learn
# Terraform Community
# Terraform Google Examples
# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated January 26, 2024

# Lab Last Tested September 25, 2023

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

