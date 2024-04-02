# Multiple VPC Networks
# schedule
# 1 hour 10 minutes
# universal_currency_alt
# 5 Credits
# Lab instructions and tasks
# GSP211
# Overview
# Objectives
# Setup and requirements
# Task 1. Create custom mode VPC networks with firewall rules
# Task 2. Create VM instances
# Task 3. Explore the connectivity between VM instances
# Task 4. Create a VM instance with multiple network interfaces
# Congratulations!
# GSP211
# Google Cloud self-paced labs logo

# Overview
# Virtual Private Cloud (VPC) networks allow you to maintain isolated environments within a larger cloud structure, giving you granular control over data protection, network access, and application security.

# In this lab you create several VPC networks and VM instances, then test connectivity across networks. Specifically, you create two custom mode networks (managementnet and privatenet) with firewall rules and VM instances as shown in this network diagram:

# Network diagram

# The mynetwork network with its firewall rules and two VM instances (mynet-us-east4-vm and mynet-us-west1-vm) have already been created for you for this lab.

# Objectives
# In this lab, you will learn how to perform the following tasks:

# Create custom mode VPC networks with firewall rules
# Create VM instances using Compute Engine
# Explore the connectivity for VM instances across VPC networks
# Create a VM instance with multiple network interfaces
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

# student-03-5106bb4812b8@qwiklabs.net
# Copied!
# You can also find the Username in the Lab Details panel.

# Click Next.

# Copy the Password below and paste it into the Welcome dialog.

# cda3vuR8RavG
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
# When you are connected, you are already authenticated, and the project is set to your Project_ID, qwiklabs-gcp-01-6b9d37cc2a61. The output contains a line that declares the Project_ID for this session:

# Your Cloud Platform project in this session is set to qwiklabs-gcp-01-6b9d37cc2a61
# gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

# (Optional) You can list the active account name with this command:
# gcloud auth list
# Copied!
# Click Authorize.
# Output:

# ACTIVE: *
# ACCOUNT: student-03-5106bb4812b8@qwiklabs.net

# To set the active account, run:
#     $ gcloud config set account `ACCOUNT`
# (Optional) You can list the project ID with this command:
# gcloud config list project
# Copied!
# Output:

# [core]
# project = qwiklabs-gcp-01-6b9d37cc2a61
# Note: For full documentation of gcloud, in Google Cloud, refer to the gcloud CLI overview guide.
# Task 1. Create custom mode VPC networks with firewall rules
# Create two custom networks managementnet and privatenet, along with firewall rules to allow SSH, ICMP, and RDP ingress traffic.

# Create the managementnet network
# Create the managementnet network using the Cloud console.

# In the Cloud console, navigate to Navigation menu (Navigation menu icon) > VPC network > VPC networks.
# Navigation menu

# Notice the default and mynetwork networks with their subnets.

# Each Google Cloud project starts with the default network. In addition, the mynetwork network has been premade as part of your network diagram.

# Click Create VPC Network.

# Set the Name to managementnet.

# For Subnet creation mode, click Custom.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	managementsubnet-us-west1
# Region	us-west1
# IPv4 range	10.130.0.0/20
# Click Done.

# Click EQUIVALENT COMMAND LINE.
gcloud compute networks create managementnet --project=qwiklabs-gcp-01-6b9d37cc2a61 --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional
gcloud compute networks subnets create managementsubnet-us-west1 --project=qwiklabs-gcp-01-6b9d37cc2a61 --range=10.130.0.0/20 --stack-type=IPV4_ONLY --network=managementnet --region=us-west1


# These commands illustrate that networks and subnets can be created using the Cloud Shell command line. You will create the privatenet network using these commands with similar parameters.

# Click Close.

# Click Create.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created a managementnet network, you will see an assessment score.

# Create the managementnet network
# Create the privatenet network
# Create the privatenet network using the Cloud Shell command line.

