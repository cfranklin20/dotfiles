#!/usr/bin/env python3
import subprocess as sp
import re
from prettytable import PrettyTable
def connect():
    # Start a process to look for ssh processes running in the background
    ps = sp.Popen(['ps', 'aux'], stdout=sp.PIPE)
    # Get the output of the grep command to find background ssh sessions
    output = sp.Popen(['grep', 'ssh -f'], stdin=ps.stdout, stdout=sp.PIPE, stderr=sp.PIPE, universal_newlines=True)
    ps.stdout.close()
    out, err = output.communicate()
    # Split the output by newlines to parse easier
    parse = out.split('\n')
    # Check if there are any connections
    if len(parse) <= 2:
        print("Error ssh port bind not running")
        return
    # List to hold connection data
    r1 = []
    # Tokenize the output stream
    for i in range(len(parse)):
        r1.append(re.findall(r'\S+', parse[i]))
    output_table = PrettyTable()
    output_table.field_names = ["Process Number", "Process Description"]
    # Create and fill a table with the information from the grep command
    for i in range(len(r1)):
        if len(r1[i]) > 0:
            if len(r1[i]) == 16:
                proc_desc = (f'{r1[i][10]} {r1[i][11]} {r1[i][12]} {r1[i][13]} {r1[i][14]}')
                output_table.add_row([r1[i][1], proc_desc])
    print(output_table)
    # Kill the background ssh session if the user wants to
    for i in range(len(r1)):
        if len(r1[i]) == 16:
            response = input(f'Kill Process {r1[i][1]}? (y/n):')
            if response == 'y':
                kill_command = ['kill', f'{r1[i][1]}']
                kill = sp.Popen(kill_command)
                if kill.returncode == None:
                    print("Process ended successfully")
                else:
                    print("Error, process not ended")
            else:
                print("Process not ended")
connect()
