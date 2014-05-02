from __future__ import with_statement
from fabric.api import *
from time import localtime, strftime
from fabric.colors import green, red
from fabric.contrib.console import confirm, prompt
from utility import create_dir

# Python files
import StringIO

#
# This file is used to include specific functions for settings
# that cannot be included within the general fabric script.
# It should include at least the following functions:
# * def app_prompt_user_for_inputs()
# * def app_set_required_environment_vars()
#
# If you don't need to use these, just return from them.
#

# Initialize directories for application
def app_initialize():
    return


# New prompts can sent to the user that set environmental variables for them.
# This can be done using the following syntax:
# utility.prompt_user_for_input(some_environment_name, "What question would you like to ask the user?", default_choice=False)
# The default_choice is what is chosen if the user just hits enter when they see it. It is False by default.
def app_prompt_user_for_inputs():
    return

# Does application specific setup of what ever is not covered by the generic fabric script.
def app_setup():

  return

# Does application specific deployment of what ever is not covered by the generic fabric script.
def app_pre_deploy():

  return

# Does application specific deployment of what ever is not covered by the generic fabric script.
def app_deploy():

  return

# Sets unique environmental variables. This can be done with:
# env.my_variable_name = value
def app_set_required_environment_vars():
    env.app_name = "myfirstproject"
    env.repo_name = "zhongya/myfirstproject.git"

## Dev
    env.develop_hosts = ['dev-vd01.cws.oregonstate.edu']
    env.develop_path = "/var/www/%s_code/" % env.app_name

## Staging
    #env.staging_hosts = ['nep-vs01.cws.oregonstate.edu']
    #env.staging_path = "/var/www/%s_code/" % env.app_name

## Production
    #env.production_hosts = ['nep-vp01.cws.oregonstate.edu']
    #env.production_path = "/var/www/%s_code/" % env.app_name

    env.repo_type = "git"
    env.repo_url = "git@gitlab.cws.oregonstate.edu"

# Array of symlinks to be created to the shared directory.  Each individual symlink is an array
# The first element in the array is the path within the 'shared' directory which we will be
# symlinking to, the second element is the path in the release directory where the symlink will
# be.  If the second element is omitted the path is assumed to be the same in both locations.
    env.custom_symlinks = [
        #['config/logger.yml'],
        #['system', 'public/system'],
    ]

    env.project_type = 'rails'

    return