# Run the following command to create the privatenet network:
# gcloud compute networks create privatenet --subnet-mode=custom
# Copied!
# Run the following command to create the privatesubnet-us-west1 subnet:
# gcloud compute networks subnets create privatesubnet-us-west1 --network=privatenet --region=us-west1 --range=172.16.0.0/24
# Copied!
# Run the following command to create the privatesubnet-us-east4 subnet:
# gcloud compute networks subnets create privatesubnet-us-east4 --network=privatenet --region=us-east4 --range=172.20.0.0/20
# Copied!
# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created a privatenet network, you will see an assessment score.

# Create the privatenet network
# Run the following command to list the available VPC networks:
# gcloud compute networks list
# Copied!
# The output should look like this:

# NAME: default
# SUBNET_MODE: AUTO
# BGP_ROUTING_MODE: REGIONAL
# IPV4_RANGE:
# GATEWAY_IPV4:

# NAME: managementnet
# SUBNET_MODE: CUSTOM
# BGP_ROUTING_MODE: REGIONAL
# IPV4_RANGE:
# GATEWAY_IPV4:

# ...
# Note: default and mynetwork are auto mode networks, whereas, managementnet and privatenet are custom mode networks. Auto mode networks create subnets in each region automatically, while custom mode networks start with no subnets, giving you full control over subnet creation
# Run the following command to list the available VPC subnets (sorted by VPC network):
# gcloud compute networks subnets list --sort-by=NETWORK
# Copied!
# The output should look like this:

# NAME: default
# REGION: us-west1
# NETWORK: default
# RANGE: 10.128.0.0/20
# STACK_TYPE: IPV4_ONLY
# IPV6_ACCESS_TYPE:
# INTERNAL_IPV6_PREFIX:
# EXTERNAL_IPV6_PREFIX:

# ...
# Note: As expected, the default and mynetwork networks have subnets in each region (__zones/regions may changes as per lab's requirements)__ as they are auto mode networks. The managementnet and privatenet networks only have the subnets that you created as they are custom mode networks .
# In the Cloud console, navigate to Navigation menu > VPC network > VPC networks.
# You see that the same networks and subnets are listed in the Cloud console.
# Create the firewall rules for managementnet
# Create firewall rules to allow SSH, ICMP, and RDP ingress traffic to VM instances on the managementnet network.

# In the Cloud console, navigate to Navigation menu (Navigation menu icon) > VPC network > Firewall.

# Click + Create Firewall Rule.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	managementnet-allow-icmp-ssh-rdp
# Network	managementnet
# Targets	All instances in the network
# Source filter	IPv4 Ranges
# Source IPv4 ranges	0.0.0.0/0
# Protocols and ports	Specified protocols and ports, and then check tcp, type: 22, 3389; and check Other protocols, type: icmp.
# Note: Make sure to include the /0 in the Source IPv4 ranges to specify all networks.
# Click EQUIVALENT COMMAND LINE.

# These commands illustrate that firewall rules can also be created using the Cloud Shell command line. You will create the privatenet's firewall rules using these commands with similar parameters.

# Click Close.

# Click Create.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created firewall rules for managementnet network, you will see an assessment score.

# Create the firewall rules for managementnet
# Create the firewall rules for privatenet
# Create the firewall rules for privatenet network using the Cloud Shell command line.

# In Cloud Shell, run the following command to create the privatenet-allow-icmp-ssh-rdp firewall rule:
# gcloud compute firewall-rules create privatenet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=privatenet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0
# Copied!
# The output should look like this:

# Creating firewall...done.
# NAME: privatenet-allow-icmp-ssh-rdp
# NETWORK: privatenet
# DIRECTION: INGRESS
# PRIORITY: 1000
# ALLOW: icmp,tcp:22,tcp:3389
# DENY:
# DISABLED: False
# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created firewall rules for privatenet network, you will see an assessment score.

# Create the firewall rules for privatenet
# Run the following command to list all the firewall rules (sorted by VPC network):
# gcloud compute firewall-rules list --sort-by=NETWORK
# Copied!
# The output should look like this:

