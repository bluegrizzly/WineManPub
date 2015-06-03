<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="openhours.aspx.cs" Inherits="WineMan.Admin.openhours" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 577px;
        }
        </style>

  <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>
       Open Hours
    </h2>

    <table class="auto-style1">
        <tr>
            <td valign="top" align="center">
                <div id="jQGridDemoPager"></div>
                <table id="jQGridDemo"></table>
            </td>
        </tr>
        </table>

    <script type="text/javascript">
        jQuery("#jQGridDemo").jqGrid({
            url: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=openhours") %>',
            datatype: 'json',
            colNames: ['Id', 'Day', 'Open Hour', 'Close Hour'],
            colModel: [
                        { name: 'id', index: 'id', width: 20, stype: 'int', sortable: true, sorttype: 'int', hidden: true},
   		                { name: 'day', index: 'day', width: 80, sortable: true, editable: true, editoptions: { readonly: 'readonly' } },
   		                { name: 'hour_start', index: 'hour_start', width: 60, sortable: true, editable: true },
                        { name: 'hour_end', index: 'hour_end', width: 60, sortable: true, editable: true }
                      ],
            rowNum: 10,
            height: 250,
            width: 500,
            multiselect: false,
            mtype: 'GET',
            loadonce: true,
            ignoreCase: true,
            rowList: [10],
            pager: '#jQGridDemoPager',
            gridview: true,
            sortname: 'id',
            sortorder: 'asc',
            viewrecords: true,
            caption: "Open Hours",
            editurl: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=openhours") %>'
        });

        $('#jQGridDemo').jqGrid('navGrid', '#jQGridDemoPager',
                   {
                       edit: true,
                       add: false,
                       del: false,
                       search: false,
                       searchtext: "Search",
                       addtext: "Add",
                       edittext: "Edit",
                       deltext: "Delete",
                       closeAfterAdd: true,
                       closeAfterEdit: true
                   },
                   {   //EDIT
                       //                       height: 300,
                       //                       width: 400,
                       //                       top: 50,
                       //                       left: 100,
                       //                       dataheight: 280,
                       closeOnEscape: true,//Closes the popup on pressing escape key
                       reloadAfterSubmit: true,
                       closeAfterAdd: true,
                       closeAfterEdit: true,
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
                       closeAfterEdit: true,
                       afterSubmit: function (response, postdata) {
                           if (response.responseText == "") {
                               $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                               return [true, '']
                           }
                           else {
                               $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                               return [false, response.responseText]
                           }
                           $('#jQGridDemo').autoclose;
                       }
                   },
                   {   //DELETE
                       closeOnEscape: true,
                       closeOnEscape: true,
                       closeAfterDelete: true,
                       reloadAfterSubmit: true,
                       drag: true,
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
