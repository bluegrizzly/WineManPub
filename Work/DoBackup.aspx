<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoBackup.aspx.cs" Inherits="WineMan.Work.DoBackup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 327px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Backup</h2>
    <br />
    <table border="0" class="auto-style1" frame="border" style="background-color: #99CCFF">
        <tr>
            <td align="center" class="auto-style2" rowspan="2">
    <asp:Button ID="Button_DoBackup" runat="server" Text="Backup Databases" Height="36px" OnClick="Button_DoBackup_Click" />
            </td>
            <td style="color: #000000">BackupPath:
                <asp:Label ID="Label_Path" runat="server" BackColor="#EEEEEE" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox_Log" runat="server" Height="78px" TextMode="MultiLine" Width="425px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
