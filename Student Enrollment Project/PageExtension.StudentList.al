pageextension 50101 MyExtension extends "Student List"
{
    actions
    {
        addafter(ActionName)
        {
            action(ExportData)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Export Student Data';
                Image = Export;

                trigger OnAction()
                begin
                    Xmlport.Run(50101, true, false);
                end;
            }

            action(ExportToExcel)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Export to Excel';
                Image = Excel;

                trigger OnAction()
                var
                    ExcelExport: Codeunit "Export to Exccel";
                begin
                    ExcelExport.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}