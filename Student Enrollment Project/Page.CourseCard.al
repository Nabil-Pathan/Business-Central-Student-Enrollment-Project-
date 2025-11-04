page 50108 "Course Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Course;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;
                }

                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                }

                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = All;
                }

                field("Course Fees"; Rec."Course Fees")
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
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}