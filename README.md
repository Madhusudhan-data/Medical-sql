# Medical Data History

This repository contains the project files, environment configurations, and analytical SQL scripts for the Medical Data History project.

## 📁 Repository Contents

* **`Dockerfile`**: The container configuration file used to set up and initialize the local MySQL database environment[cite: 3].
* **`queries.sql`**: A complete set of 35 commented SQL queries covering data filtering, aggregation, string manipulation, joins, and conditional logic.
* **`Medical_data_History_Project_Report.docx`**: The formal project document containing the challenges report and complete SQL script[cite: 3].

---
## 🚀 Getting Started with Docker

To build and run the local MySQL environment using Docker:
1. Build the Docker image:
   ```bash
   docker build -t medical-sql-env .
2. Run the MySQL container:
   ```bash
   docker run --name medical-mysql -d -p 3306:3306 medical-sql-env .
----
🛠️ Summary of Challenges Faced
Environment Compatibility & Extension Routing in VS Code: Resolved shortcut and file-linking conflicts between multiple database extensions (SQLTools vs. MSSQL) by configuring explicit default runners and connection bindings.

Container Port Mapping & Authentication Mismatch: Cleared Docker bridge mismatch errors and modern MySQL authentication plugin rejections by setting standard environmental credentials (MYSQL_ROOT_PASSWORD) and explicit port routing.

Remote User Permission Restrictions: Documented and understood read-only policy constraints (UPDATE command denied) when connecting to shared cloud academic servers (projects.datamites.com).
