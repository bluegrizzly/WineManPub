<%@ Page Title="Transactions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="WineMan.Transactions.Transactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
        #showDone {
            width: 103px;
        }
        #editRow {
            width: 86px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
    <tr>
        <td width="120" valign="top"> 
    <h2>
       Transactions
    </h2>
&nbsp;</td>
        <td valign="top" rowspan="2">
        <fieldset>
            <asp:Label ID="Label3" runat="server" Text="Dates:"></asp:Label>
            <asp:DropDownList ID="DropDownList_Filter" runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">All</asp:ListItem>
                <asp:ListItem Value="1">Today</asp:ListItem>
                <asp:ListItem Value="2">This Week</asp:ListItem>
                <asp:ListItem Value="3">This Month</asp:ListItem>
                <asp:ListItem Value="4">Last 4 Weeks</asp:ListItem>
            </asp:DropDownList>
            &nbsp; <asp:Label ID="Label2" runat="server" Text="Transaction ID:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox_TxIDSearch" runat="server" AutoPostBack="True" Width="37px"></asp:TextBox>
<asp:Button ID="Button_ClearTxID" runat="server" OnClick="Button_ClearTxID_Click" Text="X" Width="21px" />
            &nbsp;
            <asp:Label ID="Label1" runat="server" Text="Customer: "></asp:Label>
            <asp:TextBox ID="TextBox_CustomerSearch" runat="server" AutoPostBack="True"></asp:TextBox>
            <asp:Button ID="Button_ClearCustomer" runat="server" OnClick="Button_ClearCustomer_Click" Text="X" Width="21px" />
    <asp:CheckBox ID="ShowCompletedCheckBox" runat="server" Text="Show completed tx" AutoPostBack="True" />
        </fieldset>
            <table id="jQGridDemo">
            </table>
            <div id="jQGridDemoPager">
            </div>
        </td>
    </tr>
    <tr>
        <td width="120" valign="top"> 
            <fieldset>
                <input id="editRow" type="button" value="Edit tx"/>
            </fieldset></td>
    </tr>
    </table>

            <script type="text/javascript">
                jQuery("#jQGridDemo").jqGrid({
                    url: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx?showcompleted=") %>' +
                        document.getElementById('<%= ShowCompletedCheckBox.ClientID%>').checked +
                        "&filterdate=" + document.getElementById('<%= DropDownList_Filter.ClientID%>').value +
                        "&filtercustomer=" + document.getElementById('<%= TextBox_CustomerSearch.ClientID%>').value +
                        "&filtertxid=" + document.getElementById('<%= TextBox_TxIDSearch.ClientID%>').value,
                    datatype: "json",
                    colNames: ['ID', 'Customer', 'Brand', 'Type', 'Category', 'Creation Date', 'Bottling Date', 'Station', 'Done'],
                    colModel: [
                                { name: 'id', index: 'id', width: 50, stype: 'text', sortable: true, sorttype: 'int' },
   		                        { name: 'client_id', index: 'client_id', width: 140, sortable: true },
   		                        { name: 'wine_brand_id', index: 'wine_brand_id', width: 100, stype: 'text', sortable: true },
                                { name: 'wine_type_id', index: 'wine_type_id', width: 100, stype: 'text', sortable: true },
                                { name: 'wine_category_id', index: 'wine_category_id', width: 70, stype: 'text', sortable: true },
                                {
                                    name: 'date_creation', index: 'date_creation', width: 80, stype: 'text', sortable: true,
                                    formatter: 'date',
                                    datefmt: 'yyyy/MM/dd',
                                    formatoptions: {
                                        srcformat: 'd/m/Y H:i:s',
                                        newformat: 'Y/M/d',
                                        defaultValue: null
                                    },
                                },
                                {
                                    name: 'date_bottling', index: 'date_bottling', width: 120, stype: 'text', sortable: true,
                                    formatter: 'date',
                                    datefmt: 'yyyy/MM/dd',
                                    formatoptions: {
                                        srcformat: 'd/m/Y H:i:s',
                                        newformat: 'Y/M/d H:i',
                                        defaultValue: null
                                    },
                                },

                                { name: 'bottling_station', index: 'bottling_station', width: 40, sortable: true, align: 'center' },
                                {
                                    name: 'done', width: 30, index: 'done',
                                    align: 'center',
                                    editable: true,
                                    edittype: 'checkbox', editoptions: { value: "1:0", defaultValue: "1" },
                                    formatter: "checkbox", formatoptions: { disabled: true }
                                }
                    ],
                    rowNum: 20,
                    height: 250,
                    mtype: 'GET',
                    loadonce: true,
                    rowList: [20, 50, 200, 500],
                    pager: '#jQGridDemoPager',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: 'desc',
                    caption: "Transactions",
                    editurl: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx") %>',

                    onSelectRow: function (ids) {
                        url: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx") %>'
                    }
                });


                    $("#editRow").click(function () {
                        var sel_id = $('#jQGridDemo').jqGrid('getGridParam', 'selrow');
                        var value = $('#jQGridDemo').jqGrid('getCell', sel_id, 'id');
                        $.ajax({
                            type: "POST",
                            url: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx?operation=editrow") %>',
                            data: value,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                window.location = data;
                            },
                            error: function (res, status, exeption) {
                                if (value == "")
                                    alert("please select a row");
                                else
                                    alert(exeption);
                            }
                        });
                });



                    $('#jQGridDemo').jqGrid('navGrid', '#jQGridDemoPager',
                               {
                                   edit: false,
                                   add: false,
                                   del: true,
                                   search: true,
                                   searchtext: "Search",
                                   addtext: "Add",
                                   edittext: "Edit",
                                   deltext: "Delete"
                               },
                               {   //EDIT
                                   //                       height: 300,
                                   //                       width: 400,
                                   //                       top: 50,
                                   //                       left: 100,
                                   //                       dataheight: 280,
                                   closeOnEscape: true,//Closes the popup on pressing escape key
                                   reloadAfterSubmit: true,
                                   drag: true,
                                   afterSubmit: function (response, postdata) {
                                       if (response.responseText == "") {

                                           $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');//Reloads the grid after edit
                                           return [true, '']
                                       }
                                       else {
                                           $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid'); //Reloads the grid after edit
                                           return [false, response.responseText]//Captures and displays the response text on th Edit window
                                       }
                                   },
                                   editData: {
                                       EmpId: function () {
                                           var sel_id = $('#jQGridDemo').jqGrid('getGridParam', 'selrow');
                                           var value = $('#jQGridDemo').jqGrid('getCell', sel_id, 'Id');
                                           return value;
                                       }
                                   }
                               },
                               {
                                   closeAfterAdd: true,//Closes the add window after add
                                   afterSubmit: function (response, postdata) {
                                       if (response.responseText == "") {

                                           $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                                           return [true, '']
                                       }
                                       else {
                                           $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                                           return [false, response.responseText]
                                       }
                                   }
                               },
                               {   //DELETE
                                   closeOnEscape: true,
                                   closeAfterDelete: true,
                                   reloadAfterSubmit: true,
                                   closeOnEscape: true,
                                   drag: true,
                                   afterSubmit: function (response, postdata) {
                                       if (response.responseText == "") {

                                           $("#jQGridDemo").trigger("reloadGrid", [{ current: true }]);
                                           return [false, response.responseText]
                                       }
                                       else {
                                           $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                                           return [true, response.responseText]
                                       }
                                   },
                                   delData: {
                                       EmpId: function () {
                                           var sel_id = $('#jQGridDemo').jqGrid('getGridParam', 'selrow');
                                           var value = $('#jQGridDemo').jqGrid('getCell', sel_id, 'id');
                                           return value;
                                       }
                                   }
                               },
                               {//SEARCH
                                   closeOnEscape: true

                               }
                        );

            </script>
</asp:Content>
