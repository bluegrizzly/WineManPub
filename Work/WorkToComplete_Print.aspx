<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkToComplete_Print.aspx.cs" Inherits="WineMan.Work.WorkToComplete_Print" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Button ID="Button_Show" runat="server" OnClick="Button_Show_Click" Text="Show" />
        <asp:Button ID="Button_Print" runat="server" Text="Print" OnClick="Button_Print_Click" />
        &nbsp;<asp:Button ID="Button_Back" runat="server" OnClick="Button_Back_Click" Text="Back" />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="10.5in" Height="8.4in">
            <LocalReport ReportEmbeddedResource="WineMan.Reports.Report_WorkToComplete.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="winemanDataSet2TableAdapters.customersTableAdapter"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
