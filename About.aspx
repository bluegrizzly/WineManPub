<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="WineMan.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About
    </h2>
    <p>
        Created by Alain Dessureaux<br />alain.dessureaux@gmail.com<br /> Copyright (C) 2015 AndyFire Studio. All rights reserved.
    </p>
<p>
        &nbsp;</p>
<p>
        Versions:</p>
<p>
        <asp:TextBox ID="TextBox_Versions" runat="server" Font-Size="Small" ForeColor="#333333" Height="147px" ReadOnly="True" TextMode="MultiLine" Width="557px">Version 1.0: (jan 2015)
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
    </p>
</asp:Content>
