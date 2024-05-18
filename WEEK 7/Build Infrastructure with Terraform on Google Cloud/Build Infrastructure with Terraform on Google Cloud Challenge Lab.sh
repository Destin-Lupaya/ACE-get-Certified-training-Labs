# Build Infrastructure with Terraform on Google Cloud: Challenge Lab
# experiment
# Lab
# schedule
# 1 hour 30 minutes
# universal_currency_alt
# 5 Credits
# show_chart
# Intermediate
# GSP345
# Google Cloud self-paced labs logo

# Overview
# In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

# When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

# To score 100% you must successfully complete all tasks within the time period!

# This lab is recommended for students who have enrolled in the Build Infrastructure with Terraform on Google Cloud course. Are you ready for the challenge?

# Topics tested:
# Import existing infrastructure into your Terraform configuration.
# Build and reference your own Terraform modules.
# Add a remote backend to your configuration.
# Use and implement a module from the Terraform Registry.
# Re-provision, destroy, and update infrastructure.
# Test connectivity between the resources you've created.
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
# You are a cloud engineer intern for a new startup. For your first project, your new boss has tasked you with creating infrastructure in a quick and efficient manner and generating a mechanism to keep track of it for future reference and changes. You have been directed to use Terraform to complete the project.

# For this project, you will use Terraform to create, deploy, and keep track of infrastructure on the startup's preferred provider, Google Cloud. You will also need to import some mismanaged instances into your configuration and fix them.

# In this lab, you will use Terraform to import and create multiple VM instances, a VPC network with two subnetworks, and a firewall rule for the VPC to allow connections between the two instances. You will also create a Cloud Storage bucket to host your remote backend.

# Note: At the end of every section, plan and apply your changes to allow your work to be successfully verified. Since we will be updating many terraform files in this lab make sure to use the correct file path and maintain the correct indentation.
# Task 1. Create the configuration files
# In Cloud Shell, create your Terraform configuration files and a directory structure that resembles the following:
# main.tf
# variables.tf
# modules/
# └── instances
#     ├── instances.tf
#     ├── outputs.tf
#     └── variables.tf
# └── storage
#     ├── storage.tf
#     ├── outputs.tf
#     └── variables.tf
# Copied!
# Fill out the variables.tf files in the root directory and within the modules. Add three variables to each file: region, zone, and project_id. For their default values, use europe-west1, europe-west1-b, and your Google Cloud Project ID.
# Note: You should use these variables anywhere applicable in your resource configurations.
# Add the Terraform block and the Google Provider to the main.tf file. Verify the zone argument is added along with the project and region arguments in the Google Provider block.

# Initialize Terraform.

# Task 2. Import infrastructure
# In the Google Cloud Console, on the Navigation menu, click Compute Engine > VM Instances. Two instances named tf-instance-1 and tf-instance-2 have already been created for you.
# Note: by clicking on one of the instances, you can find its Instance ID, boot disk image, and machine type. These are all necessary for writing the configurations correctly and importing them into Terraform.
# Import the existing instances into the instances module. To do this, you will need to follow these steps:
# First, add the module reference into the main.tf file then re-initialize Terraform.
# Next, write the resource configurations in the instances.tf file to match the pre-existing instances.
# Name your instances tf-instance-1 and tf-instance-2.
# For the purposes of this lab, the resource configuration should be as minimal as possible. To accomplish this, you will only need to include the following additional arguments in your configuration: machine_type, boot_disk, network_interface, metadata_startup_script, and allow_stopping_for_update. For the last two arguments, use the following configuration as this will ensure you won't need to recreate it:
# metadata_startup_script = <<-EOT
#         #!/bin/bash
#     EOT
# allow_stopping_for_update = true
# Copied!
# Once you have written the resource configurations within the module, use the terraform import command to import them into your instances module.
# Apply your changes. Note that since you did not fill out all of the arguments in the entire configuration, the apply will update the instances in-place. This is fine for lab purposes, but in a production environment, you should make sure to fill out all of the arguments correctly before importing.
# Click Check my progress to verify the objective.
# Import infrastructure.

