REPORT zstudentrep_g57.

*---------------------------------------------------------------------*
* Student Management System
* Purpose : Search student records by Student ID and/or Course
* Table   : ZSTUDENT_G57
*---------------------------------------------------------------------*

* Selection screen
SELECT-OPTIONS:
  s_stuid  FOR zstudent_g57-student_id,
  s_course FOR zstudent_g57-student_course.

* Internal table and work area
DATA:
  gt_student TYPE STANDARD TABLE OF zstudent_g57,
  gs_student TYPE zstudent_g57.

START-OF-SELECTION.

  PERFORM get_student_data.

  IF gt_student IS INITIAL.
    WRITE: / 'No student records found for the given selection.'.
    RETURN.
  ENDIF.

  PERFORM display_student_data.

*---------------------------------------------------------------------*
* Retrieve matching student records
*---------------------------------------------------------------------*
FORM get_student_data.

  SELECT student_id,
         student_name,
         student_course,
         student_phoneno,
         student_email,
         student_cgpa,
         student_gender,
         student_status
    FROM zstudent_g57
    INTO CORRESPONDING FIELDS OF TABLE @gt_student
    WHERE student_id     IN @s_stuid
      AND student_course IN @s_course.

ENDFORM.

*---------------------------------------------------------------------*
* Display records using a classical list report
*---------------------------------------------------------------------*
FORM display_student_data.

  FORMAT COLOR COL_HEADING.
  WRITE: / 'STUDENT MANAGEMENT REPORT'.
  FORMAT COLOR OFF.
  ULINE.

  WRITE: / 'Student ID',
           18 'Student Name',
           42 'Course',
           58 'Phone',
           75 'Email',
           108 'CGPA',
           118 'Gender',
           128 'Status'.
  ULINE.

  LOOP AT gt_student INTO gs_student.

    WRITE: / gs_student-student_id,
             18 gs_student-student_name,
             42 gs_student-student_course,
             58 gs_student-student_phoneno,
             75 gs_student-student_email,
             108 gs_student-student_cgpa,
             118 gs_student-student_gender,
             128 gs_student-student_status.

  ENDLOOP.

  ULINE.
  WRITE: / 'Total records:', lines( gt_student ).

ENDFORM.
