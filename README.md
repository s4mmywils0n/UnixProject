# UnixProject
This is where we're gonna store the code for our git work
Automated Website Deployment with GNU/Linux Web Server

Project Description

This project involves setting up a GNU/Linux web server on a Virtual Private Server (VPS) to automate the deployment of websites that we have made in our Internet Programming course this semester. The server is configured using Ubuntu and will process web pages through Nginx system. Every time a commit or change in the files is pushed to a Git repository, the website will be automatically updated with those changes. It will make it easier for designing and updating the website without having to re-upload the project files. 

Getting Started
	Prerequisites

1.A VPS running Ubuntu (20.04 or higher).
2.A GitHub (or Git-based) repository for the website files.
3.A domain name and access to DNS settings (for setting up SSL certificates with Let’s Encrypt).

Steps to Install

Set Up the VPS:
	Choose a VPS provider (e.g., DigitalOcean, Linode).
	Create an instance running Ubuntu 20.04.
	Access your server via SSH.

Install Dependencies:
	Update the system and install required software
	Install Nginx and ensure it is running
	Allow necessary ports through the firewall:

Create a Git Repository:
	Navigate to the web root and initialize a Git repository:
	Clone your website repository into the server:
Set Up Deployment Script:
	Create a deploy.sh script that pulls the latest changes and restarts Nginx:
	Make the script executable:
	
Configure Git Hook:
	Go to the Git hooks directory and create the post-receive hook:
	Make the hook executable:
  Push changes to the repository, and the post-receive hook will automatically trigger the deployment process, updating the 	website and restarting Nginx 
