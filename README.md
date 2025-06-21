# 🏥 Hospital Management System – DBMS Project

A comprehensive **Hospital Management System** (HMS) built as part of a university-level DBMS course using **MySQL** and **Java Swing**. This project aims to streamline healthcare administration and operations through efficient database design and software integration.

---

## 👨‍💻 Technologies Used

- **Database**: MySQL / Oracle SQL Server
- **Frontend**: Java Swing
- **Backend**: Java
- **Environment**: MySQL Workbench or compatible IDE

---

## 📚 Table of Contents

- [Project Description](#project-description)
- [Functional Requirements](#functional-requirements)
- [ER Diagram & Database Schema](#er-diagram--database-schema)
- [SQL Implementation](#sql-implementation)
- [Sample Complex Queries](#sample-complex-queries)

---

## 📖 Project Description

In modern hospitals, manual administrative processes lead to inefficiencies and delays. The HMS solves this by digitizing:

- Patient record keeping
- Doctor scheduling
- Billing
- Room allotment
- Inventory & Pharmacy management

This project emphasizes **security**, **scalability**, and **data integrity** using relational design principles.

---

## ✅ Functional Requirements

1. **User Authentication**
   - Secure login for patients, doctors, and staff

2. **Patient-Doctor Interaction**
   - Schedule appointments
   - View medical records
   - Issue prescriptions

3. **Appointment & Room Management**
   - Doctor/staff approval flow
   - Efficient room allocation

4. **Billing System**
   - Transparent charges for rooms, labs, medication
   - Insurance processing

5. **Inventory & Pharmacy**
   - Medicine tracking, stock alerts
   - Lab supplies and equipment database

6. **Prescription & Lab Results**
   - E-prescription generation
   - Integrated lab report management

7. **Feedback Mechanism**
   - Patient satisfaction & review tracking

---

## 🗃️ ER Diagram & Database Schema

### 🧱 Key Entities:
- **Doctor** (`Doctor_ID`, `Name`, `Qualification`, etc.)
- **Patient** (`Patient_ID`, `Insurance_ID`, etc.)
- **Room**, **Nurse**, **Staff**, **Bill**, **Appointment**
- **Pharmacy**, **Inventory**, **Lab**, **Record**, **Feedback`
- **Department**, **Prescription`

### 🔄 Relationships:
- `works(Doctor_ID, Department_ID)`
- `allots(Room_No, Patient_ID, Staff_ID)`
- `settles(Bill_ID, Patient_ID)`
- `med_history(Record_ID, Patient_ID)`
- `requests(Appointment_ID, Patient_ID, Department_ID)`

---

## 🛠️ SQL Implementation

### 📌 Table Creation:
```sql
CREATE TABLE doctor (
  Doctor_ID INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Gender ENUM('Male', 'Female', 'Others') NOT NULL,
  Age INT NOT NULL,
  Qualification MEDIUMTEXT,
  Address LONGTEXT,
  Phone_No BIGINT,
  Years_Of_Exp INT
);

