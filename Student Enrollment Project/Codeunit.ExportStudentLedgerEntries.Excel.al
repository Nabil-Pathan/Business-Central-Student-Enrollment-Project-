codeunit 50107 "Export Student Ledger to Excel"
{
    trigger OnRun()
    var
        StudentLedger: Record "Student Ledger Entry";
        ExcelBuffer: Record "Excel Buffer";
    begin
        ExcelBuffer.DeleteAll();

        ExcelBuffer.AddColumn('Entry No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Student No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Course Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Amount', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Posting Date', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn('Status', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Applied Ammount', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Remaining Amount', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Document No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Entry Type', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);


        ExcelBuffer.NewRow();


        if StudentLedger.FindSet() then begin
            repeat
                ExcelBuffer.AddColumn(StudentLedger."Entry No.", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(StudentLedger."Student No.", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(StudentLedger."Course Code", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(StudentLedger.Amount, false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(StudentLedger."Posting Date", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Date);
                ExcelBuffer.AddColumn(StudentLedger.Status, false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(StudentLedger.Description, false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(StudentLedger."Applied Amount", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(StudentLedger."Remaining Amount", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(StudentLedger."Document No.", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(StudentLedger."Entry Type", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);


                ExcelBuffer.NewRow();
            until StudentLedger.Next() = 0;
        end;

        ExcelBuffer.CreateNewBook('Student Ledger Data');
        ExcelBuffer.WriteSheet('Students', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.OpenExcel();

    end;


}