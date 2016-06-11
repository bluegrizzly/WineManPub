<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkToCompleteTx.aspx.cs" Inherits="WineMan.Work.WorkToCompleteTx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 149px;
        }
        #setToDone {
            width: 135px;
        }
        #selectAll {
            width: 135px;
        }
        #clear {
            width: 135px;
        }
        .auto-style3 {
            width: 149px;
            height: 100px;
        }
        #print {
            width: 135px;
        }
        .auto-style4 {
            width: 149px;
            height: 43px;
        }
        #editRow {
            width: 135px;
        }
        #Text1 {
            width: 32px;
        }
        #txtLocation {
            width: 24px;
        }
    </style>

  <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

  <script>
      $(function () {
          $("#<%= txtDateStart.ClientID %>").datepicker({
              autoclose: true,
              dateFormat: "yy-mm-dd"
          });
      });
      $(function () {
          $("#<%= txtDateEnd.ClientID %>").datepicker({
              autoclose: true,
              dateFormat: "yy-mm-dd"
          });
      });
  </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <table class="auto-style1" cellspacing="3">
                <tr>
                    <td class="auto-style4" valign="top">
                        <h2>Transactions to complete </h2>
                    </td>
                    <td rowspan="3" valign="top" align="center">

                        <asp:Panel id="pnlContents" runat = "server">
                        <fieldset>
                            &nbsp;
                            <asp:Label ID="Label2" runat="server" Text="TransactionID:"></asp:Label>
                            <asp:TextBox ID="TextBox_TxID" runat="server" AutoPostBack="True" ToolTip="Filtering all transaction steps for this transaction number" Width="45px"></asp:TextBox>
                            <asp:Button ID="Button_ClearTxID" runat="server" OnClick="Button_ClearTxID_Click" Text="X" Width="20px" />
                            &nbsp;<asp:Label ID="Label3" runat="server" Text="Customer:"></asp:Label>
                            <asp:TextBox ID="TextBox_Customer" runat="server" AutoPostBack="True" ToolTip="Filtering transaction steps for customers that  are similar to this text. Can be a part of the first or last name." Width="100px"></asp:TextBox>
                            <asp:Button ID="Button_ClearCustomer" runat="server" OnClick="Button_ClearCustomer_Click" Text="X" Width="20px" />
                            &nbsp;View:<asp:DropDownList ID="DropDownList_ShowDone" runat="server" AutoPostBack="True" ToolTip="Filter view" Width="126px">
                                <asp:ListItem Value="0">In Progress Only</asp:ListItem>
                                <asp:ListItem Value="1">Done Only</asp:ListItem>
                                <asp:ListItem Value="2">All</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:CheckBox ID="CheckBox_ShowReady" runat="server" AutoPostBack="True" Text="Show Ready Only" ToolTip="Show only the transactions that have all steps completed" />

                        </fieldset>
                            <table id="jQGridDemo"></table>
                        </asp:Panel>
                        <div id="jQGridDemoPager">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" valign="top">
                        <fieldset>
                            Date Start:
                            <asp:TextBox ID="txtDateStart" runat="server" AutoPostBack="True" Width="97px"></asp:TextBox>
                            <asp:Button ID="Button_ClearStart" runat="server" Height="19px" OnClick="Button_ClearStart_Click" Text="X" Width="16px" Font-Bold="False" Font-Size="X-Small" />
                            <br />
                            Date End :
                            <asp:TextBox ID="txtDateEnd" runat="server" AutoPostBack="True" Width="97px"></asp:TextBox>
                            <asp:Button ID="Button_ClearEnd" runat="server" Height="19px" Text="X" Width="16px" Font-Size="X-Small" OnClick="Button_ClearEnd_Click" />
                            <asp:RadioButtonList ID="RadioButtonList_Date" runat="server" AutoPostBack="True" Font-Size="Small" Height="20px" Width="120px">
                                <asp:ListItem>Creation</asp:ListItem>
                                <asp:ListItem>Bottling</asp:ListItem>
                            </asp:RadioButtonList>
                        </fieldset></td>
                </tr>
                <tr>
                    <td class="auto-style2" align="center" valign="top">
                        <fieldset>

                            <input id="setToDone" type="button" value="Work Done"/><br />
                            <input id="selectAll" type="button" value="Select All"/><br />
                            <input id="clear" type="button" value="Clear Selection"/><br />
                            <br />
                            <input id="setLocation" type="button" value="Set Location"/>
                            <input id="txtLocation" type="text" /><br />
                            <br />
                            <input id="editRow" type="button" value="Edit tx"/> <br />
                        </fieldset></td>
                </tr>
            </table>
    
    <script type="text/javascript">
        function CheckRadioListSelectedItem() {
            var items = document.getElementsByName("<%=RadioButtonList_Date.UniqueID%>");
            for (var j = 0; j < items.length; j++) {
                if (items[j].checked) {
                    return items[j].value;
                }
            }
            return "Unknown";
        }

        var grid = $("#jQGridDemo");

        grid.jqGrid({
            url: '<%=ResolveUrl("~/Work/WorkToCompleteHandler.ashx?date=") %>' +
                document.getElementById('<%= txtDateStart.ClientID %>').value +
                "&dateend=" + document.getElementById('<%= txtDateEnd.ClientID %>').value +
                "&showdone=" + document.getElementById('<%= DropDownList_ShowDone.ClientID %>').value +
                "&showreadyonly=" + document.getElementById('<%= CheckBox_ShowReady.ClientID %>').checked +
                "&txid=" + document.getElementById('<%= TextBox_TxID.ClientID %>').value +
                "&customer=" + document.getElementById('<%= TextBox_Customer.ClientID %>').value +
                "&showtx=true" +
                "&datekind=" + CheckRadioListSelectedItem(),
            datatype: "json",
            colNames: ['TxID', 'Customer', 'Brand', 'Type', 'Category', 'Creation Date', 'Bottling Date', 'Steps Status', 'Loc', 'Done'],
            colModel: [
                        { name: 'id', index: 'id', width: 50, stype: 'text', sortable: true, sorttype: 'int' },
                        { name: 'client_id', index: 'client_id', width: 140, sortable: true },
                        { name: 'wine_brand_id', index: 'wine_brand_id', width: 100, stype: 'text', sortable: true },
                        { name: 'wine_type_id', index: 'wine_type_id', width: 100, stype: 'text', sortable: true },
                        { name: 'wine_category_id', index: 'wine_category_id', width: 50, stype: 'text', sortable: true },
                        {
                            name: 'date_creation', index: 'date_creation', width: 80, stype: 'text', sortable: true,
                            formatter: 'date',
                            formatoptions: {
                                srcformat: 'm/d/Y h:i:s A',
                                newformat: 'Y-M-d',
                                defaultValue: null
                            },
                        },
                        {
                            name: 'date_bottling', index: 'date_bottling', width: 80, stype: 'text', sortable: true,
                            formatter: 'date',
                            formatoptions: {
                                srcformat: 'm/d/Y h:i:s A',
                                newformat: 'Y-M-d',
                                defaultValue: null
                            },
                        },
                        { name: 'steps_done', index: 'steps_done', width: 50, stype: 'text', sortable: true, editable: false, align: 'center' },
                        { name: 'location', index: 'location', width: 20, stype: 'text', sortable: true, editable: true, align: 'center', cellEdit:true },
                        {
                            name: 'done', width: 30, index: 'done',
                            align: 'center',
                            editable: true,
                            edittype: 'checkbox', editoptions: { value: "1:0", defaultValue: "1" },
                            formatter: "checkbox", formatoptions: { disabled: true }
                        }
            ],
            rowNum: 500,
            multiselect: true,
            width: 760,
            height: 270,
            mtype: 'GET',
            loadonce: true,
            ignoreCase: true,
            rowList: [500, 1000, 5000],
            pager: '#jQGridDemoPager',
            sortname: 'id',
            viewrecords: true,
            sortorder: 'asc',
            caption: "Transactions",
            editurl: '<%=ResolveUrl("~/Transactions/TransactionHandler.ashx") %>',

            onSelectRow: function (id) {
                // Check if we are selecting a row that is already done 
                // in such case we allow reverting to not done instead.
                var ids = grid.jqGrid('getGridParam', 'selarrrow');
                var reset = true;
                if (ids.length == 1) {
                    var isDone = grid.getCell(id, "done");
                    if (isDone == "1") {
                        document.getElementById("setToDone").value = "Undo";
                        reset = false;
                    }
                }
                if (reset) {
                    document.getElementById("setToDone").value = "Work Done";
                }
            },
            gridComplete: function () {
                var rows = grid.getDataIDs();
                for (var i = 0; i < rows.length; i++) {
                    var status = grid.getCell(rows[i], "steps_done");
                    var isDone = grid.getCell(rows[i], "done");
                    if (isDone == "1") { grid.jqGrid('setRowData', rows[i], false, { color: 'black', weightfont: 'bold', background: 'gray' }); }
                    else if (status.charAt(0) == "0") { grid.jqGrid('setRowData', rows[i], false, { color: 'white', weightfont: 'bold', background: '#FF0000' }); }
                    else if (status.charAt(0) == "1") { grid.jqGrid('setRowData', rows[i], false, { color: 'white', weightfont: 'bold', background: '#FF3300' }); }
                    else if (status.charAt(0) == "2") { grid.jqGrid('setRowData', rows[i], false, { color: 'white', weightfont: 'bold', background: '#ff6600' }); }
                    else if (status.charAt(0) == "3") { grid.jqGrid('setRowData', rows[i], false, { color: 'black', weightfont: 'bold', background: '#ff9900' }); }
                    else if (status.charAt(0) == "4") { grid.jqGrid('setRowData', rows[i], false, { color: 'black', weightfont: 'bold', background: '#FFCC00' }); }
                    else if (status.charAt(0) == "5") { grid.jqGrid('setRowData', rows[i], false, { color: 'black', weightfont: 'bold', background: '#ccff00' }); }
                    else if (status.charAt(0) == "6") { grid.jqGrid('setRowData', rows[i], false, { color: 'black', weightfont: 'bold', background: '#66ff00' }); }
                    else if (status.charAt(0) == "7") { grid.jqGrid('setRowData', rows[i], false, { color: 'black', weightfont: 'bold', background: '#00FF00' }); }
                }
            }
        });


        $("#selectAll").click(function () {
            grid.jqGrid('resetSelection');
            var ids = grid.jqGrid('getDataIDs');
            for (var i = 0, il = ids.length; i < il; i++) {
                grid.jqGrid('setSelection', ids[i], true);
            }
        });
        $("#clear").click(function () {
            grid.jqGrid('resetSelection');
        });

        $("#setToDone").click(function () {
            var ids = grid.jqGrid('getGridParam', 'selarrrow');
            if (ids.length > 0) {
                var names = [];
                for (var i = 0, il = ids.length; i < il; i++) {
                    var name = grid.jqGrid('getCell', ids[i], 'id');
                    names.push(name);
                }
                //alert ("Names: " + names.join(", ") + "; ids: " + ids.join(", "));
                $("#names").html(names.join(", "));
                var jsonData = JSON.stringify(names);
                $.ajax({
                    type: "POST",
                    url: '<%=ResolveUrl("~/Work/WorkToCompleteHandler.ashx?operation=settodone&showtx=true") %>',
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        //                        alert(msg);
                        window.location.reload();
                    },
                    error: function (res, status, exeption) {
                        alert(res);
                    }
                });

                $("#dialog-confirm").dialog({
                    height: 280,
                    modal: true,
                    buttons: {
                        'Cancel': function () {
                            $(this).dialog('close');
                        },
                        'Confirm': function () {
                            alert("Confirm");
                        }
                    }
                });
            }
        });

        $("#setLocation").click(function () {
            var ids = grid.jqGrid('getGridParam', 'selarrrow');
            if (ids.length > 0) {
                var names = [];
                for (var i = 0, il = ids.length; i < il; i++) {
                    var name = grid.jqGrid('getCell', ids[i], 'id');
                    names.push(name);
                }
                $("#names").html(names.join(", "));
                var jsonData = JSON.stringify(names);
                $.ajax({
                    type: "POST",
                    url: '<%=ResolveUrl("~/Work/WorkToCompleteHandler.ashx?operation=setlocation&showtx=true&location=") %>' +
                            txtLocation.value,
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        window.location.reload();
                    },
                    error: function (res, status, exeption) {
                        alert(res);
                    }
                });
            }
        });

        $("#editRow").click(function () {
            var ids = grid.jqGrid('getGridParam', 'selarrrow');
            if (ids.length > 0) {
                var names = [];

                for (var i = 0, il = ids.length; i < il; i++) {
                    var name = grid.jqGrid('getCell', ids[i], 'id');
                    names.push(name);
                    break;// support only the first selection
                }

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
            }
        });


        $('#jQGridDemo').jqGrid('navGrid', '#jQGridDemoPager',
                    {
                        edit: false,
                        add: false,
                        del: false,
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
