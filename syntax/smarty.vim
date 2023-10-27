" Vim syntax file
" Language:	Smarty Templates
" Maintainer:	Daniel Hahler, original: Manfred Stienstra manfred.stienstra@dwerg.net
" Last Change:  Di 10 Jun 2014 15:09:10 CEST
" Filenames:    *.tpl
" URL:		https://github.com/blueyed/smarty.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'smarty'
endif

syn case ignore

runtime! syntax/html.vim
unlet b:current_syntax

syn keyword smartySTags       contained append assign call capture config_load debug eval extends fetch html_checkboxes html_image html_options html_radios html_select_date html_select_time html_table include include_php insert mailto math ldelim rdelim
syn keyword smartyDTags       contained block for function literal nocache php setfilter strip textformat
syn keyword smartyConditional contained if elseif else
syn keyword smartySRepeat     contained cycle counter
syn keyword smartyDRepeat     contained foreach foreachelse section sectionelse while

syn match smartyCProperty contained "[a-zA-Z0-9_]\+="
syn match smartyProperty  contained "file="
syn match smartyProperty  contained "loop="
syn match smartyProperty  contained "name="
syn match smartyProperty  contained "include="
syn match smartyProperty  contained "skip="
syn match smartyProperty  contained "section="
syn match smartyProperty  contained "from="
syn match smartyProperty  contained "item="
syn match smartyProperty  contained "key="
syn match smartyProperty  contained "once="
syn match smartyProperty  contained "global="
syn match smartyProperty  contained "scope="
syn match smartyProperty  contained "script="
syn match smartyProperty  contained "assign="
syn match smartyProperty  contained "start="
syn match smartyProperty  contained "stop="
syn match smartyProperty  contained "max="
syn match smartyProperty  contained "show="
syn match smartyProperty  contained "step="
syn match smartyProperty  contained "var="
syn match smartyProperty  contained "value="
syn match smartyProperty  contained "skip="
syn match smartyProperty  contained "direction="
syn match smartyProperty  contained "print="
syn match smartyProperty  contained "advance="
syn match smartyProperty  contained "delimiter="
syn match smartyProperty  contained "reset="
syn match smartyProperty  contained "output="
syn match smartyProperty  contained "selected="
syn match smartyProperty  contained "options="
syn match smartyProperty  contained "separator="
syn match smartyProperty  contained "labels="
syn match smartyProperty  contained "height="
syn match smartyProperty  contained "width="
syn match smartyProperty  contained "basedir="
syn match smartyProperty  contained "alt="
syn match smartyProperty  contained "href="
syn match smartyProperty  contained "path_prefix="
syn match smartyProperty  contained "values="
syn match smartyProperty  contained "prefix="
syn match smartyProperty  contained "time="
syn match smartyProperty  contained "start_year="
syn match smartyProperty  contained "end_year="
syn match smartyProperty  contained "display_days="
syn match smartyProperty  contained "display_months="
syn match smartyProperty  contained "display_years="
syn match smartyProperty  contained "month_format="
syn match smartyProperty  contained "day_format="
syn match smartyProperty  contained "day_value_format="
syn match smartyProperty  contained "year_as_text="
syn match smartyProperty  contained "reverse_years="
syn match smartyProperty  contained "day_size="
syn match smartyProperty  contained "month_size="
syn match smartyProperty  contained "year_size="
syn match smartyProperty  contained "day_extra="
syn match smartyProperty  contained "month_extra="
syn match smartyProperty  contained "year_extra="
syn match smartyProperty  contained "field_order="
syn match smartyProperty  contained "field_separator="
syn match smartyProperty  contained "month_value_format="
syn match smartyProperty  contained "year_empty="
syn match smartyProperty  contained "month_empty="
syn match smartyProperty  contained "day_empty="
syn match smartyProperty  contained "display_hours="
syn match smartyProperty  contained "display_minutes="
syn match smartyProperty  contained "display_seconds="
syn match smartyProperty  contained "minute_interval="
syn match smartyProperty  contained "second_interval="
syn match smartyProperty  contained "field_array="
syn match smartyProperty  contained "all_extra="
syn match smartyProperty  contained "hour_extra="
syn match smartyProperty  contained "minute_extra="
syn match smartyProperty  contained "second_extra="
syn match smartyProperty  contained "meridian_extra="
syn match smartyProperty  contained "display_meridian="
syn match smartyProperty  contained "use_24_hours="
syn match smartyProperty  contained "cols="
syn match smartyProperty  contained "rows="
syn match smartyProperty  contained "inner="
syn match smartyProperty  contained "caption="
syn match smartyProperty  contained "table_attr="
syn match smartyProperty  contained "th_attr="
syn match smartyProperty  contained "tr_attr="
syn match smartyProperty  contained "td_attr="
syn match smartyProperty  contained "trailpad="
syn match smartyProperty  contained "hdir="
syn match smartyProperty  contained "vdir="
syn match smartyProperty  contained "address="
syn match smartyProperty  contained "text="
syn match smartyProperty  contained "encode="
syn match smartyProperty  contained "cc="
syn match smartyProperty  contained "bcc="
syn match smartyProperty  contained "subject="
syn match smartyProperty  contained "newsgroups="
syn match smartyProperty  contained "followupto="
syn match smartyProperty  contained "extra="
syn match smartyProperty  contained "equation="
syn match smartyProperty  contained "format="
syn match smartyProperty  contained "trigger="
syn match smartyProperty  contained "sticky="
syn match smartyProperty  contained "caption="
syn match smartyProperty  contained "fgcolor="
syn match smartyProperty  contained "bgcolor="
syn match smartyProperty  contained "textcolor="
syn match smartyProperty  contained "capcolor="
syn match smartyProperty  contained "closecolor="
syn match smartyProperty  contained "textfont="
syn match smartyProperty  contained "captionfont="
syn match smartyProperty  contained "closefont="
syn match smartyProperty  contained "textsize="
syn match smartyProperty  contained "captionsize="
syn match smartyProperty  contained "closesize="
syn match smartyProperty  contained "width="
syn match smartyProperty  contained "height="
syn match smartyProperty  contained "left="
syn match smartyProperty  contained "right="
syn match smartyProperty  contained "center="
syn match smartyProperty  contained "above="
syn match smartyProperty  contained "below="
syn match smartyProperty  contained "border="
syn match smartyProperty  contained "offsetx="
syn match smartyProperty  contained "offsety="
syn match smartyProperty  contained "fgbackground="
syn match smartyProperty  contained "bgbackground="
syn match smartyProperty  contained "closetext="
syn match smartyProperty  contained "noclose="
syn match smartyProperty  contained "status="
syn match smartyProperty  contained "autostatus="
syn match smartyProperty  contained "autostatuscap="
syn match smartyProperty  contained "inarray="
syn match smartyProperty  contained "caparray="
syn match smartyProperty  contained "capicon="
syn match smartyProperty  contained "snapx="
syn match smartyProperty  contained "snapy="
syn match smartyProperty  contained "fixx="
syn match smartyProperty  contained "fixy="
syn match smartyProperty  contained "background="
syn match smartyProperty  contained "padx="
syn match smartyProperty  contained "pady="
syn match smartyProperty  contained "fullhtml="
syn match smartyProperty  contained "frame="
syn match smartyProperty  contained "function="
syn match smartyProperty  contained "delay="
syn match smartyProperty  contained "hauto="
syn match smartyProperty  contained "indent="
syn match smartyProperty  contained "indent_first="
syn match smartyProperty  contained "indent_char="
syn match smartyProperty  contained "wrap="
syn match smartyProperty  contained "wrap_char="
syn match smartyProperty  contained "vauto="
syn match smartyProperty  contained "wrap_cut="

