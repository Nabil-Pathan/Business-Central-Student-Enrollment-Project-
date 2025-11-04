page 50109 "Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Course;
    CardPageId = "Course Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
        area(Factboxes)
        {

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
}