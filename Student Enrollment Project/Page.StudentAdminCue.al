page 50118 "Student Admin Cue"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Student Admin Cue";

    layout
    {
        area(Content)
        {
            cuegroup(Students)
            {
                Caption = 'Students';
                field("No. of Students"; Rec."No. of Students")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Student List";
                }
                field("No. of Courses"; Rec."No. of Courses")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Course List";
                }
                field("Pending Enrollments"; Rec."Pending Enrollments")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Enrollment Request List";
                }
            }
            cuegroup(Finance)
            {
                Caption = 'Finance';

                field("Fees Due"; Rec."Fees Due")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Student Ledger Entries";
                }
                field("Payments Today"; Rec."Payments Today")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Student Ledger Entries";
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
    var
        StudentAdminCueMgt: Codeunit "Student Admin Cue Mgt";
    begin
        StudentAdminCueMgt.Run();
    end;

    var
        myInt: Integer;
}