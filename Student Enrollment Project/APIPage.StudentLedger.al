page 50114 "Student Ledger API"
{
    PageType = API;
    Caption = 'Student Ledger API';
    APIPublisher = 'studentSolution';
    APIGroup = 'ledger';
    APIVersion = 'v1.0';
    EntityName = 'payment';
    EntitySetName = 'payments';
    SourceTable = "Student Ledger Entry";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            field(Id; Rec."Entry No.")
            {

            }
            field(StudentNo; Rec."Student No.")
            {

            }

            field(CourseCode; Rec."Course Code")
            {

            }

            field(Amount; Rec.Amount)
            {

            }

            field(PostingDate; Rec."Posting Date")
            {

            }

            field(EntryType; Rec."Entry Type")
            {

            }

        }
    }
}