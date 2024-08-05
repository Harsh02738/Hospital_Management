CREATE DATABASE `hospital_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
use hospital_management_system;

CREATE TABLE `department` (
  `Department_ID` int NOT NULL,
  `Dept_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `doctor` (
  `Doctor_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `Age` int NOT NULL,
  `Qualification` mediumtext NOT NULL,
  `Address` longtext NOT NULL,
  `Phone_No` bigint NOT NULL,
  `Years_Of_Exp` int NOT NULL,
  PRIMARY KEY (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `inventory` (
  `Item_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Quantity` int NOT NULL,
  `Description` mediumtext NOT NULL,
  `Expiry_Date` datetime NOT NULL,
  `Department_ID1` int NOT NULL,
  PRIMARY KEY (`Item_ID`,`Department_ID1`),
  KEY `Department_ID1_idx` (`Department_ID1`),
  CONSTRAINT `Department_ID1` FOREIGN KEY (`Department_ID1`) REFERENCES `department` (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nurse` (
  `Nurse_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `Years_Of_Exp` int NOT NULL,
  `Qualification` mediumtext NOT NULL,
  PRIMARY KEY (`Nurse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `patient` (
  `Patient_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `Address` longtext NOT NULL,
  `Phone_No` bigint NOT NULL,
  `Insurance_ID` int NOT NULL,
  PRIMARY KEY (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pharmacy` (
  `Medicine_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Quantity` int NOT NULL,
  `Description` mediumtext NOT NULL,
  `Expiry_Date` datetime NOT NULL,
  PRIMARY KEY (`Medicine_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `prescription` (
  `Prescription_ID` int NOT NULL,
  `Description` mediumtext NOT NULL,
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  PRIMARY KEY (`Prescription_ID`),
  KEY `Doctor_ID_idx` (`Doctor_ID`),
  KEY `Patient_ID_idx` (`Patient_ID`),
  CONSTRAINT `Doctor_ID` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`),
  CONSTRAINT `Patient_ID` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `record` (
  `Record_ID` int NOT NULL,
  `Prescription_ID1` int NOT NULL,
  `Description` mediumtext NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Record_ID`),
  KEY `Prescription_ID2_idx` (`Prescription_ID1`),
  CONSTRAINT `Prescription_ID1` FOREIGN KEY (`Prescription_ID1`) REFERENCES `prescription` (`Prescription_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `requests` (
  `Appointment_ID` int NOT NULL,
  `Patient_ID4` int NOT NULL,
  `Time` datetime NOT NULL,
  `Department_ID3` int NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `Department_ID3_idx` (`Department_ID3`),
  KEY `Patient_ID4_idx` (`Patient_ID4`),
  CONSTRAINT `Department_ID3` FOREIGN KEY (`Department_ID3`) REFERENCES `department` (`Department_ID`),
  CONSTRAINT `Patient_ID4` FOREIGN KEY (`Patient_ID4`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `room` (
  `Room_No` int NOT NULL,
  `Price` int NOT NULL,
  `Status` enum('Available','Not Available') NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Nurse_ID` int NOT NULL,
  PRIMARY KEY (`Room_No`),
  KEY `Nurse_ID_idx` (`Nurse_ID`),
  CONSTRAINT `Nurse_ID` FOREIGN KEY (`Nurse_ID`) REFERENCES `nurse` (`Nurse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `settles` (
  `Bill_ID` int NOT NULL,
  `Patient_ID10` int NOT NULL,
  `Date` datetime NOT NULL,
  `ModeOfPayment` varchar(45) NOT NULL,
  PRIMARY KEY (`Bill_ID`),
  KEY `Patient_ID2_idx` (`Patient_ID10`),
  CONSTRAINT `Patient_ID10` FOREIGN KEY (`Patient_ID10`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `staff` (
  `Staff_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `works` (
  `Doctor_ID` int NOT NULL,
  `Department_ID2` int NOT NULL,
  `Position` varchar(45) NOT NULL,
  PRIMARY KEY (`Doctor_ID`),
  KEY `Department_ID2_idx` (`Department_ID2`),
  CONSTRAINT `Department_ID2` FOREIGN KEY (`Department_ID2`) REFERENCES `department` (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `lab` (
  `Lab_ID` int NOT NULL,
  `Cost` int NOT NULL,
  `Description` mediumtext NOT NULL,
  `Date` datetime NOT NULL,
  `Patient_ID8` int NOT NULL,
  PRIMARY KEY (`Lab_ID`),
  KEY `Patient_ID8_idx` (`Patient_ID8`),
  CONSTRAINT `Patient_ID8` FOREIGN KEY (`Patient_ID8`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `med_history` (
  `Record_ID` int NOT NULL,
  `Patient_ID7` int NOT NULL,
  PRIMARY KEY (`Record_ID`),
  KEY `Patient_ID7_idx` (`Patient_ID7`),
  CONSTRAINT `Patient_ID7` FOREIGN KEY (`Patient_ID7`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `feeback` (
  `Feedback_ID` int NOT NULL,
  `Description` mediumtext NOT NULL,
  `Date` datetime NOT NULL,
  `Appointment_ID2` int NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Appointment_ID2_idx` (`Appointment_ID2`),
  CONSTRAINT `Appointment_ID2` FOREIGN KEY (`Appointment_ID2`) REFERENCES `appointment` (`Appointment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `allots` (
  `Room_No` int NOT NULL,
  `Patient_ID9` int NOT NULL,
  `Staff_ID4` int NOT NULL,
  PRIMARY KEY (`Room_No`),
  KEY `Patient_ID5_idx` (`Patient_ID9`),
  KEY `Staff_ID2_idx` (`Staff_ID4`),
  CONSTRAINT `Patient_ID9` FOREIGN KEY (`Patient_ID9`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `Staff_ID4` FOREIGN KEY (`Staff_ID4`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `appointment` (
  `Appointment_ID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Doctor_ID2` int NOT NULL,
  `Staff_ID2` int NOT NULL,
  `Patient_ID2` int NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `Patient_ID_idx` (`Patient_ID2`),
  KEY `Doctor_ID_idx` (`Doctor_ID2`),
  KEY `Staff_ID_idx` (`Staff_ID2`),
  CONSTRAINT `Doctor_ID2` FOREIGN KEY (`Doctor_ID2`) REFERENCES `doctor` (`Doctor_ID`),
  CONSTRAINT `Patient_ID2` FOREIGN KEY (`Patient_ID2`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `Staff_ID2` FOREIGN KEY (`Staff_ID2`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `bill` (
  `Bill_ID` int NOT NULL,
  `Amount` int NOT NULL,
  `Status` enum('Yes','No') NOT NULL,
  `Description` mediumtext NOT NULL,
  `Date` datetime NOT NULL,
  `Staff_ID3` int NOT NULL,
  PRIMARY KEY (`Bill_ID`),
  KEY `Staff_ID3_idx` (`Staff_ID3`),
  CONSTRAINT `Staff_ID3` FOREIGN KEY (`Staff_ID3`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
