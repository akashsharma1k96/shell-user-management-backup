#!/bin/bash
# user_mgmt_backup.sh
# Script for user management and backup in Linux

# ----------------------
# Variables
# ----------------------
BACKUP_DIR="backups"
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/script.log"

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

# ----------------------
# Functions
# ----------------------

# Logging helper
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Add user
add_user() {
    read -p "Enter username to add: " username
    if id "$username" &>/dev/null; then
        log "User $username already exists."
        echo "User already exists."
    else
        sudo useradd -m "$username"
        sudo passwd "$username"
        log "User $username created."
        echo "User $username created."
    fi
}

# Delete user
delete_user() {
    read -p "Enter username to delete: " username
    if id "$username" &>/dev/null; then
        read -p "Are you sure you want to delete $username? (y/n): " confirm
        if [[ "$confirm" == "y" ]]; then
            sudo userdel -r "$username"
            log "User $username deleted."
            echo "User $username deleted."
        else
            echo "Operation cancelled."
        fi
    else
        echo "User does not exist."
    fi
}

# List users (normal accounts)
list_users() {
    log "Listed users."
    awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd
}

# Backup directory
backup_directory() {
    read -p "Enter directory to backup: " dir
    if [[ -d "$dir" ]]; then
        filename="$BACKUP_DIR/backup_$(basename $dir)_$(date +%F_%H-%M-%S).tar.gz"
        tar -czf "$filename" "$dir"
        log "Backup created for $dir at $filename"
        echo "Backup created: $filename"
    else
        echo "Directory does not exist."
    fi
}

# Restore backup
restore_backup() {
    read -p "Enter backup file path to restore: " file
    read -p "Enter destination directory: " dest
    if [[ -f "$file" ]]; then
        mkdir -p "$dest"
        tar -xzf "$file" -C "$dest"
        log "Backup $file restored to $dest"
        echo "Backup restored to $dest"
    else
        echo "Backup file not found."
    fi
}

# Show logs
show_logs() {
    if [[ -f "$LOG_FILE" ]]; then
        tail -n 20 "$LOG_FILE"
    else
        echo "No logs yet."
    fi
}

# Help menu
usage() {
    echo "Usage: $0 {adduser|deluser|listusers|backup|restore|logs}"
}

# ----------------------
# Main
# ----------------------
case "$1" in
    adduser) add_user ;;
    deluser) delete_user ;;
    listusers) list_users ;;
    backup) backup_directory ;;
    restore) restore_backup ;;
    logs) show_logs ;;
    *) usage ;;
esac
