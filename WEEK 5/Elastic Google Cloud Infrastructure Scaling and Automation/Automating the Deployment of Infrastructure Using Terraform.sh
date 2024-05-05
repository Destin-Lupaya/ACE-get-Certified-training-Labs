# Automating the Deployment of Infrastructure Using Terraform
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# 5 Credits
# show_chart
# Introductory
# Overview
# Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open-source tool that codifies APIs into declarative configuration files that can be shared among team members, treated as code, edited, reviewed, and versioned.

# In this lab, you create a Terraform configuration with a module to automate the deployment of Google Cloud infrastructure. Specifically, you deploy one auto mode network with a firewall rule and two VM instances, as shown in this diagram:

# Terraform configuration diagram

# Objectives
# In this lab, you learn how to perform the following tasks:

# Create a configuration for an auto mode network
# Create a configuration for a firewall rule
# Create a module for VM instances
# Create and deploy a configuration
# Verify the deployment of a configuration
# Setup
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

# Task 1. Set up Terraform and Cloud Shell
# Configure your Cloud Shell environment to use Terraform.

# Install Terraform
# Terraform is now integrated into Cloud Shell. Verify which version is installed.

# In the Cloud Console, click Activate Cloud Shell (Activate Cloud Shell icon).
# If prompted, click Continue.
# To confirm that Terraform is installed, run the following command:
# terraform --version
# Copied!
# The output should look like this:

# Terraform v1.3.3
# Note: Don't worry if you get a warning that the version of Terraform is out of date, because the lab instructions will work with Terraform v1.3.3 and later. The available downloads for the latest version of Terraform are on the Terraform website. Terraform is distributed as a binary package for all supported platforms and architectures, and Cloud Shell uses Linux 64-bit.

# To create a directory for your Terraform configuration, run the following command:
# mkdir tfinfra
# Copied!
# In Cloud Shell, click Open editor (Cloud Shell Editor icon).
# Note: If you see the message "Unable to load code editor because third-party cookies are disabled", click Open in New Window. The code editor will open in a new tab. Return to the original tab, click Open Terminal and then switch back to the code editor tab. You will periodically need to switch back to the Cloud Shell terminal in this lab.

# In the left pane of the code editor, expand the tfinfra folder.
# Initialize Terraform
# Terraform uses a plugin-based architecture to support the numerous infrastructure and service providers available. Each "provider" is its own encapsulated binary distributed separately from Terraform itself. Initialize Terraform by setting Google as the provider.

# To create a new file inside tfinfra folder, right-click on tfinfra folder and then click New File.
# Name the new file provider.tf, and then open it.
# Copy the code into provider.tf:
# provider "google" {}
# Copied!
# To save provider.tf, click File > Save.

# To initialize Terraform, run the following command:

# cd tfinfra
# terraform init
# Copied!
# The output should look like this:

# * provider.google: version = "~> 4.43.0"
# Terraform has been successfully initialized!
# You are now ready to work with Terraform in Cloud Shell.

# Task 2. Create mynetwork and its resources
# Create the auto mode network mynetwork along with its firewall rule and two VM instances (mynet_us_vm and mynet_eu_vm).

# Configure mynetwork
# Create a new configuration, and define mynetwork.

# To create a new file inside tfinfra, right-click on tfinfra folder and then click New File.
# Name the new file mynetwork.tf, and then open it.
# Copy the following base code into mynetwork.tf:
# # Create the mynetwork network
# resource [RESOURCE_TYPE] "mynetwork" {
# name = [RESOURCE_NAME]
# # RESOURCE properties go here
# }
# Copied!
# This base template is a great starting point for any Google Cloud resource. The name field allows you to name the resource, and the type field allows you to specify the Google Cloud resource that you want to create. You can also define properties, but these are optional for some resources.

# In mynetwork.tf, replace [RESOURCE_TYPE] with "google_compute_network" (with the quotes).
# Note: The google_compute_network resource is a VPC network. Available resources are in the Google Cloud provider documentation. Learn more about this specific resource in the Terraform documentation.

