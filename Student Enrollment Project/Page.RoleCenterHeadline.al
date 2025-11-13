page 50116 "Role Center Headline"
{
    PageType = HeadlinePart;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Welcome; Welcome)
                {
                    ApplicationArea = All;
                }
                field(Awesome; BusinessCentralIsAwesomeLbl)
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        Hyperlink('https://github.com/Nabil-Pathan/Business-Central-Student-Enrollment-Project');
                    end;
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

    trigger OnOpenPage()
    begin
        Welcome := StrSubstNo(WelcomeLbl, UserId());
    end;


    var
        WelcomeLbl: Label 'Welcome, %1 👋';
        BusinessCentralIsAwesomeLbl: Label '<qualifier>Welcome to CampusConnect</qualifier><payload>Built using <emphasize>Dynamics 365 Business Central</emphasize></payload>';
        Welcome: Text;
}