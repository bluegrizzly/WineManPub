<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkToComplete.aspx.cs" Inherits="WineMan.Work.WorkToComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 214px;
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
            width: 214px;
            height: 129px;
        }
        #print {
            width: 135px;
        }
        .auto-style4 {
            width: 214px;
            height: 43px;
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
                        <h2>Transaction Steps </h2>
                    </td>
                    <td rowspan="3" valign="top" align="center">

                        <asp:Panel id="pnlContents" runat = "server">
                        <fieldset>
                            <asp:Label ID="Label2" runat="server" Text="TransactionID:"></asp:Label>
                            <asp:TextBox ID="TextBox_TxID" runat="server" Width="45px" AutoPostBack="True"></asp:TextBox>
                            &nbsp;<asp:Button ID="Button_ClearTxID" runat="server" OnClick="Button_ClearTxID_Click" Text="X" Width="20px" />
&nbsp;<asp:Label ID="Label1" runat="server" Text="Step"></asp:Label>
                            <asp:DropDownList ID="DropDownList_FilterStep" runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                            &nbsp;
                            <asp:CheckBox ID="CheckBox_ShowDone" runat="server" Text="Show work done" AutoPostBack="True" />
                            
                            &nbsp;</fieldset>
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
                            <asp:TextBox ID="txtDate" runat="server" AutoPostBack="True"></asp:TextBox>
                            <br />
                            <br />Date End :
                            <asp:TextBox ID="txtDateEnd" runat="server" AutoPostBack="True"></asp:TextBox>
                        </fieldset></td>
                </tr>
                <tr>
                    <td class="auto-style2" align="center" valign="top">
                        &nbsp;<fieldset>
                            <input id="setToDone" type="button" value="Set to Done"/><br />
                            <input id="selectAll" type="button" value="Select All"/><br />
                            <input id="clear" type="button" value="Clear Selection"/><br />
                            <br />&nbsp;<asp:Button ID="Button_Print" runat="server" OnClick="Button_Print_Click" Text="Print" Width="135px" />
&nbsp;<br />
                        </fieldset></td>
                </tr>
            </table>
    
    <script type="text/javascript">
        var grid = $("#jQGridDemo");

        grid.jqGrid({
            url: '<%=ResolveUrl("~/Work/WorkToCompleteHandler.ashx?date=") %>' +
                document.getElementById('<%= txtDate.ClientID %>').value +
                "&dateend=" + document.getElementById('<%= txtDateEnd.ClientID %>').value +
                "&showdone=" + document.getElementById('<%= CheckBox_ShowDone.ClientID %>').checked +
                "&filterstep=" + document.getElementById('<%= DropDownList_FilterStep.ClientID %>').selectedIndex +
                "&txid=" + document.getElementById('<%= TextBox_TxID.ClientID %>').value + 
                "&showtx=false",
            datatype: "json",
            colNames: ['id', 'TxId', 'Date', 'Step', 'Brand', 'Type', 'Customer', 'Tel', 'Done'],
            colModel: [
                        { name: 'id', index: 'id', width: 10, stype: 'text', sortable: true, sorttype: 'int', hidden: true },
                        { name: 'txid', index: 'txid', width: 40, stype: 'text', sortable: true, sorttype: 'int' },
                        { name: 'date', index: 'date', width: 80, stype: 'text', sortable: true,
                            formatter: 'date',
                            datefmt: 'yyyy/MM/dd',
                            formatoptions: { srcformat: 'd/m/Y H:i:s',
                                             newformat: 'Y/M/d',
                                             defaultValue: null },
                        },
   		                { name: 'step', index: 'step', width: 70, sortable: true },
   		                { name: 'brand', index: 'brand', width: 80, sortable: true },
   		                { name: 'type', index: 'type', width: 80, sortable: true },
   		                { name: 'customer', index: 'customer', width: 140, sortable: true },
   		                { name: 'tel', index: 'tel', width: 70, sortable: true },
                        {
                            name: 'done', width: 50, index: 'done',
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
            rowList: [20, 50, 100],
            pager: '#jQGridDemoPager',
            sortname: 'step',
            viewrecords: true,
//            rownumbers: true,
            gridview: true,
            sortorder: 'desc',
            caption: "Transactions steps",
            editurl: '<%=ResolveUrl("~/Work/WorkToCompleteHandler.ashx") %>'
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
            if (ids.length > 0)
            {
                var names = [];
                for (var i = 0, il = ids.length; i < il; i++)
                {
                    var name = grid.jqGrid('getCell', ids[i], 'id');
                    names.push(name);
                }
                //alert ("Names: " + names.join(", ") + "; ids: " + ids.join(", "));
                $("#names").html(names.join(", "));
                var jsonData = JSON.stringify(names);
                $.ajax({
                    type: "POST",
                    url: '<%=ResolveUrl("~/Work/WorkToCompleteHandler.ashx?operation=settodone&showtx=false") %>',
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(msg)
                    {
                        //                        alert(msg);
                        window.location.reload();
                    },
                    error: function (res, status, exeption)
                    {
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


        $('#jQGridDemo').jqGrid('navGrid', '#jQGridDemoPager',
                   {
                       edit: false,
                       add: false,
                       del: false,
                       search: true,
                       searchtext: "Search",
                       addtext: "Add",
                       edittext: "Edit",
                       deltext: "Set to Done"
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
                               var value = $('#jQGridDemo').jqGrid('getCell', sel_id, 'id');
                               return value;
                           }
                       }
                   },
                   {//ADD portion
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
                               var sel_id = $('#jQGridDemo').jqGrid('getGridParam', 'selarrrow');
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
