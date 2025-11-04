codeunit 50104 "Export to Exccel"
{
    trigger OnRun()
    var
        Student: Record Student;
        ExcelBuffer: Record "Excel Buffer";
    begin
        ExcelBuffer.DeleteAll();

        ExcelBuffer.AddColumn('Student No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Email', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Phone', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();


        if Student.FindSet() then begin
            repeat
                ExcelBuffer.AddColumn(Student."Student No.", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Student.Name, false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Student.Email, false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Student.Phone, false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.NewRow();
            until Student.Next() = 0;
        end;

        ExcelBuffer.CreateNewBook('Student Data');
        ExcelBuffer.WriteSheet('Students', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.OpenExcel();

    end;


}