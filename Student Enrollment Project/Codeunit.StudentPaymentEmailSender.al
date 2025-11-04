codeunit 50108 "Student Payment Email Sender"
{
    [EventSubscriber(ObjectType::Table, Database::"Student Ledger Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure SendPaymentReceipt(var Rec: Record "Student Ledger Entry")
    var
        StudentRec: Record Student;
        OutStream: OutStream;
        TempBlob: Codeunit "Temp Blob";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit "Email";
        ReportSelection: Codeunit "Report Selection Mgt.";
        FileName: Text;
        StringBuilder: TextBuilder;
        subject: Text;
        InStream: InStream;
        StudentPaymentReceiptReport: Report "Student Payment Receipt";
        FilterRec: Record "Student Ledger Entry";
    begin
        // Message('Email Event triggered for Payment');
        if Rec."Entry Type" <> Rec."Entry Type"::Payment then
            exit;
        if not StudentRec.Get(Rec."Student No.") then
            exit;
        if StudentRec.Email = '' then
            exit;

        FileName := 'PaymentReceipt_' + Format(CurrentDateTime, 0, '<Year4><Month,2><Day,2><Hours24,2><Minutes,2><Seconds,2>') + '.pdf';

        FilterRec.SetRange("Entry No.", Rec."Entry No.");

        StudentPaymentReceiptReport.SetTableView(FilterRec);

        TempBlob.CreateOutStream(OutStream);

        StudentPaymentReceiptReport.SaveAs('', ReportFormat::Pdf, OutStream);

        TempBlob.CreateInStream(InStream);

        subject := StrSubstNo('Payment Receipt for course %1', Rec."Course Code");
        StringBuilder.AppendLine(StrSubstNo('Dear %1,', StudentRec.Name));
        StringBuilder.AppendLine();
        StringBuilder.AppendLine(StrSubstNo('Amount Paid %1', Abs(Rec.Amount)));
        StringBuilder.AppendLine();
        StringBuilder.AppendLine(StrSubstNo('Date: %1', Rec."Posting Date"));
        StringBuilder.AppendLine('Thank you for your payment');

        EmailMessage.Create(StudentRec.Email, subject, StringBuilder.ToText());
        EmailMessage.AddAttachment(FileName, 'application/pdf', InStream);

        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

        Message('Payment Receipt Email Sent');

    end;
}
