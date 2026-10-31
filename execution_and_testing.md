# Execution and Testing

## Execute
1. Create and activate `ZCOURSE_G57` and `ZSTUDENT_G57` in SE11.
2. Create the course foreign-key relationship.
3. Create the optional search help and table type.
4. Create report `ZSTUDENTREP_G57` in SE38.
5. Paste `src/zstudentrep_g57.abap`, activate, and execute.

## Test cases

| Test | Input | Expected result |
|---|---|---|
| Search by Student ID | Existing ID; Course blank | Matching student record(s) |
| Search by Course | Student ID blank; existing course | Students in that course |
| Search by both | Existing ID and matching course | Matching record(s) |
| Non-existing ID | ID that is not in the table | No-record message |
| Non-existing course | Course that has no students | No-record message |
| No filters | Both selection ranges blank | All rows in current client |

## Debugging
- Set a breakpoint in `FORM get_student_data`.
- Execute the report and inspect `S_STUID` and `S_COURSE`.
- Step over the `SELECT` and inspect `GT_STUDENT`.
- Check `SY-SUBRC` immediately after database statements when you need the statement status. This report uses `GT_STUDENT IS INITIAL` to check whether any rows were returned.

## Notes
Use fictional records only. Do not commit actual student names, phone numbers, or email addresses to a public repository.
