# BookEase

BookEase is a Flask-based library management system designed to manage books, authors, categories, publishers, racks, and book transactions. It features user authentication with role-based access (admin and regular users), a MySQL database for data storage, and a responsive interface enhanced with custom CSS, jQuery, and Bootstrap modals. The system supports book issuance tracking, user management, and data normalization for efficient library operations.

## Features
- **User Authentication**: Secure login, registration, and logout with admin and regular user roles.
- **Book Management**: Add, view, edit, delete, and search books with details like title, author, category, and status.
- **Library Entities**: Manage authors, categories, publishers, and racks with CRUD operations via modal forms.
- **Book Issuance**: Track book loans, including issue dates, return dates, and student details.
- **Admin Controls**: Admins can manage user accounts, update passwords, and view all users.
- **Database Normalization**: Uses normalized tables for efficient data storage and querying.
- **Responsive Design**: User-friendly interface with custom CSS and Bootstrap for modals.
- **Docker Support**: Deployable via Docker for consistent environments.

## Project Structure
```
BookEase/
├── app.py                          # Main Flask application
├── Create_RAW_Data.sql             # SQL script to create raw_data table
├── Dockerfile                      # Docker configuration for deployment
├── insert_data_raw_data.sql        # SQL script to insert sample data into raw_data
├── Insert data normalized.sql      # SQL script to populate normalized tables
├── NORMALIZED TABLES.sql           # SQL script to create normalized tables
├── packages.txt                    # System dependencies for installation
├── README.md                       # Project documentation
├── requirements.txt                # Python dependencies
├── static/
│   ├── js/
│   │   ├── author.js               # JavaScript for author modal
│   │   ├── books.js                # JavaScript for book modal and search
│   │   ├── category.js             # JavaScript for category modal
│   │   ├── issue_books.js          # JavaScript for issue book modal
│   │   ├── publisher.js            # JavaScript for publisher modal
│   │   └── rack.js                 # JavaScript for rack modal
│   ├── styles/
│   │   └── dashboard.css           # Custom CSS for dashboard styling
│   └── images/                     # Directory for static images (empty)
├── templates/
│   ├── author.html                 # Template for managing authors
│   ├── books.html                  # Template for listing books
│   ├── category.html               # Template for managing categories
│   ├── dashboard.html              # Dashboard template
│   ├── edit_author.html            # Template for editing authors
│   ├── edit_book.html              # Template for editing books
│   ├── edit_category.html          # Template for editing categories
│   ├── edit_issue_book.html        # Template for editing issued books
│   ├── edit_publisher.html         # Template for editing publishers
│   ├── edit_rack.html             # Template for editing racks
│   ├── edit_user.html             # Template for editing users
│   ├── issue_book.html             # Template for managing book issuance
│   ├── login.html                  # Login page template
│   ├── password_change.html        # Template for changing passwords
│   ├── publisher.html             # Template for managing publishers
│   ├── rack.html                   # Template for managing racks
│   ├── register.html               # Registration page template
│   ├── transaction.html            # Template for viewing transactions
│   ├── users.html                 # Template for managing users
│   └── view_user.html             # Template for viewing user details
```

## Prerequisites
- Python 3.9+
- MySQL database (e.g., AWS RDS or local MySQL server)
- Docker (optional, for containerized deployment)
- System dependencies listed in `packages.txt`
- Frontend dependencies: jQuery, Bootstrap (assumed included in templates)

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/rishitpuri/BookEase.git
   cd BookEase
   ```

2. **Install System Dependencies** (Ubuntu/Debian):
   ```bash
   sudo apt-get update
   sudo apt-get install -y $(cat packages.txt)
   ```

3. **Set Up a Virtual Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

4. **Install Python Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

5. **Configure MySQL Database**:
   - Set up a MySQL database (e.g., on AWS RDS or locally).
   - Update `app.py` with your MySQL credentials:
     ```python
     app.config['MYSQL_HOST'] = 'your-mysql-host'
     app.config['MYSQL_USER'] = 'your-mysql-user'
     app.config['MYSQL_PASSWORD'] = 'your-mysql-password'
     app.config['MYSQL_DB'] = 'your-database-name'
     ```
   - Run the SQL scripts to set up tables and data:
     ```bash
     mysql -h <host> -u <user> -p <database> < Create_RAW_Data.sql
     mysql -h <host> -u <user> -p <database> < NORMALIZED TABLES.sql
     mysql -h <host> -u <user> -p <database> < insert_data_raw_data.sql
     mysql -h <host> -u <user> -p <database> < Insert data normalized.sql
     ```

6. **Set Environment Variables**:
   Create a `.env` file in the root directory:
   ```
   FLASK_APP=app.py
   FLASK_ENV=development
   SECRET_KEY=your-secret-key
   ```

7. **Run the Application**:
   ```bash
   gunicorn -b 0.0.0.0:8000 -w 4 app:app
   ```
   Access the app at `http://localhost:8000`.

## Docker Deployment

1. **Build the Docker Image**:
   ```bash
   docker build -t bookease .
   ```

2. **Run the Docker Container**:
   ```bash
   docker run -p 5000:5000 --env-file .env bookease
   ```
   Access the app at `http://localhost:5000`.

## Usage
1. **Register an Account**: Navigate to `/register` to create a user account.
2. **Log In**: Use credentials at `/login` to access the dashboard.
3. **Manage Library**:
   - **Books**: Add, edit, delete, or search books via `/books` (search uses `books.js`).
   - **Authors, Categories, Publishers, Racks**: Manage via respective routes (`/author`, `/category`, `/publisher`, `/rack`) with modal forms.
   - **Transactions**: View book issuance details at `/transaction`.
   - **Issue Books**: Manage loans at `/list_issue_book` with modal forms (`issue_books.js`).
4. **Admin Features**: Admins can manage users at `/users` and update passwords at `/password_change`.
5. **Log Out**: Sign out via `/logout`.

## Dependencies
- **Python**: Flask, Flask-MySQLdb, mysqlclient, gunicorn, streamlit (see `requirements.txt`)
- **System**: build-essential, pkg-config, default-libmysqlclient-dev, gcc, libc-dev, libffi-dev (see `packages.txt`)
- **Frontend**: jQuery, Bootstrap (for modals), custom CSS (`dashboard.css`)

## Database Setup
- **Raw Data**: `raw_data` table for initial data (`Create_RAW_Data.sql`, `insert_data_raw_data.sql`).
- **Normalized Tables**: `Authors`, `Categories`, `Books`, `student_data`, `Transactions` (`NORMALIZED TABLES.sql`, `Insert data normalized.sql`).
- Ensure MySQL is running and credentials are configured in `app.py`.

## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

## License
No license file is included. Contact the repository owner for licensing details.

## Contact
For questions or feedback, reach out to [Rishit Puri](https://github.com/rishitpuri).