# Task 3. Configure a remote backend
# Create a Cloud Storage bucket resource inside the storage module. For the bucket name, use tf-bucket-594661. For the rest of the arguments, you can simply use:

# location = "US"
# force_destroy = true
# uniform_bucket_level_access = true
# Note: You can optionally add output values inside of the outputs.tf file.
# Add the module reference to the main.tf file. Initialize the module and apply the changes to create the bucket using Terraform.

# Configure this storage bucket as the remote backend inside the main.tf file. Be sure to use the prefix terraform/state so it can be graded successfully.

# If you've written the configuration correctly, upon init, Terraform will ask whether you want to copy the existing state data to the new backend. Type yes at the prompt.

# Click Check my progress to verify the objective.
# Configure a remote backend.

# Task 4. Modify and update infrastructure
# Navigate to the instances module and modify the tf-instance-1 resource to use an e2-standard-2 machine type.

# Modify the tf-instance-2 resource to use an e2-standard-2 machine type.

# Add a third instance resource and name it tf-instance-018708. For this third resource, use an e2-standard-2 machine type. Make sure to change the machine type to e2-standard-2 to all the three instances.

# Initialize Terraform and apply your changes.

# Note: Optionally, you can add output values from these resources in the outputs.tf file within the module.
# Click Check my progress to verify the objective.
# Modify and update infrastructure.

# Task 5. Destroy resources
# Destroy the third instance tf-instance-018708 by removing the resource from the configuration file. After removing it, initialize terraform and apply the changes.
# Click Check my progress to verify the objective.
# Destroy resources.

# Task 6. Use a module from the Registry
# In the Terraform Registry, browse to the Network Module.

# Add this module to your main.tf file. Use the following configurations:

# Use version 6.0.0 (different versions might cause compatibility errors).
# Name the VPC tf-vpc-119930, and use a global routing mode.
# Specify 2 subnets in the europe-west1 region, and name them subnet-01 and subnet-02. For the subnets arguments, you just need the Name, IP, and Region.
# Use the IP 10.10.10.0/24 for subnet-01, and 10.10.20.0/24 for subnet-02.
# You do not need any secondary ranges or routes associated with this VPC, so you can omit them from the configuration.
# Once you've written the module configuration, initialize Terraform and run an apply to create the networks.

# Next, navigate to the instances.tf file and update the configuration resources to connect tf-instance-1 to subnet-01 and tf-instance-2 to subnet-02.

# Note: Within the instance configuration, you will need to update the network argument to tf-vpc-119930, and then add the subnetwork argument with the correct subnet for each instance.
# Click Check my progress to verify the objective.
# Use a module from the Registry.

# Task 7. Configure a firewall
# Create a firewall rule resource in the main.tf file, and name it tf-firewall.
# This firewall rule should permit the tf-vpc-119930 network to allow ingress connections on all IP ranges (0.0.0.0/0) on TCP port 80.
# Make sure you add the source_ranges argument with the correct IP range (0.0.0.0/0).
# Initialize Terraform and apply your changes.
# Note: To retrieve the required network argument, you can inspect the state and find the ID or self_link of the google_compute_network resource you created. It will be in the form projects/PROJECT_ID/global/networks/tf-vpc-119930.
# Click Check my progress to verify the objective.
# Configure a firewall.

# Congratulations!
# If you managed to import, create, modify, and configure the architecture within the allotted time, you've shown great competency in your Terraform skills! In this lab, you started by importing two pre-configured VMs into Terraform and creating a Cloud Storage bucket to configure your backend. You then added another instance and practiced modifying and updating the resource configurations within your modules. Lastly, you used a module from the Terraform Registry to create a VPC with two subnets, connected the instances to it, and created a firewall rule to allow connections between them.

# Build Infrastructure with Terraform on Google Cloud

# Earn your next skill badge
# This self-paced lab is part of the Build Infrastructure with Terraform on Google Cloud skill badge course. Completing this skill badge course earns you the badge above, to recognize your achievement. Share your badge on your resume and social platforms, and announce your accomplishment using #GoogleCloudBadge.

