CREATE DATABASE gym_management;
USE gym_management;

CREATE TABLE memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    duration_months INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    join_date DATE NOT NULL,
    membership_id INT,
    FOREIGN KEY (membership_id) REFERENCES memberships(membership_id)
);

CREATE TABLE trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    schedule_time DATETIME NOT NULL,
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    class_id INT,
    attendance_date DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

INSERT INTO memberships (type, duration_months, price) VALUES
('Basic', 3, 100.00),
('Standard', 6, 180.00),
('Premium', 12, 300.00);

INSERT INTO members (first_name, last_name, email, phone, join_date, membership_id) VALUES
('John', 'Doe', 'john.doe@email.com', '1234567890', '2024-01-15', 1),
('Jane', 'Smith', 'jane.smith@email.com', '2345678901', '2024-02-10', 2),
('Robert', 'Brown', 'robert.brown@email.com', '3456789012', '2024-03-05', 3),
('Emily', 'Davis', 'emily.davis@email.com', '4567890123', '2024-03-20', 1);

INSERT INTO trainers (first_name, last_name, specialization, phone) VALUES
('Michael', 'Johnson', 'Strength Training', '5678901234'),
('Sarah', 'Williams', 'Yoga', '6789012345'),
('David', 'Miller', 'Cardio', '7890123456');

INSERT INTO classes (class_name, schedule_time, trainer_id) VALUES
('Morning Yoga', '2024-04-01 07:00:00', 2),
('Strength Training', '2024-04-01 18:00:00', 1),
('HIIT Cardio', '2024-04-02 19:00:00', 3);

INSERT INTO attendance (member_id, class_id, attendance_date) VALUES
(1, 1, '2024-04-01'),
(2, 1, '2024-04-01'),
(3, 2, '2024-04-01'),
(4, 3, '2024-04-02'),
(1, 3, '2024-04-02');

INSERT INTO payments (member_id, amount, payment_date, payment_method) VALUES
(1, 100.00, '2024-01-15', 'Credit Card'),
(2, 180.00, '2024-02-10', 'Cash'),
(3, 300.00, '2024-03-05', 'UPI'),
(4, 100.00, '2024-03-20', 'Debit Card');




