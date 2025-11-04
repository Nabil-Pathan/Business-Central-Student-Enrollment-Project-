codeunit 50105 "Student Fee Posting"
{
    procedure PostFeeFromEnrollment(var EnrollmentRequest: Record "Enrollment Request")
    var
        StudentLedger: Record "Student Ledger Entry";
        Course: Record Course;
    begin
        if not Course.Get(EnrollmentRequest."Course Code") then begin
            Error('Course %1 not found', EnrollmentRequest."Course Code");
        end;

        StudentLedger.Init();
        StudentLedger."Student No." := EnrollmentRequest."Student No.";
        StudentLedger."Course Code" := EnrollmentRequest."Course Code";
        StudentLedger."Entry Type" := StudentLedger."Entry Type"::Fee;
        StudentLedger.Amount := Course."Course Fees";
        StudentLedger."Applied Amount" := 0;
        StudentLedger."Remaining Amount" := Course."Course Fees";
        StudentLedger."Document No." := '';
        StudentLedger."Posting Date" := Today;
        StudentLedger.Status := StudentLedger.Status::Open;
        StudentLedger.Description := 'Fee for ' + Course."Course Name" + ' (Enrollment)';
        StudentLedger.Insert();
    end;
}