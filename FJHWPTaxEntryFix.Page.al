page 70100 "FJH.W/P Tax Entry Fix"
{

    /* Documentation()
    No. yyyy.mm.dd   Developer  Company      DocNo.        Version       Description
    -----------------------------------------------------------------------------------------------------
    000 2020.08.01   TDs        Grvppe       MtsBC15       01.00.00.00   Migration BC15
    */
    Permissions = tabledata "FJH.W/P Tax Entry" = rimd;
    Caption = 'Tax Entry Fix';
    ApplicationArea = All;
    UsageCategory = Administration;
    PageType = List;
    SourceTable = "FJH.W/P Tax Entry";
    SourceTableView = sorting("Document Date");
    //where(Posted = const(true));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(fldTaxType; rec."Tax Type")
                {
                    Visible = fldTaxTypeVisible;
                    ApplicationArea = All;
                    ToolTip = 'Tax Type';
                }
                field(fldTaxID; rec."Tax ID")
                {
                    Visible = fldTaxIDVisible;
                    ApplicationArea = All;
                    ToolTip = 'Tax ID';
                }
                field(fldTaxCode; rec."Tax Code")
                {
                    Editable = false;
                    Visible = fldTaxCodeVisible;
                    ApplicationArea = All;
                    ToolTip = 'Tax Code';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Posted';
                }
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entry No.';
                }
                field("Account Type"; rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Account Type';
                }
                field("Account No."; rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Account No.';
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                }
                field("VAT Registration No."; rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'VAT Registration No.';
                }
                field(Transaction; rec.Transaction)
                {
                    ApplicationArea = All;
                    ToolTip = 'Transaction';
                }
                field(Document; rec.Document)
                {
                    ApplicationArea = All;
                    ToolTip = 'Document';
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document Date';
                }
                field("Previous Base"; rec."Previous Base")
                {
                    ApplicationArea = All;
                    ToolTip = 'Previous Base';
                }
                field("Current Base"; rec."Current Base")
                {
                    ApplicationArea = All;
                    ToolTip = 'Current Base';
                }
                field("Previous Tax"; rec."Previous Tax")
                {
                    ApplicationArea = All;
                    ToolTip = 'Previous Tax';
                }
                field("Current Tax"; rec."Current Tax")
                {
                    ApplicationArea = All;

                    ToolTip = 'Current Tax';
                }
                field(FixCurrentTax; rec."Fix Current Tax")
                {
                    ApplicationArea = All;
                    Visible = OnlyCO;
                    ToolTip = 'Current Tax';
                }
                field("Tax rate"; rec."Tax rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tax rate';
                }
                field("Exception Rate"; rec."Exception Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Exception Rate';
                }
                field("Exception Amount"; rec."Exception Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Exception Amount';
                }
                field("Exception Certificate"; rec."Exception Certificate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Exception Certificate';
                }
                field("Amount Excepted Base (LCY)"; rec."Amount Excepted Base (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount Excepted Base (LCY)';
                }
                field("Certificate number"; rec."Certificate number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Certificate number';
                }
                field(Province; rec.Province)
                {
                    ApplicationArea = All;
                    ToolTip = 'Province';
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Currency Code';
                }
                field(Currency; rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Currency';
                }
                field("Vendor Document No."; rec."Vendor Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Vendor Document No.';
                }
                field("Current Tax (LCY)"; rec."Current Tax (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Current Tax (LCY)';
                }
                field("Posting Document Type Code"; rec."Posting Document Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Posting Document Type Code';
                }
                field("Posting Document Type"; rec."Posting Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Posting Document Type';
                }
                field("Posting Document No."; rec."Posting Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Posting Document No.';
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Posting Date';
                }
                field("Source Code"; rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Source Code';
                }
                field("Customs clearance code"; rec."Customs clearance code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customs clearance code';
                }

                field("Add-Currency Current Base"; rec."Add-Currency Current Base")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Add-Currency Current Base';
                }
                field("Add-Currency Current Tax"; rec."Add-Currency Current Tax")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Add-Currency Current Tax';
                }

            }
        }
    }
    actions
    {
    }
    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := true;
        fldTaxCodeVisible := true;
        fldTaxIDVisible := true;
        fldTaxTypeVisible := true;
    end;

    trigger OnOpenPage()
    begin
        fldTaxTypeVisible := rec.GETFILTER("Tax Type") = '';
        fldTaxIDVisible := rec.GETFILTER("Tax ID") = '';
        fldTaxCodeVisible := rec.GETFILTER("Tax Code") = '';
        OnlyCO := FJHSetupLocalization.IsLocColombia();
    end;

    var
        FJHSetupLocalization: Record "FJH.Setup Localization";

        fldTaxCodeVisible: Boolean;

        fldTaxIDVisible: Boolean;

        fldTaxTypeVisible: Boolean;
        OnlyCO: Boolean;

}
