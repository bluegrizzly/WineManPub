﻿<%@ Page Title="Transactions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="WineMan.Transactions.Transactions" %>
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
            <asp:DropDownList ID="DropDownList_Filter" runat="server" AutoPostBack="True" ToolTip="Filter the transactions by their creation date">
                <asp:ListItem Value="0">All</asp:ListItem>
                <asp:ListItem Value="1">Today</asp:ListItem>
                <asp:ListItem Value="2">This Week</asp:ListItem>
                <asp:ListItem Value="3">This Month</asp:ListItem>
                <asp:ListItem Value="4">Last 4 Weeks</asp:ListItem>
            </asp:DropDownList>
            &nbsp; <asp:Label ID="Label2" runat="server" Text="Transaction ID:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox_TxIDSearch" runat="server" AutoPostBack="True" Width="37px" ToolTip="Search transaction by it's unique ID"></asp:TextBox>
<asp:Button ID="Button_ClearTxID" runat="server" OnClick="Button_ClearTxID_Click" Text="X" Width="21px" />
            &nbsp;
            <asp:Label ID="Label1" runat="server" Text="Customer: "></asp:Label>
            <asp:TextBox ID="TextBox_CustomerSearch" runat="server" AutoPostBack="True" ToolTip="Search transaction with customer. Can be beginning or ending part  of the first or last name."></asp:TextBox>
            <asp:Button ID="Button_ClearCustomer" runat="server" OnClick="Button_ClearCustomer_Click" Text="X" Width="21px" />
    &nbsp; View:<asp:DropDownList ID="DropDownList_ShowDone" runat="server" AutoPostBack="True" ToolTip="Filter view" Width="126px">
                                <asp:ListItem Value="0">In Progress Only</asp:ListItem>
                                <asp:ListItem Value="1">Done Only</asp:ListItem>
                                <asp:ListItem Value="2">All</asp:ListItem>
                            </asp:DropDownList>
        </fieldset>
        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
            <table id="jQGridDemo">
            </table>
            <div id="jQGridDemoPager">
            </div>
        </asp:Panel>
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
            var grid = $("#jQGridDemo");
            jQuery("#jQGridDemo").jqGrid({
                url: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx?showcompleted=") %>' + document.getElementById('<%= DropDownList_ShowDone.ClientID%>').value +
                    "&filterdate=" + document.getElementById('<%= DropDownList_Filter.ClientID%>').value +
                    "&filtercustomer=" + document.getElementById('<%= TextBox_CustomerSearch.ClientID%>').value +
                    "&filtertxid=" + document.getElementById('<%= TextBox_TxIDSearch.ClientID%>').value,
                datatype: "json",
                colNames: ['id', 'Customer', 'Symbol', 'Brand', 'Type', 'Category', 'Creation Date', 'Bottling Date', 'Station', 'Location', 'Code', 'Done'],
                colModel: [
                            { name: 'id', index: 'id', width: 40, stype: 'text', sortable: true, sorttype: 'int' },
   		                    { name: 'client_id', index: 'client_id', width: 140, sortable: true },
                            { name: 'symbol', index: 'symbol', width: 10, sortable: true },
   		                    { name: 'wine_brand_id', index: 'wine_brand_id', width: 100, stype: 'text', sortable: true },
                            { name: 'wine_type_id', index: 'wine_type_id', width: 100, stype: 'text', sortable: true },
                            { name: 'wine_category_id', index: 'wine_category_id', width: 50, stype: 'text', sortable: true },
                            {
                                name: 'date_creation', index: 'date_creation', width: 80, stype: 'text', sortable: true,
                                formatter: 'date',
                                formatoptions: {
                                    srcformat: 'm/d/Y h:i:s',
                                    newformat: 'Y-M-d',
                                    defaultValue: null
                                },
                            },
                            {
                                name: 'date_bottling', index: 'date_bottling', width: 110, stype: 'text', sortable: true,
                                formatter: 'date',
                                formatoptions: {
                                    srcformat: 'm/d/Y h:i:s A',
                                    newformat: 'Y-M-d H:i',
                                    defaultValue: null
                                },
                            },

                            { name: 'bottling_station', index: 'bottling_station', width: 40, sortable: true, align: 'center' },
                            { name: 'location', index: 'location', width: 30, sortable: true, align: 'center' },
                            { name: 'product_code', index: 'product_code', width: 25, sortable: true, align: 'center' },
                            {
                                name: 'done', width: 30, index: 'done',
                                align: 'center',
                                stype: 'checkbox',
                                search: true,
                                editable: true,
                                edittype: 'checkbox',
                                editoptions: { value: "1:0", defaultValue: "1" },
                                formatter: "checkbox", formatoptions: { disabled: true }
                            }
                ],
                rowNum: 1000,
                height: 270,
                autowidth: true,
                mtype: 'GET',
                loadonce: true,
                ignoreCase: true,
                rowList: [1000, 2000, 5000],
                pager: '#jQGridDemoPager',
                sortname: 'id',
                viewrecords: true,
                sortorder: 'asc',
                multiselect: false,
                caption: "Transactions",
                editurl: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx") %>',

                onSelectRow: function (ids) {
                    url: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx") %>'
                },
                gridComplete: function () {
                    var rows = $("#jQGridDemo").getDataIDs();
                    for (var i = 0; i < rows.length; i++) {
                        var status = $("#jQGridDemo").getCell(rows[i], "done");
                        if (status == "1") {
                            $("#jQGridDemo" ).jqGrid('setRowData', rows[i], false, { color: 'white', weightfont: 'bold', background: 'green' });
                        }
                    }
                }
            });


            $("#editRow").click(function () {
                var ids = $("#jQGridDemo").jqGrid('getGridParam', 'selrow');

                if (ids.length > 0) {
                    var names = [];

                    var rowData = $("#jQGridDemo").jqGrid("getRowData" ,ids);
                    var name = rowData['id'];
                    names.push(name);

                    names.push("*");

                    var allids = grid.jqGrid('getDataIDs');
                    for (var i = 0; i < allids.length; i++) {
                        var rowId = allids[i];
                        var rowData = grid.jqGrid('getRowData', rowId);
                        names.push(rowData.id);
                        //alert("RowId: " + rowId + " data: " + rowData.id);
                    }

                    //alert ("Names: " + names.join(", ") + "; ids: " + ids.join(", "));
                    $("#names").html(names.join(", "));
                    var jsonData = JSON.stringify(names);
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx?operation=editrow") %>',
                        data: jsonData,
                        async:false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            window.open(data, "_blank");
                        },
                        error: function (res, status, exeption) {
                            if (value == "")
                                alert("please select a row");
                            else
                                alert(exeption);
                            }
                        });
                    }
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
                                width:500,
                                drag: true,
                                beforeShowForm: function ($form) {
                                    var sel_id = $('#jQGridDemo').jqGrid('getGridParam', 'selrow');
                                    $("td.delmsg", $form[0]).html("*** WARNING ***\n\nDo you really want delete the transaction: <b>id=" +
                                            $('#jQGridDemo').jqGrid('getCell', sel_id, 'id') + "</b>?\n\nAll transactions steps related to this transaction\nwill also be deleted ");
                                },
                                afterSubmit: function (response, postdata) {
                                    if (response.responseText == "") {

                                        $("#jQGridDemo").trigger("reloadGrid", [{ current: true }]);
                                        return [true, response.responseText]
                                    }
                                    else {
                                        $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                                        return [false, response.responseText]
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
