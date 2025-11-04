page 50113 "Enrollment API"
{
    PageType = API;
    Caption = 'Enrollment API';
    APIPublisher = 'studentSolution';
    APIGroup = 'enrollment';
    APIVersion = 'v1.0';
    EntityName = 'enrollment';
    EntitySetName = 'enrollments';
    SourceTable = "Enrollment Request";
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
            field(Status; Rec.Status)
            {

            }
        }
    }
}