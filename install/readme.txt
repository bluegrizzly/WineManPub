WineMan

Installation notes
-------------------

-Install vc redist 2013

-Install iis 
	iis8
	iis*
	asp*
	- run %windir%\Microsoft.NET\Framework64\v4.0.30319\aspnet_regiis.exe -i
	- create wineman app with port 58404
	- In iis manager: application pool of wineman, set .net to 4
	- web.config may need to change .net to 4.0
	- Set the application pool->Advanced settings->ProcessModel : Identity to username which can see all printers.

- Install mysql server+ workbench
	- set password: piepasri



------------
security
https://msdn.microsoft.com/en-us/library/ms251693.aspx

In internet properties (http://support.myvisionexpress.com/index.php?/Knowledgebase/Article/View/444/154/how-to-activate-activex-for-google-chrome--firefox-for-single-sign-on-feature-for-rd-web-access)
	- CustomLevels...
	- set Run Activex controls and plugins to enable
	- set download signed activeX control to enable
	- set download unsigned activeX control to enable
