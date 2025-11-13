page 50120 "Recent Payments"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Student Ledger Entry";
    Caption = 'Recent Payments';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Posting Date"; Rec."Posting Date")
                {

                }
                field("Student No."; Rec."Student No.")
                {

                }
                field("Course Code"; Rec."Course Code")
                {

                }
                field(Amount; Rec.Amount)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Entry Type", Rec."Entry Type"::Payment);
        Rec.SetFilter("Posting Date", '>%1', Today - 30);
        Rec.SetCurrentKey("Posting Date");
        Rec.Ascending(false);
    end;

    var
        myInt: Integer;
}