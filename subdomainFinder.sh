#!/bin/bash

# Function to display a refined loading animation with lolcat
loading_animation() {
    local pid=$1
    local message=$2
    local delay=0.2
    local spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧")

    echo -n "$message " | lolcat
    
    # Loop while the process is running
    while [ "$(ps a | awk '{print $1}' | grep -w $pid)" ]; do
        for i in "${!spinner[@]}"; do
            printf "\r%s %s" "${spinner[$i]}" "$message" | lolcat
            sleep $delay
        done
    done

    # Clear the spinner once done
    echo -e "\r${message} Done!" | lolcat
}

# Display header with figlet
figlet "W@ππ|0π" | lolcat

# Target domain input with improved handling
read -e -p "Enter the target domain: " targetDomain

# Remove any leading or trailing whitespace
targetDomain=$(echo "$targetDomain" | xargs)

# Define output directory in the current user's Desktop folder
output_dir="$HOME/Desktop/$targetDomain"
mkdir -p "$output_dir"

# Start the subdomain enumeration tools in the background
(subfinder -d $targetDomain -silent; assetfinder --subs-only $targetDomain) > "$output_dir/combined_subdomains.txt" &
pid_enum=$!

# Display loading animation for subdomain enumeration
loading_animation $pid_enum "Finding Subdomains..."

# Sort and deduplicate the results
sort "$output_dir/combined_subdomains.txt" | uniq > "$output_dir/sorted_combined_subdomains.txt"
mv "$output_dir/sorted_combined_subdomains.txt" "$output_dir/combined_subdomains.txt"

# Run httprobe to check which subdomains are live
echo "Start Checking Live Subdomains...." | lolcat
(cat "$output_dir/combined_subdomains.txt" | httprobe > "$output_dir/live_subdomains.txt") &
pid_probe=$!

# Display loading animation for live subdomain checking
loading_animation $pid_probe "Checking Live Subdomains..."

# Remove the combined_subdomains.txt file after checking live subdomains
rm "$output_dir/combined_subdomains.txt"

# Rename live_subdomains.txt to target domain name
mv "$output_dir/live_subdomains.txt" "$output_dir/$targetDomain.txt"

# Display completion message
echo "Subdomain Finding and Live Subdomain Checking completed." | lolcat
echo "Live subdomains saved to $output_dir/$targetDomain.txt" | lolcat