# In mynetwork.tf, replace [RESOURCE_NAME] with "mynetwork" (with the quotes).
# Add the following property to mynetwork.tf:
# auto_create_subnetworks = "true"
# Copied!
# By definition, an auto mode network automatically creates a subnetwork in each region. Therefore, you are setting auto_create_subnetworks to true.

# Verify that mynetwork.tf file look like this:
# # Create the mynetwork network
# resource "google_compute_network" "mynetwork" {
# name = "mynetwork"
# # RESOURCE properties go here
# auto_create_subnetworks = "true"
# }
# Copied!
# To save mynetwork.tf, click File > Save.
# Configure the firewall rule
# Define a firewall rule to allow HTTP, SSH, RDP, and ICMP traffic on mynetwork.

# Add the following base code to mynetwork.tf:
# # Add a firewall rule to allow HTTP, SSH, RDP and ICMP traffic on mynetwork
# resource [RESOURCE_TYPE] "mynetwork-allow-http-ssh-rdp-icmp" {
# name = [RESOURCE_NAME]
# # RESOURCE properties go here
# }
# Copied!
# In mynetwork.tf, replace [RESOURCE_TYPE] with "google_compute_firewall" (with the quotes).
# Note: The google_compute_firewall resource is a firewall rule. Learn more about this specific resource in the Terraform documentation.

# In mynetwork.tf, replace [RESOURCE_NAME] with "mynetwork-allow-http-ssh-rdp-icmp" (with the quotes).
# Add the following property to mynetwork.tf:
# network = google_compute_network.mynetwork.self_link
# Copied!
# Note: Because this firewall rule depends on its network, you are using the google_compute_network.mynetwork.self_link reference to instruct Terraform to resolve these resources in a dependent order. In this case, the network is created before the firewall rule.

# Add the following properties to mynetwork.tf:
# allow {
#     protocol = "tcp"
#     ports    = ["22", "80", "3389"]
#     }
# allow {
#     protocol = "icmp"
#     }
# source_ranges = ["0.0.0.0/0"]
# Copied!
# The list of allow rules specifies which protocols and ports are permitted.

# Verify that your mynetwork.tf file look like this:
# # Create the mynetwork network
# resource "google_compute_network" "mynetwork" {
# name = "mynetwork"
# # RESOURCE properties go here
# auto_create_subnetworks = "true"
# }
# # Add a firewall rule to allow HTTP, SSH, RDP and ICMP traffic on mynetwork
# resource "google_compute_firewall" "mynetwork-allow-http-ssh-rdp-icmp" {
# name = "mynetwork-allow-http-ssh-rdp-icmp"
# # RESOURCE properties go here
# network = google_compute_network.mynetwork.self_link
# allow {
#     protocol = "tcp"
#     ports    = ["22", "80", "3389"]
#     }
# allow {
#     protocol = "icmp"
#     }
# source_ranges = ["0.0.0.0/0"]
# }
# Copied!
# To save mynetwork.tf, click File > Save.
# Configure the VM instance
# Define the VM instances by creating a VM instance module. A module is a reusable configuration inside a folder. You will use this module for both VM instances of this lab.

# To create a new folder inside tfinfra, select the tfinfra folder, and then click File > New Folder.
# Name the new folder instance.
# To create a new file inside instance, right-click on instance folder and then click New File.
# Name the new file main.tf, and then open it.
# You should have the following folder structure in Cloud Shell:

# Folder structure

# Copy the following base code into main.tf:
# resource [RESOURCE_TYPE] "vm_instance" {
#   name = [RESOURCE_NAME]
#   # RESOURCE properties go here
# }
# Copied!
# In main.tf, replace [RESOURCE_TYPE] with "google_compute_instance" (with the quotes).
# Note: The google_compute_instance resource is a Compute Engine instance. Learn more about this specific resource in the Terraform documentation.

