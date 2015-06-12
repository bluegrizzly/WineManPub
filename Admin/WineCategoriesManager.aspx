<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WineCategoriesManager.aspx.cs" Inherits="WineMan.Admin.WineCategoriesManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
       Wine Categories Manager
    </h2>

    <table class="auto-style1">
        <tr>
            <td rowspan="3" valign="top">
                <div id="jQGridDemoPager"></div>
                <table id="jQGridDemo">
                </table>
            </td>
            <td valign="top" class="auto-style1">
                </td>
        </tr>
        <tr>
            <td valign="top" align="left" class="auto-style1" >
                <strong>Notes:</strong><br />
                * Step 1 is necessary<br />
                * Days are from the start (step1)<br />
                * The name need to be the same&nbsp; for the same recipe<br />
                <br />
                * If you change the recipes (ex nb days) the existing transactions will not be updated</td>
        </tr>
        <tr>
            <td valign="top">
            </td>
        </tr>
    </table>

    <script type="text/javascript">
        jQuery("#jQGridDemo").jqGrid({
            url: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=wine_categories") %>',
            datatype: "json",
            ajaxSelectOptions: { cache: false },
            colNames: ['Id', 'Name', 'Cost', 'Step', 'Days', 'Symbol'],
            colModel: [
                        { name: 'id', index: 'id', width: 20, stype: 'text', sortable: true, sorttype: 'int', editable: false, hidden: false },
                        { name: 'name', index: 'name', width: 200, stype: 'text', sortable: true, editable: true },
                        { name: 'cost', index: 'cost', width: 60, stype: 'text', sortable: true, editable: true },
                        { name: 'step', index: 'step', width: 200,
                            sortable: true,
                            stype: 'select',
                            align: 'center',
                            editable: true,
                            edittype: 'select',
                            //formatter: 'select',
                            editoptions: { aysnc: false, dataUrl: "/Default/StepSelect" }, editrules: { required: true },
                            searchoptions: { dataUrl: "/Default/StepSelect" }
                        },
                        { name: 'days', index: 'days', width: 60, stype: 'text', sortable: true, editable: true },
                        { name: 'symbol', width: 50, index: 'symbol',
                            align: 'center',
                            editable: true,
                            edittype:'select',
                            stype: 'select',
                            formatter:'select', editoptions:{value:"W:W;R:R;X:X;F:F;RQ:RQ;B:B;S:S"} 
                        }
                        ],
            rowNum: 200,
            height: 250,
            multiselect: false,
            mtype: 'GET',
            loadonce: true,
            ignoreCase: true,
            rowList: [200, 400, 600],
            pager: '#jQGridDemoPager',
            multiSort: true,
            sortname: 'name asc, step',
            viewrecords: true,
            sortorder: 'asc',
            caption: "Wine Categories",
            editurl: '<%=ResolveUrl("~/Admin/AdminHandler.ashx?db=wine_categories") %>'
        });

        function getStepsValues()
        {

        }

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
