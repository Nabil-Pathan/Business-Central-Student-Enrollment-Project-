report 50102 "Student Payment Receipt"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Student Payment Receipt';
    DefaultRenderingLayout = RDLCLayout;

    dataset
    {
        dataitem("Student Ledger Entry"; "Student Ledger Entry")
        {
            column(Student_No_; "Student No.") { }
            column(EntryType; "Entry Type") { }
            column(Amount; Abs(Amount)) { }
            column(Date; "Posting Date") { }
            column(CompanyName; CompanyName) { }

            dataitem(Student; Student)
            {
                DataItemLink = "Student No." = field("Student No.");

                column(Name; Name) { }
                column(Email; Email) { }
                column(Phone; Phone) { }
            }
        }
    }

    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = 'StudentPaymentReceipt.rdl';
        }
    }

}
