codeunit 50101 "Populate Sample Data"
{
    trigger OnRun()
    begin
        if ConfirmPopulation() then begin
            PopulateStudents();
            PopulateCourse();
            PopulateEnrollmentRequest();
            Message('Sample data has been populated successfully.');
        end;
    end;

    local procedure ConfirmPopulation(): Boolean
    begin
        exit(Confirm('Do you want to popluate the sample data ?'))
    end;

    local procedure PopulateStudents()
    var
        Student: Record Student;
        i: Integer;
    begin
        for i := 1 to 5 do begin
            Student.Init();
            Student."Student No." := Format(i);
            Student.Name := 'Student' + Format(i);
            Student.Email := 'student' + Format(i) + '@school.com';
            Student.Phone := '1234567890';
            if Student.Insert() then;
        end;
    end;

    local procedure PopulateCourse()
    var
        Course: Record Course;
    begin
        InsertCourse('C001', 'Introduction to Programming', 'This course provides introduction to programming');
        InsertCourse('C002', 'Business Central Functional', 'This course provides introduction to Business Central Functional Side');
        InsertCourse('C003', 'Business Central Technical', 'This course provides introduction to Business Central Technical Side');
        InsertCourse('C004', 'Introduction to Power Platform', 'This course provides introduction to Power Platform');
    end;


    local procedure InsertCourse(CourseCode: Code[20]; CourseName: Text[100]; Description: Text[100])
    var
        Course: Record Course;
    begin
        Course.Init();
        Course."Course Code" := CourseCode;
        Course."Course Name" := CourseName;
        Course."Course Description" := Description;
        if Course.Insert() then;
    end;

    local procedure PopulateEnrollmentRequest()
    var
        Enrollment: Record "Enrollment Request";
        Student: Record Student;
        Course: Record Course;
        EntryNo: Integer;
    begin
        EntryNo := 1;
        if Student.FindSet() then begin
            repeat
                if Course.FindSet() then begin
                    repeat
                        Enrollment.Init();
                        Enrollment."Entry No." := EntryNo;
                        Enrollment."Student No." := Student."Student No.";
                        Enrollment."Course Code" := Course."Course Code";
                        Enrollment."Request Date" := WorkDate();
                        Enrollment.Status := Enrollment.Status::Pending;
                        Enrollment.Insert();
                        EntryNo += 1;
                    until Course.Next() = 0;
                end;
            until Student.Next() = 0;
        end;

    end;

    var
        myInt: Integer;
}