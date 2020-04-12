" Vim Syntax File
" Language: MarieCurry
" Maintainers: Benjamin Lellouch & Wojciech Rozowski
" Latest Revision: 10 April 2020

if exists("b:current_syntax")
	finish
endif

syntax keyword typeKeyword int char bool streams void 
highlight link typeKeyword Type

syntax keyword includeKeyword include
highlight link includeKeyword Include

syntax keyword conditionalKeyword if else while
highlight link conditionalKeyword Conditional

syntax keyword exceptionKeyword try catch throw
syntax keyword exceptionKeyword NullPointerException StreamsNotInitialisedException NotExistingStreamConsumptionException
syntax keyword exceptionKeyword DivideByZeroException TrapException ListEmptyException
highlight link exceptionKeyword Exception

syntax keyword functionKeyword print isEmpty consume tail head cons fst snd return 
highlight link functionKeyword Function

syn keyword booleanKeyword true false
highlight link booleanKeyword Boolean

syn match number "[0-9]*"
highlight link number Number

syn match operator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match operator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match operator	"[.!~*&%<>^|=,+-]"
syn match operator	"/[^/*=]"me=e-1
syn match operator	"/$"
syn match operator "&&\|||"
syn match operator	"[][]"
highlight link operator Conditional

syn match string "\".*\"" 
highlight link string String


let b:current_syntax = "MarieCurry"
