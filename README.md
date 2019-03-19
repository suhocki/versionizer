# versionizer
Generates version based on git logs

### usage
--type 

name - print full version name like "1.0.2"  
code - print version code like "1"

version looks like X.Y.Z, where:  
X - version code (based on master branch merges count)  
Y - major version (based on develop branch merges count)  
Z - minor version (based on commits count in some feature/bug branch)
