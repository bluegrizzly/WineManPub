<%@ Page Title="WineMan" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"  CodeBehind="Default.aspx.cs" Inherits="WineMan._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="/Styles/jquery-ui.css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            width: 484px;
            height: 211px;
        }
        .auto-style2 {
            width: 483%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Welcome to WineMan
    </h2>
    <p>
        <br />
        <br />
        <br />
        <table width="100%" >
            <tr>
                <td align="center">
                    <img alt="logo" class="auto-style1" src="images/index_logo.png" /></td>
                <td></td>
            </tr>
        </table>
    </p>

</asp:Content>
