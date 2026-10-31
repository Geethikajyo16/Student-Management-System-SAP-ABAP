# Project Explanation – Student Management System

## Short explanation
I developed a Student Management System using SAP ABAP to search and display student master data. I designed the data model using ABAP Dictionary objects such as domains, data elements, a transparent table, a table type, and a search help. I used a course check-table/foreign-key relationship for course validation. I developed a classical report with selection options for Student ID and Course. The report retrieves only the required fields using Open SQL, stores the result in an internal table, processes records using a work area, and displays them. I also handled the no-record-found scenario.

## Technical flow
Selection screen → Open SQL → `ZSTUDENT_G57` → Internal table → Work area / LOOP → Classical list output


