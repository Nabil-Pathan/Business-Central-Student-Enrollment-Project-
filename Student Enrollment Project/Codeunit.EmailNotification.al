codeunit 50102 "Email Notification"
{
    procedure SendEnrollmentStatusEmail(Enrollment: Record "Enrollment Request")
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit "Email";
        Student: Record Student;
        Course: Record Course;
        subject: Text;
        StringBuilder: TextBuilder;
        RecipientEmail: Text;
    begin
        if not Student.Get(Enrollment."Student No.") then
            exit;
        if not Course.Get(Enrollment."Course Code") then
            exit;

        subject := StrSubstNo('Enrollment Request for %1', Course."Course Name");
        StringBuilder.AppendLine(StrSubstNo('Dear %1,', Student.Name));
        StringBuilder.AppendLine();
        StringBuilder.AppendLine(StrSubstNo('Your enrollment request for the following course has been processed %1 is %2.', Course."Course Name", Enrollment.Status));
        StringBuilder.AppendLine();
        if Enrollment.Status = Enrollment.Status::Approved then begin
            StringBuilder.AppendLine('You can now access to course materials and start learning.');
        end
        else begin
            StringBuilder.AppendLine('Your enrollment request has not been approved');
        end;

        StringBuilder.AppendLine();
        StringBuilder.AppendLine('Thank You.');
        RecipientEmail := Student.Email;

        EmailMessage.Create(RecipientEmail, subject, StringBuilder.ToText());
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

    end;
}