# Next steps
# Now that you have shown competency in Terraform, you may want to register for the HashiCorp Infrastructure Automation Certification. The Terraform Associate certification is for Cloud Engineers specializing in operations, IT, or development who know the basic concepts and skills associated with open source HashiCorp Terraform. Candidates will be best prepared for this exam if they have professional experience using Terraform in production, but performing the exam objectives in a personal demo environment may also be sufficient. So, if you want to take your skills to the next level and verify your infrastructure automation abilities, we recommend that you review the study guide and the exam review, and then register for the exam when you're ready. Good luck!

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual Last Updated May 14, 2024

# Lab Last Tested May 14, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.


export ZONE=europe-west1-b


export BUCKET_HUSTLER=tf-bucket-790836


export INSTANCE_HUSTLER=tf-instance-780741


export VPC_HUSTLER=tf-vpc-630432


export REGION=${ZONE%-*}
export PROJECT_ID=$(gcloud config get-value project)
touch main.tf
touch variables.tf
mkdir -p modules/instances
cd modules/instances
touch instances.tf outputs.tf variables.tf
cd ..
mkdir storage
cd storage
touch storage.tf outputs.tf variables.tf
cd ~
echo 'variable "region" {
 default = "'"$REGION"'"
}

variable "zone" {
 default = "'"$ZONE"'"
}

variable "project_id" {
 default = "'"$PROJECT_ID"'"
}' > variables.tf

echo 'terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}' >main.tf

terraform init

echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-1"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf
INSTANCE_ID1=$(gcloud compute instances describe tf-instance-1 --zone=$ZONE --format="value(id)")
INSTANCE_ID2=$(gcloud compute instances describe tf-instance-2 --zone=$ZONE --format="value(id)")
terraform import module.instances.google_compute_instance.tf-instance-1 $INSTANCE_ID1
terraform import module.instances.google_compute_instance.tf-instance-2 $INSTANCE_ID2
terraform plan
terraform apply -auto-approve
echo 'resource "google_storage_bucket" "storage-bucket" {
  name          = "'"$BUCKET_HUSTLER"'"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}' > modules/storage/storage.tf

echo 'terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}' > main.tf

terraform init
terraform apply -auto-approve

echo 'terraform {
  backend "gcs" {
    bucket  = "'"$BUCKET_HUSTLER"'"
 prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}' > main.tf
terraform init
echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-1"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
resource "google_compute_instance" "'"$INSTANCE_HUSTLER"'" {
  name         = "'"$INSTANCE_HUSTLER"'"
  machine_type = "n1-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf
terraform init
terraform apply -auto-approve
echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
resource "google_compute_instance" "'"$INSTANCE_HUSTLER"'" {
  name         = "'"$INSTANCE_HUSTLER"'"
  machine_type = "e2-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf

terraform init
terraform apply -auto-approve
terraform taint module.instances.google_compute_instance.$INSTANCE_HUSTLER
terraform plan
terraform apply -auto-approve

echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf
terraform apply -auto-approve
echo 'terraform {
  backend "gcs" {
    bucket  = "'"$BUCKET_HUSTLER"'"
 prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0.0"

    project_id   = "'"$PROJECT_ID"'"
    network_name = "'"$VPC_HUSTLER"'"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "'"$REGION"'"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "'"$REGION"'"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
    ]
}' > main.tf

terraform init
terraform apply -auto-approve

echo 'resource "google_compute_instance" "tf-instance-1"{
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "'"$VPC_HUSTLER"'"
     subnetwork = "subnet-01"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2"{
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "'"$VPC_HUSTLER"'"
     subnetwork = "subnet-02"
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0.0"

    project_id   = "'"$PROJECT_ID"'"
    network_name = "'"$VPC_HUSTLER"'"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "'"$REGION"'"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "'"$REGION"'"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
    ]
}' > modules/instances/instances.tf
terraform init
terraform apply -auto-approve

