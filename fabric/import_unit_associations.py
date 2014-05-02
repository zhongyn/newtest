from __future__ import with_statement
from fabric.api import *
from fabric.colors import green, red, yellow
from fabric.decorators import *
from fabric.operations import *
from time import localtime, strftime
from fabric.contrib.console import confirm, prompt
from fabric.contrib.files import exists

#
# Imports new unit associations for a provided unit.
# It does so using the import_unit_assocations.rb script
# contained within NEP. This expects three CSV files that
# handle the changes:
#
# 1) agencies_fixed.csv
# 2) people_fixed.csv
# 3) sites_fixed.csv
#
# See script/import_unit_associations.rb in NEP for more information.
#

# Runs the script to import unit associations.
def import_unit_associations(unit=''):
  if not confirm(yellow('Would you like to split a unit?'), default=False):
    return
  unit = check_unit(unit)
  if unit == '':
    print(red("Unit not set. Cancelling user import."))
    return
  file_path = get_file_path()
  deployment_path = env.release_full_path
  print green("Copying files to new NEP deploy")
  get_files_from_file_path(file_path, deployment_path)
  run_import(unit, deployment_path)
  print green("Cleaning up files")
  clean_up(deployment_path)
  print green("Successfully split unit %s" % unit)

# Ensures that we have a unit to deploy with
def check_unit(unit):
  if unit == '':
    return prompt(yellow('Specify which unit (by abbreviation) you would like to split.'))
  return unit

# Gets the path where the CSV files are being kept
def get_file_path():
  return prompt(yellow('Specify the path to the CSV files you would like to use.'))

# Copies the files needed for the import into the current path (Which should be the deployment_path)
def get_files_from_file_path(file_path, deployment_path):
  if exists('%s/agencies_fixed.csv' % file_path):
    run('cp %s/agencies_fixed.csv %s' % (file_path, deployment_path))
  if exists('%s/people_fixed.csv' % file_path):
    run('cp %s/people_fixed.csv %s' % (file_path, deployment_path))
  if exists('%s/sites_fixed.csv' % file_path):
    run('cp %s/sites_fixed.csv %s' % (file_path, deployment_path))

# Runs the actual import script, after confirming with the user
def run_import(unit, path):
  command = "%s/script/runner %s/script/import_unit_associations.rb %s -e production --debug --go" % (path, path, unit)
  if not confirm(yellow("Ready to run %s. IS THIS OKAY?" % command), default=False):
    # Cancel the import - note that this just returns, so the clean up will still happen
    print(red("Cancelling import"))
    return
  with cd(path):
    run(command)

# Cleans up any files left behind from the import
def clean_up(deployment_path):
  if exists('%s/agencies_fixed.csv' % deployment_path):
    sudo('rm %s/agencies_fixed.csv' % deployment_path)
  if exists('%s/people_fixed.csv' % deployment_path):
    sudo('rm %s/people_fixed.csv' % deployment_path)
  if exists('%s/sites_fixed.csv' % deployment_path):
    sudo('rm %s/sites_fixed.csv' % deployment_path)
  if exists('%s/agencies_done.csv' % deployment_path):
    sudo('rm %s/agencies_done.csv' % deployment_path)
  if exists('%s/people_done.csv' % deployment_path):
    sudo('rm %s/people_done.csv' % deployment_path)
  if exists('%s/sites_done.csv' % deployment_path):
    sudo('rm %s/sites_done.csv' % deployment_path)
