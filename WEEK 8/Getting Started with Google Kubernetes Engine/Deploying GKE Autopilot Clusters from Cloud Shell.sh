# Deploying GKE Autopilot Clusters from Cloud Shell
# experiment
# Lab
# schedule
# 1 hour
# universal_currency_alt
# 1 Credit
# show_chart
# Introductory
# Overview
# In this lab, you use the command line to build GKE clusters. You inspect the kubeconfig file, and you use kubectl to manipulate the cluster.

# Objectives
# In this lab, you learn how to perform the following tasks:

# Use kubectl to build and manipulate GKE clusters
# Use kubectl and configuration files to deploy Pods
# Use Container Registry to store and deploy containers
# Lab setup
# Access Qwiklabs
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

# After you complete the initial sign-in steps, the project dashboard appears.

# Project dashboard tabbed page

# Open Cloud Shell
# You will do most of the work in Cloud Shell. Cloud Shell is a command-line environment running in Google Cloud. This Debian-based virtual machine is loaded with all the management tools you need (such as docker, gcloud,gsutil, and kubectl) and provides a persistent 5GB home directory.

# On the Google Cloud console title bar, click Activate Cloud Shell (Activate cloud shell icon).
# Click Continue.
# After a moment of provisioning, the Cloud Shell prompt appears:

# Cloud Shell prompt displaying the message: Welcome to Cloud Shell! Type "help" to get started.

# Task 1. Deploy GKE clusters
# In this task, you use Cloud Shell to deploy GKE clusters.

# In Cloud Shell, type the following command to set the environment variable for the zone and cluster name:
# export my_region=us-west1
# export my_cluster=autopilot-cluster-1
# Copied!
# In Cloud Shell, type the following command to create a Kubernetes cluster. If prompted, click Authorize:
# gcloud container clusters create-auto $my_cluster --region $my_region
# Copied!
# This form of the command sets most options to their defaults. To view the entire set of possible options, refer to the gcloud container clusters create reference.

# You will see a number of warnings highlighting changes to default GKE cluster settings that were introduced as newer versions of Kubernetes have been adopted by GKE.

# Note: You need to wait a few minutes for the cluster deployment to complete.
# When deployment is complete, the Google Cloud console Kubernetes Engine > Clusters page should look like this screenshot:

# Kubernetes Clusters page displaying details such as location, cluster size, total cores, and total memory for autopilot-cluster-1

# Click Check my progress to verify the objective.
# Deploy GKE clusters

# Task 2. Connect to a GKE cluster
# In this task, you use Cloud Shell to authenticate to a GKE cluster and then inspect the kubectl configuration files.

# Authentication in Kubernetes applies both to communicating with the cluster from an external client through the kube-APIserver running on the master and to cluster containers communicating within the cluster or externally.

# In Kubernetes, authentication can take several forms. For GKE, authentication is typically handled with OAuth2 tokens and can be managed through Cloud Identity and Access Management across the project as a whole and, optionally, through role-based access control which can be defined and configured within each cluster.

# In GKE, cluster containers can use service accounts to authenticate to and access external resources.

# Note: For Kubernetes versions before 1.12, client certificates and basic authentication are not disabled by default. These are lower security methods of authentication and should be disabled to increase cluster security. (For versions 1.12 and later, both of these methods are disabled by default.)
# To create a kubeconfig file with the credentials of the current user (to allow authentication) and provide the endpoint details for a specific cluster (to allow communicating with that cluster through the kubectl command-line tool), execute the following command:
# gcloud container clusters get-credentials $my_cluster --region $my_region
# Copied!
# This command creates a .kube directory in your home directory if it doesn't already exist. In the .kube directory, the command creates a file named config if it doesn't already exist, which is used to store the authentication and configuration information. The config file is typically called the kubeconfig file.

# Open the kubeconfig file with the nano text editor:
# nano ~/.kube/config
# Copied!
# You can now examine all of the authentication and endpoint configuration data stored in the file. Information for the cluster should appear. The information was populated during cluster creation.

