reportextension 50101 CustomerTop10List extends "Customer - Top 10 List"
{
    dataset
    {
        add(Customer)
        {
            column(City; City)
            {
            }
        }
    }

    rendering
    {
        layout(CustomTop10Layout)
        {
            Type = RDLC;
            LayoutFile = 'CustomerTop10List.rdl';
        }
    }
}
