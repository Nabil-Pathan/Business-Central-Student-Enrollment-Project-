tableextension 50101 StudentTableExtension extends Student
{
    fields
    {
        field(6; "Picture"; Media)
        {
            Caption = 'Student Picture';
        }
    }
    var
        myInt: Integer;
}