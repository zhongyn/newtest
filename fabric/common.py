from __future__ import with_statement
from fabric.api import *
from fabric.colors import green, red, yellow
from fabric.decorators import *
from fabric.operations import *
from time import localtime, strftime
from fabric.contrib.console import confirm, prompt
from fabric.contrib.files import exists

import config

#
# Includes functions necessary to set paths, and to set them up, that are not specific to this project
#
# Sets a bunch of variables we'll need during the deploy
# This will allow us to change them in one place
def set_required_environment_vars():
  env.deploy_host = env["%s_host" % env.deploy_env]
  env.shared_full_path = "%s/%s" % (env.deploy_path, env.shared_directory_name)
  env.config_full_path = "%s/%s" % (env.shared_full_path, env.shared_config_directory_name)
  env.tmp_full_path = "%s/%s" % (env.shared_full_path, env.shared_tmp_directory_name)
  env.log_full_path = "%s/%s" % (env.shared_full_path, env.shared_logs_directory_name)
  env.shared_file_upload_full_path = "%s/%s" % (env.shared_full_path, env.file_upload_directory)
  env.all_releases_full_path = "%s/%s" % (env.deploy_path, env.all_releases_directory_name)
  env.current_release_full_path = "%s/%s" % (env.deploy_path, env.current_release_directory_name)
  env.release_path = strftime("%Y%m%d%H%M", localtime())
  env.release_full_path = "%s/%s" % (env.all_releases_full_path, env.release_path)
  env.release_file_upload_full_path = "%s/public" % env.release_full_path
  # Forces the environment to not use shells
  # This is used to make it so when running sudo commands, Fabric
  # will only run the command, and not try and run it in bash
  # We set this to get around the problem of not being able to run
  # bash as the sudo user.