echo 'terraform {
  backend "gcs" {
    bucket  = "'"$BUCKET_HUSTLER"'"
 prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0.0"

    project_id   = "'"$PROJECT_ID"'"
    network_name = "'"$VPC_HUSTLER"'"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "'"$REGION"'"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "'"$REGION"'"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
    ]
}
resource "google_compute_firewall" "tf-firewall"{
  name    = "tf-firewall"
 network = "projects/'$PROJECT_ID'/global/networks/'$VPC_HUSTLER'"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}' > main.tf
terraform init
terraform apply -auto-approve












export ZONE=europe-west1-b

export BUCKET_NAME=tf-bucket-790836

export INSTANCE_NAME=tf-instance-780741

export VPC_NAME=tf-vpc-630432






export REGION=${ZONE%-*}
export PROJECT_ID=$(gcloud config get-value project)
touch main.tf
touch variables.tf
mkdir -p modules/instances
cd modules/instances
touch instances.tf outputs.tf variables.tf
cd ..
mkdir storage
cd storage
touch storage.tf outputs.tf variables.tf
cd ~
echo 'variable "region" {
 default = "'"$REGION"'"
}

variable "zone" {
 default = "'"$ZONE"'"
}

variable "project_id" {
 default = "'"$PROJECT_ID"'"
}' > variables.tf

echo 'terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}' >main.tf

terraform init

echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-1"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf
INSTANCE_ID1=$(gcloud compute instances describe tf-instance-1 --zone=$ZONE --format="value(id)")
INSTANCE_ID2=$(gcloud compute instances describe tf-instance-2 --zone=$ZONE --format="value(id)")
terraform import module.instances.google_compute_instance.tf-instance-1 $INSTANCE_ID1
terraform import module.instances.google_compute_instance.tf-instance-2 $INSTANCE_ID2
terraform plan
terraform apply -auto-approve
echo 'resource "google_storage_bucket" "storage-bucket" {
  name          = "'"$BUCKET"'"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}' > modules/storage/storage.tf

echo 'terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}' > main.tf

terraform init
terraform apply -auto-approve

echo 'terraform {
  backend "gcs" {
    bucket  = "'"$BUCKET"'"
 prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}' > main.tf
terraform init
echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-1"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
resource "google_compute_instance" "'"$INSTANCE"'" {
  name         = "'"$INSTANCE"'"
  machine_type = "n1-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf
terraform init
terraform apply -auto-approve
echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
resource "google_compute_instance" "'"$INSTANCE"'" {
  name         = "'"$INSTANCE"'"
  machine_type = "e2-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf

terraform init
terraform apply -auto-approve
terraform taint module.instances.google_compute_instance.$INSTANCE
terraform plan
terraform apply -auto-approve

echo 'resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         =  "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}' > modules/instances/instances.tf
terraform apply -auto-approve
echo 'terraform {
  backend "gcs" {
    bucket  = "'"$BUCKET"'"
 prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0.0"

    project_id   = "'"$PROJECT_ID"'"
    network_name = "'"$VPC"'"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "'"$REGION"'"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "'"$REGION"'"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
    ]
}' > main.tf

terraform init
terraform apply -auto-approve

echo 'resource "google_compute_instance" "tf-instance-1"{
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "'"$VPC"'"
     subnetwork = "subnet-01"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2"{
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "'"$ZONE"'"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "'"$VPC"'"
     subnetwork = "subnet-02"
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0.0"

    project_id   = "'"$PROJECT_ID"'"
    network_name = "'"$VPC"'"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "'"$REGION"'"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "'"$REGION"'"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
    ]
}' > modules/instances/instances.tf
terraform init
terraform apply -auto-approve

echo 'terraform {
  backend "gcs" {
    bucket  = "'"$BUCKET"'"
 prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  zone        = var.zone
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {
  source     = "./modules/storage"
}
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0.0"

    project_id   = "'"$PROJECT_ID"'"
    network_name = "'"$VPC"'"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "'"$REGION"'"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "'"$REGION"'"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
    ]
}
resource "google_compute_firewall" "tf-firewall"{
  name    = "tf-firewall"
 network = "projects/'$PROJECT_ID'/global/networks/'$VPC'"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}' > main.tf
terraform init
terraform apply -auto-approve