# In main.tf, replace [RESOURCE_NAME] with "${var.instance_name}" (with the quotes).
# Because you will be using this module for both VM instances, you are defining the instance name as an input variable. This allows you to control the name of the variable from mynetwork.tf. Learn more about input variables in the Terraform: Define Input Variables Guide.

# Add the following properties to main.tf:
#   zone         = "${var.instance_zone}"
#   machine_type = "${var.instance_type}"
# Copied!
# These properties define the zone and machine type of the instance as input variables.

# Add the following properties to main.tf:
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#       }
#   }
# Copied!
# This property defines the boot disk to use the Debian 11 OS image. Because both VM instances will use the same image, you can hard-code this property in the module.

# Add the following properties to main.tf:
#   network_interface {
#     network = "${var.instance_network}"
#     access_config {
#       # Allocate a one-to-one NAT IP to the instance
#     }
#   }
# Copied!
# This property defines the network interface by providing the network name as an input variable and the access configuration. Leaving the access configuration empty results in an ephemeral external IP address (required in this lab). To create instances with only an internal IP address, remove the access_config section. For more information, see the Terraform documentation.

# Verify that main.tf looks like this, including brackets {}
# resource "google_compute_instance" "vm_instance" {
#   name         = "${var.instance_name}"
#   zone         = "${var.instance_zone}"
#   machine_type = "${var.instance_type}"
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#       }
#   }
#   network_interface {
#     network = "${var.instance_network}"
#     access_config {
#       # Allocate a one-to-one NAT IP to the instance
#     }
#   }
# }
# Copied!
# To save main.tf, click File > Save.
# To create a new file inside instance, right-click on instance folder and then click New File.
# Name the new file variables.tf, and then open it.
# Define the 4 input variables in variables.tf.
# variable "instance_name" {}
# variable "instance_zone" {}
# variable "instance_type" {
#   default = "e2-micro"
#   }
# variable "instance_network" {}
# Copied!
# By giving instance_type a default value, you make the variable optional. The instance_name, instance_zone, and instance_network are required, and you will define them in mynetwork.tf.

# To save variables.tf, click File > Save.
# Add the following VM instances to mynetwork.tf:

# # Create the mynet-us-vm instance
# module "mynet-us-vm" {
#   source           = "./instance"
#   instance_name    = "mynet-us-vm"
#   instance_zone    = "Zone"
#   instance_network = google_compute_network.mynetwork.self_link
# }

# # Create the mynet-eu-vm" instance
# module "mynet-eu-vm" {
#   source           = "./instance"
#   instance_name    = "mynet-eu-vm"
#   instance_zone    = "Zone 2"
#   instance_network = google_compute_network.mynetwork.self_link
# }
# Copied!
# These resources are leveraging the module in the instance folder and provide the name, zone, and network as inputs. Because these instances depend on a VPC network, you are using the google_compute_network.mynetwork.self_link reference to instruct Terraform to resolve these resources in a dependent order. In this case, the network is created before the instance.

# Note: The benefit of writing a Terraform module is that it can be reused across many configurations. Instead of writing your own module, you can also leverage existing modules from the Terraform Module registry.

# To save mynetwork.tf, click File > Save.

# Verify that mynetwork.tf looks like this, including brackets {}

# # Create the mynetwork network
# resource "google_compute_network" "mynetwork" {
# name = "mynetwork"
# # RESOURCE properties go here
# auto_create_subnetworks = "true"
# }
# # Add a firewall rule to allow HTTP, SSH, RDP and ICMP traffic on mynetwork
# resource "google_compute_firewall" "mynetwork-allow-http-ssh-rdp-icmp" {
# name = "mynetwork-allow-http-ssh-rdp-icmp"
# # RESOURCE properties go here
# network = google_compute_network.mynetwork.self_link
# allow {
#     protocol = "tcp"
#     ports    = ["22", "80", "3389"]
#     }
# allow {
#     protocol = "icmp"
#     }
# source_ranges = ["0.0.0.0/0"]
# }
# # Create the mynet-us-vm instance
# module "mynet-us-vm" {
#   source           = "./instance"
#   instance_name    = "mynet-us-vm"
#   instance_zone    = "Zone"
#   instance_network = google_compute_network.mynetwork.self_link
# }
# # Create the mynet-eu-vm" instance
# module "mynet-eu-vm" {
#   source           = "./instance"
#   instance_name    = "mynet-eu-vm"
#   instance_zone    = "Zone 2"
#   instance_network = google_compute_network.mynetwork.self_link
# }
# Copied!
# Create mynetwork and its resources
# It's time to apply the mynetwork configuration.

