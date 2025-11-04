page 50104 "Enrollment Request List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Enrollment Request";
    CardPageId = "Enrollment Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = All;
                }

                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;
                }

                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ApproveRequest)
            {
                ApplicationArea = All;
                Caption = 'Approve Request';
                Image = Approve;
                trigger OnAction()
                var
                    EnrollmentMgt: Codeunit "Enrollment Management";
                begin
                    EnrollmentMgt.ApproveRequest(Rec);
                end;
            }

            action(RejectRequest)
            {
                ApplicationArea = All;
                Caption = 'Reject Request';
                Image = Reject;

                trigger OnAction()
                var
                    EnrollmentMgt: Codeunit "Enrollment Management";
                begin
                    EnrollmentMgt.RejectRequest(Rec);
                end;
            }

            action(PopulateSampleData)
            {
                ApplicationArea = All;
                Caption = 'Populate Sample Data';
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PopulateData: Codeunit "Populate Sample Data";
                begin
                    PopulateData.Run();
                end;
            }

            action(ViewApprovedEnrollments)
            {
                ApplicationArea = All;
                Caption = 'View Approved Enrollments';
                Image = List;
                RunObject = page 50105;
            }

            action(ViewLedger)
            {
                ApplicationArea = All;
                Caption = 'View Student Ledger';
                RunObject = page "Student Ledger Entries";
            }
        }
    }

    var
        StatusStyle: Text;

    trigger OnAfterGetRecord()
    begin
        StatusStyle := SetStatusStyle();
    end;

    local procedure SetStatusStyle(): Text
    begin
        case
            Rec.Status of
            Rec.Status::Pending:
                exit('Pending');
            Rec.Status::Approved:
                exit('Approved');
            Rec.Status::Rejected:
                exit('Rejected');
        end;
    end;
}