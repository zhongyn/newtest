from __future__ import with_statement
from fabric.api import *
from fabric.colors import green, red, yellow
from fabric.decorators import *
from fabric.operations import *
from time import localtime, strftime
from fabric.contrib.console import confirm, prompt
from fabric.contrib.files import exists

# Import fabric files / configs
import config

#
# Includes functions necessary to checkout the project from SVN
#

# Initial function to call to check out the repo
def checkout_from_repo():
  prompt_user_for_git_path()
  checkout()

# Asks the user for a location within the git repo to check out
def prompt_user_for_git_path():
  git_branch = prompt(yellow("What tag/branch would you like to checkout?"))
  if git_branch == '':
    env.git_branch = 'master'
  else:
    env.git_branch = git_branch

# Runs the command to check out the git path to the release path
def checkout():
  with cd(env.all_releases_full_path):
    print green("Cloning %s" % env.release_path)
    run("git clone -b %s %s %s" % (env.git_branch, env.git_path, env.release_path))
    print green("%s successfully checked out" % env.git_path)
