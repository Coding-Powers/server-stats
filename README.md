# Server Performance Stats Script

## Overview

`server-stats.sh` is a Bash script that gets **Server Performance Stats** on any Linux server. It provides essential information about CPU, memory, disk usage, and the top processes consuming resources.

## Features

The script outputs the following statistics:

- **Total CPU Usage**: Displays the percentage of CPU currently in use.
- **Total Memory Usage**: Shows used and free memory, including the percentage of memory used.
- **Total Disk Usage**: Provides information on used and free disk space, including the percentage of disk used.
- **Top 5 Processes by CPU Usage**: Lists the top five processes consuming the most CPU resources.
- **Top 5 Processes by Memory Usage**: Lists the top five processes consuming the most memory resources.
- **OS Version**: Displays the operating system version running on the server.
- **System Uptime**: Shows how long the server has been running since the last reboot.
- **Load Average**: Provides the system load averages for the last 1, 5, and 15 minutes, indicating the demand on the system.
- **Logged-in Users**: Counts the number of users currently logged into the system.
- **Failed Login Attempts**: Counts the number of failed login attempts recorded in the authentication logs.

## Requirements

- A Linux server
- Bash shell
- Basic Linux utilities (e.g., `awk`, `ps`, `df`, `free`, `who`, `uptime`, `grep`)

## Usage

1. **Clone the repository or download the script:**
   ```bash
   git clone https://github.com/Coding-Powers/server-stats.git
   cd server-stats/
   ```
2. **Make the script executable:**
   ```bash
   chmod +x server-stats.sh
   ```
3. **Run the script:**
   ```bash
   ./server-stats.sh
   ```
## Reference:
```
https://roadmap.sh/projects/server-stats
```
