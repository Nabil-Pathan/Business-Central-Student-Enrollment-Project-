table 50106 "Student Admin Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. of Students"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Pending Enrollments"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Fees Due"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Payments Today"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No. of Students")
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