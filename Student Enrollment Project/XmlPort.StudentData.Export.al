xmlport 50101 "Export Student Data"
{
    Format = VariableText;
    Direction = Export;

    schema
    {
        textelement(Root)
        {
            tableelement(Student; Student)
            {
                fieldelement(No; Student."Student No.")
                {

                }

                fieldelement(Name; Student.Name)
                {

                }

                fieldelement(Email; Student.Email)
                {

                }

                fieldelement(Phone; Student.Phone)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}