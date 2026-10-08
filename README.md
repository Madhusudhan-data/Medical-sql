# PRCE-001 Medical Data History

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
