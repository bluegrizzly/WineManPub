<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WineBrandManager.aspx.cs" Inherits="WineMan.Admin.WineBrandManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
       Wine Brand Manager
    </h2>

    <table class="auto-style1">
        <tr>
            <td rowspan="4" valign="top">
                <div id="jQGridDemoPager"></div>
                <table id="jQGridDemo">
                </table>
            </td>
            <td valign="top" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" align="right" >
                &nbsp;</td>
            <td valign="top">
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" align="right" >
                &nbsp;</td>
            <td valign="top">
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                &nbsp;</td>
        </tr>
    </table>

    <script type="text/javascript">
        jQuery("#jQGridDemo").jqGrid({
            url: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=wine_brands") %>',
            datatype: "json",
            ajaxSelectOptions: { cache: false },
            colNames: ['Id', 'Name', 'Active'],
            colModel: [
                        { name: 'id', index: 'id', width: 20, stype: 'text', sortable: true, sorttype: 'int', editable: false, hidden:false},
                        { name: 'name', index: 'name', width: 200, stype: 'text', sortable: true, editable: true },
                        {
                            name: 'active', width: 50, index: 'active',
                            editable: true,
                            edittype: 'checkbox', editoptions: { value: "1:0", defaultValue: "1" },
                            formatter: "checkbox", formatoptions: { disabled: true }
                        }],
            rowNum: 100,
            height: 250,
            width:750,
            multiselect: false,
            mtype: 'GET',
            loadonce: true,
            ignoreCase: true,
            rowList: [100, 200, 500, 1000],
            pager: '#jQGridDemoPager',
            sortname: 'name',
            viewrecords: true,
            sortorder: 'asc',
            caption: "Wine Brands",
            editurl: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=wine_brands") %>'
        });

        $('#jQGridDemo').jqGrid('navGrid', '#jQGridDemoPager',
                   {
                       edit: true,
                       add: true,
                       del: true,
                       search: true,
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
                       closeOnEscape: true,//Closes the popup on pressing escape key
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
