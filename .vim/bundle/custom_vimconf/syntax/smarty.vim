" Vim syntax file
" Language: Smarty Templates
" Maintainer:   Manfred Stienstra manfred.stienstra@dwerg.net
" Last Change:  Fri Apr 12 10:33:51 CEST 2002 
" Filenames:    *.tpl
" URL:      http://www.dwerg.net/download/vim/smarty.vim

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
"syn cluster htmlPreproc add=smartyUnZone

syn match smartyTagName contained "[-_A-Za-z0-9]\+"

syn keyword smartyInFunc ne eq == != > < >= <= === ! % 

syn match smartyProperty contained "[-_A-Za-z0-9]\+="

syn match smartyConstant "\$smarty" 

syn match smartyDollarSign      contained "\$"
syn match smartyMaybeDollarSign contained "\([^\\]\|\\\\\)\@<=\$"

syn match smartyVariable      contained "\$\@<=\h\w*"
syn match smartyVariable      contained "\(\$\h\w*\(\.\|\->\|\[.*\]\(\.\|\->\)\)\)\@<=\w*"
syn match smartyMaybeVariable contained "\(\(^\|[^\\]\|\\\\\)\$\)\@<=\h\w*"


syn match smartyEscapedVariable contained "\\$\h\w*"

syn region smartyInBracket    matchgroup=Constant start=+\[+ end=+\]+ contains=smartyVariable contained
syn region smartyInBacktick   matchgroup=Constant start=+\`+ end=+\`+ contains=smartyVariable contained
syn region smartyStringDouble matchgroup=htmlString start=+"+  end=+"+  contains=smartyMaybeVariable, smartyInBacktick, smartyMaybeDollarSign contained keepend

syn match smartyGlue "\.\|\->"


syn region smartyModifier  matchgroup=Statement start=+|+   end=+\ze:\|\>+
syn region smartyParameter matchgroup=Statement start=+:+   end=+\s\|}+ contains=smartyVariable, smartyDollarSign, smartyGlue, smartyInBracket, smartyStringDouble
syn region smartyZone     matchgroup=htmlTag   start="{"   end="}" contains=smartyParameter, smartyProperty, smartyGlue, smartyModifier, smartyDollarSign, smartyInBracket, smartyStringDouble, smartyVariable, smartyString, smartyBlock, smartyTagName, smartyConstant, smartyInFunc
syn region smartyZone     matchgroup=htmlEndTag   start="{/"   end="}" contains=smartyTagName
syn region smartyComment  matchgroup=Comment   start="{\*" end="\*}"

syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,smartyZone
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,smartyZone
  syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc,smartyZone


if version >= 508 || !exists("did_smarty_syn_inits")
  if version < 508
    let did_smarty_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink smartyTagName         htmlTagName
  HiLink smartyProperty        Type
  HiLink smartyComment         Comment
  HiLink smartyInFunc          Function
  HiLink smartyBlock           Constant
  HiLink smartyGlue            Statement
  HiLink smartyVariable        Identifier
  HiLink smartyDollarSign      Statement
  HiLink smartyMaybeVariable   Identifier
  HiLink smartyMaybeDollarSign Statement
  HiLink smartyStringDouble    htmlString
  HiLink smartyInBracket       PreProc
  HiLink smartyInBacktick      Statement
  HiLink smartyModifier        Special
  delcommand HiLink
endif 

let b:current_syntax = "smarty"

if main_syntax == 'smarty'
  unlet main_syntax
endif

" vim: ts=8
