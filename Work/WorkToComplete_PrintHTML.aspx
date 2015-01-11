<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkToComplete_PrintHTML.aspx.cs" Inherits="WineMan.Work.WorkdToComplete_Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 155px;
            height: 91px;
        }
    </style>

    <script type = "text/javascript">
        function PrintPanel() {
            window.print();
            
        }
    </script>

</head>
<body onload="DoPrint()">
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel_Main" runat="server" Font-Names="Arial">
            <img alt="" class="auto-style1" src="../images/index_logo.png" />
            A FAIRE LE
            <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="Larger"></asp:Label>
            <br />
            <asp:Table ID="Table_Content" runat="server">
            </asp:Table>
        </asp:Panel>
    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick = "return PrintPanel();" />
    </div>
    </form>
</body>
</html>