# NAME: default-allow-icmp
# NETWORK: default
# DIRECTION: INGRESS
# PRIORITY: 65534
# ALLOW: icmp
# DENY:
# DISABLED: False

# NAME: default-allow-internal
# NETWORK: default
# DIRECTION: INGRESS
# PRIORITY: 65534
# ALLOW: tcp:0-65535,udp:0-65535,icmp
# DENY:
# DISABLED: False

# ...
# The firewall rules for mynetwork network have been created for you. You can define multiple protocols and ports in one firewall rule (privatenet and managementnet), or spread them across multiple rules (default and mynetwork).

# In the Cloud console, navigate to Navigation menu > VPC network > Firewall.
# You see that the same firewall rules are listed in the Cloud console.
# Task 2. Create VM instances
# Create two VM instances:

# managementsubnet-us-west1-vm in managementsubnet-us-west1
# privatesubnet-us-west1-vm in privatesubnet-us-west1
# Create the managementnet-us-west1-vm instance
# Create the managementnet-us-west1-vm instance using the Cloud console.

# In the Cloud console, navigate to Navigation menu > Compute Engine > VM instances.

# The mynet-us-east4-vm and mynet-us-west1-vm has been created for you, as part of your network diagram.

# Click Create instance.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	managementnet-us-west1-vm
# Region	us-west1
# Zone	us-west1-b
# Series	E2
# Machine type	e2-micro
# From Advanced options, click Networking, Disks, Security, Management, Sole-tenancy dropdown.

# Click Networking.

# For Network interfaces, click the dropdown to edit.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Network	managementnet
# Subnetwork	managementsubnet-us-west1
# Click Done.

# Click EQUIVALENT CODE.

# This illustrate that VM instances can also be created using the Cloud Shell command line. You will create the privatenet-us-west1-vm instance using these commands with similar parameters.

# Click Create.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created VM instance in managementnet network, you will see an assessment score.

# Create the managementnet-us-west1-vm instance
# Create the privatenet-us-west1-vm instance
# Create the privatenet-us-west1-vm instance using the Cloud Shell command line.

# In Cloud Shell, run the following command to create the privatenet-us-west1-vm instance:
# gcloud compute instances create privatenet-us-west1-vm --zone=us-west1-b --machine-type=e2-micro --subnet=privatesubnet-us-west1
# Copied!
# The output should look like this:

# Created [https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-04-972c7275ce91/zones/"us-west1-b"/instances/privatenet-us-west1-vm].
# NAME: privatenet-us-west1-vm
# ZONE: us-west1-b
# MACHINE_TYPE: e2-micro
# PREEMPTIBLE:
# INTERNAL_IP: 172.16.0.2
# EXTERNAL_IP: 34.135.195.199
# STATUS: RUNNING
# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created VM instance in privatenet network, you will see an assessment score.

# Create the privatenet-us-west1-vm instance
# Run the following command to list all the VM instances (sorted by zone):
# gcloud compute instances list --sort-by=ZONE
# Copied!
# The output should look like this:

# NAME: mynet-us-east4-vm
# ZONE: us-east4-a
# MACHINE_TYPE: e2-micro
# PREEMPTIBLE:
# INTERNAL_IP: 10.164.0.2
# EXTERNAL_IP: 34.147.23.235
# STATUS: RUNNING

# NAME: mynet-us-west1-vm
# ZONE: us-west1-b
# MACHINE_TYPE: e2-micro
# PREEMPTIBLE:
# INTERNAL_IP: 10.128.0.2
# EXTERNAL_IP: 35.232.221.58
# STATUS: RUNNING
# ...
# In the Cloud console, navigate to Navigation menu (Navigation menu icon) > Compute Engine > VM instances.

# You see that the VM instances are listed in the Cloud console.

# Click on Column display options, then select Network. Click Ok.

# There are three instances in us-west1 and one instance in us-east4. However, these instances are spread across three VPC networks (managementnet, mynetwork and privatenet), with no instance in the same zone and network as another. In the next section, you explore the effect this has on internal connectivity.

