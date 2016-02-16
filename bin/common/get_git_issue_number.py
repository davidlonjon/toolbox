#!/usr/bin/env python
"""Get the issue number form the current git branch.

Some examples:

 - "master" will return "master: "
 - "feature/test" will return "test: "
 - "feature/123" will return "#123: "
 - "bugfix/123-test" will return "#123: "
 - "bugfix/123_test" will return "#123: "
 - "bugfix/SPP-123" will return "#SPP-123: "
 - "bugfix/SPP-123-test" will return "#SPP-123: "
 - "bugfix/SPP-123_test" will return "#SPP-123: "

This is a rough script but does the job.
"""

import os
import subprocess
import sys

DEVNULL = open(os.devnull, 'wb')

current_git_branch = subprocess.Popen(
  'git rev-parse --abbrev-ref HEAD',
  shell=True,
  stdout=subprocess.PIPE,
  stderr=DEVNULL
).stdout.read().replace("\n", "")

if not current_git_branch:
    sys.exit()

branch_parts = current_git_branch.split("/")

if len(branch_parts) > 1:
    branch_base = branch_parts[0]
    branch_name = branch_parts[1]
    branch_name_parts = branch_name.split("_")
    branch_id = branch_name

    if len(branch_name_parts) > 1:
        branch_id = branch_name_parts[0]
        branch_trail = branch_name_parts[1]
        if len(branch_name_parts) > 2:
            branch_trail = "_".join(branch_name_parts[1:])
else:
    branch_id = branch_parts[0]

branch_id_parts = branch_id.split("-")
if len(branch_id_parts) > 1:
    if branch_id_parts[0] == 'SPP':
        branch_id = '{0}-{1}'.format(branch_id_parts[0], branch_id_parts[1])
    else:
        branch_id = "#{0}".format(branch_id_parts[0])
else:
    if branch_id.isdigit():
        branch_id = "#{0}".format(branch_id)

print branch_id + ": "
