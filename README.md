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
