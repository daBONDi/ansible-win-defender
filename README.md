# Ansible Modules for managing internal Windows Defender

## Installation

Copy the folders into you libary folder

## win_defender_exclusion

See Readme.md in Module Folder

### Example
- name: "Exclude all .mdb files from Scanning"
  win_defender_exclusion:
    list: 
      - "*.mdb"
    type: Extension
    clean: false

## win_defender_update
- name: "Simply force an Signature update"
  win_defender_update:

Return Change if a update happends.