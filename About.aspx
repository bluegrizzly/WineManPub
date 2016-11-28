<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="WineMan.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About
    </h2>
    <asp:Panel ID="Panel2" runat="server" Width="100%">
        
            Created by Alain Dessureaux<br />alain.dessureaux@gmail.com<br /> Copyright (C) 2015 AndyFire Studio. All rights reserved.
        
            <strong>
            <br />
            <br />
            Versions: 1.1</strong><asp:TextBox ID="TextBox_Versions" runat="server" Font-Size="Small" ForeColor="#333333" Height="282px" ReadOnly="True" TextMode="MultiLine" Width="100%" BackColor="#F2F2F2">
Version 2.0 ()
- Transactions page: 
    - Added Symbol column
    - Improved performance
    - When clicking "Tx completed", do not show a aknowldegment message anymore. 
- Transaction to complete page:
    - Added Symbol column
    - Improved performance
    - Sort by transaction id if a step is selected in filter
- Customer research: now support research of a first name or last name with more than 1 word (ex: Alain & France)
- Transaction research (all screens) when seraching for a specific transaction ID, all other filters are ignored and the transaction is displayed.
- Edit transaction: now open in a new window. (make sure you are not blocking popups)
- Bottling Appointments: Move boxes to add new hours on the side.


Version 1.9.2 (Oct 20 2016)
- Steps to complete: Now the End date is inclusive in the research.

Version 1.9.1 (June 27 2016)
- Transaction Steps: Improved performance for fetching data. (50% faster)
- Customers: No look for tel bur  field when doing customer researches
- Bug fix: Transactions - View All - *enter contract number*: some field were missing
- Bug fix: Modify Transaction. Set Transaction complete checkbox was not working

Version 1.9 (June 11 2016)
- Transactions page:
    - Added new combo box : View.  This filter the transaction done or not
    - Sort by default in ascendent ID order and made default page to 500 
    - The table size if now 1000 by default.
    - Improve speed of getting transaactions records
- Add Transaction page:
    - Customer research have been improve using the same alogythm as the transactions page. (you can use tel number unformatted, ex: 6880987)
- Admin->Production Step:
    - Added a new field : Required For Completion.  When this is false, the step doesn't need to be completed to complete a transaction.
    - The field in the transaction screen will be gray.
    - The number of steps will not count them
- Transaction Steps Page:
    - Added Set Location button
    - Added Location Column
    - Added the Previous next support of all transactions in the grid when you go editing the transaction
- General:
    - Made the grids sorted by increasing numbers 
    - Made the grids default number of rows much higher (1000 for customers and tx, 100,500 for settings)
    - Improved Performance of populating the Transactions grids and transaction steps grids
-Bug Fix: Page error when inverting sort of transactions page and click edit tx
-Bug Fix: Fixed customer research in Transaction screen 
-Bug Fix: Transaction Steps page was returning one more day of the end date specified
-Bug Fix: Transaction research with customer was returning all transaction done/not done
-Bug Fix: Duplicate a transaction and selecting a different hour was causing the hour to be placed at the same place as the previous tx.
-Bug Fix: Crash when trying to edit a transaction from a list of more than 300 rows.

Version 1.8.8 (May 25 2016)
- Bug Fix: Add New transaction the second time was giving an error
- Bug Fix: if step has invalid ID, transaction step to complete was not showing anything

Version 1.8.7 (May 14 2016)
- Bottling Schedule Print: Added more space.
- Bottling Schedule Print: Going back will go to the last selected date
- Bottling appointment screen: Now show all transactions in a single hour slot. This is permitted by the system. 
- Bug fix: Duplicate a transaction was not showing some dates in the bottling appointements screen
- Bug fix: After the creation of a transaction, changing a date would not work.

Version 1.8.6 (April 14 2016)
- Improved the phone number search in the the customers page and the transaction  page. You can now just type the phone number all together (ex: 7670987)

Version 1.8.5 (April 8 2016)
- Bug fixing 
    - Transaction ID Start At in setting now start at this number even if there is a transaction that has higher IDs
    - Transaction Product code now have a -None- value (by default) that can be selected
