## My .vim folder ##

Feel free to borrow it ! :)

### Note to Self ###

#### Installation ####

    git clone git://github.com/Pychimp/dotvim.git ~/.vim

#### Create Symlinks ####

    ln -s ~/.vim/vimrc ~/.vimrc

#### Adding Plugins (Or other Vim stuff) ####

    cd ~/.vim (IF your not in .vim folder !)

Then copy the url that you would use to clone a repo, and then 

    git submodule add <The url of the repo> bundle/<repo's name>

--

For more help check this [vimcast](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen)
