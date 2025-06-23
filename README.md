# BookEase

BookEase is a web-based book management system built with Flask, allowing users to browse, add, update, and delete books. It features user authentication for secure access and uses SQLite for data storage. The application provides a clean, responsive interface for managing a personal book collection.

## Features
- **User Authentication**: Register, log in, and log out securely to manage your book collection.
- **Book Management**: Add, view, update, and delete books with details like title, author, genre, and publication year.
- **Responsive Design**: User-friendly interface styled with Tailwind CSS and custom CSS.
- **Database Integration**: Stores book and user data in a SQLite database.
- **Search and Filter**: Browse books with ease using the intuitive interface.

## Project Structure
```
BookEase/
├── app.py                   # Main Flask application
├── requirements.txt         # Python dependencies
├── instance/
│   └── bookease.db          # SQLite database (auto-generated)
├── static/
│   ├── css/
│   │   ├── output.css       # Tailwind CSS output
│   │   └── styles.css       # Custom styles
│   └── images/              # Static image assets
├── templates/
│   ├── add_book.html        # Template for adding books
│   ├── base.html            # Base HTML template
│   ├── books.html           # Template for listing books
│   ├── index.html           # Home page template
│   ├── login.html           # Login page template
│   ├── register.html        # Registration page template
│   └── update_book.html     # Template for updating books
```

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/rishitpuri/BookEase.git
   cd BookEase
   ```

2. **Set Up a Virtual Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Set Environment Variables**:
   Create a `.env` file in the root directory and add:
   ```
   FLASK_APP=app.py
   FLASK_ENV=development
   SECRET_KEY=your-secret-key
   ```

5. **Initialize the Database**:
   Run the application to automatically create the SQLite database (`bookease.db`) in the `instance` folder.

6. **Run the Application**:
   ```bash
   flask run
   ```
   Open your browser and navigate to `http://127.0.0.1:5000`.

## Usage
1. **Register an Account**: Go to the registration page to create a new user account.
2. **Log In**: Use your credentials to access the book management features.
3. **Manage Books**:
   - Add a new book with details like title, author, genre, and publication year.
   - View all books in a list with options to update or delete entries.
   - Update existing book details via the update form.
4. **Log Out**: Securely log out when done.

## Dependencies
- Flask: Web framework
- Flask-Login: User session management
- Flask-SQLAlchemy: Database ORM
- Werkzeug: Password hashing
- Tailwind CSS: Styling
- See `requirements.txt` for the full list.

## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For questions or feedback, reach out to [Rishit Puri](https://github.com/rishitpuri).
