# Windows Defender Exclusion List

Define and manage the Exclusion of Files,Directorys and Processes from Windows Defender on Windows Server 2016/Windows 10

### Settings
#### list
a list of items who should gets excluded from scanning

#### type
Define what type of exclusion it is
 - ***Extension*** - *.exe, *.doc, ...
 - ***Path*** - C:\Temp,.. Support also System Environment variables
 - ***Process*** - word.exe,exporer.exe,...

#### clean
if true the current configured items getting removed, so only the defined item under list getting applyed

---

## Example
win_defender_exclusion:
      list: 
        - "*.mdb"
        - "*
      type: Extension
      clean: false