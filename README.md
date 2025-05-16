# Automated Website Deployment with GNU/Linux Web Server

## Project Description

This project involves setting up a **GNU/Linux web server** on a **Virtual Private Server (VPS)** to automate the deployment of websites created during the **Internet Programming** course. The server will run **Debiam** and process web pages using **Nginx**. 

Every time a **commit** or **change** in the files is pushed to a **Git repository**, the website will be automatically updated. This eliminates the need to manually re-upload project files after every change, making it easier to design, test, and deploy updates to the website efficiently.

---

## Getting Started

Before starting, you will need:

- **A VPS running Ubuntu 20.04 or higher**:
  - You can use any VPS provider (e.g., **DigitalOcean**, **Linode**).
  - The server should have **SSH** access enabled for remote configuration.

- **A GitHub (or Git-based) repository**:
  - Store your website files in a Git repository for easy version control and automated deployment.

- **A domain name and access to DNS settings**:
  - Required for setting up **SSL certificates** using **Let’s Encrypt** for secure HTTPS.

---

This project automates the deployment of website updates using Git, Nginx, and Let’s Encrypt. Every time changes are pushed to the Git repository, the server automatically updates the website and restarts Nginx to serve the updated content.

With SSL set up via Let’s Encrypt, your website will also be securely served via HTTPS, ensuring encrypted communication.

Additional Notes
GitHub Repository: Make sure the repository is properly set up with all website files before deployment.

Nginx Configuration: Ensure Nginx is configured to serve the correct website files from /var/www/html.

SSL: Setting up SSL with Let’s Encrypt ensures that your website is served securely over HTTPS.
