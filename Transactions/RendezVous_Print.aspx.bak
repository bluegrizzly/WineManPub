<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RendezVous_Print.aspx.cs" Inherits="WineMan.Transactions.RendezVous_Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 155px;
            height: 74px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
        }
        .auto-style4 {
            width: 166px;
        }
        .auto-style5 {
            width: 152px;
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
        <asp:Button ID="Button_Back" runat="server" OnClick="Button_Back_Click" Text="Back" Height="31px" Width="58px" />
        &nbsp;<asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick = "return PrintPanel();" Height="31px" Width="65px" />
&nbsp;&nbsp;
        <asp:Label ID="Label_Printer" runat="server" Text="Printer:" Visible="False"></asp:Label>
        <asp:DropDownList ID="DropDownList_Printer" runat="server" Visible="False">
        </asp:DropDownList>
        <asp:Panel ID="Panel_Main" runat="server" Font-Names="Arial">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style5">
                        <img alt="" class="auto-style1" src="../images/index_logo.png" />
                    </td>
                    <td class="auto-style4">
                        <h1>Bottling </h1>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="Larger" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="3">
                        <asp:Table ID="Table_Content" runat="server">
                        </asp:Table>
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
