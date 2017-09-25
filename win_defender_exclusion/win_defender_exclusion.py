#!/usr/bin/python
# -*- coding: utf-8 -*-

# (c) 2017, David Baumann <dabondi@noreply.users.github.com>
# GNU GENERAL PUBLIC LICENSE v3

DOCUMENTATION = '''
---
module: win_defender_exclusion
version_added: "2.5"
short_description: Manage Windows Defender Realtime Exclusion Lists
description: |
     Manage Windows Defender Realtime Scanning Exclusion Lists

     Tested on Windows Server 2016
     **Will only work on Windows 10 or Windows Server 2016 Systems because of Usage of the Get/Set-MpPreference Powershell Command**
options:
  
  list:
    default: []
    required: false
    description:
      - Manage a list of process/extension/directorys who need to be excluded from scan process
    required: false

  type:
    required: true
    description:
      - What type of exclusion to manage
    choices:
     - "Process"
     - "Extension"
     - "Path"

  clean:
    default: false
    description:
     - If true all other non defined exclusions getting removed
    required: false

author: David Baumann <dabondi@noreply.users.github.com>
'''

EXAMPLES = '''
# Playbook example
  - name: Ensure Exchange ComplianceAuditService is excluded
    win_defender_exclusion:
      type: Process
      list:
        - "ComplianceAuditService.exe"
'''
