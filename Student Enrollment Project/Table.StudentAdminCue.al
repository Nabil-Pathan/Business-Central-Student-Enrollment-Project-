table 50106 "Student Admin Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10]) { }
        field(2; "No. of Students"; Integer) { }
        field(3; "Pending Enrollments"; Integer) { }
        field(4; "Fees Due"; Integer) { }
        field(5; "Payments Today"; Integer) { }
        field(6; "No. of Courses"; Integer) { }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
