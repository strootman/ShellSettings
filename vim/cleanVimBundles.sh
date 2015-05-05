#!/bin/bash

# This script removes empty vim bundle directories. More importantly, it assumes
# they are empty!
git rm vim/.vim/bundle/{vim-fugitive,Dockerfile,paredit.vim,rainbow_parenthesis.vim}
git commit -m "Removing empty bundles from vim"

