page 50111 "Student Picture FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            field(Picture; Rec.Picture)
            {
                ApplicationArea = All;
                ShowCaption = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                Caption = 'Import Picture';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Instr: InStream;
                    FileName: Text;
                    FileMgt: Codeunit "File Management";
                begin
                    if UploadIntoStream('Import student picture', '', 'All Files (*.*)|*.*', FileName, Instr) then begin
                        Rec.Picture.ImportStream(Instr, FileName);
                        Rec.Modify(true);
                    end;
                end;
            }

            action(DeletePicture)
            {
                Caption = 'Delete Picture';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Clear(Rec.Picture);
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}