syn match   smartyConstant contained "\$smarty"
syn keyword smartyTodo     contained FIXME NOTE TODO OPTIMIZE XXX

" Number
syn match smartyNumber "-\=\<\d\+\>" contained display
syn match smartyNumber "\<0x\x\{1,8}\>"  contained display

" Boolean
syn keyword smartyBoolean contained true false

" Operator
syn match  smartyOperator contained  "||\|&&\| neq \| gte \| lte \| not \| mod \| ne \| eq \| gt \| lt \| ge \| le \|===\|==\|!=\|>\|<\|>=\|<=\|!\|%"
syn match  smartyGlue     contained "\.\|\->"

" Dollar
syn match smartyDollarSign      contained "\$" " nextgroup=smartyVariable
syn match smartyMaybeDollarSign contained "\([^\\]\|\\\\\)\@<=\$"

" Variable
syn match smartyVariable        contained "\$\@<=\(\h\w\{-}\(\.\|\->\|\[\w\{-}\]\(\.\|\->\)\)\)*\w*" contains=smartyGlue nextgroup=smartyFunctionArgs
syn match smartyMaybeVariable   contained "\(\(^\|[^\\]\|\\\\\)\$\)\@<=\h\w*"
syn match smartyEscapedVariable contained "\\$\h\w*"