# Task 3. Explore the connectivity between VM instances
# Explore the connectivity between the VM instances. Specifically, determine the effect of having VM instances in the same zone versus having instances in the same VPC network.

# Ping the external IP addresses
# Ping the external IP addresses of the VM instances to determine if you can reach the instances from the public internet.

# In the Cloud console, navigate to Navigation menu > Compute Engine > VM instances.

# Note the external IP addresses for mynet-us-east4-vm, managementnet-us-west1-vm, and privatenet-us-west1-vm.

# For mynet-us-west1-vm, click SSH to launch a terminal and connect.

# To test connectivity to mynet-us-east4-vm's external IP, run the following command, replacing mynet-us-east4-vm's external IP:

#  ping -c 3 'Enter mynet-us-east4-vm external IP here'
# Copied!
# This should work!

# To test connectivity to managementnet-us-west1-vm's external IP, run the following command, replacing managementnet-us-west1-vm's external IP:
#  ping -c 3 'Enter managementnet-us-west1-vm external IP here'
# Copied!
# This should work!

# To test connectivity to privatenet-us-west1-vm's external IP, run the following command, replacing privatenet-us-west1-vm's external IP:
# ping -c 3 'Enter privatenet-us-west1-vm external IP here'
# Copied!
# This should work!

# Note: You are able to ping the external IP address of all VM instances, even though they are either in a different zone or VPC network. This confirms public access to those instances is only controlled by the ICMP firewall rules that you established earlier.
# Ping the internal IP addresses
# Ping the internal IP addresses of the VM instances to determine if you can reach the instances from within a VPC network.

# In the Cloud console, navigate to Navigation menu > Compute Engine > VM instances.
# Note the internal IP addresses for mynet-us-east4-vm, managementnet-us-west1-vm, and privatenet-us-west1-vm.
# Return to the SSH terminal for mynet-us-west1-vm.
# To test connectivity to mynet-us-east4-vm's internal IP, run the following command, replacing mynet-us-east4-vm's internal IP:
# ping -c 3 'Enter mynet-us-east4-vm internal IP here'
# Copied!
# Note: You are able to ping the internal IP address of mynet-us-east4-vm because it is on the same VPC network as the source of the ping (mynet-us-west1-vm), even though both VM instances are in separate zones, regions and continents!
# To test connectivity to managementnet-us-west1-vm's internal IP, run the following command, replacing managementnet-us-west1-vm's internal IP:
# ping -c 3 'Enter managementnet-us-west1-vm internal IP here'
# Copied!
# Note: This should not work as indicated by a 100% packet loss!
# To test connectivity to privatenet-us-west1-vm's internal IP, run the following command, replacing privatenet-us-west1-vm's internal IP:
# ping -c 3 'Enter privatenet-us-west1-vm internal IP here'
# Copied!
# Note: This should not work either as indicated by a 100% packet loss! You are unable to ping the internal IP address of managementnet-us-west1-vm and privatenet-us-west1-vm because they are in separate VPC networks from the source of the ping (mynet-us-west1-vm), even though they are all in the same region us-west1.
# VPC networks are by default isolated private networking domains. However, no internal IP address communication is allowed between networks, unless you set up mechanisms such as VPC peering or VPN.

# Note: For the below task consider region_1 = us-west1 and region_2 = us-east4`

# Which instance(s) should you be able to ping from mynet-region_1-vm using internal IP addresses?

# privatenet-region_1-vm

# managementnet-region_1-vm

# mynet-region_2-vm

# Task 4. Create a VM instance with multiple network interfaces
# Every instance in a VPC network has a default network interface. You can create additional network interfaces attached to your VMs. Multiple network interfaces enable you to create configurations in which an instance connects directly to several VPC networks (up to 8 interfaces, depending on the instance's type).

# Create the VM instance with multiple network interfaces
# Create the vm-appliance instance with network interfaces in privatesubnet-us-west1, managementsubnet-us-west1 and mynetwork. The CIDR ranges of these subnets do not overlap, which is a requirement for creating a VM with multiple network interface controllers (NICs).

