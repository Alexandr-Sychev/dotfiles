#!/usr/bin/python3

import rofi

prompt = 'Power management'

variants = {
    'Lock': '~/.dotfiles/scripts/screen-locker/lockscreen',
    'Sleep': 'systemctl suspend',
    'Power off': 'poweroff',
    'Restart': 'reboot',
}

rofi.choose_with_rofi_and_execute_command(prompt, variants)

