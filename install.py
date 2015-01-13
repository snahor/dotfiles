#!/usr/bin/env python

import os

from os import path
from glob import glob

dotfiles = path.dirname(path.abspath(__file__))
home = path.dirname(dotfiles)


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
            print('Symlinking: %s -> %s' % (link, target))
            os.symlink(target, link)


for target in glob(dotfiles + '/.*'):
    if target.endswith('.git'):
        continue
    symlink(target)