# In the Cloud console, navigate to Navigation menu > Compute Engine > VM instances.

# Click Create instance.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Name	vm-appliance
# Region	us-west1
# Zone	us-west1-b
# Series	E2
# Machine type	e2-standard-4
# Note: The number of interfaces allowed in an instance is dependent on the instance's machine type and the number of vCPUs. The e2-standard-4 allows up to 4 network interfaces. Refer to the Maximum number of network interfaces section of the Google Cloud Guide for more information.
# From Advanced options, click Networking, Disks, Security, Management, Sole-tenancy dropdown.

# Click Networking.

# For Network interfaces, click the dropdown to edit.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Network	privatenet
# Subnetwork	privatesubnet-us-west1
# Click Done.

# Click Add a network interface.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Network	managementnet
# Subnetwork	managementsubnet-us-west1
# Click Done.

# Click Add a network interface.

# Set the following values, leave all other values at their defaults:

# Property	Value (type value or select option as specified)
# Network	mynetwork
# Subnetwork	mynetwork
# Click Done.

# Click Create.

# Test Completed Task
# Click Check my progress to verify your performed task. If you have successfully created VM instance with multiple network interfaces, you will see an assessment score.

# Create a VM instance with multiple network interfaces
# Explore the network interface details
# Explore the network interface details of vm-appliance within the Cloud console and within the VM's terminal.

# In the Cloud console, navigate to Navigation menu (Navigation menu icon) > Compute Engine > VM instances.
# Click nic0 within the Internal IP address of vm-appliance to open the Network interface details page.
# Verify that nic0 is attached to privatesubnet-us-west1, is assigned an internal IP address within that subnet (172.16.0.0/24), and has applicable firewall rules.
# Click nic0 and select nic1.
# Verify that nic1 is attached to managementsubnet-us-west1, is assigned an internal IP address within that subnet (10.130.0.0/20), and has applicable firewall rules.
# Click nic1 and select nic2.
# Verify that nic2 is attached to mynetwork, is assigned an internal IP address within that subnet (10.128.0.0/20), and has applicable firewall rules.
# Note: Each network interface has its own internal IP address so that the VM instance can communicate with those networks.
# In the Cloud console, navigate to Navigation menu > Compute Engine > VM instances.
# For vm-appliance, click SSH to launch a terminal and connect.
# Run the following, to list the network interfaces within the VM instance:
# sudo ifconfig
# Copied!
# The output should look like this:

# eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1460
#         inet 172.16.0.3  netmask 255.255.255.255  broadcast 172.16.0.3
#         inet6 fe80::4001:acff:fe10:3  prefixlen 64  scopeid 0x20<link>
#         ether 42:01:ac:10:00:03  txqueuelen 1000  (Ethernet)
#         RX packets 626  bytes 171556 (167.5 KiB)
#         RX errors 0  dropped 0  overruns 0  frame 0
#         TX packets 568  bytes 62294 (60.8 KiB)
#         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
# eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1460
#         inet 10.130.0.3  netmask 255.255.255.255  broadcast 10.130.0.3
#         inet6 fe80::4001:aff:fe82:3  prefixlen 64  scopeid 0x20<link>
#         ether 42:01:0a:82:00:03  txqueuelen 1000  (Ethernet)
#         RX packets 7  bytes 1222 (1.1 KiB)
#         RX errors 0  dropped 0  overruns 0  frame 0
#         TX packets 17  bytes 1842 (1.7 KiB)
#         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
# eth2: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1460
#         inet 10.128.0.3  netmask 255.255.255.255  broadcast 10.128.0.3
#         inet6 fe80::4001:aff:fe80:3  prefixlen 64  scopeid 0x20<link>
#         ether 42:01:0a:80:00:03  txqueuelen 1000  (Ethernet)
#         RX packets 17  bytes 2014 (1.9 KiB)
#         RX errors 0  dropped 0  overruns 0  frame 0
#         TX packets 17  bytes 1862 (1.8 KiB)
#         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
# Note: The sudo ifconfig command lists a Linux VM's network interfaces along with the internal IP addresses for each interface.
# Explore the network interface connectivity
# Demonstrate that the vm-appliance instance is connected to privatesubnet-us-west1, managementsubnet-us-west1 and mynetwork by pinging VM instances on those subnets.

