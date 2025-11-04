codeunit 50106 "Student Payment Posting"
{
    procedure PostPaymentFromJournal(var JournalLine: Record "Student Payment Journal Line")
    var
        FeeEntry: Record "Student Ledger Entry";
        PaymentEntry: Record "Student Ledger Entry";
        RemainingPayment: Decimal;
        AppliedToEntry: Decimal;
    begin
        JournalLine.TestField("Student No.");
        JournalLine.TestField(Amount);

        if JournalLine.Amount <= 0 then begin
            Error('Journal Line Amount must be > 0');
        end;

        RemainingPayment := JournalLine.Amount;

        FeeEntry.SetRange("Student No.", JournalLine."Student No.");
        FeeEntry.SetRange("Course Code", JournalLine."Course Code");
        FeeEntry.SetRange(Status, FeeEntry.Status::Open);
        FeeEntry.SetCurrentKey("Posting Date");


        if FeeEntry.FindSet() then begin
            repeat
                if RemainingPayment <= 0 then
                    break;
                if FeeEntry."Remaining Amount" > 0 then begin
                    if FeeEntry."Remaining Amount" >= RemainingPayment then begin
                        AppliedToEntry := RemainingPayment;
                        RemainingPayment := 0;
                    end
                    else begin
                        AppliedToEntry := FeeEntry."Remaining Amount";
                        RemainingPayment -= AppliedToEntry;
                    end;

                    FeeEntry."Applied Amount" += AppliedToEntry;
                    FeeEntry."Remaining Amount" := FeeEntry.Amount - FeeEntry."Applied Amount";
                    if FeeEntry."Remaining Amount" = 0 then begin
                        FeeEntry.Status := FeeEntry.Status::Closed;
                    end;
                    FeeEntry.Modify(true);
                end;
            until FeeEntry.Next() = 0;

            PaymentEntry.Init();
            PaymentEntry."Student No." := JournalLine."Student No.";
            PaymentEntry."Course Code" := JournalLine."Course Code";
            PaymentEntry."Entry Type" := PaymentEntry."Entry Type"::Payment;

            PaymentEntry.Amount := -JournalLine.Amount;
            PaymentEntry."Applied Amount" := JournalLine.Amount - RemainingPayment;
            PaymentEntry."Remaining Amount" := RemainingPayment;

            if PaymentEntry."Remaining Amount" = 0 then begin
                PaymentEntry.Status := PaymentEntry.Status::Closed;
            end
            else begin
                PaymentEntry.Status := PaymentEntry.Status::Open;
            end;
            PaymentEntry."Posting Date" := JournalLine."Posting Date";
            PaymentEntry.Description := 'Payment ' + JournalLine.Description;
            PaymentEntry.Insert();


            if RemainingPayment > 0 then begin
                Message('Payment exceeds the outstanding fees by %1. Remaining %2 recorded as unapplied credit.', RemainingPayment, RemainingPayment);
            end;

            JournalLine.Delete();
        end;
    end;
}