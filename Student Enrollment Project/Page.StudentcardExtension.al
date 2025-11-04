pageextension 50102 "Student Card Extension" extends "Student Card"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(StudentPictureFactBox; "Student Picture FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Student No." = field("Student No.");
            }
            part(StudentFinanceBox; "Student Finance FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Student No." = field("Student No.");
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}