# Hospital Management System (HMS) SQL Database

This project contains the implementation of a Hospital Management System (HMS) using MySQL. The database stores information about doctors, patients, rooms, tests, and guardians, providing key functionalities such as data insertion, updating, and retrieval with SQL queries.

## Project Structure

- **Doctor.sql**: Contains the SQL code to create the `Doctor` table, storing information about doctors including their ID, phone number, salary, address, name, and department.
- **Room.sql**: Defines the `Room` table, which stores the details of hospital rooms including room ID, type, and price.
- **Test.sql**: Creates the `Test` table to store test details such as test ID, name, description, price, and date.
- **Patient.sql**: Contains SQL statements to create the `Patient` table, which includes patient information and foreign keys linking to the `Doctor`, `Room`, and `Test` tables.
- **Guardian.sql**: Defines the `Guardian` table, storing information about the patient's guardian. It links to the `Patient` table via a foreign key.
- **HMS.sql**: A complete SQL file containing all the table definitions, inserts, and queries for the HMS system.
- **Stock.csv**: Example data used for the SQL queries.

## SQL Features

### Key Tables and Queries

- **Doctors**: 
    - Store doctor details such as ID, phone number, salary, address, name, and department.
    - Example query: Insert a new doctor.
      ```sql
      INSERT INTO Doctor (D_id, phone, salary, address, D_name, department)
      VALUES (1, '123-456-7890', 75000, '123 Main St', 'Dr. John Doe', 'Cardiology');
      ```

- **Patients**:
    - Store patient information including ID, name, address, phone, and age. Also includes foreign keys linking to doctors, rooms, and tests.
    - Example query: Retrieve all patients assigned to a specific doctor.
      ```sql
      SELECT * FROM Patient WHERE D_id = 1;
      ```

- **Rooms**:
    - Store information on hospital rooms such as room type and price.
    - Example query: Find all available rooms.
      ```sql
      SELECT R_id FROM Room LEFT JOIN Patient ON Room.R_id = Patient.R_id WHERE Patient.R_id IS NULL;
      ```

- **Tests**:
    - Store test details including ID, name, description, price, and date.
    - Example query: Retrieve the description and date of tests taken by a patient.
      ```sql
      SELECT T_description, T_date FROM Test WHERE T_id = (SELECT T_id FROM Patient WHERE P_id = 1);
      ```

- **Guardians**:
    - Store information about guardians, linking to the patient ID.
    - Example query: Find the guardian for a specific patient.
      ```sql
      SELECT G_name FROM Guardian WHERE P_id = 1;
      ```

### Example Queries

1. **Insert a new doctor**:
    ```sql
    INSERT INTO Doctor (D_id, phone, salary, address, D_name, department)
    VALUES (16, '306-227-2408', 1529.75, '81949 Gulseth Park', 'Aretha Sebrens', 'Neurology');
    ```

2. **Increase the salary of all doctors by 10%**:
    ```sql
    UPDATE Doctor
    SET salary = salary * 1.1;
    ```

3. **Count the number of patients who have a guardian**:
    ```sql
    SELECT COUNT(Patient.P_id) AS 'Patients with Guardian'
    FROM Patient
    INNER JOIN Guardian ON Patient.P_id = Guardian.P_id;
    ```

4. **List the names of doctors with a salary greater than 100,000**:
    ```sql
    SELECT D_name FROM Doctor
    WHERE salary > 100000;
    ```

5. **List the patient names along with their test descriptions and test dates**:
    ```sql
    SELECT P_name, GROUP_CONCAT(CONCAT(T_description, ': ', T_date)) AS Test_Info
    FROM Patient
    INNER JOIN Test ON Patient.T_id = Test.T_id
    GROUP BY P_name;
    ```

6. **Find the number of available rooms**:
    ```sql
    SELECT COUNT(*) AS Available_Rooms
    FROM Room
    LEFT JOIN Patient ON Room.R_id = Patient.R_id
    WHERE Patient.R_id IS NULL;
    ```

## How to Run the SQL Scripts

1. **Setup the Database**:
    - Ensure you have MySQL installed and running.
    - Create the database and tables by running the provided SQL scripts in the following order:
      1. `Doctor.sql`
      2. `Room.sql`
      3. `Test.sql`
      4. `Patient.sql`
      5. `Guardian.sql`

2. **Run Queries**:
    - Use the provided sample queries or write your own to manipulate and query the database.

## License
This project is licensed under the MIT License.
