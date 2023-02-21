#!/usr/bin/python3

import os


def choose_with_rofi(prompt, variants):
    variants_string = '\n'.join(variants)
    command = f'printf "{variants_string}" | rofi -dmenu -i -p "{prompt}"'
    stream = os.popen(command)
    return stream.read()[:-1]


def choose_with_rofi_and_execute_command(prompt, variants):
    chosen = choose_with_rofi(prompt, variants.keys())
    command = variants[chosen]
    os.system(command)