# Press CTRL+X to exit the nano editor.
# Note: The kubeconfig file can contain information for many clusters. The currently active context (the cluster that kubectl commands manipulate) is indicated by the current-context property.
# You don't have to run the gcloud container clusters get-credentials command to populate the kubeconfig file for clusters that you created in the same context (the same user in the same environment), because those clusters already have their details populated when the cluster is created.
# But you do have to run the command to connect to a cluster created by another user or in another environment. The command is also an easy way to switch the active context to a different cluster.
# Task 3. Use kubectl to inspect a GKE cluster
# In this task, you use Cloud Shell and kubectl to inspect a GKE cluster.

# After the kubeconfig file is populated and the active context is set to a particular cluster, you can use the kubectl command-line tool to execute commands against the cluster. Most such commands ultimately trigger a REST API call against the master API server, which triggers the associated action.

# In Cloud Shell, execute the following command to print out the content of the kubeconfig file:
# kubectl config view
# Copied!
# The sensitive certificate data is replaced with DATA+OMITTED.

# In Cloud Shell, execute the following command to print out the cluster information for the active context:
# kubectl cluster-info
# Copied!
# The output describes the active context cluster.

# Output:

# Kubernetes control plane is running at https://34.133.211.75
# GLBCDefaultBackend is running at https://34.133.211.75/api/v1/namespaces/kube-system/services/default-http-backend:http/proxy
# KubeDNS is running at https://34.133.211.75/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
# KubeDNSUpstream is running at https://34.133.211.75/api/v1/namespaces/kube-system/services/kube-dns-upstream:dns/proxy
# Metrics-server is running at https://34.133.211.75/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

# To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
# In Cloud Shell, execute the following command to print out the active context:
# kubectl config current-context
# Copied!
# A line of output indicates the active context cluster.

# Output:

# gke_qwiklabs-gcp-01-9ce11ae39cc2_us-west1_autopilot-cluster-1
# PROJECT_ID is your project ID. This information is the same as the information in the current-context property of the kubeconfig file.

# In Cloud Shell, execute the following command to print out some details for all the cluster contexts in the kubeconfig file:
# kubectl config get-contexts
# Copied!
# Several lines of output indicate details about the cluster you created and indicate which is the active context cluster. In general, this command lists some details of the clusters present in the user's kubeconfig file, including any other clusters that were created by the user as well as any manually added to the kubeconfig file.

# In Cloud Shell, execute the following command to change the active context:
# kubectl config use-context gke_${DEVSHELL_PROJECT_ID}_us-west1_autopilot-cluster-1
# Copied!
# In this case you have only one cluster, so this command didn't change anything.

# However, in the future you may have more than one cluster in a project. You can use this approach to switch the active context when your kubeconfig file has the credentials and configuration for several clusters already populated. This approach requires the full name of the cluster, which includes the gke prefix, the project ID, the location, and the display name, all concatenated with underscores.

# In Cloud Shell, execute the following command to enable bash autocompletion for kubectl:
# source <(kubectl completion bash)
# Copied!
# This command produces no output.

# In Cloud Shell, type kubectl followed by a space and press the Tab key twice.
# The shell outputs all the possible commands:

# Cloud shell displaying all possible output commands

# In Cloud Shell, type kubectl co and press the Tab key twice.
# The shell outputs all commands starting with "co" (or any other text you type).

# Cloud shell displaying all output commands starting with co, such as completion, convert, config, and cordon

# Task 4. Deploy Pods to GKE clusters
# In this task, you use Cloud Shell to deploy Pods to GKE clusters.

# Use kubectl to deploy Pods to GKE
# Kubernetes introduces the abstraction of a Pod to group one or more related containers as a single entity to be scheduled and deployed as a unit on the same node. You can deploy a Pod that is a single container from a single container image. Or a Pod can contain many containers from many container images.

# In Cloud Shell, execute the following command to deploy nginx as a Pod named nginx-1:
# kubectl create deployment --image nginx nginx-1
# Copied!
# This command creates a Pod named nginx with a container running the nginx image. When a repository isn't specified, the default behavior is to try to find the image either locally or in the Docker public registry. In this case, the image is pulled from the Docker public registry.

# In Cloud Shell, execute the following command to view all the deployed Pods in the active context cluster:
# kubectl get pods
# Copied!
# The output should look like the following example, but with a slightly different Pod name.

# Note:If you see a message that the server is currently unable to handle the request, wait for the deployment to finish and become ready.
# Output:


