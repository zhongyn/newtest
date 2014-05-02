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
from to import *
from common import *

# Install rvm under user
@task
def install_rvm():
  check_if_deploy_env_set()
  get_deploy_env_path()
  set_required_environment_vars()
  print green("Ready to deploy application to %s" % env.deploy_path)
  print green("Connecting to %s") % env.deploy_host
  with settings(host_string=env.deploy_host):
    run("\curl -L https://get.rvm.io | bash -s stable")
    run("echo 'PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting' >> .bashrc")
    run("rvm install 1.9.3 -l %s" % env.ruby_patch_level)
    run("rvm alias create default 1.9.3")
    run("gem install bundler")
    run("gem install passenger -v %s" % env.passenger_version)
    run("source .bash_profile; passenger-install-apache2-module")

# Checks to see if rvm is install and path is setup
def check_rvm():
  with settings(host_string=env.deploy_host):
    run("rvm list")
    run("which gem")
    run("echo $PATH")
    run("source .bash_profile; which passenger-install-apache2-module")
