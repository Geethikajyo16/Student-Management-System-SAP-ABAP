# Student Management System – SAP ABAP

A beginner-friendly SAP ABAP project for maintaining and searching student master data.

## Project overview
- **Technology:** SAP ABAP, ABAP Dictionary (DDIC), Open SQL, internal tables, classical report
- **Purpose:** Search student records by Student ID and/or Course and display matching details.
- **Main report:** `ZSTUDENTREP_G57`
- **Main database table:** `ZSTUDENT_G57`

## Repository structure
```text
Student_Management_System_ABAP/
├── src/
│   └── zstudentrep_g57.abap
├── docs/
│   ├── ddic_design.md
│   ├── execution_and_testing.md
│   └── interview_explanation.md
├── data/
│   └── sample_students.csv
└── README.md
```

## SAP objects to create

| Object | Suggested name | Description |
|---|---|---|
| Transparent table | `ZSTUDENT_G57` | Stores student master data |
| Course check table | `ZCOURSE_G57` | Stores valid course IDs |
| Report | `ZSTUDENTREP_G57` | Searches and displays students |
| Search help | `ZSH_COURSE_G57` | F4 help for course selection |
| Table type | `ZTT_STUDENT_G57` | Reusable table type, if required |

The DDIC objects are created and activated in the SAP system (for example, using **SE11**). The repository includes their design documentation; it does not contain a transport request.

## How to run
1. Create and activate the DDIC objects described in `docs/ddic_design.md`.
2. Open **SE38** or **SE80**.
3. Create report `ZSTUDENTREP_G57`.
4. Copy the contents of `src/zstudentrep_g57.abap`.
5. Activate and execute the report.
6. Enter a Student ID, Course, both, or leave both blank to display all records.

## Important
The code assumes the field names in `ZSTUDENT_G57` match the names documented here. If your SAP table uses different field or object names, update the report accordingly.

This is a learning/demo project. Do not upload real student personal information to a public GitHub repository. Use only fictional sample data.