# To rewrite the Terraform configuration files to a canonical format and style, run the following command:
# terraform fmt
# Copied!
# The output should look like this:

# mynetwork.tf
# Note: If you get an error, revisit the previous steps to ensure that your configuration matches the lab instructions. If you cannot troubleshoot the issue of your configuration, download and then look at these finished configurations:

# mynetwork.tf
# main.tf
# provider.tf
# variables.tf
# To initialize Terraform, run the following command:
# terraform init
# Copied!
# The output should look like this:

# Initializing modules...
# - mynet-eu-vm in instance
# - mynet-us-vm in instance
# ...
# * provider.google: version = "~> 4.43.0"

# Terraform has been successfully initialized!
# Note: If you get an error, revisit the previous steps to ensure that you have the correct folder/file structure. If you cannot troubleshoot the issue of your configuration, refer to the finished configurations linked above. When you have corrected the issue, re-run the previous command.

# To create an execution plan, run the following command:
# terraform plan
# Copied!
# The output should look like this:

# ...
# Plan: 4 to add, 0 to change, 0 to destroy.
# ...
# Terraform determined that the following 4 resources need to be added:

# Name	Description
# mynetwork	VPC network
# mynetwork-allow-http-ssh-rdp-icmp	Firewall rule to allow HTTP, SSH, RDP and ICMP
# mynet-us-vm	VM instance in Zone
# mynet-eu-vm	VM instance in Zone 2
# To apply the desired changes, run the following command:
# terraform apply
# Copied!
# To confirm the planned actions, type:
# yes
# Copied!
# The output should look like this:

# ...
# Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
# Click Check my progress to verify the objective.
# Create mynetwork and its resources

# Note: If you get an error during the execution, revisit the previous steps to ensure that you have the correct folder/file structure. If you cannot troubleshoot the issue of your configuration, refer to the finished configurations linked above. When you have corrected the issue, re-run the previous command.

# Task 3. Verify your deployment
# In the Cloud Console, verify that the resources were created.

# Verify your network in the Cloud Console
# In the Cloud Console, on the Navigation menu (Navigation menu icon), click VPC network > VPC networks.
# View the mynetwork VPC network with a subnetwork in every region.
# On the Navigation menu, click VPC network > Firewall.
# Sort the firewall rules by Network.
# View the mynetwork-allow-http-ssh-rdp-icmp firewall rule for mynetwork.
# Verify your VM instances in the Cloud Console
# On the Navigation menu (Navigation menu icon), click Compute Engine > VM instances.
# View the mynet-us-vm and mynet-eu-vm instances.
# Note the internal IP address for mynet-eu-vm.
# For mynet-us-vm, click SSH to launch a terminal and connect.
# To test connectivity to mynet-eu-vm's internal IP address, run the following command in the SSH terminal (replacing mynet-eu-vm's internal IP address with the value noted earlier):
# ping -c 3 <Enter mynet-eu-vm's internal IP here>
# Copied!
# Note: This should work because both VM instances are on the same network, and the firewall rule allows ICMP traffic!
# Task 4. Review
# In this lab, you created a Terraform configuration with a module to automate the deployment of Google Cloud infrastructure. As your configuration changes, Terraform can create incremental execution plans, which allows you to build your overall configuration step by step.

# The instance module allowed you to re-use the same resource configuration for multiple resources while providing properties as input variables. You can leverage the configuration and module that you created as a starting point for future deployments.

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

