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


function! s:handle(lnum, ft, searchpairargs) abort
  " See if we're inside a subblock.
  let l:save_cursor = getcurpos()
  exec a:lnum
  let l:scriptlnum = call('searchpair', a:searchpairargs)
  let l:prevlnum = prevnonblank(a:lnum)
  call setpos('.', l:save_cursor)

  " If we're in a subblock and the previous line isn't the starting tag
  " itself, use its indenting.
  if l:scriptlnum && l:scriptlnum != l:prevlnum
    exec 'return ' s:indentexprs[a:ft]
  endif
  return ''
endfun

function! s:syn(lnum) abort
  let l:nonemptycol=match(getline(a:lnum), '\S')+1
  return synIDattr(synID(a:lnum, l:nonemptycol, 1), 'name')
endfunction

function! GetSmartyHtmlIndent(lnum) abort
  let l:line  = getline(prevnonblank(a:lnum-1))
  let l:cline = getline(a:lnum)
  let l:nline = getline(nextnonblank(a:lnum+1))
  let l:sw    = 0
  let l:syn   = s:syn(prevnonblank(a:lnum-1))
  let l:csyn  = s:syn(v:lnum)
  let l:nsyn  = s:syn(nextnonblank(a:lnum+1))

  if g:smarty_indent_block
      let l:sw = exists('*shiftwidth') ? shiftwidth() : shiftwidth()

      if l:csyn ==# 'smartyStartTag' || l:csyn ==# 'smartyMiddleTag'
          call cursor(a:lnum, match(getline(a:lnum), '\S')+1)
          let l:pairline = searchpair('{', '', '}', 'bW')
          if l:pairline > 0
              return l:sw + indent(l:pairline)
          endif
      endif
      if l:csyn ==# 'smartyStartTag'
          if l:syn ==# 'htmlTag' || l:syn ==# 'htmlScriptTag'
              if l:line =~# '<[^>]*$'
                  return l:sw + indent(prevnonblank(v:lnum-1))
              endif
              let l:indent = call(substitute(s:indentexprs['html'], '(\|)', '', 'g'), [])
              return l:indent
          endif
          if (l:syn ==# 'smartyStartTag' || l:syn ==# 'smartyMiddleTag') && !(l:line =~? '{\([a-z]\+\)[^}]*}[^\n]*{\/\1}')
              return l:sw + indent(prevnonblank(v:lnum-1))
          endif

          return indent(prevnonblank(v:lnum-1))
      elseif l:csyn ==# 'smartyEndTag' || l:csyn ==# 'smartyMiddleTag'
          if (l:syn ==# 'smartyStartTag' || l:syn ==# 'smartyMiddleTag') && !(l:line =~? '{\([a-z]\+\)[^}]*}[^\n]*{\/\1}')
              return indent(prevnonblank(v:lnum-1))
          endif

          return indent(prevnonblank(v:lnum-1)) - l:sw
      endif
  endif

  for [ft, args] in items(s:pairs)
    let l:indent = call('s:handle', [a:lnum, ft, args])
    if type(l:indent) == type(0)
      if g:smarty_indent_verbose
        echom 'Line ' . a:lnum . ': using ' . ft . ' indenting via ' . s:indentexprs[ft]
      endif

      if g:smarty_indent_block
          " Indent {php}
          if l:cline =~# '\s*{php}\s*'
            return l:sw + indent(prevnonblank(v:lnum-1))
          endif

          " Indent/unindent {/php}
          if l:cline =~# '\s*{/php}\s*'
            if l:line =~# '\s*{php}\s*'
              return indent(prevnonblank(v:lnum-1))
            else
              return indent(prevnonblank(v:lnum-1)) - l:sw
            endif
          endif

          " Indent line if previous line is {php}
          if l:line =~# '\s*{php}\s*'
            return l:sw + indent(prevnonblank(v:lnum-1))
          endif
      endif

      return l:indent
    endif
  endfor

  " Fallback to HTML
  if g:smarty_indent_verbose
    echom 'Line ' . a:lnum . ': using HTML indenting via ' . s:indentexprs['html']
  endif

  let l:indent = call(substitute(s:indentexprs['html'], '(\|)', '', 'g'), [])

  if g:smarty_indent_block
      if l:cline =~# '^\s*</\(\w\+\)>'
          let l:tagname = matchstr(l:cline, '^\s*</\zs\w\+\ze>')
          call cursor(a:lnum, match(l:cline, '\S')+1)
          let l:pairline = searchpair('<' . l:tagname . '\>', '', '</' . l:tagname . '>', 'bW')
          if l:pairline > 0
              return indent(l:pairline)
          endif
      endif

      " Indent if previous line is a smartyStartTag but ignore inline tags
      if (l:syn ==# 'smartyStartTag' || l:syn ==# 'smartyMiddleTag') && !(l:line =~? '{\([a-z]\+\)[^}]*}[^\n]*{\/\1}')
          call cursor(a:lnum - 1, len(l:line))
          let l:pairline = searchpair('{', '', '}', 'bW')
          if l:pairline > 0
              return l:sw + indent(l:pairline)
          endif
          return l:sw + l:indent
      endif

      if l:line =~# '>[^<]*$' && l:cline !~# '^\s*</'
          call cursor(a:lnum - 1, len(l:line))
          let l:open_tag = searchpair('<', '', '>', 'bW')
          if l:open_tag > 0 && l:open_tag < a:lnum - 1
              return l:sw + indent(prevnonblank(a:lnum - 1))
          endif
      endif
  endif

  return l:indent
endfunction
