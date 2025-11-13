page 50119 "Recent Enrollment Part"
{
    PageType = ListPart;
    ApplicationArea = All;
    Caption = 'Recent Enrollments';
    SourceTable = "Enrollment Request";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Student No."; Rec."Student No.")
                {
                }
                field("Course Code"; Rec."Course Code")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Approval Date"; Rec."Approval Date")
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
        Rec.SetRange(Status, Rec.Status::Approved);
    end;


    var
        myInt: Integer;
}