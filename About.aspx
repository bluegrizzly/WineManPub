<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="WineMan.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About
    </h2>
    <asp:Panel ID="Panel2" runat="server" Width="100%">
        
            Created by Alain Dessureaux<br />alain.dessureaux@gmail.com<br /> Copyright (C) 2015 AndyFire Studio. All rights reserved.
        
            <strong>
            <br />
            <br />
            Versions: 1.03</strong><asp:TextBox ID="TextBox_Versions" runat="server" Font-Size="Small" ForeColor="#333333" Height="282px" ReadOnly="True" TextMode="MultiLine" Width="100%" BackColor="#F2F2F2">
Version 1.03 (6 avril 2015)
- Transaction page : No restrictions about dates when changing a transaction step date.
- Transactions to complete page:
    - Added transaction ID and Custoemer filters.
- Transaction steps page 
    - Now take into account the filtering (dates, transaction ID, Step)
    - New Customer field for filtering
- Transaction steps page print preview 
    - Added interactive column sorting.
    - Added printer choice.
- Transaction Print: Adjusted the margin for the transaction report printed page and for the work to complete printed page.
- Added many tooltips on text fields and buttons to better explain their usage. Just leave the mouse over a field.
- Removed the useless calendar on the home page.
- Settings page:
   - New field to set the starting ID of transactions.

Version 1.02 (2 avril 2015)
- New printer settings for reports in addition of the transaction default printer.

Version 1.01 (19 mars 2015)
- Add Transaction page: 
    - New button to reset the dates of the transaction steps starting the yeast today. All steps dates are adjusted.
    - If you change the yeast date the date of all steps are adjusted. You can change also dates of other steps but in such a case no modificaiton are done to other steps and it makes the transaction not following the recipes.
    - Confirm window before changing the category on an existing transaction.
    - If a transaction doesn't follow the recipes anymore because a step date changed, there is an indication in red: *Broken Recipes
-Transaction page:
    - Moved done column to th end to be consistent
- Transaction to complete page:
    - Added a button and text box to set location of selected transaction.
- New Settings page.
- Now handle the default printer.  You need to set the default printer in the Settings page in order to be able to print.

Version 1.0 (01 mars 2015)
- Allow setting appointment before the wine is ready (witha warning message)
- Transaction to complete page: Added a check box to show transactions already done.
- Both in Transaction to complete & transaction steps to complete page: 
    - If you select a transaction that is done. The button "Set to Done" change to Undo. if you select it, the transaction or transaction step reset to not done.
    - Added X buttons to clear the date fields

Version 0.95 (23 fev 2015)
- Added color code : 
    -Transactions page : Green when transaction is done
    -Transaction to complete : from red to green depending of the number of steps completed.
    -Transaction Steps to complete: Green when done.
- Allow only administrator to go on Admin pages.
- Show Printer dialog (to choose the printer) for the transaction steps to complete.
- Transaction Steps: set the end date to be the current date by default. So you see the work to be done only up to today only. You can remove the date to see all steps to do in the future.
- If a type or brand or type is disabled, we now see them when editing old transactions. but not see them with new tx.

Version 0.9: (19 fev 2015)
- Allow deleting brand,type and category with errors if they are in uses
- Do not show the brand,type if they are not active
- Allow deleting transactions. By doing so, all transaction steps related to the transaction will be deleted as well.
- In Transactions page, you can now type the full name of a customer or customer ID or phone to search all his transactions.
- Improved changind transaction step dates. We will change the ulterior dates only if the step needs to, regarding teh category recipes. A better messages now explain also what has been done.

Version 0.8: (10 fev 2015)
- New page to manage the production steps. Admin->Managers->Production Steps
- Date problem fixed.
- Now check if entry exist before adding it (Brands, Types, Categories, Product codes and Customers (with name and postal code)
- Remove ability to delete brand, type, category (this would corrupt other tables if we do so)
- New box in the Customers page to search for customers

Version 0.7: (1 fev 2015)
- Customers:
    - Customers sorted by last name alphabetic order 
    - Add dash to telephone number automatically
    - Ignore caps for customer name search (for all databases also)
- Fixed messagebox bug
- Fixed date formats to be all in MM-DD-YY
- Transaction Page:
    - Ability to change the data of a transaction step
    - Modify button has been removed. 
    - Transaction record is updated after any modifications.
    - Validation is done on transaction modification.
    - When the transaction step date changes, the rendez-vous date need to be updated before changing the transaction

Version 0.6: (23 jan 2015)
- New Menu separation (Bottling / WineWork)
- New page to complete transactions
- New page icon
- New fields in transaction: Location, comments and Product  Code
- New Product Code manager page (under Admin->Managers)
- Backup Page. for manual backups (backup path is in settings)

Version 0.5: (15 jan 2015)
-----------------------
- Add transaction
    - Rendezvous: Cannot select a rendez vous that is before the wine completed date.
    - Rendezvous: Will automatically select a next non-holiday date
    - Choosing a customer: Can select a customer by phone or name of first name
    - Choosing a customer: You can see the name of the clients and phone number 

- All transactions
    - You can toggle to see all transactions or only the non completed ones (default)
    - You can sort the transaction with some filters like &quot;last week&quot;
    - Filtering based on customer and transaction ID

- Work to complete page 
    - Show late work toggle
    - Show work done toggle
    - Filtering based on Steps

- Customers
    - Can add/remove/edit customers

-Admin
    - Can add/modify/edit holidays. The holidays cannot be selected by rendez vous.
    - Can add/modify/edit Wine Brand, Type, Categories

- Print
    - Transaction card for client (bilingual)
    - Work to do
    - Rendez vous

</asp:TextBox>
    </asp:Panel>
</asp:Content>
