<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkToCompleteTx.aspx.cs" Inherits="WineMan.Work.WorkToCompleteTx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 146px;
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
            width: 146px;
            height: 129px;
        }
        #print {
            width: 135px;
        }
        .auto-style4 {
            width: 146px;
            height: 43px;
        }
        #editRow {
            width: 135px;
        }
    </style>

  <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

  <script>
      $(function () {
          $("#<%= txtDate.ClientID %>").datepicker({
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
                        <h2>TransactionS </h2>
                    </td>
                    <td rowspan="3" valign="top" align="center">

                        <asp:Panel id="pnlContents" runat = "server">
                        <fieldset>
                            &nbsp;
                            <asp:CheckBox ID="CheckBox_ShowReady" runat="server" Text="Show Ready Only (all steps done)" AutoPostBack="True" />
                            
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
                            <asp:TextBox ID="txtDate" runat="server" AutoPostBack="True" Width="107px"></asp:TextBox>
                            <br />
                            <br />Date End :
                            <asp:TextBox ID="txtDateEnd" runat="server" AutoPostBack="True" Width="107px"></asp:TextBox>
                        </fieldset></td>
                </tr>
                <tr>
                    <td class="auto-style2" align="center" valign="top">
                        &nbsp;<fieldset>

                            <input id="setToDone" type="button" value="Set to Done"/><br />
                            <input id="selectAll" type="button" value="Select All"/><br />
                            <input id="clear" type="button" value="Clear Selection"/><br />
                            <br />&nbsp;&nbsp;<br />
                            <input id="editRow" type="button" value="Edit tx"/> <br />
                        </fieldset></td>
                </tr>
            </table>
    
    <script type="text/javascript">
        var grid = $("#jQGridDemo");

        grid.jqGrid({
            url: '<%=ResolveUrl("~/Work/WorkToCompleteHandler.ashx?date=") %>' +
                document.getElementById('<%= txtDate.ClientID %>').value +
                "&dateend=" + document.getElementById('<%= txtDateEnd.ClientID %>').value +
                "&showdone=false" +
                "&showreadyonly=" + document.getElementById('<%= CheckBox_ShowReady.ClientID %>').checked +
                "&showtx=true",
            datatype: "json",
            colNames: ['ID', 'Customer', 'Brand', 'Type', 'Category', 'Creation Date', 'Steps Status', 'Done'],
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
                                srcformat: 'm/d/Y h:i:s A',
                                newformat: 'Y-M-d',
                                defaultValue: null
                            },
                        },
                        { name: 'steps_done', index: 'steps_done', width: 100, stype: 'text', sortable: true, editable:false },
                        {
                            name: 'done', width: 30, index: 'done',
                            align: 'center',
                            editable: true,
                            edittype: 'checkbox', editoptions: { value: "1:0", defaultValue: "1" },
                            formatter: "checkbox", formatoptions: { disabled: true }
                        }
            ],
            rowNum: 50,
            multiselect: true,
            height: 250,
            mtype: 'GET',
            loadonce: true,
            ignoreCase: true,
            rowList: [50, 200, 500],
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
