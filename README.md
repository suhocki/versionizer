# versionizer
Generates version based on git logs

### usage
name - print full version
code - print commits count in current branch

version looks like X.Y.Z, where:
X - version code or count of merges to master
Y - major version or count of merges to develop
Z - minor version or count of commits into current non-master and non-develop branch. If current branch is master or develop, then 0 will return
