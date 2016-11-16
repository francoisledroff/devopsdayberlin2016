### cookbook upload

use knife to uload the cookbooks in this folder
from the chef-repo root folder:

    knife upload coobooks
    knife cookbook upload --force springboot

### Berkshelf

we are using Berkshelf to manage thirdparty cookbooks

After exploring for a short time with git submodules and subtree
http://berkshelf.com/index.html

#### Bersfile.lock
A `Berksfile.lock` is  created. It’s there to ensure that you (and other developers or your build server) will use the same versions of all cookbook dependencies. (to be committed in git then)

But note that you’ll have to nuke/edit it when trying out snapshots git-based cookbooks

#### Berkshelf Commands
to test the Berksfile:

     berks install

to upload the recipe in the chef server:

     berks upload

to Upload all cookbook(s) even if a frozen one exists on the Chef Server

     berks upload --force

to get help on a specific command:

     berks help upload





