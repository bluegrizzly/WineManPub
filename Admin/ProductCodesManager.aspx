<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductCodesManager.aspx.cs" Inherits="WineMan.Admin.ProductCodeManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
       Product Codes Manager
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
                Colors:<br />
                <asp:Panel ID="Panel2" runat="server" BackColor="Brown" ForeColor="Black" HorizontalAlign="Center">
                    Brown</asp:Panel>
                <asp:Panel ID="Panel3" runat="server" BackColor="Green" ForeColor="Black" HorizontalAlign="Center">
                    Green
                    <asp:Panel ID="Panel8" runat="server" BackColor="Gray" ForeColor="Black" HorizontalAlign="Center">
                        Gray</asp:Panel>
                </asp:Panel>
                <asp:Panel ID="Panel4" runat="server" BackColor="Gold" ForeColor="Black" HorizontalAlign="Center">
                    Gold
                    <asp:Panel ID="Panel9" runat="server" BackColor="Orange" ForeColor="Black" HorizontalAlign="Center">
                        Orange</asp:Panel>
                </asp:Panel>
                <asp:Panel ID="Panel5" runat="server" BackColor="Red" ForeColor="Black" HorizontalAlign="Center">
                    Red</asp:Panel>
                <asp:Panel ID="Panel6" runat="server" BackColor="RoyalBlue" ForeColor="Black" HorizontalAlign="Center">
                    Royal Blue
                </asp:Panel>
                <asp:Panel ID="Panel7" runat="server" BackColor="Pink" ForeColor="Black" HorizontalAlign="Center">
                    Pink</asp:Panel>
            </td>
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
            url: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=product_codes&explicitsetid=true") %>',
            datatype: "json",
            ajaxSelectOptions: { cache: false },
            colNames: ['Id', 'Name', 'Color'],
            colModel: [
                        { name: 'id', index: 'id', width: 30, stype: 'int', sortable: true, sorttype: 'int', editable: true},
                        { name: 'name', index: 'name', width: 200, stype: 'text', sortable: true, editable: true },
                        { name: 'color', index: 'color', width: 200,
                            sortable: true,
                            stype: 'select',
                            align: 'center',
                            editable: true,
                            edittype: 'select',
                            formatter: 'select', editoptions: { value: "Brown:Brown;Green:Green;Gray:Gray;Gold:Gold;Orange:Orange;Red:Red;RoyalBlue:RoyalBlue;Pink:Pink" }
                        }],
            rowNum: 50,
            height: 250,
            width:750,
            multiselect: false,
            mtype: 'GET',
            loadonce: true,
            ignoreCase: true,
            rowList: [50, 100, 500],
            pager: '#jQGridDemoPager',
            sortname: 'name',
            viewrecords: true,
            sortorder: 'asc',
            caption: "Wine Brands",
            editurl: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=product_codes&explicitsetid=true") %>'
        });

        $('#jQGridDemo').jqGrid('navGrid', '#jQGridDemoPager',
                   {
                       edit: true,
                       add: true,
                       del: false,
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
