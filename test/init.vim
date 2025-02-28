" minimum vim configuration for test runner
set nocompatible
"let &packpath = expand('<sfile>:p:h:h')
" Remove first and last entry from runtimepath, to prevent loading plugins from ~/.vim
" Replace first entry rom runtimepath, by current directory, preventing
" loading plugins from ~/.vim and ensure the local syntax file is loaded
" instead of the bundled one
let &runtimepath = substitute(&runtimepath, '\v^.{-},(.*),.*$', '.,\1', '')

filetype off
set runtimepath+=vader.vim
set runtimepath+=.
set runtimepath+=after
"force loading current syntax file first
filetype plugin indent on
syntax enable
" Avoid closing up any fold since it results in some tests skipping lines and
" their output ends up diverging from what we expect them to be.
set foldlevel=99
