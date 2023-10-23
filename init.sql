CREATE TABLE IF NOT EXISTS publishers (
  publisher_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS authors (
  author_id INT PRIMARY KEY,
  fullname VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS books (
  book_id INT PRIMARY KEY,
  title VARCHAR(100),
  year INT,
  pages INT,
  price DECIMAL(10,2),
  quantity INT,
  publisher_id INT,
  author_id INT,
  FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id),
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE IF NOT EXISTS readers (
  reader_id INT PRIMARY KEY,
  fullname VARCHAR(100),
  address VARCHAR(100),
  telephone VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS loans (
  loan_id INT PRIMARY KEY,
  reader_id INT,
  book_id INT,
  loandate DATE,
  returndate DATE,
  FOREIGN KEY (reader_id) REFERENCES readers(reader_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE IF NOT EXISTS author_books (
  author_id INT,
  book_id INT,
  PRIMARY KEY (author_id, book_id),
  FOREIGN KEY (author_id) REFERENCES authors(author_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);