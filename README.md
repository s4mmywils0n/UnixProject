# Automated Website Deployment with GNU/Linux Web Server

## Project Description

This project involves setting up a **GNU/Linux web server** on a **Virtual Private Server (VPS)** to automate the deployment of websites created during the **Internet Programming** course. The server will run **Debiam** and process web pages using **Nginx**. 

Every time a **commit** or **change** in the files is pushed to a **Git repository**, the website will be automatically updated. This eliminates the need to manually re-upload project files after every change, making it easier to design, test, and deploy updates to the website efficiently.

---

## Getting Started

### Prerequisites

Before starting, you will need:

- **A VPS running Ubuntu 20.04 or higher**:
  - You can use any VPS provider (e.g., **DigitalOcean**, **Linode**).
  - The server should have **SSH** access enabled for remote configuration.

- **A GitHub (or Git-based) repository**:
  - Store your website files in a Git repository for easy version control and automated deployment.

- **A domain name and access to DNS settings**:
  - Required for setting up **SSL certificates** using **Let’s Encrypt** for secure HTTPS.

---

## Steps to Install

### 1. Set Up the VPS

1. **Create a VPS instance** on **DigitalOcean** (or another VPS provider).
2. **Choose Ubuntu 20.04** as the operating system during setup.
3. **Access the VPS via SSH**:
   ```bash
   ssh username@your_server_ip
   ```
### 2. Install Dependencies
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
   Allow necessary ports through the firewall:

   ```bash
sudo ufw allow 'Nginx Full'
```
   Check the status of Nginx:

```bash

sudo systemctl status nginx
```
### 3. Create a Git Repository on the Server
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
### 4. Set Up the Deployment Script
Create a deploy.sh script that automates the deployment process, pulling the latest changes from the repository and restarting Nginx.

   Create the deploy.sh script:

```bash
sudo nano /var/www/html/deploy.sh
```
Add the following content to the script:

```bash
#!/bin/bash
```
# Change to the web root directory
cd /var/www/html

# Pull the latest changes from the Git repository
git pull origin main

# Restart Nginx to apply the changes
sudo systemctl restart nginx
Make the script executable:

bash
Copy
sudo chmod +x /var/www/html/deploy.sh
5. Configure Git Hook for Automated Deployment
Set up a post-receive Git hook to automatically deploy changes whenever changes are pushed to the repository.

Navigate to the Git hooks directory:

bash
Copy
cd /var/www/html/.git/hooks
Create the post-receive hook:

bash
Copy
sudo nano post-receive
Add the following content to the post-receive hook:

bash
Copy
#!/bin/bash

# Call the deploy script
/var/www/html/deploy.sh
Make the hook executable:

bash
Copy
sudo chmod +x /var/www/html/.git/hooks/post-receive
6. Push Changes to the Repository
Once the Git hook is set up, you can push changes to the repository, and the website will automatically be updated on the server.

Push changes from your local machine:

bash
Copy
git push origin main
The post-receive hook will trigger the deploy.sh script, pulling the latest changes and restarting Nginx.

7. Set Up SSL with Let’s Encrypt (Optional, but Recommended)
Install Certbot and Nginx plugin for SSL:

bash
Copy
sudo apt install certbot python3-certbot-nginx -y
Obtain an SSL certificate for your domain:

bash
Copy
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
Follow the prompts to complete the SSL setup.

Test SSL certificate renewal:

bash
Copy
sudo certbot renew --dry-run
Conclusion
This project automates the deployment of website updates using Git, Nginx, and Let’s Encrypt. Every time changes are pushed to the Git repository, the server automatically updates the website and restarts Nginx to serve the updated content.

With SSL set up via Let’s Encrypt, your website will also be securely served via HTTPS, ensuring encrypted communication.

Additional Notes
GitHub Repository: Make sure the repository is properly set up with all website files before deployment.

Nginx Configuration: Ensure Nginx is configured to serve the correct website files from /var/www/html.

SSL: Setting up SSL with Let’s Encrypt ensures that your website is served securely over HTTPS.
