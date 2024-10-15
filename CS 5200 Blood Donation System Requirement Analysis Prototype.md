# CS 5200 Blood Donation System Requirement Analysis Prototype



## ***Functional Dependency and Corresponding Explanation***

1. `Admin`: unique volunteerID, username and password

   I would say volunteerID could be an auto-increment surrogate key, and the username must be unique.

   $\underline{volunteerID }\rightarrow (username, password)$.

   ```mysql
   CREATE TABLE ADMIN (
       volunteerID INTEGER AUTO_INCREMENT PRIMARY KEY,
       username VarChar(25), 
       psswrd VarChar(30)
   );
   ```

2. `Blood_Group`: unique bloodGroupID, blood type

   $\underline{bloodGroupID}\rightarrow (bloodType)$;

   ```mysql
   CREATE TABLE BLOOD_GROUP (
       bloodGroupID INTEGER AUTO_INCREMENT PRIMARY KEY,
       bloodType VarChar(20)
   );
   ```
   
   ```
   CREATE TABLE CUSTOMER(
   CustomerID INTEGER NOT NULL AUTO_INCREMENT,
   Title CHAR(35) NOT NULL,
   Copy CHAR(12) NOT NULL,
   Medium char(35) NULL,
   Description VARCHAR(1000) NULL DEFAULT 'Unknown provenance',
   ArtistID INTEGER NOT NULL,
   CONSTRAINT WorkPK PRIMARY KEY(WorkID), 
   CONSTRAINT WorkAK1 UNIQUE(Title, Copy),
   CONSTRAINT ArtistFK FOREIGN KEY(ArtistID) REFERENCES ARTIST(ArtistID)
   )ENGINE=InnoDB AUTO_INCREMENT 500;
   
   
   ```
   
   
   
3. `Donor`: unique donorID, name, address, phone, gender, age, and other details like email, blood type, medical history

   $\underline{donorID }\rightarrow (name, address, phone, email, gender, age, blood type, medical history)$;

   ```mysql
   CREATE TABLE DONOR (
       donorID INTEGER AUTO_INCREMENT PRIMARY KEY,
       name VarChar(25), 
       gender VarChar(15),
       age INTEGER,
       address VarChar(46), # USPS
       phone VarChar(30),
       email VarChar(31), # AI says 31 chars meet 95% requirement
       bloodType VarChar(20),
       medicalHistory VarChar(150),
       FOREIGN KEY (bloodType) REFERENCES (BLOOD_GROUP)
   );
   ```

   

4. `Blood_Group_Receiver`: weak entity, patientID refers to `PATIENT` table, BloodType, received.

   $\underline{patientID }\rightarrow (bloodType, received)$;

   ```mysql
   CREATE TABLE DONOR (
       patientID INTEGER PRIMARY KEY,
       bloodType VarChar(20),
       received INTEGER DEFAULT 0,
       FOREIGN KEY (patientID) REFERENCES (PATIENT),
       FOREIGN KEY (bloodType) REFERENCES (BLOOD_GROUP)
   );
   ```

   

5. `Blood_Bag`: unique bagID, a dateOfIssue (the date blood had been donated) and a dateOfUse

   $\underline{bagID }\rightarrow (dateOfIssue, dateOfUse, bloodType, available )$;

   ```mysql
   CREATE TABLE BLOOD_BAG (
       bagID INTEGER AUTO_INCREMENT PRIMARY KEY,
       dateOfIssue DATETIME,
       dateOfUse DATETIME,
       bloodType VarChar(20),
       available INTEGER DEFAULT 1,
       FOREIGN KEY (bloodType) REFERENCES (BLOOD_GROUP)
   );
   ```

   

6. `Inventory`: Unique ID, address

   $\underline{inventoryID }\rightarrow (address, bagID)$;

   ```mysql
   CREATE TABLE INVENTORY (
       inventoryID INTEGER AUTO_INCREMENT PRIMARY KEY,
       address VarChar(46),
       bagID INTEGER,
       FOREIGN KEY (bagID) REFERENCES (BLOOD_BAG)    
   );
   ```

   

7. `Hospital`: Unique hospitalID, name, address

   $\underline{hospitalID }\rightarrow (name, address)$;

   ```mysql
   CREATE TABLE HOSPITAL (
       hospitalID INTEGER AUTO_INCREMENT PRIMARY KEY,
       name VarChar(50),
       address VarChar(46)
   );
   ```

   

8. `Patient`: unique patientID, his name, and the reason for admission along with the severity for admission

   $\underline{patientID }\rightarrow (name, RFA, SFA, hospitalID)$;

   ```mysql
   CREATE TABLE PATIENT (
       patientID INTEGER AUTO_INCREMENT PRIMARY KEY,
       name VarChar(70), # avg length for US names
       RFA VarChar(46),
       SFA INTEGER,
       hospitalID INTEGER,
       FOREIGN KEY (hospitalID) REFERENCES (HOSPITAL)
   );
   ```

   

## ***ER-Diagram***

![ER-Fin](D:\HW\CS 5200\ER-Fin.png)