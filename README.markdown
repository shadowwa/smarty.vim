# Smarty plugin for Vim

This plugin provides syntax highlighting, indenting and general filetype
settings for the Smarty templating language.

This is a fork of [Vim Script #1798](http://www.vim.org/scripts/script.php?script_id=1798)
(see the original README below).

## Enhancements

The following (probably incomplete) list of enhancements are provided:

* Various improvements throughout the syntax handling.
* `{php}…{/php}` blocks are delegated to PHP syntax.
* `filetype` is set to "smarty" for `*.tpl` files.
* syntax is based on HTML filetype.
* matchit (jumping between tags via `%`) is configured for Smarty tags
  (`{foo}` .. `{/foo}`), and based on the html setup.
* line endings have been converted to unix fileformat (to prevent
  parse errors on Linux/Mac).
* Smarter indenting, handling PHP blocks and delegating to HTML (includes
  JavaScript).
* Syntax updated to Smarty5
* add doc for variable configuration
* unit tests

## Installation

If you use [Vundle](https://github.com/gmarik/vundle), add the following lines
to your `~/.vimrc`:

```vim
Plugin 'shadowwa/smarty.vim'
```

Then run inside Vim:

```vim
:so ~/.vimrc
:PluginInstall
```

If you use [Pathogen](https://github.com/tpope/vim-pathogen), do this:

```sh
cd ~/.vim/bundle
git clone https://github.com/shadowwa/smarty.vim.git
```

For [vim-plug](https://github.com/junegunn/vim-plug) users:

```vim
Plug 'shadowwa/smarty.vim'
```

in your `.vimrc` or `init.vim`, then restart Vim and run `:PlugInstall`.

## Variables

### indenting

When this variable is set, the indentation is done on html tags and smarty
tags otherwise smarty tags are not indented

```vim
let g:smarty_indent_block = 1
```

```smarty
 <div>
     <span>
         {if $test}
             {$variable}
         {/if}
     </span>
 </div>
```

```vim
    let g:smarty_indent_block = 0
```

```smarty
 <div>
     <span>
         {if $test}
         {$variable}
         {/if}
     </span>
 </div>
```

### Verbose mode for debugging

```vim
    let g:smarty_indent_verbose = 1
```

## Testing

Testing is based on vader.vim testing framework, see:
<https://github.com/junegunn/vader.vim> . To run full test suit use
`./test/run-tests.sh`, this will also download vader.vim plugin to project's
folder.

## About Smarty

[Smarty](https://smarty-php.github.io/smarty/stable/) is a PHP template language.

[Pull requests](https://github.com/shadowwa/smarty.vim) are welcome, of course.

## Additional useful plugins

* [vim-textobj-smarty](https://github.com/kana/vim-textobj-smarty/) add textobj
  for smarty, allowing to work on loop and conditional code with `*ak` and on
  content only with `*ik` ([vim-textobj-user](https://github.com/kana/vim-textobj-user)
  is also required)
* [vim-snippets](https://github.com/honza/vim-snippets) is a library of
  snippets for multiple languages, including Smarty. Works with:
  * [snipmate](https://github.com/garbas/vim-snipmate),
  * [ultisnips](https://github.com/SirVer/ultisnips) or
  * [coc-snippets](https://github.com/neoclide/coc-snippets) if you are using [coc](https://github.com/neoclide/coc.nvim)
* [coc-smarty](https://github.com/shadowwa/coc-smarty) is an extension for [coc](https://github.com/neoclide/coc.nvim),
  a test of using [coc-html](https://github.com/neoclide/coc-html) with code
  from [vscode-smarty](https://github.com/ssigwart/vscode-smarty)

## Original README

This is a mirror of <http://www.vim.org/scripts/script.php?script_id=1798>

A friend and I found that there were no acceptable vim syntax files for smarty,
so we took the only one we could find and added everything from the smarty
documentation (<http://smarty.php.net/manual/en>) to it.  If nothing else,
this is a very good start on a complete smarty syntax file.  We have even used
vimtip #498 to use autocomplete with this syntax and so far it seems to work well.
