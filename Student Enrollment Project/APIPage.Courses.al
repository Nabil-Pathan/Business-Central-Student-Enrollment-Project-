page 50117 "Courses API Page"
{
    PageType = API;
    Caption = 'Courses API';
    APIPublisher = 'studentSolution';
    APIGroup = 'courses';
    APIVersion = 'v1.0';
    EntityName = 'course';
    EntitySetName = 'courses';
    SourceTable = Course;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            field(CourseCode; Rec."Course Code")
            {

            }
            field(CourseName; Rec."Course Name")
            {

            }
            field(CourseDescription; Rec."Course Description")
            {

            }
            field(CourseFees; Rec."Course Fees")
            {

            }
        }
    }
}