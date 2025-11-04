page 50112 "Student API"
{
    PageType = API;
    Caption = 'Student API';
    APIPublisher = 'studentSolution';
    APIGroup = 'studentmgmt';
    APIVersion = 'v1.0';
    EntityName = 'student';
    EntitySetName = 'students';
    SourceTable = Student;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            field(Id; Rec."Student No.")
            {

            }
            field(Name; Rec.Name)
            {

            }
            field(Email; Rec.Email)
            {

            }
            field(Phone; Rec.Phone)
            {

            }
            field(Picture; Rec.Picture)
            {

            }
        }
    }
}