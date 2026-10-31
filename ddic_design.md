# ABAP Dictionary (DDIC) Design

Create these objects in **SE11** and activate them before running the report.

## 1. Transparent table: `ZSTUDENT_G57`

Suggested fields (adjust data types and lengths to your system standards):

| Field | Suggested type | Key | Description |
|---|---|---:|---|
| `MANDT` | `MANDT` | Yes (client-dependent table) | Client |
| `STUDENT_ID` | `CHAR10` | Yes | Unique student ID |
| `STUDENT_NAME` | `CHAR40` | No | Student name |
| `STUDENT_COURSE` | `CHAR10` | No | Course ID |
| `STUDENT_PHONENO` | `CHAR15` | No | Phone number |
| `STUDENT_EMAIL` | `CHAR60` | No | Email address |
| `STUDENT_CGPA` | `DEC` (for example 3 decimals) | No | CGPA |
| `STUDENT_GENDER` | `CHAR1` | No | Gender code |
| `STUDENT_STATUS` | `CHAR10` | No | ACTIVE / INACTIVE |

For a reusable design, create domains and data elements for the business fields rather than using built-in types directly in the final table.

## 2. Course check table: `ZCOURSE_G57`

| Field | Suggested type | Key | Description |
|---|---|---:|---|
| `MANDT` | `MANDT` | Yes | Client |
| `COURSE_ID` | `CHAR10` | Yes | Course identifier |
| `COURSE_NAME` | `CHAR40` | No | Course name |

Create a foreign-key relationship from `ZSTUDENT_G57-STUDENT_COURSE` to `ZCOURSE_G57-COURSE_ID`. Ensure the field types and lengths are compatible.

## 3. Suggested reusable DDIC objects

Create domains and data elements for:
- Student ID
- Student name
- Course ID
- Phone number
- Email
- CGPA
- Gender
- Student status

Optional:
- Table type `ZTT_STUDENT_G57`, line type `ZSTUDENT_G57`.
- Elementary or collective search help `ZSH_COURSE_G57`, based on `ZCOURSE_G57`, assigned to the course data element/selection-screen field as appropriate.

## 4. Notes
- The report uses `SELECT-OPTIONS`, so users can enter single values, ranges, or multiple selections.
- If both selection ranges are left empty, the report returns all rows in the client. For a production report, consider making at least one selection mandatory or adding authorization and volume controls.
- A foreign key/check table provides DDIC-level input assistance and consistency checks in relevant SAP contexts; it is not a substitute for every application-level validation.
