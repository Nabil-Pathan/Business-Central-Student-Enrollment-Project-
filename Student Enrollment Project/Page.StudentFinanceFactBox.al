page 50110 "Student Finance FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Student;
    Caption = 'Student Finance Overview';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Total Fees"; GetTotalFees())
                {

                }

                field("Total Paid"; GetTotalPaid())
                {

                }

                field("Balance"; GetOutStandingBalance())
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    local procedure GetTotalFees(): Decimal
    var
        Ledg: Record "Student Ledger Entry";
        Total: Decimal;
    begin
        Ledg.SetRange("Student No.", Rec."Student No.");
        Ledg.SetRange("Entry Type", Ledg."Entry Type"::Fee);
        Total := 0;
        if Ledg.FindSet() then begin
            repeat
                Total += Ledg.Amount;
            until Ledg.Next() = 0;
        end;
        exit(Total);
    end;

    local procedure GetTotalPaid(): Decimal
    var
        Ledg: Record "Student Ledger Entry";
        Paid: Decimal;
    begin
        Ledg.SetRange("Student No.", Rec."Student No.");
        Ledg.SetRange("Entry Type", Ledg."Entry Type"::Payment);
        Paid := 0;
        if Ledg.FindSet() then begin
            repeat
                Paid += -Ledg.Amount;
            until Ledg.Next() = 0;
        end;

        exit(Paid);
    end;

    local procedure GetOutStandingBalance(): Decimal
    begin
        exit(GetTotalFees() - GetTotalPaid());
    end;
}