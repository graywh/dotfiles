import sys, os

paths = [
        os.path.join(os.environ["HOME"], "src", "python", "lib"),
        os.path.join(os.environ["HOME"], "Code", "python", "lib"),
        os.path.join(os.environ["HOME"], "lib", "python"),
        ]
for path in paths:
    if os.path.exists(path) and os.path.isdir(path):
        sys.path.append(path)

del path
del paths

try:
    from base import *
except ImportError:
    pass # do nothing
