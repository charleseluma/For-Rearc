### This is for Rearc ###
Details of each file in my repo
index.html - Contains the content of my html page
main.tf - Contains the script used for provisioning my environment on AWS
nodeconfig4http - Has the script used for setting up the http page
nodeconfig4https - Has the script used for setting up the https page


 --- **How I went about this challenge** --- THe Mnaul Way:(
STEP 1 - Created my AWS environment with Terraform
STEP 2 - Maually installed Node.js on my EC2
STEP 3 - Created 2 projects on node, one for the HHTP and HTTPS respectively
STEP 4 - Created a self signed certificate using node
STEP 5 - Rendered both sites with nodejs
STEP 6 - Load balance both pages with Node


--- **WHAT I WILL LOVE TO DO IF I HAD TIME** --- The Sustanable way to go :)
STEP 1 - Pull down a nodejs image in docker and configure the image to do the below steps
STEP 2 - Created 2 projects on node, one for the HHTP and HTTPS respectively
STEP 3 - Created a self signed certificate using node
STEP 4 - Render both sites with nodejs
STEP 5 - Load balance both pages with Node
STEP 6 - Create my own docker container off the node I pulled from docker
STEP 7 - Upload the image to my repo on Docker Hub
STEP 8 - Created my AWS environment with Terraform and have it pull down my node image from Docker Hub

My Final thoughts, from a sustanable and repeatble perspective, the 2nd option is what makes DevOps work!
