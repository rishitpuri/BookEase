-- Rishit Puri
-- Insert data into Authors table
INSERT INTO Authors (author_id, author_name)
SELECT DISTINCT author_id, author
FROM raw_data;

-- Insert data into Categories Table
INSERT INTO Categories (category_id, category_name)
SELECT DISTINCT category_id, category
FROM raw_data;

-- Srihari 
-- Insert data into Books Table
INSERT INTO Books (book_id, book_title, author_id, category_id, shelf_id, book_status)
SELECT bid, title, author_id, category_id, shelf_id, book_status
FROM raw_data;

-- Srihari
-- Insert data into Student Data
INSERT INTO student_data (Student_ID, transaction_id, Student_name, Age, Major)
SELECT DISTINCT Student_ID, transaction_id, Student_Name, Age, Major
FROM RAW_Data
WHERE Student_ID IS NOT NULL AND Student_Name IS NOT NULL AND Major IS NOT NULL AND Age IS NOT NULL;

-- Srihari 
-- Insert data into Transactions Table
INSERT INTO Transactions (transaction_id, book_id, Issued_Date, Age, Major, Student_ID)
SELECT 
    rt.transaction_id,
    rt.bid, 
    rt.Issued_Date,
    rt.Age,
    rt.Major,
    sd.Student_ID
FROM raw_data rt
JOIN student_data sd ON rt.Student_Name = sd.Student_name AND rt.Major = sd.Major
WHERE rt.Student_Name IS NOT NULL AND rt.Major IS NOT NULL;