Version 1.8 (April 5 2016)
- Fixed deletion of a production step. Now it will show the right categories and transactions to delete before.

Version 1.7 (April 3 2016)
- Added bar code to transaction sheet

Version 1.6 (December 5 2015)
- Support Server side printing using Internet explorer

Version 1.5 (July 28 2015)
- Fixed a performance problem when using more than 2000 entries (ex for customers)

Version 1.3 (June 21 2015)
- Customer : fixed telephone format 
- Appointement page: added the hour 00. This can be used when the client doesn't which time he will come.
- Transaction Print page: Fill with blank line to have a page always the same height.
- Add Transaction Page: 
    - Show the customer's telephone 
    - Fixed alignements and display in dates section
    - Show the transaction's creation date.
    - Added tooltips on elements.
- Everywhere: Renamed "Set to Done" to "Work Done"
- Transactions page: tx page navigation is now supported when editing a transaction from the transactions page.
- New Anaysis reports under the Admin->Reports menu
    - Created transactions analysis: Gives for last 12 months the total nb of created transactions per month
    - Active transactions analysis: Gives a analysis of all active transaction that show wine brand and wine types distribution.

Version 1.2 (June 14 2015)
- Transaction page: 
    - New checkbox to complete a transaction. Checkbox is enabled if all steps are completed.
    - Transaction browsing support. When comming from the transaction to complete page, you can browse from the list of transactions in the list. When you can browse 2 buttons will show at the bottom right with the index of the transaction from the list.

Version 1.1.1 (June 11 2015)
- Customer : Fixed issue using ' in adress
- Transaction Print: Support having 9 steps to fit in 1 page.

Version 1.1 (June 3 2015)
- Transaction Page:
    - Added a Duplicate Button. That start a new transaction with all the same values that are on screen. You then need to press Create button to create the new transaction.
    - New TextBox for step dates. The dates can be changed by selecting a date box. The commit is done after selecting the date.
    - New CheckBox beside the date that allow you to complete or uncomplete the transaction step. The commit is done after checking/unchecking the checkbox.
- Admin
    - New Open Hours page. This allows defining for every day of the week the open hours.
    - Settings page:
        - Added the Appointment hour intervale settings. This will be used by bottling stations screen and appointments
- Transaction to Complete page:
    - Trying to complete a transaction with uncompleted steps will fail and give an error message.
    - Added a button to select if the date we are filtering is teh creation or the bottling.
    - By default the "Date End" field is set to the current date and for bottling dates. (before it was showing all in the future) 
- Transaction Steps To Complete page:
    - Added a button to edit transaction. that goes to the selection transaction steps' transaction.
- Customers
    - Now check email in the doublon validation before adding an entry
- Bottling Appointments
    - New Print page with the 3 stations on the same page in 3 columns.
- Misc:
    - Moved "transactions to complete" menuitem under Bottling
    - Telephone numbers are now always formatted like: (000) 000-0000

Version 1.04 (avril 2015)
- Fixed the transaction print

Version 1.03 (6 avril 2015)
- Transaction page:
    - No restrictions about dates when changing a transaction step date.
    - Renamed Rendez-vous to Appointment
- Transactions to complete page:
    - Added transaction ID and Custoemer filters.
- Transaction steps page 
    - Now take into account the filtering (dates, transaction ID, Step)
    - New Customer field for filtering
- Transaction steps page print preview 
    - Added interactive column sorting.
    - Added printer choice.
- Transaction Print: Adjusted the margin for the transaction report printed page and for the work to complete printed page.
- Added many tooltips on text fields and buttons to better explain their usage. Just leave the mouse over a field.
- Removed the useless calendar on the home page.
- Settings page:
   - New field to set the starting ID of transactions.
- Bug fixing when picking appointments dates.
- Made the add customer dialog modal, so if you click on the side of it , it doesn't close anymore.

Version 1.02 (2 avril 2015)
- New printer settings for reports in addition of the transaction default printer.

