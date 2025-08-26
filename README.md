# 🐚 Shell Script for User Management and Backup in Linux

A Bash script to automate basic **user management** and **directory backup/restore** in Linux.  
This project demonstrates Linux commands, shell scripting, and logging, making it a practical example for sysadmin tasks.

---

## 🔹 Features

- **User Management**
  - Add new users
  - Delete users (with confirmation)
  - List existing users (normal accounts only)

- **Backup & Restore**
  - Create timestamped backups of directories (`.tar.gz`)
  - Restore backups to a chosen location
  - Automatically creates `backups/` folder for storage

- **Logging**
  - All actions are logged in `logs/script.log`
  - Automatically creates `logs/` folder

---

## ⚡ Requirements

- Linux or Linux-like environment (WSL, Ubuntu, etc.)
- Bash shell
- `tar`, `passwd`, `useradd`, `userdel` commands

---

## 🚀 Getting Started

1. **Clone the repository**
```bash
 git clone https://github.com/akashsharma1k96/shell-user-management-backup.git
 cd shell-user-management-backup
```
2. **Make the script executable**
```bash
chmod +x user_mgmt_backup.sh
 ```
   
3. **Run the script with commands**
  * **Add a new user**
    ```bash
    ./user_mgmt_backup.sh adduser
     ```
* **Delete a user**
   ```bash
   ./user_mgmt_backup.sh deluser
     ```
* **List users**
   ```bash
   ./user_mgmt_backup.sh listusers
      ```
* **Backup a directory**
   ```bash
   ./user_mgmt_backup.sh backup
      ```
* **Restore a backup**
   ```bash
   ./user_mgmt_backup.sh restore
      ```
* **View recent logs**
   ```bash
    ./user_mgmt_backup.sh logs
   
      
## 🗂 Directory Structure
```
shell-user-management-backup/
├── user_mgmt_backup.sh   # Main shell script
├── README.md             # This documentation
├── .gitignore            # Ignore backups and logs
├── backups/              # Automatically created by script
└── logs/                 # Automatically created by script
```

