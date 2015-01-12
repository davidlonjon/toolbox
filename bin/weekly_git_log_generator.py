#! /usr/bin/env python
"""
Outputs a week by week commit log with one line commit messages for your entire git repository
from start to finish
"""

import commands
import datetime

status, start_date = commands.getstatusoutput("git log --date=short --format='%cd' --reverse | head -1")
status, end_date = commands.getstatusoutput("git log --date=short --format='%cd' -1")

start_date = datetime.datetime.strptime(start_date, '%Y-%m-%d')
end_date = datetime.datetime.strptime(end_date, '%Y-%m-%d')

current_date = start_date
number_of_weeks = 0
final_log = ""

while current_date <= end_date:
    new_date = current_date + datetime.timedelta(7)
    current_date_string = current_date.strftime('%A %B %d %Y')
    new_date_string = new_date.strftime('%A %B %d %Y')
    final_log += "\n=========Week %d ==========\n" % number_of_weeks
    final_log += "=========From %s to %s =========\n" % (current_date_string, new_date_string)
    status, output = commands.getstatusoutput("git log --no-merges --format=' * %s' " + "--since=%s --until=%s" % (current_date.strftime('%Y-%m-%d'), new_date.strftime('%Y-%m-%d')))
    current_date = new_date
    final_log += output
    number_of_weeks += 1
    # print current_date

print final_log
# text_file = open("weekly_log.txt", "w")
# text_file.write(final_log)
# text_file.close()
