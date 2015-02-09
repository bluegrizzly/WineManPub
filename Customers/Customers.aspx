<%@ Page Title="Customers" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WineMan.Customers.Customers" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Customers
    </h2>
    <div style="text-align:center">
            <asp:Label ID="Label1" runat="server" Text="Search: "></asp:Label>
            <asp:TextBox ID="TextBox_CustomerSearch" runat="server" AutoPostBack="True" Width="128px"></asp:TextBox>
            <asp:Button ID="Button_ClearCustomer" runat="server" OnClick="Button_ClearCustomer_Click" Text="X" Width="21px" />
    &nbsp;<asp:Label ID="Label2" runat="server" Font-Size="X-Small" Text="(name or tel or id)"></asp:Label>
    </div>
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal" Width="100%">
    <table id="jQGridDemo">
    </table>
    <div id="jQGridDemoPager">
    </div>
        </asp:Panel>
    <script type="text/javascript">
        jQuery("#jQGridDemo").jqGrid({
            url: '<%=ResolveUrl("~/Customers/CustomersHandler.ashx") %>' +
                        "?filtercustomer=" + document.getElementById('<%= TextBox_CustomerSearch.ClientID%>').value,
            datatype: "json",
            colNames: ['Id', 'First Name', 'Last Name', 'Address', 'City', 'Province', 'Postal Code', 'Email', 'Tel', 'Tel Bur', 'Fax', 'Language'],
            colModel: [
                        { name: 'id', index: 'id', width: 20, stype: 'text', sortable: true, sorttype: 'int'},
   		                { name: 'first_name', index: 'first_name', width: 100, stype: 'text', sortable: true, editable: true },
   		                { name: 'last_name', index: 'last_name', width: 120, sortable: true, editable: true },
                        { name: 'address', index: 'address', width: 100, editable: true },
                        { name: 'city', index: 'city', width: 80, editable: true },
                        { name: 'province', index: 'province', width: 30, editable: true },
                        { name: 'postal_code', index: 'postal_code', width: 50, editable: true, formatter: formatPostalCode },
                        { name: 'email', index: 'email', width: 100, editable: true },
                        { name: 'telephone', index: 'telephone', width: 78, editable: true, formatter: formatPhoneNumber },
                        { name: 'telephone_bur', index: 'telephone_bur', width: 78, editable: true, formatter: formatPhoneNumber },
                        { name: 'telephone_fax', index: 'telephone_fax', width: 65, editable: true, formatter: formatPhoneNumber },
                        {
                            name: 'language', width: 50, index: 'language',
                            align: 'center',
                            search: true,
                            editable: true,
                            edittype:'select',
                            stype: 'select',
                            formatter:'select', editoptions:{value:"0:English;1:French"},
                            searchoptions: {value:"0:English;1:French"} 
                        }],
            rowNum: 20,
            height: 300,
            mtype: 'GET',
            loadonce: true,
            rowList: [20, 50, 200, 500],
            pager: '#jQGridDemoPager',
            sortname: 'last_name',
            viewrecords: true,
            sortorder: 'desc',
            caption: "Customers Details",
            ignoreCase: true,
            editurl: '<%=ResolveUrl("~/Customers/CustomersHandler.ashx") %>'
        });
        function formatPhoneNumber(cellvalue, options, rowObject) {
            var re = new RegExp("([0-9]{3})([0-9]{3})([0-9]{3,6})", "g");
            cellvalue = cellvalue.replace(re, "($1)-$2-$3");
            return cellvalue;
        }
        function formatPostalCode(cellvalue, options, rowObject) {
            return cellvalue.toUpperCase().replace("/\W/g", '').replace("/(...)/", '$1 ');
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
                       width: 400,
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
                       width: 400,
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
