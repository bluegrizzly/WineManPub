<%@ Page Title="" Language="C#" MasterPageFile="~/BaseReport.Master" AutoEventWireup="true" CodeBehind="Analysis_ActiveTx.aspx.cs" Inherits="WineMan.Reports.Analysis_ActiveTx" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="800px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport ReportEmbeddedResource="WineMan.Reports.Report_Analysis_ActiveTx.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSetTX" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="DataSetTxTableAdapters.transactionsTableAdapter"></asp:ObjectDataSource>
</asp:Content>
