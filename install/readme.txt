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
	

- Install mysql server+ workbench
	- set password: piepasri
