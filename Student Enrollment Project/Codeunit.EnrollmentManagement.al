codeunit 50103 "Enrollment Management"
{
    procedure ApproveRequest(var EnrollmentRequest: Record "Enrollment Request")
    var
        EmailNotification: Codeunit "Email Notification";
        StudentLedger: Record "Student Ledger Entry";
        Course: Record Course;
        PostFeeEnrollment: Codeunit "Student Fee Posting";
    begin
        if EnrollmentRequest.Status <> EnrollmentRequest.Status::Pending then
            Error('Only Pending Requests can be approved');
        EnrollmentRequest.Status := EnrollmentRequest.Status::Approved;
        EnrollmentRequest."Approval Date" := CurrentDateTime;
        EnrollmentRequest."Approver ID" := UserId;
        EnrollmentRequest.Modify();

        if Course.Get(EnrollmentRequest."Course Code") then begin
            PostFeeEnrollment.PostFeeFromEnrollment(EnrollmentRequest);
        end;

        EmailNotification.SendEnrollmentStatusEmail(EnrollmentRequest);
        Message('Enrollment Request Approved Successfully. Email Notification sent to the Student');
    end;


    procedure RejectRequest(var EnrollmentRequest: Record "Enrollment Request")
    var
        EmailNotification: Codeunit "Email Notification";
    begin
        if EnrollmentRequest.Status <> EnrollmentRequest.Status::Pending then
            Error('Only Pending Requests can be rejected');
        EnrollmentRequest.Status := EnrollmentRequest.Status::Rejected;
        EnrollmentRequest."Approval Date" := CurrentDateTime;
        EnrollmentRequest."Approver ID" := UserId;
        EnrollmentRequest.Modify();
        EmailNotification.SendEnrollmentStatusEmail(EnrollmentRequest);
        Message('Enrollment Request Rejected Successfully. Email Notification sent to the Student');
    end;
}


