#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'  # Reset to default color

#Function to display total CPU usage
function cpu_usage {
    echo -e "${CYAN}==================== Total CPU Usage ====================${RESET}"
    
    #Here we read the first line of /proc/stat to get CPU usage
    read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
    
    #Here we calculate total and used CPU time
    total=$((user + nice + system + idle + iowait + irq + softirq + steal))
    used=$((user + nice + system + irq + softirq + steal))
    
    #Here we calculate CPU usage percentage
    cpu_usage_percentage=$((100 * used / total))
    
    echo "Cpu Usage Percentage: ${cpu_usage_percentage}%"
}

#Function to display total memory usage
function memory_usage {
    echo -e "${CYAN}==================== Total Memory Usage ====================${RESET}"
    #Here we use free to get memory usage and format the output
    free -h | awk 'NR==2{printf "Used: %s (%.2f%%)\nFree: %s\n", $3, $3*100/$2, $4}'
}

#Function to display total disk usage
function disk_usage {
    echo -e "${CYAN}==================== Total Disk Usage ====================${RESET}"
    #Here we use df to get disk usage and format the output for the root filesystem
    df -h | awk '$NF=="/"{printf "Used: %s (%.2f%%)\nFree: %s\n", $3, $3*100/$2, $4}'
}

#Function to display top 5 processes by CPU usage
function top_cpu_processes {
    echo -e "${CYAN}==================== Top 5 Processes by CPU Usage ====================${RESET}"
    #Here we use ps to list processes sorted by CPU usage
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
}

#Function to display top 5 processes by memory usage
function top_memory_processes {
    echo -e "${CYAN}==================== Top 5 Processes by Memory Usage ====================${RESET}"
    #Here we use ps to list processes sorted by memory usage
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
}

#Function to display additional stats
function additional_stats {
    echo -e "${CYAN}==================== Additional Stats ====================${RESET}"
    #Here we get OS version
    echo -e "${GREEN}OS Version: ${RESET}$(lsb_release -d | cut -f2-)" 
    #Here we get system uptime
    echo -e "${GREEN}Uptime: ${RESET}$(uptime -p)"
    #Here we get load average (system load)
    echo -e "${GREEN}Load Average: ${RESET}$(cat /proc/loadavg | awk '{print $1, $2, $3}')"
    #Here we count logged in users
    logged_in_users=$(who | awk '{print $1}' | sort | uniq)
    echo -e "${GREEN}Logged in Users: ${RESET}$(who | wc -l)"
    echo -e "${GREEN}Usernames: ${RESET}${logged_in_users}"
    #Here we count failed login attempts
    echo -e "${GREEN}Failed Login Attempts: ${RESET}$(grep 'Failed password' /var/log/auth.log | wc -l)"
}

#Main script execution
echo -e "${YELLOW}==================== Server Performance Stats ====================${RESET}"
cpu_usage          #Here we call the function to display CPU usage
memory_usage       #Here we call the function to display memory usage
disk_usage         #Here we call the function to display disk usage
top_cpu_processes  #Here we call the function to display top CPU processes
top_memory_processes #Here we call the function to display top memory processes
additional_stats   #Here we call the function to display additional stats
echo -e "${YELLOW}==================================================================${RESET}"
