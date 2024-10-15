INSERT INTO administrator (UserName, UserPassword) VALUES
('user1', 'password1'),
('user2', 'password2'),
('user3', 'password3'),
('user4', 'password4'),
('user5', 'password5'),
('user6', 'password6'),
('user7', 'password7'),
('user8', 'password8'),
('user9', 'password9'),
('user10', 'password10');

INSERT INTO blood_group (BloodGroupType, TextDescription) VALUES
('A+', 'positive A'),
('A-', 'negative A'),
('B+', 'positive B'),
('B-', 'negative B'),
('O+', 'positive O'),
('O-', 'negative O'),
('AB+', 'positive AB'),
('AB-', 'negative AB');

INSERT INTO blood_group_receiver (BloodGroupDonor, BloodGroupReceiver) VALUES
('A+', 'A+'),
('A-', 'A+'),
('B+', 'A-'),
('B-', 'O+'),
('O+', 'AB-'),
('O-', 'B+'),
('AB+', 'O-'),
('AB-', 'A-'),
('A+', 'AB+'),
('A-', 'O-');

INSERT INTO donor (FirstName, LastName, Street, State, ZipCode, Phone, Gender, Age, MedicalRemarks, BLoodGroup, DateOfRegistration, RegistrarID) VALUES
('John', 'Doe', '123 Main St', 'California', '90210', '1234567890', 'Male', 25, 'None', 'A+', '2023-01-01', 1),
('Jane', 'Smith', '456 Oak St', 'New York', '10001', '9876543210', 'Female', 30, 'Allergic to penicillin', 'B-', '2023-01-02', 2),
('Mike', 'Johnson', '789 Pine St', 'Texas', '75001', '5551234567', 'Male', 40, 'None', 'O+', '2023-01-03', 3),
('Sara', 'Williams', '101 Cedar St', 'Florida', '33101', '7890123456', 'Female', 28, 'High blood pressure', 'AB+', '2023-01-04', 4),
('David', 'Brown', '202 Elm St', 'Ohio', '44101', '3210987654', 'Male', 35, 'None', 'B+', '2023-01-05', 5),
('Emily', 'Davis', '303 Maple St', 'Illinois', '60601', '2345678901', 'Female', 22, 'None', 'O-', '2023-01-06', 6),
('Chris', 'Jones', '404 Birch St', 'Georgia', '30301', '8765432109', 'Male', 45, 'Diabetic', 'A-', '2023-01-07', 7),
('Olivia', 'Taylor', '505 Walnut St', 'Michigan', '48201', '1357924680', 'Female', 32, 'None', 'AB-', '2023-01-08', 8),
('Daniel', 'Miller', '606 Spruce St', 'Washington', '98101', '9870123456', 'Male', 27, 'None', 'A+', '2023-01-09', 9),
('Mia', 'Lee', '707 Fir St', 'Arizona', '85001', '8765432101', 'Female', 38, 'None', 'O+', '2023-01-10', 10);

INSERT INTO inventory (Street, State, ZipCode, BloodBagQtn) VALUES
('123 Main St', 'California', '90210', 100),
('456 Oak St', 'New York', '10001', 75),
('789 Pine St', 'Texas', '75001', 120),
('101 Cedar St', 'Florida', '33101', 50),
('202 Elm St', 'Ohio', '44101', 90),
('303 Maple St', 'Illinois', '60601', 60),
('404 Birch St', 'Georgia', '30301', 80),
('505 Walnut St', 'Michigan', '48201', 110),
('606 Spruce St', 'Washington', '98101', 95),
('707 Fir St', 'Arizona', '85001', 70);

INSERT INTO blood_bag (BLoodGroup, DateOfIssue, DateOfuse, InventoryID, DonorID, Available) VALUES
('A+', '2023-01-01', '2023-01-10', 31, 11, 1),
('B-', '2023-02-05', '2023-02-15', 32, 12, 1),
('O+', '2023-03-10', '2023-03-20', 33, 13, 0),
('AB+', '2023-04-15', '2023-04-25', 34, 14, 1),
('B+', '2023-05-20', '2023-05-30', 35, 15, 0),
('O-', '2023-06-25', '2023-07-05', 36, 16, 1),
('A-', '2023-07-30', '2023-08-10', 37, 17, 1),
('AB-', '2023-09-05', '2023-09-15', 38, 18, 0),
('A+', '2023-10-10', '2023-10-20', 39, 19, 1),
('O+', '2023-11-15', '2023-11-25', 40, 20, 1);
