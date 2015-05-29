# Installation

To use these configuration files:
- Install the Inconsolata font for gvim (`levien-inconsolata-fonts` for Fedora)
- Run `scripts/initialize_config_repo.sh` from the scripts directory. This will replace any relevant files with symlinks to the configuration files in the repository. It will ask for confirmation for each file.
- Set some `git`-related ENV variables:
  * `GIT_AUTHOR_NAME`
  * `GIT_AUTHOR_EMAIL`
  * `GIT_COMMITTER_NAME`
  * `GIT_COMMITTER_EMAIL`

  You can create a `.bashrc_private` file for this, if it is executable, it will be executed from `.bashrc`.

  The reason for this is that a `git config --global set author.*` changes the `gitconfig` file that is now also in the repository. Most of the time, you don't want to commit that information to the repository. Also, if you do a `git stash`, you won't be able to commit anything, since you've just stashed the author name, so git can't use it for the commit.