export ZONE=us-west1-c

curl -LO https://raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/quickgcplab.sh

sudo chmod +x quickgcplab.sh

./quickgcplab.sh

# main.tf

variable "instance_name" {}
variable "instance_zone" {}

variable "instance_type" {
  default = "n1-standard-1"
}

variable "instance_subnetwork" {}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  zone         = "${var.instance_zone}"
  machine_type = "${var.instance_type}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = "${var.instance_subnetwork}"

    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }
}


# mynetwork.tf

# Create the mynetwork network
resource "google_compute_network" "mynetwork" {
  name                    = "mynetwork"
  auto_create_subnetworks = true
}

# Create a firewall rule to allow HTTP, SSH, RDP and ICMP traffic on mynetwork
resource "google_compute_firewall" "mynetwork-allow-http-ssh-rdp-icmp" {
  name    = "mynetwork-allow-http-ssh-rdp-icmp"
  network = google_compute_network.mynetwork.self_link
  source_ranges = [
    "0.0.0.0/0"
  ]

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }

  allow {
    protocol = "icmp"
  }
}

# Create the mynet-us-vm instance
module "mynet-us-vm" {
  source              = "./instance"
  instance_name       = "mynet-us-vm"
  instance_zone       = "us-central1-a"
  instance_subnetwork = google_compute_network.mynetwork.self_link
}

# Create the mynet-eu-vm" instance
module "mynet-eu-vm" {
  source              = "./instance"
  instance_name       = "mynet-eu-vm"
  instance_zone       = "europe-west1-d"
  instance_subnetwork = google_compute_network.mynetwork.self_link
}

# provider

provider "google" {}

# quicklabsh

BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`
#----------------------------------------------------start--------------------------------------------------#

echo "${YELLOW}${BOLD}Starting${RESET}" "${GREEN}${BOLD}Execution${RESET}"

gcloud auth list

mkdir tfinfra

cd tfinfra

wget https://raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/provider.tf

wget https://raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/terraform.tfstate

wget https://raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/variables.tf

wget https://raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/mynetwork.tf

mkdir instance

cd instance

wget https://raw.githubusercontent.com/QUICK-GCP-LAB/2-Minutes-Labs-Solutions/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/main.tf

cd ..

terraform init

terraform fmt

terraform init

echo -e "mynet-us-vm\nmynetwork\n$ZONE" | terraform plan -var="instance_name=$(</dev/stdin)" -var="instance_network=$(</dev/stdin)" -var="instance_zone=$(</dev/stdin)"

echo -e "mynet-us-vm\nmynetwork\n$ZONE" | terraform apply -var="instance_name=$(</dev/stdin)" -var="instance_network=$(</dev/stdin)" -var="instance_zone=$(</dev/stdin)" --auto-approve

echo "${RED}${BOLD}Congratulations${RESET}" "${WHITE}${BOLD}for${RESET}" "${GREEN}${BOLD}Completing the Lab !!!${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#

# terraformstate
{
  "version": 4,
  "terraform_version": "1.3.3",
  "serial": 5,
  "lineage": "92e63ba6-4397-50cc-96f2-44e451c1a732",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "google_compute_firewall",
      "name": "mynetwork-allow-http-ssh-rdp-icmp",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "allow": [
              {
                "ports": [
                  "22",
                  "80",
                  "3389"
                ],
                "protocol": "tcp"
              },
              {
                "ports": [],
                "protocol": "icmp"
              }
            ],
            "creation_timestamp": "2022-11-14T03:52:40.095-08:00",
            "deny": [],
            "description": "",
            "destination_ranges": [],
            "direction": "INGRESS",
            "disabled": false,
            "enable_logging": null,
            "id": "projects/qwiklabs-gcp-02-c22a2b21b741/global/firewalls/mynetwork-allow-http-ssh-rdp-icmp",
            "log_config": [],
            "name": "mynetwork-allow-http-ssh-rdp-icmp",
            "network": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/global/networks/mynetwork",
            "priority": 1000,
            "project": "qwiklabs-gcp-02-c22a2b21b741",
            "self_link": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/global/firewalls/mynetwork-allow-http-ssh-rdp-icmp",
            "source_ranges": [
              "0.0.0.0/0"
            ],
            "source_service_accounts": null,
            "source_tags": null,
            "target_service_accounts": null,
            "target_tags": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "google_compute_network.mynetwork"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_network",
      "name": "mynetwork",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "auto_create_subnetworks": true,
            "delete_default_routes_on_create": false,
            "description": "",
            "enable_ula_internal_ipv6": false,
            "gateway_ipv4": "",
            "id": "projects/qwiklabs-gcp-02-c22a2b21b741/global/networks/mynetwork",
            "internal_ipv6_range": "",
            "mtu": 0,
            "name": "mynetwork",
            "project": "qwiklabs-gcp-02-c22a2b21b741",
            "routing_mode": "REGIONAL",
            "self_link": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/global/networks/mynetwork",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
        }
      ]
    },
    {
      "module": "module.mynet-eu-vm",
      "mode": "managed",
      "type": "google_compute_instance",
      "name": "vm_instance",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 6,
          "attributes": {
            "advanced_machine_features": [],
            "allow_stopping_for_update": null,
            "attached_disk": [],
            "boot_disk": [
              {
                "auto_delete": true,
                "device_name": "persistent-disk-0",
                "disk_encryption_key_raw": "",
                "disk_encryption_key_sha256": "",
                "initialize_params": [
                  {
                    "image": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-10-buster-v20221102",
                    "labels": {},
                    "size": 10,
                    "type": "pd-standard"
                  }
                ],
                "kms_key_self_link": "",
                "mode": "READ_WRITE",
                "source": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/zones/europe-west1-d/disks/mynet-eu-vm"
              }
            ],
            "can_ip_forward": false,
            "confidential_instance_config": [],
            "cpu_platform": "Intel Haswell",
            "current_status": "RUNNING",
            "deletion_protection": false,
            "description": "",
            "desired_status": null,
            "enable_display": false,
            "guest_accelerator": [],
            "hostname": "",
            "id": "projects/qwiklabs-gcp-02-c22a2b21b741/zones/europe-west1-d/instances/mynet-eu-vm",
            "instance_id": "8687487256826450661",
            "label_fingerprint": "42WmSpB8rSM=",
            "labels": null,
            "machine_type": "n1-standard-1",
            "metadata": null,
            "metadata_fingerprint": "3L0km5BCHws=",
            "metadata_startup_script": null,
            "min_cpu_platform": "",
            "name": "mynet-eu-vm",
            "network_interface": [
              {
                "access_config": [
                  {
                    "nat_ip": "34.78.113.148",
                    "network_tier": "PREMIUM",
                    "public_ptr_domain_name": ""
                  }
                ],
                "alias_ip_range": [],
                "ipv6_access_config": [],
                "ipv6_access_type": "",
                "name": "nic0",
                "network": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/global/networks/mynetwork",
                "network_ip": "10.132.0.2",
                "nic_type": "",
                "queue_count": 0,
                "stack_type": "IPV4_ONLY",
                "subnetwork": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/regions/europe-west1/subnetworks/mynetwork",
                "subnetwork_project": "qwiklabs-gcp-02-c22a2b21b741"
              }
            ],
            "project": "qwiklabs-gcp-02-c22a2b21b741",
            "reservation_affinity": [],
            "resource_policies": null,
            "scheduling": [
              {
                "automatic_restart": true,
                "instance_termination_action": "",
                "min_node_cpus": 0,
                "node_affinities": [],
                "on_host_maintenance": "MIGRATE",
                "preemptible": false,
                "provisioning_model": "STANDARD"
              }
            ],
            "scratch_disk": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/zones/europe-west1-d/instances/mynet-eu-vm",
            "service_account": [],
            "shielded_instance_config": [
              {
                "enable_integrity_monitoring": true,
                "enable_secure_boot": false,
                "enable_vtpm": true
              }
            ],
            "tags": null,
            "tags_fingerprint": "42WmSpB8rSM=",
            "timeouts": null,
            "zone": "europe-west1-d"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiNiJ9",
          "dependencies": [
            "google_compute_network.mynetwork"
          ]
        }
      ]
    },
    {
      "module": "module.mynet-us-vm",
      "mode": "managed",
      "type": "google_compute_instance",
      "name": "vm_instance",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 6,
          "attributes": {
            "advanced_machine_features": [],
            "allow_stopping_for_update": null,
            "attached_disk": [],
            "boot_disk": [
              {
                "auto_delete": true,
                "device_name": "persistent-disk-0",
                "disk_encryption_key_raw": "",
                "disk_encryption_key_sha256": "",
                "initialize_params": [
                  {
                    "image": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-10-buster-v20221102",
                    "labels": {},
                    "size": 10,
                    "type": "pd-standard"
                  }
                ],
                "kms_key_self_link": "",
                "mode": "READ_WRITE",
                "source": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/zones/us-central1-a/disks/mynet-us-vm"
              }
            ],
            "can_ip_forward": false,
            "confidential_instance_config": [],
            "cpu_platform": "Intel Haswell",
            "current_status": "RUNNING",
            "deletion_protection": false,
            "description": "",
            "desired_status": null,
            "enable_display": false,
            "guest_accelerator": [],
            "hostname": "",
            "id": "projects/qwiklabs-gcp-02-c22a2b21b741/zones/us-central1-a/instances/mynet-us-vm",
            "instance_id": "3444012086028374758",
            "label_fingerprint": "42WmSpB8rSM=",
            "labels": null,
            "machine_type": "n1-standard-1",
            "metadata": null,
            "metadata_fingerprint": "3L0km5BCHws=",
            "metadata_startup_script": null,
            "min_cpu_platform": "",
            "name": "mynet-us-vm",
            "network_interface": [
              {
                "access_config": [
                  {
                    "nat_ip": "34.135.106.210",
                    "network_tier": "PREMIUM",
                    "public_ptr_domain_name": ""
                  }
                ],
                "alias_ip_range": [],
                "ipv6_access_config": [],
                "ipv6_access_type": "",
                "name": "nic0",
                "network": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/global/networks/mynetwork",
                "network_ip": "10.128.0.2",
                "nic_type": "",
                "queue_count": 0,
                "stack_type": "IPV4_ONLY",
                "subnetwork": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/regions/us-central1/subnetworks/mynetwork",
                "subnetwork_project": "qwiklabs-gcp-02-c22a2b21b741"
              }
            ],
            "project": "qwiklabs-gcp-02-c22a2b21b741",
            "reservation_affinity": [],
            "resource_policies": null,
            "scheduling": [
              {
                "automatic_restart": true,
                "instance_termination_action": "",
                "min_node_cpus": 0,
                "node_affinities": [],
                "on_host_maintenance": "MIGRATE",
                "preemptible": false,
                "provisioning_model": "STANDARD"
              }
            ],
            "scratch_disk": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-c22a2b21b741/zones/us-central1-a/instances/mynet-us-vm",
            "service_account": [],
            "shielded_instance_config": [
              {
                "enable_integrity_monitoring": true,
                "enable_secure_boot": false,
                "enable_vtpm": true
              }
            ],
            "tags": null,
            "tags_fingerprint": "42WmSpB8rSM=",
            "timeouts": null,
            "zone": "us-central1-a"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiNiJ9",
          "dependencies": [
            "google_compute_network.mynetwork"
          ]
        }
      ]
    }
  ],
  "check_results": []
}

# variable.tf

variable "instance_name" {}
variable "instance_zone" {}
variable "instance_type" {
  default = "e2-micro"
}
variable "instance_network" {}