syn region smartyInBracket    contained matchgroup=Constant start=+\[+ end=+\]+ contains=smartyVariable
syn region smartyInBacktick   contained matchgroup=Constant start=+\`+ end=+\`+ contains=smartyVariable
syn region smartyString       contained matchgroup=Constant start=+'+  end=+'+  contains=smartyMaybeVariable, smartyInBacktick, smartyMaybeDollarSign keepend
syn region smartyStringDouble contained matchgroup=Constant start=+"+  end=+"+  contains=smartyMaybeVariable, smartyInBacktick, smartyMaybeDollarSign keepend
syn region smartyModifier     contained matchgroup=Statement start=+||\@!+ end=+\ze:\|\>+
syn region smartyParameter    contained matchgroup=Statement start=+:+     end=+\ze\(}\||\)+ contains=smartyVariable, smartyDollarSign, smartyGlue, smartyInBracket, smartyStringDouble contained

syn region smartySimpleTag start="{\s\{-}[a-z$]\@=" end="}" contains=smartyParameter, smartyCProperty, smartyProperty, smartyGlue, smartyModifier, smartyDollarSign, smartyInBracket, smartyStringDouble, smartyVariable, smartyString, smartySTags, smartyConstant, smartySRepeat, smartyNumber, smartyBoolean, smartyOperator, smartyTodo
syn region smartyStartTag  start="{\(block\|elseif\|for\|foreach\|function\|if\|literal\|nocache\|php\|section\|setfilter\|strip\|textformat\|while\)\@=" end="}" contains=smartyParameter, smartyCProperty, smartyProperty, smartyGlue, smartyModifier, smartyDollarSign, smartyInBracket, smartyStringDouble, smartyVariable, smartyString, smartyDTags, smartyConstant, smartyDRepeat, smartyNumber, smartyBoolean, smartyOperator, smartyConditional, smartyOperator
syn region smartyMiddleTag start="{\(else\|foreachelse\|sectionelse\)\>" end="}" contains=smartyConditional, smartyDRepeat
syn region smartyEndTag    start="{/\(block\|for\|foreach\|function\|if\|literal\|nocache\|php\|section\|setfilter\|strip\|textformat\|while\)\@=" end="}" contains=smartyDTags, smartyConditional, smartyDRepeat
syn region smartyComment   matchgroup=Comment  start="{\*" end="\*}" contains=smartyTodo

syn cluster htmlPreproc add=smartyZone add=smartyComment add=smartySimpleTag add=smartyStartTag add=smartyMiddleTag add=smartyEndTag

syn region htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn region htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc

if version >= 508 || !exists("did_smarty_syn_inits")
  if version < 508
    let did_smarty_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink smartyBoolean         Boolean
  HiLink smartyCProperty       Identifier
  HiLink smartyComment         Comment
  HiLink smartyConditional     Keyword
  HiLink smartyDRepeat         Keyword
  HiLink smartyDTags           Keyword
  HiLink smartyDollarSign      Statement
  HiLink smartyGlue            Statement
  HiLink smartyInBacktick      Statement
  HiLink smartyInBracket       PreProc
  HiLink smartyKeyword         Type
  HiLink smartyMaybeDollarSign Statement
  HiLink smartyMaybeVariable   Identifier
  HiLink smartyModifier        Special
  HiLink smartyNumber          Number
  HiLink smartyOperator        Operator
  HiLink smartyProperty        Keyword
  HiLink smartyRepeat          Repeat
  HiLink smartySRepeat         Keyword
  HiLink smartySTags           Keyword
  HiLink smartyString          Special
  HiLink smartyStringDouble    Special
  HiLink smartyTest            Boolean
  HiLink smartyTodo            Todo
  HiLink smartyVariable        Identifier
  delcommand HiLink
endif

" Match/delegate {php}..{/php} blocks.
syn include syntax/php.vim
syn region   phpRegion  matchgroup=Delimiter start="{php}" end="{/php}" contains=@phpClTop

let b:current_syntax = "smarty"

if main_syntax == 'smarty'
  unlet main_syntax
endif

" vim: ts=8
