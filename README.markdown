# Smarty syntax file for Vim

This is a fork of Vim Script #1798 (see the original README below).

It contains the following enhancements:

 * line endings have been converted to unix fileformat (to prevent
   parse errors on Linux/Mac)
 * `filetype` is set to "smarty" for `*.tpl` files
 * matchit (jumping between tags via `%`) is configured for Smarty tags
   (`{foo}` .. `{/foo}`)


## Original README
This is a mirror of http://www.vim.org/scripts/script.php?script\_id=1798

A friend and I found that there were no acceptable vim syntax files for smarty, so we took the only one we could find and added everything from the smarty documentation (http://smarty.php.net/manual/en) to it.  If nothing else, this is a very good start on a complete smarty syntax file.  We have even used vimtip #498 to use autocomplete with this syntax and so far it seems to work well.
