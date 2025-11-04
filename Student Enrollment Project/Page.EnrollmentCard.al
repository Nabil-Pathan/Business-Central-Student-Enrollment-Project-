page 50103 "Enrollment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Enrollment Request";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
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

            group(ApprovalInfo)
            {
                Caption = 'Approval Information';
                Editable = false;
                Visible = Rec.Status <> Rec.Status::Pending;

                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = All;
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SubmitRequest)
            {
                ApplicationArea = All;
                Caption = 'Submit Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to submit the request?') then begin
                        Rec.Status := Rec.Status::Pending;
                        Rec."Request Date" := Today;
                        Rec.Modify();
                        Message('Request Submitted Successfully');
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}