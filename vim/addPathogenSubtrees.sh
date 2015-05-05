#!/bin/bash

# This script will add the squashed subtrees for the vim pathogen bundles
# This script assumes that the corresponding remotes have already been set up.


git subtree add --prefix=vim/.vim/bundle/vim-fugitive --squash vim-fugitive master
git subtree add --prefix=vim/.vim/bundle/Dockerfile --squash Dockerfile master
git subtree add --prefix=vim/.vim/bundle/paraedit.vim --squash paredit.vim master
git subtree add --prefix=vim/.vim/bundle/powerline --squash powerline master
git subtree add --prefix=vim/.vim/bundle/rainbow_parentheses.vim --squash rainbow_parentheses.vim master

