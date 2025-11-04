table 50101 Student
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student No.';
        }

        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Name';
        }

        field(3; Email; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email';
        }

        field(4; Phone; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone';
        }

        field(5; Age; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Age';
        }
    }

    keys
    {
        key(PK; "Student No.")
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