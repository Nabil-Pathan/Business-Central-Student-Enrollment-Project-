report 50101 "Student Fee Statement"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelLayout;

    dataset
    {
        dataitem(Student; Student)
        {
            RequestFilterFields = "Student No.", Name;
            column(StudentNo; "Student No.")
            {

            }
            column(StudentName; Name)
            {

            }

            column(TotalFees; TotalFees)
            {

            }

            column(TotalPaid; TotalPaid)
            {

            }
            column(Balance; Balance)
            {

            }


            dataitem(Ledger; "Student Ledger Entry")
            {
                DataItemLink = "Student No." = field("Student No.");

                column(Posting_Date; "Posting Date")
                {

                }
                column(Course_Code; "Course Code")
                {

                }
                column(Description; Description)
                {

                }
                column(Amount; Amount)
                {

                }
                column(Status; Status)
                {

                }

                trigger OnAfterGetRecord()
                begin
                    if Amount > 0 then begin
                        TotalFees += Amount;
                    end
                    else begin
                        TotalPaid += Amount;
                    end;

                    Balance := TotalFees + TotalPaid;
                end;

                trigger OnPreDataItem()
                begin
                    if ShowOnlyOpen then begin
                        Ledger.SetRange(Status, Ledger.Status::Open);
                    end;
                end;
            }


            trigger OnPreDataItem()
            begin
                TotalFees := 0;
                TotalPaid := 0;
                Balance := 0;
            end;

        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(ShowOnlyOpen; ShowOnlyOpen)
                    {
                        Caption = 'Show Only Open Entries';
                        ApplicationArea = All;
                    }
                }
            }
        }

    }

    rendering
    {
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = 'StudentFeeStatement.xlsx';
        }

        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'StudentFeeStatement.docx';
        }

        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = 'StudentFeeStatement.rdl';
        }
    }


    var
        ShowOnlyOpen: Boolean;
        TotalFees: Decimal;
        TotalPaid: Decimal;
        Balance: Decimal;
}