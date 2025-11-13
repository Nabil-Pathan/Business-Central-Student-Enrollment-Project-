codeunit 50109 "Student Admin Cue Mgt"
{
    trigger OnRun()
    begin
        UpdateDashboardCue();
    end;

    local procedure UpdateDashboardCue()
    var
        StudentCue: Record "Student Admin Cue";
        StudentLedger: Record "Student Ledger Entry";
        EnrollmentRec: Record "Enrollment Request";
        StudentRec: Record Student;
        CourseRec: Record Course;
    begin
        if not StudentCue.Get('MAIN') then begin
            StudentCue.Init();
            StudentCue."Primary Key" := 'MAIN';
            StudentCue.Insert();
        end;

        StudentCue."No. of Students" := StudentRec.Count();

        StudentCue."No. of Courses" := CourseRec.Count();

        EnrollmentRec.SetRange(Status, EnrollmentRec.Status::Pending);
        StudentCue."Pending Enrollments" := EnrollmentRec.Count();

        StudentLedger.SetRange("Entry Type", StudentLedger."Entry Type"::Fee);
        StudentLedger.SetFilter("Remaining Amount", '>0');
        StudentCue."Fees Due" := StudentLedger.Count();

        StudentLedger.Reset();
        StudentLedger.SetRange("Entry Type", StudentLedger."Entry Type"::Payment);
        StudentLedger.SetRange("Posting Date", Today);
        StudentCue."Payments Today" := StudentLedger.Count();

        StudentCue.Modify(true);
    end;

    var
        myInt: Integer;
}