#!/usr/bin/env python

import os

from os import path
from glob import glob

dotfiles = path.dirname(path.abspath(__file__))
home = path.dirname(dotfiles)

nvim_dir = path.expanduser('~/.config/nvim')
vim_dir = path.expanduser('~/.vim')
nvimrc = path.expanduser('~/.config/nvim/init.vim')
vimrc = path.expanduser('~/.vimrc')


def _symlink(target, link):
    print('Symlinking: %s -> %s' % (link, target))
    os.symlink(target, link)


def symlink(target):
    if path.isdir(target):
        for t in glob(target + '/*'):
            symlink(t)
    else:
        link = target.replace(dotfiles, home)
        if not path.exists(link):
            dirname = path.dirname(link)
            if not path.exists(dirname):
                os.makedirs(dirname)
            _symlink(target, link)


for target in glob(dotfiles + '/.*'):
    if target.endswith('.git'):
        continue
    symlink(target)


if not path.islink(nvim_dir) and not path.exists(nvim_dir):
    _symlink(vim_dir, nvim_dir)
    _symlink(vimrc, nvimrc)
