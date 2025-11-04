table 50102 Course
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Course Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Code';
        }

        field(2; "Course Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Name';
        }

        field(3; "Course Description"; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Description';
        }

        field(4; "Course Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Fees';
        }
    }

    keys
    {
        key(PK; "Course Code")
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