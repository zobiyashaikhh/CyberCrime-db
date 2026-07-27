# 🚔 CyberCrime Evidence Database Management System

A relational database management system built using **MySQL** to simulate how a cybercrime investigation department manages cases, suspects, seized devices, digital evidence, and forensic investigations.

---

## 📌 Project Overview

The CyberCrime Evidence Database Management System is designed to help investigators securely organize and manage digital forensic investigations. It stores information about cybercrime cases, assigned officers, suspects, seized devices, digital evidence, chain of custody, and investigation logs.

The project demonstrates database design, relational modelling, SQL querying, and data management using MySQL.

---

## 🎯 Objectives

- Store cybercrime investigation records.
- Maintain relationships between cases, officers, suspects, and evidence.
- Track digital evidence collected during investigations.
- Maintain a complete chain of custody.
- Generate useful reports using SQL queries.

---

## 🛠️ Technologies Used

- MySQL 8.0
- MySQL Workbench
- SQL
- Git
- GitHub
- VS Code

---

## 🗂️ Database Schema

The project consists of **7 relational tables**:

- Officers
- Cases
- Suspects
- Devices
- DigitalEvidence
- ChainOfCustody
- EvidenceLogs

---

## 🔗 Entity Relationships

- One Officer manages multiple Cases.
- One Case can have multiple Suspects.
- One Case can contain multiple Devices.
- One Device can contain multiple Digital Evidence files.
- One Evidence item can have multiple Chain of Custody records.
- One Evidence item can have multiple Investigation Logs.

---

## ✨ Features

- Manage cybercrime cases
- Track suspects
- Store seized devices
- Store digital forensic evidence
- Maintain evidence custody history
- Record investigation activities
- Execute analytical SQL queries

---

## 📊 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- AUTO_INCREMENT
- NOT NULL
- UNIQUE
- INSERT INTO
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- COUNT()
- INNER JOIN
- LEFT JOIN
- Window Functions (RANK)
- Views

---

## 📁 Project Structure

```
CyberCrime-Evidence-DB/
│
├── README.md
├── schema.sql
├── insert_data.sql
├── queries.sql
├── views.sql
├── er_diagram.png
└── screenshots/
```

---

## 📸 Screenshots

Add screenshots of:

- Database tables
- SQL queries
- Query outputs
- EER Diagram

---

## 🚀 Future Improvements

- Add stored procedures
- Add triggers
- Add indexes
- Implement user authentication
- Develop a web interface
- Create dashboards for investigators

---

## 👩‍💻 Author

**Zobiya Shaikh**

Second Year Computer Engineering Student

Built as a portfolio project to demonstrate SQL database design and relational database management.