# NAME                       READY     STATUS    RESTARTS   AGE
# nginx-1-74c7bbdb84-nvwsc   1/1       Running   0          2m52s
# In Cloud Shell, execute the following command to view the resource usage across the nodes of the cluster:
# kubectl top nodes
# Copied!
# The output should look like the following example.

# Output:

# NAME                                                 CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
# gk3-autopilot-cluster-1-pool-2-7246ae0e-4q7s          1971m       102%    1803Mi          30%       
# Note: If you receive an error as metrics not available yet, re-run the above command.
# Another top command (kubectl top pods) shows similar information across all the deployed Pods in the cluster.

# You will now enter your Pod name into a variable that we will use throughout this lab. Using variables like this can help you minimize human error when typing long names. You must type your Pod's unique name in place of [your_pod_name]:
# export my_nginx_pod=[your_pod_name]
# Copied!
# Example:


# export my_nginx_pod=nginx-1-74c7bbdb84-nvwsc
# Confirm that you have set the environment variable successfully by having the shell echo the value back to you:
# echo $my_nginx_pod
# Copied!
# Output:


# nginx-1-74c7bbdb84-nvwsc
# In Cloud Shell, execute the following command to view the complete details of the Pod you just created:
# kubectl describe pod $my_nginx_pod
# Copied!
# The output should look like the following example. Details of the Pod, as well as its status and conditions and the events in its lifecycle, are displayed.

# Output:


#     Image:          nginx
#     Image:          nginx
#     Image:          nginx
#     Image ID:       docker.io/library/nginx@sha256:480868e8c8c797794257e2abd88d0f9a8809b2fe956cbfbc05dcc0bca1f7cd43
#     Port:           
#     Host Port:      
#     State:          Running
#       Started:      Wed, 17 May 2023 10:47:04 +0000
#     Ready:          True
#     Restart Count:  0
#     Limits:
#       cpu:                500m
#       ephemeral-storage:  1Gi
#       memory:             2Gi
#     Requests:
#       cpu:                500m
#       ephemeral-storage:  1Gi
#       memory:             2Gi
#     Environment:          
#     Mounts:
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ksxxr (ro)
# Conditions:
#   Type              Status
#   Initialized       True
#   Ready             True
#   ContainersReady   True
#   PodScheduled      True
# Volumes:
#   kube-api-access-ksxxr:
#     Type:                    Projected (a volume that contains injected data from multiple sources)
#     TokenExpirationSeconds:  3607
#     ConfigMapName:           kube-root-ca.crt
#     ConfigMapOptional:       
#     DownwardAPI:             true
# QoS Class:                   Guaranteed
# Node-Selectors:              
# Tolerations:                 kubernetes.io/arch=amd64:NoSchedule
#                              node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                              node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
# Events:
#   Type     Reason            Age    From                                   Message
#   ----     ------            ----   ----                                   -------
#   Warning  FailedScheduling  5m42s  gke.io/optimize-utilization-scheduler  0/2 nodes are available: 2 Insufficient cpu, 2 Insufficient memory. preemption: 0/2 nodes are available: 2 No preemption victims found for incoming pod.
#   Normal   Scheduled         4m15s  gke.io/optimize-utilization-scheduler  Successfully assigned default/nginx-1-6b7bff9fc7-t7fzk to gk3-autopilot-cluster-1-pool-1-242a3a6a-j9rh
#   Normal   TriggeredScaleUp  5m34s  cluster-autoscaler                     pod triggered scale-up: [{https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-02-92c260add90a/zones/us-west1-c/instanceGroups/gk3-autopilot-cluster-1-pool-1-242a3a6a-grp 0->1 (max: 1000)}]
#   Normal   Pulling           3m30s  kubelet                                Pulling image "nginx"
#   Normal   Pulled            3m16s  kubelet                                Successfully pulled image "nginx" in 13.843394735s (13.843643782s including waiting)
#   Normal   Created           3m16s  kubelet                                Created container nginx
#   Normal   Started           3m15s  kubelet                                Started container nginx
# Push a file into a container
# To be able to serve static content through the nginx web server, you must create and place a file into the container.

# In Cloud Shell, type the following commands to open a file named test.html in the nano text editor:
# nano ~/test.html
# Copied!
# Add the following text (shell script) to the empty test.html file:
#  This is title
#  Hello world 
# Copied!
# Press CTRL+X, then press Y and enter to save the file and exit the nano editor.

