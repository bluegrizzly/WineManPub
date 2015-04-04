<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="WineMan.Admin.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
       Settings
  </h2>
<p>
  </p>

<asp:Panel ID="Panel2" runat="server">
    <table class="auto-style1">
        <tr>
            <td align="right" style="background-color: #E1E8F0">Default Printer [<strong>Transactions</strong>]</td>
            <td style="background-color: #E1E8F0">
                <asp:DropDownList ID="DropDownList_Printers" runat="server" Height="20px" Width="314px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="background-color: #E1E8F0">Default Printer [<strong>Reports</strong>]</td>
            <td style="background-color: #E1E8F0">
                <asp:DropDownList ID="DropDownList_PrintersReports" runat="server" Height="20px" Width="314px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="background-color: #E1E8F0">Backup Path</td>
            <td style="background-color: #E1E8F0">
                <asp:TextBox ID="TextBox_BackupPath" runat="server" Width="305px" Height="16px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="background-color: #E1E8F0">Auto Print (no print preview for transactions)</td>
            <td style="background-color: #E1E8F0">
                <asp:CheckBox ID="CheckBox_AutoPrint" runat="server" />
            </td>
        </tr>

        <tr>
            <td align="right" style="background-color: #E1E8F0">Transaction ID Start at:</td>
            <td style="background-color: #E1E8F0">
                <asp:TextBox ID="TextBox_StartTXID" runat="server" TextMode="Number"></asp:TextBox>
            </td>
        </tr>

    </table>


    <table class="auto-style1">
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="Button_Save" runat="server" OnClick="Button_Save_Click" Text="Save Settings" TabIndex="2" UseSubmitBehavior="False" />
            </td>
        </tr>
    </table>

</asp:Panel>

</asp:Content>
