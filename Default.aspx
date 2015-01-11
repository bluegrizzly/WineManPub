<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"  CodeBehind="Default.aspx.cs" Inherits="WineMan._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="/Styles/jquery-ui.css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            width: 484px;
            height: 211px;
        }
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Welcome to WineMan
    </h2>
    <p>
        <table class="auto-style2">
            <tr>
                <td>
        <asp:Calendar ID="Calendar1" runat="server" Enabled="False" OnDayRender="Calendar1_DayRender">
                        <SelectedDayStyle BackColor="#0099FF" />
                        <TodayDayStyle BackColor="#999999" />
                        <WeekendDayStyle BackColor="#EEEEEE" />
        </asp:Calendar>
                </td>
                <td>
                    <img alt="logo" class="auto-style1" src="images/index_logo.png" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>



</asp:Content>
