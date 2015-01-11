<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rendezvous.aspx.cs" Inherits="WineMan.Transactions.Rendezvous" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 111px;
        }
        .auto-style4 {
            width: 15px;
        }
    .auto-style5 {
        width: 100%;
    }
        .auto-style6 {
            width: 191px;
        }
        .auto-style7 {
            width: 235px;
        }
    .auto-style8 {
        width: 301px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td rowspan="3" align class="auto-style4">
                    &nbsp;</td>
                <td rowspan="3" valign="top">
                    <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="400px" ScrollBars="Auto">
                        <table class="auto-style5">
                            <tr>
                                <td class="auto-style6">
                                </td>
                                <td align="center" class="auto-style8">
                                    <asp:Label ID="Label_Date" runat="server" BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" Font-Size="Larger" Text="Label"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <table class="auto-style5">
                            <tr>
                                <td colspan="3">
                                    <asp:Panel ID="Panel2" runat="server" BackColor="#EFF2F5" ScrollBars="Auto">
                                        <asp:Table ID="Table_Stations" runat="server" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" EnableViewState="False" GridLines="Both" HorizontalAlign="Center" ViewStateMode="Disabled">
                                        </asp:Table>
                                        <br />
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;</td>
                                <td align="center" class="auto-style7">
                                    <asp:DropDownList ID="DropDownList_ManualHour" runat="server" AutoPostBack="True" Height="17px" Width="49px">
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                    </asp:DropDownList>
                                    h<asp:DropDownList ID="DropDownList_ManualMin" runat="server" AutoPostBack="True" Height="16px" Width="47px">
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>35</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>45</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>55</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;<asp:Button ID="Button_AddHour_S1" runat="server" Text="Add" />
                                </td>
                                <td align="center">&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td valign="top">
        <asp:Calendar ID="Calendar_RDV" runat="server" OnSelectionChanged="Calendar_RDV_SelectionChanged" OnDayRender="Calendar_RDV_DayRender">
                        <SelectedDayStyle BackColor="SkyBlue" />
                        <TodayDayStyle BackColor="#999999" />
                        <WeekendDayStyle BackColor="#EEEEEE" />
        </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td align="center"><asp:Button ID="Button_Select" runat="server" OnClick="Button_Select_Click" Text="Select" Height="30px" Width="68px" style="margin-top: 14px" />
        
                &nbsp;
                    <asp:Button ID="Button_Print" runat="server" Height="28px" OnClick="Button_Print_Click" Text="Print" Width="64px" />
                    <asp:Button ID="Button_Cancel" runat="server" Height="30px" OnClick="Button_Cancel_Click" Text="Cancel" />
        
                    <br />
        
                </td>
            </tr>
        </table>
    </p>
    </asp:Content>
