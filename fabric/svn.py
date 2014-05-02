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
  prompt_user_for_svn_path()
  checkout()

# Asks the user for a location within the svn repo to check out
def prompt_user_for_svn_path():
  svn_sublocation = prompt(yellow(('Please specify a location under %s to check out from ' + \
                                  '(Such as "trunk", "tags/1.0.0", etc.)') % env.svn_path))
  env.svn_sublocation = svn_sublocation
  env.svn_full_path = "%s/%s" % (env.svn_path, env.svn_sublocation)

# Runs the command to check out the svn path to the release path
def checkout():
  with cd(env.all_releases_full_path):
    run("svn export %s %s" % (env.svn_full_path, env.release_path))
    print green("%s successfully checked out" % env.svn_full_path)
