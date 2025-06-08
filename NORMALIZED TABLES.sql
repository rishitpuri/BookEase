-- Maheshwaran
-- Authors Table
CREATE TABLE Authors (
    author_id INT NOT NULL,
    author_name VARCHAR(255) NOT NULL
);
-- Maheshwaran 
-- Categories Table
CREATE TABLE Categories (
    category_id INT NOT NULL,
    category_name VARCHAR(255) NOT NULL
);
-- Srihari 
-- Add an index to the author_id column in the Authors table
CREATE INDEX idx_author_id ON Authors(author_id);
-- Srihari 
-- Add an index to the category_id column in the Categories table
CREATE INDEX idx_category_id ON Categories(category_id);

-- Maheshwaran 
-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    author_id INT,
    category_id INT,
    shelf_id INT,
    book_status VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Srihari
-- Student Data
CREATE TABLE student_data (
  Student_ID INT PRIMARY KEY,
  transaction_id INT,
  Student_name VARCHAR(255) NOT NULL,
  Age INT,
  Major VARCHAR(255)
);
-- Rishit Puri 
-- Transactions Table
CREATE TABLE Transactions (
  transaction_id INT,
  book_id INT,
  Issued_Date DATE,
  Age INT,
  Major VARCHAR(255),
  Student_ID INT,
  FOREIGN KEY (book_id) REFERENCES Books(book_id),
  FOREIGN KEY (Student_ID) REFERENCES student_data(Student_ID)
);


#DROP TABLE student_data;
#DROP TABLE transactions;
#DROP TABLE categories;
#DROP TABLE books;
#DROP TABLE authors;