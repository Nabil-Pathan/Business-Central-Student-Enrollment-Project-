page 50115 "Student Enrollment Role Center"
{
    PageType = RoleCenter;
    Caption = 'Student Enrollment Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; "Role Center Headline")
                {
                    ApplicationArea = All;
                }
                part(StudentCues; "Student Admin Cue")
                {
                    ApplicationArea = All;
                }
                part(RecentEnrollments; "Recent Enrollment Part")
                {
                    ApplicationArea = All;
                }
                part(PowerBIEnrollments; "Power BI Embedded Report Part")
                {
                    ApplicationArea = All;
                    SubPageView = where(Context = const('Enrollments'));
                }
                part(RecentPayments; "Recent Payments")
                {
                    ApplicationArea = All;
                }

                part(PowerBIPayments; "Power BI Embedded Report Part")
                {
                    ApplicationArea = All;
                    SubPageView = where(Context = const('Payments'));
                }
            }

        }
    }

    actions
    {
        area(Sections)
        {
            group(StudentsGroup)
            {
                Caption = 'Students';
                action(StudentList)
                {
                    Caption = 'Students';
                    RunObject = page "Student List";
                    ApplicationArea = All;
                }
            }
            group(CoursesGroup)
            {
                Caption = 'Courses';
                action(CourseList)
                {
                    Caption = 'Courses';
                    RunObject = page "Course List";
                    ApplicationArea = All;
                }
            }
            group(EnrollmentGroup)
            {
                Caption = 'Enrollments';

                action(EnrollmentList)
                {
                    Caption = 'Enrollment Requests';
                    RunObject = page "Enrollment Request List";
                    ApplicationArea = All;
                }
            }
            group(FinanceGroup)
            {
                Caption = 'Payments & Fees';

                action(LedgerEntries)
                {
                    Caption = 'Student Ledger Entries';
                    RunObject = page "Student Ledger Entries";
                    ApplicationArea = All;
                }
                action(PaymentJournal)
                {
                    Caption = 'Payment Journal';
                    RunObject = page "Student Payment Journal";
                    ApplicationArea = All;
                }
            }
        }
        area(Reporting)
        {
            action(FeesStatement)
            {
                Caption = 'Student Fees Statement';
                RunObject = report "Student Fee Statement";
                ApplicationArea = All;
                Image = Report;
            }
            action(PaymentReceipt)
            {
                Caption = 'Payment Receipt';
                RunObject = report "Student Payment Receipt";
                ApplicationArea = All;
                Image = Report;
            }
        }

        area(Creation)
        {
            action(AddStudent)
            {
                Caption = 'New Student';
                RunObject = page "Student Card";
                RunPageMode = Create;
                ApplicationArea = All;
                Image = Add;
            }
            action(AddCourse)
            {
                Caption = 'New Course';
                RunObject = page "Course Card";
                RunPageMode = Create;
                ApplicationArea = All;
                Image = Add;
            }
            action(AddEnrollment)
            {
                Caption = 'New Enrollment';
                RunObject = page "Enrollment Card";
                RunPageMode = Create;
                ApplicationArea = All;
                Image = Add;
            }
        }
    }

    var
        myInt: Integer;
}

profile StudentAdmin
{
    ProfileDescription = 'Student Admin Center';
    RoleCenter = "Student Enrollment Role Center";
    Caption = 'Student Admin Center';
}