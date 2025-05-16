# Installation Instructions for Automated Website Deployment with GNU/Linux Web Server

## Prerequisites

Before starting, ensure that you have:

- **A VPS running Debian 11 or 12** (e.g., **DigitalOcean**, **Linode**).
- **SSH access** to your server.
- **A GitHub (or Git-based) repository** for your website files.
- **A domain name** (for SSL setup with Let’s Encrypt).

---

## Software and Tools to Install

###  **Debian 11 or 12** (for the VPS)

- You will need a **Virtual Private Server** (VPS) with **Debian 11** or higher to run this project.
- You can use providers like:
  - **[DigitalOcean](https://www.digitalocean.com)**
  - **[Linode](https://www.linode.com)**

###  **Nginx** (Web Server)

- **Nginx** is a high-performance web server used to serve your website.
- Official website: **[Nginx](https://nginx.org)**

###  **Git** (Version Control)

- **Git** will allow you to clone and manage your website repository.
- Official website: **[Git](https://git-scm.com)**

### 6. **GitHub** (or Git-based Repository)

- **GitHub** (or any Git-based service) will store your website files, and allow you to update the server whenever you push changes.
- Official website: **[GitHub](https://github.com)**

---
### Steps to Install

## 1. Set Up the VPS

1. **Create a VPS instance** on **DigitalOcean** (or another VPS provider).
2. **Choose Ubuntu 20.04** as the operating system during setup.
3. **Access the VPS via SSH**:
   ```bash
   ssh username@your_server_ip
   ```
## 2. Install Dependencies
   Update the system:

   ```bash
   sudo apt update && sudo apt upgrade -y
```
   Install Nginx:
   ```bash
    sudo apt install nginx -y
```
   Install Git:

   ```bash
   sudo apt install git -y
```
   Check the status of Nginx:

```bash

sudo systemctl status nginx
```
## 3. Create a Git Repository on the Server
   Navigate to the web root:

```bash
cd /var/www/html
```
   Initialize a Git repository:

```bash
git init
```
   Clone your website repository from GitHub:

```bash
git clone https://github.com/yourusername/your-repository.git .
```
## 4. Set Up the Deployment Script
Create a deploy.sh script that automates the deployment process, pulling the latest changes from the repository and restarting Nginx.

   Create the deploy.sh script:
   
```bash
sudo nano /var/www/html/UnixProject/deploy.sh
```
Add the following content to the script:

```bash
#!/bin/bash
#Pull changes from the git repository
cd /var/www/html/UnixProject
git pull origin main
#Restart Nginx to apply changes
sudo systemctl restart ngninx
```
### Change to the web root directory
```
cd /var/www/html
```
### Pull the latest changes from the Git repository
```
git pull origin main
```
### Restart Nginx to apply the changes
```
sudo systemctl restart nginx
```
Make the script executable:

```
sudo chmod +x /var/www/html/deploy.sh
```

## 5. Configure Git Hook for Automated Deployment
Set up a post-receive Git hook to automatically deploy changes whenever changes are pushed to the repository.

Navigate to the Git hooks directory:

```bash
cd /var/www/html/.git/hooks
```
Create the post-receive hook:
```bash
 sudo nano /var/www/html/UnixProject/.git/hooks/post-receive
```
Add the following content to the post-receive hook:

```bash
#!/bin/bash
#Pull changes from the git repository
cd /var/www/html/UnixProject
git pull origin main
#Restart Nginx to apply changes
sudo systemctl restart ngninx
```
Make the hook executable:

```bash
sudo chmod +x /var/www/html/.git/hooks/post-receive
```

## 6. Push Changes to the Repository
Once the Git hook is set up, you can push changes to the repository, and the website will automatically be updated on the server.

Push changes from your local machine:

```bash
git push origin main
```
The post-receive hook will trigger the deploy.sh script, pulling the latest changes and restarting Nginx.

## Extra Feature
Firewall setup
Certbot configuration
Adding a Domain to replace ip address


