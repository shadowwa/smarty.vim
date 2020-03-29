" Inspired by: http://github.com/kchmck/vim-coffee-script

if exists('b:did_indent')
  finish
endif

if !exists('g:smarty_indent_verbose')
  let g:smarty_indent_verbose = 0
endif

let s:indentexprs = {}

" NOTE: Javascript does not use indentexpr, but gets handled by html.vim.
"       CoffeeScript injects itself via after/indent/html.vim.
let s:pairs = {
      \ 'php': ['{php[^>]*}', '', '{/php}', 'bWn'],
      \ }

for ft in keys(s:pairs)
  silent! unlet b:did_indent
  exec 'runtime indent/'.ft.'.vim'
  let s:indentexprs[ft] = &l:indentexpr
endfor

" Load html last so it can overwrite other settings.
silent! unlet b:did_indent
runtime indent/html.vim
let s:indentexprs['html'] = &l:indentexpr

let b:did_indent = 1

" Inject our wrapper indent function.
setlocal indentexpr=GetSmartyHtmlIndent(v:lnum)


function! s:handle(lnum, ft, searchpairargs)
  " See if we're inside a subblock.
  let save_cursor = getcurpos()
  exec a:lnum
  let scriptlnum = call('searchpair', a:searchpairargs)
  let prevlnum = prevnonblank(a:lnum)
  call setpos('.', save_cursor)

  " If we're in a subblock and the previous line isn't the starting tag
  " itself, use its indenting.
  if scriptlnum && scriptlnum != prevlnum
    exec 'return ' s:indentexprs[a:ft]
  endif
  return ""
endfun

function! s:syn(lnum)
  return synIDattr(synID(a:lnum,1+indent(a:lnum),1),'name')
endfunction

function! GetSmartyHtmlIndent(lnum)
  let line  = getline(prevnonblank(a:lnum-1))
  let cline = getline(a:lnum)
  let nline = getline(nextnonblank(a:lnum+1))
  let sw    = 0
  let syn   = s:syn(prevnonblank(a:lnum-1))
  let csyn  = s:syn(v:lnum)
  let nsyn  = s:syn(nextnonblank(a:lnum+1))

  if g:smarty_indent_block
      let sw = exists('*shiftwidth') ? shiftwidth() : shiftwidth()

      if csyn == 'smartyStartTag'
          if syn == 'htmlTag' || syn == 'smartyStartTag'
              return sw + indent(prevnonblank(v:lnum-1))
          endif

          return indent(prevnonblank(v:lnum-1))
      elseif csyn == 'smartyEndTag'
          if syn == 'smartyStartTag'
              return indent(prevnonblank(v:lnum-1))
          endif

          return indent(prevnonblank(v:lnum-1)) - sw
      endif
  endif

  for [ft, args] in items(s:pairs)
    let indent = call('s:handle', [a:lnum, ft, args])
    if type(indent) == type(0)
      if g:smarty_indent_verbose
        echom "Line " . a:lnum . ": using " . ft . " indenting via " . s:indentexprs[ft]
      endif

      if g:smarty_indent_block
          " Indent {php}
          if cline =~ '\s*{php}\s*'
            return sw + indent(prevnonblank(v:lnum-1))
          endif

          " Indent/unindent {/php}
          if cline =~ '\s*{/php}\s*'
            if line =~ '\s*{php}\s*'
              return indent(prevnonblank(v:lnum-1))
            else
              return indent(prevnonblank(v:lnum-1)) - sw
            endif
          endif

          " Indent line if previous line is {php}
          if line =~ '\s*{php}\s*'
            return sw + indent(prevnonblank(v:lnum-1))
          endif
      endif

      return indent
    endif
  endfor

  " Fallback to HTML
  if g:smarty_indent_verbose
    echom "Line " . a:lnum . ": using HTML indenting via " . s:indentexprs['html']
  endif

  let indent = call(substitute(s:indentexprs['html'], '(\|)', '', 'g'), [])

  if g:smarty_indent_block
      " Indent if previous line is a smartyStartTag but ignore inline tags
      if syn == 'smartyStartTag' && !(line =~ '{\([a-z]\+\)[^}]*}[^\n]*{\/\1}')
        return sw + indent
      endif
  endif

  return indent
endfunction