# In the Cloud console, navigate to Navigation menu > Compute Engine > VM instances.
# Note the internal IP addresses for privatenet-us-west1-vm, managementnet-us-west1-vm, mynet-us-west1-vm, and mynet-us-east4-vm.
# Return to the SSH terminal for vm-appliance.
# To test connectivity to privatenet-us-west1-vm's internal IP, run the following command, replacing privatenet-us-west1-vm's internal IP:
# ping -c 3 'Enter privatenet-us-west1-vm's internal IP here'
# Copied!
# This works!

# Repeat the same test by running the following:
# ping -c 3 privatenet-us-west1-vm
# Copied!
# Note: You are able to ping privatenet-us-west1-vm by its name because VPC networks have an internal DNS service that allows you to address instances by their DNS names rather than their internal IP addresses. When an internal DNS query is made with the instance hostname, it resolves to the primary interface (nic0) of the instance. Therefore, this only works for privatenet-us-west1-vm in this case.
# To test connectivity to managementnet-us-west1-vm's internal IP, run the following command, replacing managementnet-us-west1-vm's internal IP:
# ping -c 3 'Enter managementnet-us-west1-vm's internal IP here'
# Copied!
# This works!

# To test connectivity to mynet-us-west1-vm's internal IP, run the following command, replacing mynet-us-west1-vm's internal IP:
# ping -c 3 'Enter mynet-us-west1-vm's internal IP here'
# Copied!
# This works!

# To test connectivity to mynet-us-east4-vm's internal IP, run the following command, replacing mynet-us-east4-vm's internal IP:
# ping -c 3 'Enter mynet-us-east4-vm's internal IP here'
# Copied!
# Note: This does not work! In a multiple interface instance, every interface gets a route for the subnet that it is in. In addition, the instance gets a single default route that is associated with the primary interface eth0. Unless manually configured otherwise, any traffic leaving an instance for any destination other than a directly connected subnet will leave the instance via the default route on eth0.
# To list the routes for vm-appliance instance, run the following command:
# ip route
# Copied!
# The output should look like this:

# default via 172.16.0.1 dev eth0
# 10.128.0.0/20 via 10.128.0.1 dev eth2
# 10.128.0.1 dev eth2 scope link
# 10.130.0.0/20 via 10.130.0.1 dev eth1
# 10.130.0.1 dev eth1 scope link
# 172.16.0.0/24 via 172.16.0.1 dev eth0
# 172.16.0.1 dev eth0 scope link
# Note: The primary interface eth0 gets the default route (default via 172.16.0.1 dev eth0), and all three interfaces eth0, eth1 and eth2 get routes for their respective subnets. Since, the subnet of mynet-us-east4-vm (10.132.0.0/20) is not included in this routing table, the ping to that instance leaves vm-appliance on eth0 (which is on a different VPC network). You could change this behavior by configuring policy routing as documented in the Configuring policy routing section of the Google Cloud Guide.
# Congratulations!
# In this lab you created a VM instance with three network interfaces and verified internal connectivity for VM instances that are on the subnets that are attached to the multiple interface VM.

# You also explored the default network along with its subnets, routes, and firewall rules. You then created tested connectivity for a new auto mode VPC network.

# Next steps / Learn more
# To learn more about VPC networking, see Using VPC Networks.

# Google Cloud training and certification
# ...helps you make the most of Google Cloud technologies. Our classes include technical skills and best practices to help you get up to speed quickly and continue your learning journey. We offer fundamental to advanced level training, with on-demand, live, and virtual options to suit your busy schedule. Certifications help you validate and prove your skill and expertise in Google Cloud technologies.

# Manual last updated April 02, 2024

# Lab last tested April 02, 2024

# Copyright 2024 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.

