from __future__ import with_statement
from fabric.api import *
from fabric.colors import red, green

# This method is responsible for checking out code from the repository.  The
# repository type and location must be set in the configuration file
def checkout():
    # Call a more specific method based on env.repo_type
    if (env.repo_type == "svn"):
      checkout_via_svn()

    if (env.repo_type == "git"):
      checkout_via_git()

    cleanup()

# Perform an svn export of the specified tag/branch/trunk
def checkout_via_svn():
    if (env.repo != ""):
      with cd(env.releases_path):
        run("svn export " + env.repo_path + env.repo + " " + env.release)
        print(green("Code deployed via svn"))


# Perform a git clone, checkout the appropriate branch/tag
def checkout_via_git():
    with cd(env.releases_path):
        run("git clone " + env.repo_path + " " + env.release)
        with cd(env.release):
            run("git checkout " + env.checkout)
            print(green("Code Deployed via git"))


# If there are more than the maxiumum amount of releases to keep, get rid of the oldest
def cleanup():
    dirs = run("ls %s" % env.releases_path).split("  ")
    if (len(dirs) > env.past_releases_to_keep):
        dirs = sorted(dirs)
        with cd(env.releases_path):
            run("sudo rm -rf " + dirs[0] + "/")
            print(green("Deleting old release: %s" % dirs[0]))
