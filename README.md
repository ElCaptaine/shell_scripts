**README**

## Script: `connect_to_database.sh`

### Description:
This script facilitates the process of connecting to a PostgreSQL database by providing an interactive selection interface for available databases stored in a configuration file `.db.conf`. Once a database is selected, the script reads the corresponding credentials from the configuration file and establishes a connection to the PostgreSQL database using `psql`.

### Prerequisites:
- PostgreSQL installed on your local machine.
- Configuration file `.db.conf` present in the current directory with appropriate database configurations.
- Necessary permissions to access the specified PostgreSQL databases.
- **[Requirement]** `fzf` must be installed on your system for interactive selection.

### Usage:
1. **Configuration Setup**:
   - Create a configuration file named `.db.conf` in the directory where you intend to run the script.
   - Configure the PostgreSQL databases within the `.db.conf` file following the provided format (e.g., `[database_name]` followed by host, port, user, and password).

2. **Execute Script**:
   - Open a terminal or command prompt.
   - Navigate to the directory containing the script (`connect_to_database.sh`).
   - Run the script using:
     ```
     bash connect_to_database.sh
     ```
   - Follow the interactive prompts to select the database and provide the necessary credentials.

### Important Notes:
- Ensure that the `.db.conf` file is properly formatted and contains the necessary database configurations.
- Review the PostgreSQL connection parameters (host, port, user, password) to match your PostgreSQL setup.
- Double-check the security implications of storing passwords in plaintext within the configuration file.
- This script assumes that `psql` is installed and available in the system's PATH.

### Disclaimer:
This script is provided as-is, without any warranties. Use it at your own risk. Always review scripts from untrusted sources before execution, and ensure they align with your security policies and best practices.

### Author:
ElCaptaine

### License:
This project is licensed under the [License Name] - see the [LICENSE.md](LICENSE.md) file for details.