# In Cloud Shell, execute the following command to place the file into the appropriate location within the nginx container in the nginx Pod to be served statically:

# kubectl cp ~/test.html $my_nginx_pod:/usr/share/nginx/html/test.html
# Copied!
# This command copies the test.html file from the local home directory to the /usr/share/nginx/html directory of the first container in the nginx Pod. You can specify other containers in a multi-container Pod by using the -c option, followed by the name of the container.

# Expose the Pod for testing
# A service is required to expose a Pod to clients outside the cluster. Services are discussed elsewhere in the course and used extensively in other labs. You can use a simple command to create a service to expose a Pod.

# In Cloud Shell, execute the following command to create a service to expose our nginx Pod externally:
# kubectl expose pod $my_nginx_pod --port 80 --type LoadBalancer
# Copied!
# This command creates a LoadBalancer service, which allows the nginx Pod to be accessed from internet addresses outside of the cluster.

# In Cloud Shell, execute the following command to view details about services in the cluster:
# kubectl get services
# Copied!
# The output should look like the following example. You use the external IP address in the next step.

# Note: You might have to repeat the command a few times before the new service has its external IP populated.
# Output:


# NAME             TYPE          CLUSTER-IP    EXTERNAL-IP  PORT(S)      AGE
# kubernetes       ClusterIP     10.11.240.1          443/TCP       1h
# nginx-1-7...wsc  LoadBalancer  10.11.240.87      80:31695/TCP  3s
# The Kubernetes service is one of the default services created or used by the cluster. The nginx service that you created is also displayed.

# You may need to re-run this command several times before the external IP address is displayed.

# Output:


# NAME             TYPE         CLUSTER-IP   EXTERNAL-IP    PORT(S)     AGE
# kubernetes       ClusterIP    10.11.240.1           443/TCP      1h
# nginx-1-7...wsc  LoadBalancer 10.11.240.87 104.154.177.46 80:31695/TCP 1m
# Click Check my progress to verify the objective.
# Deploy Pods to GKE clusters

# In Cloud Shell, execute the following command to verify that the nginx container is serving the static HTML file that you copied.
# You replace [EXTERNAL_IP] with the external IP address of your service that you obtained from the output of the previous step.

# curl http://[EXTERNAL_IP]/test.html
# Copied!
# The file contents appear in the output. You can go to the same address in your browser to see the file rendered as HTML.

# Example:


# curl http://104.154.177.46/test.html

#  This is title
#  Hello world 
# In Cloud Shell, execute the following command to view the resources being used by the nginx Pod:
# kubectl top pods
# Copied!
# Output:


# NAME                       CPU(cores)   MEMORY(bytes)
# nginx-1-74c7bbdb84-nvwsc   0m           2Mi
# Task 5. Introspect GKE Pods
# In this task, you connect to a Pod to adjust settings, edit files, and make other live changes to the Pod.

# Note: Use this process only when troubleshooting or experimenting. Because the changes you make are not made to the source image of the Pod, they won't be present in any replicas.
# Prepare the environment
# The preferred way of deploying Pods and other resources to Kubernetes is through configuration files, which are sometimes called manifest files. Configuration files are typically written in the YAML syntax, specifying the details of the resource. With configuration files, you can more easily specify complex options than with a long line of command-line arguments.

# YAML syntax is similar to, but more concise than, JSON syntax and it enables the same kind of hierarchical structuring of objects and properties. The source repository for the lab contains sample YAML files that have been prepared for you.

# In Cloud Shell, enter the following command to clone the repository to the lab Cloud Shell:
# git clone https://github.com/GoogleCloudPlatform/training-data-analyst
# Copied!
# Create a soft link as a shortcut to the working directory:
# ln -s ~/training-data-analyst/courses/ak8s/v1.1 ~/ak8s
# Copied!
# Change to the directory that contains the sample files for this lab:
# cd ~/ak8s/GKE_Shell/
# Copied!
# A sample manifest YAML file for a Pod called new-nginx-pod.yaml has been provided for you:

