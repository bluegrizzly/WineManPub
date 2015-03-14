<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddTransaction.aspx.cs" Inherits="WineMan.Transactions.AddTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 89px;
            height: 21px;
        }
        .auto-style4 {
            height: 4px;
        }
        .auto-style10 {
            width: 774px;
        }
        .auto-style11 {
            width: 89px;
        }
        .auto-style12 {
            height: 13px;
        }
        .auto-style13 {
            width: 31px;
            height: 21px;
        }
        .auto-style14 {
            width: 31px;
        }
        .auto-style15 {
            width: 197px;
        }
        .auto-style18 {
            height: 21px;
        }
        .auto-style19 {
            width: 39px;
            height: 21px;
        }
        .auto-style20 {
            width: 39px;
        }
        .auto-style22 {
        }
    .auto-style23 {
        width: 121px;
    }
    .auto-style24 {
        width: 154px;
    }
    </style>
<style>
       .ui-autocomplete {
            max-height: 300px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        } 
    .auto-style25 {
        width: 100%;
    }
    .auto-style26 {
        width: 51px;
    }
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

<script language="javascript" type="text/javascript">
    $(function () {
        $("#<%= TextBox_Date.ClientID %>").datepicker({
              autoclose: true,
              dateFormat: "M-dd-yy"
          });
    });

      $(function () {
        $('#<%=txtLastName.ClientID%>').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveClientUrl("~/Transactions/AddTransaction.aspx/GetAutoCompleteData")%>',
                    data: "{ 'pre':'" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return { value: item }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Ajax error: " + textStatus);
                    }
                });
            },
            select: function (event, ui) {
                $.ajax({
                    type: 'POST',
                    url: '<%=ResolveUrl("~/Transactions/AddTransaction.aspx/GetAutoCompleteDataDone")%>',
                    data: '{name: "' + document.getElementById('<%= txtLastName.ClientID%>').value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json'
                });
            }
        });
      });

    function ConfirmDropDownValueChange(source, arguments) {
        // Only ask confirmation for transaction editing
        if (document.getElementById('<%=Label_TransactionID.ClientID%>').innerText == "-") {
            arguments.IsValid = true;
            return;
        }
            
        arguments.IsValid = confirm("Are you sure? \nThis operation will change all transaction step dates.");
        if (!arguments.IsValid)
        {
            // Replace old value here.
        }
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="auto-style1" > 
            <asp:Panel ID="Panel1" runat="server" BorderWidth="2"  width="200" Height="300" >
                <table width="100%">
                    <tr>
                        <td>
                        <h3>1. Choose Customer</h3>
                        </td>
                        <td align="right">
                            <asp:CheckBox ID="CheckBox_1" runat="server" BackColor="Red" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Enabled="False" />
                        </td>
                    </tr>
               </table>
                <table width="100%">
                    <tr>
                        <td class="auto-style19" align="right">ID:</td>
                        <td class="auto-style18">
                            <asp:Label ID="Label_CustomerID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style20">First:</td>
                        <td>
                            <asp:Label ID="Label_FirstName" runat="server" Text="none" Font-Size="13pt" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style20">Last:</td>
                        <td>
                            <asp:Label ID="Label_LastName" runat="server" Text="none" Font-Size="13pt" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                </table>                <fieldset>
                <div class="ui-widget" style="text-align:center" >
                      <asp:TextBox ID="txtLastName" runat="server" Width="150px" CssClass="textboxAuto"  Font-Size="12px" OnTextChanged="txtLastName_TextChanged" BackColor="#E1E8F0" AutoPostBack="True" />
                      <br />
                      <asp:Label ID="Label1" runat="server" Font-Italic="True" Font-Size="7pt" ForeColor="#999999" Text="Type name, ID or phone to select"></asp:Label>
                </div>    
                </fieldset>
            </asp:Panel>
        </td>
        <td  > 

        <asp:Panel ID="Panel2" runat="server" BorderWidth="2" Width="400" Height="300">
            
            <table style="width:100%; height: 275px;" cellspacing="3">
            <tr>
                <td align="left" class="auto-style22"><h3>&nbsp;2. Choose Wine</h3></td>

                <td align="right">
                    <asp:CheckBox ID="CheckBox_2" runat="server" BackColor="Red" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Enabled="False" />
                </td>
            </tr>
                <tr>
                    <td align="right" class="auto-style22">Brand :&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="DropDownList_Brand" runat="server" OnSelectedIndexChanged="DropDownList_Brand_SelectedIndexChanged" BackColor="#E1E8F0" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
            <tr>
                <td align="right" class="auto-style22">Type :&nbsp;</td>
                <td>
                    <asp:DropDownList ID="DropDownList_Type" runat="server" AutoPostBack="True" BackColor="#E1E8F0" OnSelectedIndexChanged="DropDownList_Type_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="auto-style22">Category :&nbsp;</td>
                <td>
                    <asp:DropDownList ID="DropDownList_Category" runat="server" BackColor="#E1E8F0" OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged" CausesValidation="True" ValidationGroup="Group1" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:CustomValidator ID="ConfirmDropDownValidator" runat="server" ClientValidationFunction="ConfirmDropDownValueChange" Display="Dynamic" ValidationGroup="Group1" />
                </td>
            </tr>
                <tr>
                    <td class="auto-style4" colspan="2" style="background-color: #000080"></td>
                </tr>
                <tr>
                    <td align="right" class="auto-style22">Price :</td>
                    <td>
                        <asp:Label ID="Label_Price" runat="server" Text="0"></asp:Label>
                </td>
            </tr>

                <tr>
                    <td class="auto-style4" colspan="2" style="background-color: #000080"></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style22" colspan="2">Location:
                        <asp:TextBox ID="TextBox_Location" runat="server" BackColor="#E1E8F0" Width="47px" AutoPostBack="True" OnTextChanged="TextBox_Location_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style22" colspan="2">Product Code:
                        <asp:DropDownList ID="DropDownList_ProductCode" runat="server" BackColor="#E1E8F0" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_ProductCode_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="auto-style22" colspan="2">Comments<br />
                        <asp:TextBox ID="TextBox_Comment" runat="server" BackColor="#E1E8F0" Font-Size="Small" Height="140%" TextMode="MultiLine" Width="374px" AutoPostBack="True" OnTextChanged="TextBox_Comment_TextChanged"></asp:TextBox>
                    </td>
                </tr>

            </table>
            </asp:Panel>
        </td>
        <td class="auto-style14"  > 

            <asp:Panel ID="Panel15" runat="server" BorderWidth="2" Width="315" Height="300" HorizontalAlign="Left">
                <table width="100%">
                <tr>
                    <td align="left" class="auto-style15"><h3>&nbsp;3. Bottling Rendez-vous</h3></td>
                    <td align="right">
                        <asp:CheckBox ID="CheckBox_3" runat="server" BackColor="Red" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Enabled="False" />
                     </td>
                </tr>
                <tr>
                    <td  align="center">
                    <asp:Calendar ID="Calendar_RDV" runat="server" BorderStyle="Solid" BorderWidth="1px" ShowGridLines="True" ShowNextPrevMonth="False" Height="113px" Width="223px" Enabled="False">
                        <SelectedDayStyle BackColor="#0099FF" />
                        <TodayDayStyle BackColor="#999999" />
                        <WeekendDayStyle BackColor="#EEEEEE" />
                        </asp:Calendar>
                    </td>

                </tr>
                    <tr>
                        <td align="center" valign="middle" >
                            <strong>Date</strong>:
                            <asp:Label ID="Label_BottlingDate" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle"><strong>Hour</strong>:
                            <asp:Label ID="Label_BottlingHour" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle"><strong>Station</strong>:
                            <asp:Label ID="Label_BottlingStation" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="center">
                            <asp:Button ID="Button_SelectDate" runat="server" Height="23px" OnClick="Button_SelectDate_Click" Text="Pick a Rendez-vous" Width="148px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">
            <asp:Panel ID="Panel4" runat="server" BorderWidth="2"  width="200" Height="110" >
                <table style="width: 200px">
                    <tr>
                        <td class="auto-style24">
                            <h3> 4. Complete</h3>
                        </td>
                        <td align="right" class="auto-style23">
                            <asp:CheckBox ID="CheckBox_4" runat="server" BackColor="Red" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Enabled="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23" colspan="2">
                            <p>
                                Transaction ID:
                                <asp:Label ID="Label_TransactionID" runat="server" DefaultValue="0" Name="TxID" Text="Label" Font-Size="Large" style="font-weight: 700" ForeColor="Black"></asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="Button_Commit" runat="server" CausesValidation="False" OnClick="Button_Commit_Click" Text="Create" UseSubmitBehavior="False" />
                                <asp:Button ID="Button_Print" runat="server" OnClick="Button_Print_Click" Text="Print" />
                                <asp:Button ID="Button_SendEmail" runat="server" OnClick="Button_SendEmail_Click" Text="Send Email" Width="66px" Font-Size="X-Small" Height="22px" style="margin-top: 0px" Visible="False" />
                            </p>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

        </td>
        <td class="auto-style13" colspan="2" > 

            <asp:Panel ID="Panel3" runat="server" BorderWidth="2" Width="725" Height="110" CssClass="Panal" ScrollBars="Auto">
                <table style="width:100%; height:100%" cellspacing="0" cellpadding="0">
                    <tr >
                        <td colspan="0" valign="top" class="auto-style12" rowspan="0"><h3>Dates</h3></td>
                    </tr>
                    <tr>
                        <td class="auto-style10" valign="top">
                            <asp:Table ID="Table_Dates" runat="server" BorderWidth="2px" CellPadding="1" CellSpacing="1" GridLines="Both" Height="62px" HorizontalAlign="Center" Width="670px">
                            </asp:Table>
                            <table class="auto-style25">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="CheckBox_EditDates" runat="server" Text="Edit Dates" AutoPostBack="True" OnCheckedChanged="CheckBox_EditDates_CheckedChanged" />
                                </td>
                                <td>
                            <asp:Panel ID="Panel_EditDates" runat="server" >
                                <table class="auto-style25">
                                    <tr>
                                        <td>
                                            
                                        </td>
                                        <td align="center" style="background-color: #E1E8F0">
                                            <asp:DropDownList ID="DropDownList_Steps" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="DropDownList_Steps_SelectedIndexChanged" AutoPostBack="True" Visible="False">
                                            </asp:DropDownList>
                                            <asp:TextBox ID="TextBox_Date" runat="server" Width="85px" Visible="False"></asp:TextBox>
                                            <asp:Button ID="Button_ChangeDate" runat="server" Text="Change Date" OnClick="Button_ChangeDate_Click" Visible="False" />
                                        </td>
                                        <td class="auto-style26"></td>
                                        <td align="center" style="background-color: #E1E8F0">
                                             <asp:Button ID="Button_ResetDate" runat="server" Text="Reset Dates (today)" OnClick="Button_ResetDate_Click" Visible="False" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            </td>
                                </tr></table>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:winemanConnectionString %>" ProviderName="<%$ ConnectionStrings:winemanConnectionString.ProviderName %>" SelectCommand="SELECT id, name FROM steps"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                
            </asp:Panel>
        </td>
    </tr>
    </table>

</asp:Content>
