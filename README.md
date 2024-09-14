## Introduction
The Subdomain Finder Tools Combination script simplifies and automates the process of discovering subdomains and checking for live services. It leverages multiple tools to maximize subdomain discovery, offering a combined and deduplicated list of subdomains and an efficient way to probe for live ones.

## Why Use This Script?
**Efficient and fast:** Runs Subfinder and Assetfinder in parallel to discover as many subdomains as possible.

**Probes for live subdomains:** Uses Httprobe to quickly identify which subdomains are active.
Organized output: Saves results in a directory named after your target domain for easy management.

**Enhanced visual experience:** Features colorful loading animations and stylized text using Lolcat and Figlet.






# Installation Instructions

## Prerequisites
- [Go](https://golang.org/doc/install) (version 1.17 or higher)

## Installing Subfinder, Assetfinder, and Httprobe

You can install the required tools using the provided `setup.sh` script.

### Steps:
      git clone https://github.com/313-warrior/Subdomain-Finder-Tools-Combination.git
      cd Subdomain-Finder-Tools-Combination
      chmod +x setup.sh  subdomainFinder.sh
      ./setup.sh
      ./subdomainFinder.sh
   
      
### Usage
- Once the setup is complete, you can run the Bash script as follows:

- Navigate to the repository directory.

      ./subdomain_finder.sh
**When prompted, enter the target domain you want to scan:**

      Enter the target domain: example.com





## Author: Ubayda Stevenson
