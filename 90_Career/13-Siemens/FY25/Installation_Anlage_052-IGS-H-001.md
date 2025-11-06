
Missed Preparation of GIS-H in Munich:

	- (Install windowsdesktop-runtime-8.0.11-win-x86)
	- (aspnetcore-runtime-8.0.11-win-x86)


Installation of GIS-H 001

- Save data from old machine:
	- Program Files\SInE2
	- Program Files\GIS_ServiceAssistant
	- Program Files\Infratec
	- Users\All Users\Application Data\Infratec
	- Users\Thermoanlage\Infratec
- Exchange computer:
	- (Install windowsdesktop-runtime-8.0.11-win-x86)
	- (aspnetcore-runtime-8.0.11-win-x86)
	- Copy prepared SInE2 to C:\
	- Copy prepared SInE to C:\
	- Copy preset, config, profiles from old SInE2 to new SInE2
	- Set compatibility mode for SInE2.exe to Win XP SP3, Set to "execute as administrator"
	- Copy old SInE2.ini to new SInE2
	- Open copied SInE2.ini with editor and add line RefImage Dir=C:\SInE2\Reference_images
	- Check if folder C:\SInE2\Reference_images exist, and add if not
	- Copy Reference images from other machines if applicable
	- Copy license information to C:\ProgramData\InfraTec\IRBSDK_V3\irbgrab.ini (Start notepad as administrator)
	- Copy calibration data for camera (Start SInE2, write down number of camera and take the calibration data (CAL_8309436) from the backup. For GIS 001 it's 436 as of 06/2025
	- Check Positioning: Select GIS-Positioning and move around.
	- Check Flash: Select Flash as Excitation modules. If access error open NI Measurement & Automation and check which device is online. Delete unused devices and rename the device which is online to Dev1
	- Check HotAir: Select HotAir-GIS-Light as excitation module. Move to a position which is not loading. This closes the door. Then switch on hot, cold (and light) and check if it works
	- Copy GIS_ServiceAssistant from old computer to C\:GIS_ServiceAssistant - the chronology of the maintenance is stored in the individual folders needs to be preserved
	- Replace GIS_ServiceAssistant.exe with a fixed copy (treated with: corflags /32bit+ GIS_ServiceAssistant.exe)
	- Check if GIS_ServiceAssistant runs (Password is "gsa")
	- In SInE2-Positioning: Check if "Service" show the list and the dates of last maintenance
	- Turn every LED to the max

Simotion throws errors like "Name not found":
- Open Simotion Scout and check connection:
	- Connect to target system
	- Acknowledge every error
	- Extras->Export OPC Data, use standards as given, don't start routing
- Open Siemens Automation Communication Settings
- Restart OPC server:
	- goto protocol selection
	- click S7 off and on, only COM/DCOM S7 should be active
	- Let it restart the server
- Check if door is locked, and enable is active
- Use TestApp to enable and home all axis

	
	


	

	