#!/usr/bin/env python3
'''Script that parses nvidia-smi help message from stdin and prints out constatns in dart code'''

import sys
import camel_converter

current_command = None
current_description = None

def command_to_dart_name(command):
    return camel_converter.to_camel(command.replace('.', '_'))

def flush_command():
    global current_command
    global current_description

    if current_command is not None and current_description is not None:
        for command in current_command:
            for line in current_description:
                print('///', line)
            aliases = list(filter(lambda a: a != command, current_command))
            if len(aliases):
                print('///')
                print('///', 'Equivalent to', ', '.join(map(lambda a: f'[{command_to_dart_name(a)}]', aliases)) + '.')
            print('const', command_to_dart_name(command), '=', '\'' + command + '\';')
            print()
    
    current_command = None
    current_description = None

for line in sys.stdin:
    line = str(line).strip()
    if not len(line):
        flush_command()
        continue
    
    if line.startswith('"') and current_command is None:
        flush_command()
        current_command = []
        current_description = []
        inside = False
        buffer = ''
        for char in line:
            if char == '"':
                inside = not inside
                if not inside:
                    current_command.append(buffer)
                    buffer = ''
                continue

            if inside:
                buffer += char

        if len(buffer):
            current_command.append(buffer)
        
        continue
    
    if current_description is not None:
        current_description.append(line)

flush_command()
