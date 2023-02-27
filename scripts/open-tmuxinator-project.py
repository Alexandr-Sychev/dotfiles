#!/usr/bin/python3

import os


def exec(cmd):
    stream = os.popen(cmd)
    return stream.read()


projects_path = os.getenv('HOME') + '/projects'
base_projects = ['base']
base_project = 'base'

tp_cmd = 'tmuxinator list -n | sed "/tmuxinator projects:/ d"'
tmuxinator_projects = exec(tp_cmd).strip().split('\n')
tmuxinator_projects = [p for p in tmuxinator_projects if p not in base_projects]

pd_cmd = 'ls -1 ' + projects_path
projects_directory = exec(pd_cmd).strip().split('\n')

fzf_input = '\n'.join(set(tmuxinator_projects + projects_directory))
fzf_cmd = f'echo "{fzf_input}" | fzf'
chosen = exec(fzf_cmd).strip()

if chosen in tmuxinator_projects:
    cmd = 'tmuxinator start ' + chosen
else:
    session_name = '_'.join(chosen.split('.'))
    chosen_project_path = f'{projects_path}/{chosen}'
    base_project_path = f'{os.getenv("DOTFILES")}/roles/tmux/files/templates/{base_project}.yml'
    cmd = f'cd {chosen_project_path} && tmuxinator start -n {session_name} -p {base_project_path}'

exec(cmd)