# apiVersion: v1
# kind: Pod
# metadata:
#   name: new-nginx
#   labels:
#     name: new-nginx
# spec:
#   containers:
#   - name: new-nginx
#     image: nginx
#     ports:
#     - containerPort: 80
# To deploy your manifest, execute the following command:
# kubectl apply -f ./new-nginx-pod.yaml
# Copied!
# Note: You may need to wait a few minutes for the pod deployment to complete and the status change to running.
# Click Check my progress to verify the objective.
# Deploy a new pod using a Yaml file

# To see a list of Pods, execute the following command:
# kubectl get pods
# Copied!
# The output should look like the example.

# Output:


# NAME                       READY     STATUS    RESTARTS   AGE
# new-nginx                  1/1       Running   0          9s
# nginx-1-74c7bbdb84-nvwsc   1/1       Running   0          55m
# You can see your new nginx Pod as well as the one we created earlier in the lab.

# Use shell redirection to connect to a Pod
# Some container images include a shell environment that you can launch. This shell environment might be more convenient than executing individual commands with kubectl. For instance, the nginx image includes a bash shell. In this task you use shell redirection to connect to the bash shell in your new nginx pod to carry out a sequence of actions.

# In Cloud Shell, execute the following command to start an interactive bash shell in the nginx container:
# kubectl exec -it new-nginx -- /bin/bash
# Copied!
# A new shell prompt appears.

# Output:


# root@new-nginx:/#
# You have started an interactive bash shell in the container of the new-nginx Pod. If the Pod had several containers, you could specify one by name with the -c option.

# Because the nginx container image has no text editing tools by default, you need to install one.

# In Cloud Shell, in the nginx bash shell, execute the following commands to install the nano text editor:
# apt-get update
# apt-get install nano
# Copied!
# When prompted with Do you want to continue (Y/n), press Y to confirm.

# You need to create a test.html file in the static served directory on the nginx container.

# In Cloud Shell, in the nginx bash shell, execute the following commands to switch to the static files directory and create a test.html file:
# cd /usr/share/nginx/html
# nano test.html
# Copied!
# In Cloud Shell, in the nginx bash shell nano session, type the following text:
#  This is title
#  Hello world 
# Copied!
# Press CTRL+X, then press Y and enter to save the file and exit the nano editor.
# In Cloud Shell, in the nginx bash shell, execute the following command to exit the nginx bash shell:
# exit
# Copied!
# To connect to and test the modified nginx container (with the new static HTML file), you could create a service. An easier way is to use port forwarding to connect to the Pod directly from Cloud Shell.

# In Cloud Shell, execute the following command to set up port forwarding from Cloud Shell to the nginx Pod (from port 10081 of the Cloud Shell VM to port 80 of the nginx container):
# kubectl port-forward new-nginx 10081:80
# Copied!
# The output should look like the example.

# Output:


# Forwarding from 127.0.0.1:10081 -> 80
# Forwarding from [::1]:10081 -> 80
# This is a foreground process, so you need to open another Cloud Shell instance to test.

# In the Cloud Shell menu bar, click the plus sign (+) icon to start a new Cloud Shell session.
# (+) icon highlighted in the Cloud Shell menu bar

# A second Cloud Shell session appears in your Cloud Shell window. You can switch between sessions by clicking the titles in the menu bar.

# In the second Cloud Shell session, execute the following command to test the modified nginx container through the port forwarding:
# curl http://127.0.0.1:10081/test.html
# Copied!
# The HTML text you placed in the test.html file is displayed.

#  This is title
#  Hello world 
# View the logs of a Pod
# In the Cloud Shell menu bar, click the plus sign (+) icon to start another new Cloud Shell session.
# A third Cloud Shell session appears in your Cloud Shell window. As before, you can switch sessions by clicking them in the menu bar.

# In the third Cloud Shell window, execute the following command to display the logs and to stream new logs as they arrive (and also include timestamps) for the new-nginx Pod:
# kubectl logs new-nginx -f --timestamps
# Copied!
# You will see the logs display in this new window.
# Return to the second Cloud Shell window and re-run the curl command to generate some traffic on the Pod.
# Review the additional log messages as they appear in the third Cloud Shell window.
# Third Cloud Shell window displaying additional log messages

# Close the third Cloud Shell window to stop displaying the log messages.
# Close the original Cloud Shell window to stop the port forwarding process.
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

