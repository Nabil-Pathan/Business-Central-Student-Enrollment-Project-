xmlport 50102 "Export Student Ledger Entries"
{
    Format = VariableText;
    Direction = Export;
    schema
    {
        textelement(Root)
        {
            tableelement(Student_Ledger_Entry; "Student Ledger Entry")
            {
                fieldelement(EntryNo; Student_Ledger_Entry."Entry No.")
                {

                }

                fieldelement(StudentNo; Student_Ledger_Entry."Student No.")
                {

                }

                fieldelement(CourseCode; Student_Ledger_Entry."Course Code")
                {

                }

                fieldelement(Amount; Student_Ledger_Entry.Amount)
                {

                }

                fieldelement(PostingDate; Student_Ledger_Entry."Posting Date")
                {

                }

                fieldelement(Status; Student_Ledger_Entry.Status)
                {

                }

                fieldelement(Description; Student_Ledger_Entry.Description)
                {

                }

                fieldelement(AppliedAmount; Student_Ledger_Entry."Applied Amount")
                {

                }
                fieldelement(RemainingAmount; Student_Ledger_Entry."Remaining Amount")
                {

                }

                fieldelement(DocumentNo; Student_Ledger_Entry."Document No.")
                {

                }
                fieldelement(EntryType; Student_Ledger_Entry."Entry Type")
                {

                }
            }
        }
    }


    var
        myInt: Integer;
}