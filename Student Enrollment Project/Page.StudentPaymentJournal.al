page 50107 "Student Payment Journal"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Student Payment Journal Line";
    Caption = 'Student Payment Journal';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = All;
                }

                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;
                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PostPayment)
            {
                Caption = 'Post Payment';
                ApplicationArea = All;
                Image = Post;
                trigger OnAction()
                var
                    PostPayment: Codeunit "Student Payment Posting";
                begin
                    PostPayment.PostPaymentFromJournal(Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}