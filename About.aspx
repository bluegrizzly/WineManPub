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
            Versions: 0.9</strong><asp:TextBox ID="TextBox_Versions" runat="server" Font-Size="Small" ForeColor="#333333" Height="282px" ReadOnly="True" TextMode="MultiLine" Width="100%" BackColor="#F2F2F2">
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
