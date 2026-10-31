# Project Explanation – Student Management System

## Short explanation
I developed a Student Management System using SAP ABAP to search and display student master data. I designed the data model using ABAP Dictionary objects such as domains, data elements, a transparent table, a table type, and a search help. I used a course check-table/foreign-key relationship for course validation. I developed a classical report with selection options for Student ID and Course. The report retrieves only the required fields using Open SQL, stores the result in an internal table, processes records using a work area, and displays them. I also handled the no-record-found scenario.

## Technical flow
Selection screen → Open SQL → `ZSTUDENT_G57` → Internal table → Work area / LOOP → Classical list output

## Common interview questions

**1. Why did you use an internal table?**  
To hold the selected database records in application-server memory so they can be processed and displayed.

**2. Why did you select individual fields instead of `SELECT *`?**  
To retrieve only the columns required by the report, reducing unnecessary data transfer and making the intent clear.

**3. What is the purpose of the course foreign key?**  
It defines a relationship between the student course field and the valid course IDs in the course check table.

**4. What is the difference between a structure/work area and an internal table?**  
A structure/work area holds one row at a time; an internal table holds multiple rows.

**5. What happens if no matching records are found?**  
The internal table remains initial and the report displays a no-record-found message.

**6. Why use `SELECT-OPTIONS`?**  
It supports single values, intervals, exclusions, and multiple selections.

**7. Which transaction codes are relevant?**  
SE11 for DDIC objects; SE38/SA38 for report creation and execution; SE80 for the Object Navigator; SE16N for table-data inspection where authorized.
