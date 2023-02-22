#!/usr/bin/python3

import rofi

prompt = 'Power management'

variants = {
    '1 Lock': '~/.dotfiles/scripts/screen-locker/lockscreen',
    '2 Sleep': 'systemctl suspend',
    '3 Restart': 'reboot',
    '4 Power off': 'poweroff',
}

rofi.choose_with_rofi_and_execute_command(prompt, variants)

