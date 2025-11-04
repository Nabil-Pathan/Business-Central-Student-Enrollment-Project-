table 50105 "Student Payment Journal Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(2; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Student."Student No.";
        }

        field(3; "Course Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Course."Course Code";
        }

        field(4; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(6; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Line No.")
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