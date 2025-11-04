table 50104 "Student Ledger Entry"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }

        field(2; "Student No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Student."Student No.";
        }

        field(3; "Course Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Course."Course Code";
        }

        field(4; Amount; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(5; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(6; Status; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Open,Closed;
        }

        field(7; Description; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(8; "Applied Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(9; "Remaining Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(10; "Document No."; Text[50])
        {
            DataClassification = SystemMetadata;
        }

        field(11; "Entry Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Fee,Payment;
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(StudentCourse; "Student No.", "Course Code")
        {

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
        "Remaining Amount" := Amount - "Applied Amount";
        if "Remaining Amount" = 0 then
            Status := Status::Closed
        else
            Status := Status::Open;
    end;

    trigger OnModify()
    begin
        "Remaining Amount" := Amount - "Applied Amount";
        if "Remaining Amount" = 0 then
            Status := Status::Closed
        else
            Status := Status::Open
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;



}