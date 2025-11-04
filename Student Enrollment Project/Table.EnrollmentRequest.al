table 50103 "Enrollment Request"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student No.';
            TableRelation = Student;
        }

        field(3; "Course Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Code';
            TableRelation = Course;
        }

        field(4; "Request Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date';
        }

        field(5; Status; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
            OptionMembers = "Pending","Approved","Rejected";
        }

        field(6; "Approval Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Appoval Date';
        }

        field(7; "Approver ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Approver ID';
            TableRelation = User."User Name";
        }

        field(8; "Course Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Fees';
            TableRelation = Course."Course Fees";
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}