Version 1.01 (19 mars 2015)
- Add Transaction page: 
    - New button to reset the dates of the transaction steps starting the yeast today. All steps dates are adjusted.
    - If you change the yeast date the date of all steps are adjusted. You can change also dates of other steps but in such a case no modificaiton are done to other steps and it makes the transaction not following the recipes.
    - Confirm window before changing the category on an existing transaction.
    - If a transaction doesn't follow the recipes anymore because a step date changed, there is an indication in red: *Broken Recipes
-Transaction page:
    - Moved done column to th end to be consistent
- Transaction to complete page:
    - Added a button and text box to set location of selected transaction.
- New Settings page.
- Now handle the default printer.  You need to set the default printer in the Settings page in order to be able to print.

Version 1.0 (01 mars 2015)
- Allow setting appointment before the wine is ready (witha warning message)
- Transaction to complete page: Added a check box to show transactions already done.
- Both in Transaction to complete & transaction steps to complete page: 
    - If you select a transaction that is done. The button "Set to Done" change to Undo. if you select it, the transaction or transaction step reset to not done.
    - Added X buttons to clear the date fields

Version 0.95 (23 fev 2015)
- Added color code : 
    -Transactions page : Green when transaction is done
    -Transaction to complete : from red to green depending of the number of steps completed.
    -Transaction Steps to complete: Green when done.
- Allow only administrator to go on Admin pages.
- Show Printer dialog (to choose the printer) for the transaction steps to complete.
- Transaction Steps: set the end date to be the current date by default. So you see the work to be done only up to today only. You can remove the date to see all steps to do in the future.
- If a type or brand or type is disabled, we now see them when editing old transactions. but not see them with new tx.

Version 0.9: (19 fev 2015)
- Allow deleting brand,type and category with errors if they are in uses
- Do not show the brand,type if they are not active
- Allow deleting transactions. By doing so, all transaction steps related to the transaction will be deleted as well.
- In Transactions page, you can now type the full name of a customer or customer ID or phone to search all his transactions.
- Improved changind transaction step dates. We will change the ulterior dates only if the step needs to, regarding teh category recipes. A better messages now explain also what has been done.

Version 0.8: (10 fev 2015)
- New page to manage the production steps. Admin->Managers->Production Steps
- Date problem fixed.
- Now check if entry exist before adding it (Brands, Types, Categories, Product codes and Customers (with name and postal code)
- Remove ability to delete brand, type, category (this would corrupt other tables if we do so)
- New box in the Customers page to search for customers

Version 0.7: (1 fev 2015)
- Customers:
    - Customers sorted by last name alphabetic order 
    - Add dash to telephone number automatically
    - Ignore caps for customer name search (for all databases also)
- Fixed messagebox bug
- Fixed date formats to be all in MM-DD-YY
- Transaction Page:
    - Ability to change the data of a transaction step
    - Modify button has been removed. 
    - Transaction record is updated after any modifications.
    - Validation is done on transaction modification.
    - When the transaction step date changes, the rendez-vous date need to be updated before changing the transaction

Version 0.6: (23 jan 2015)
- New Menu separation (Bottling / WineWork)
- New page to complete transactions
- New page icon
- New fields in transaction: Location, comments and Product  Code
- New Product Code manager page (under Admin->Managers)
- Backup Page. for manual backups (backup path is in settings)

Version 0.5: (15 jan 2015)
-----------------------
- Add transaction
    - Rendezvous: Cannot select a rendez vous that is before the wine completed date.
    - Rendezvous: Will automatically select a next non-holiday date
    - Choosing a customer: Can select a customer by phone or name of first name
    - Choosing a customer: You can see the name of the clients and phone number 

- All transactions
    - You can toggle to see all transactions or only the non completed ones (default)
    - You can sort the transaction with some filters like &quot;last week&quot;
    - Filtering based on customer and transaction ID

- Work to complete page 
    - Show late work toggle
    - Show work done toggle
    - Filtering based on Steps

- Customers
    - Can add/remove/edit customers

-Admin
    - Can add/modify/edit holidays. The holidays cannot be selected by rendez vous.
    - Can add/modify/edit Wine Brand, Type, Categories

- Print
    - Transaction card for client (bilingual)
    - Work to do
    - Rendez vous

</asp:TextBox>
    </asp:Panel>
</asp:Content>
