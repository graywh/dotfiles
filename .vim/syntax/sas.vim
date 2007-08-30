" Vim syntax file
" Language: SAS
" Maintainer:  Will Gray <graywh@gmail.com>
" Last Change: 2007 Aug 30
" 
" This is a modification of the version that ships with Vim
" and maintained by James Kidd <james.kidd@covance.com>.
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let b:current_syntax = "sas"

syn case ignore
syn sync ccomment sasComment

syn region sasString start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=sasMacroVar
syn region sasString start=+'+  skip=+\\\\\|\\'+  end=+'+

" Want region from 'cards;' to ';' to be captured
syn region sasCards  start="^\s*CARDS.*" end="^\s*;\s*$"
syn region sasCards  start="^\s*DATALINES.*" end="^\s*;\s*$"

syn match sasNumber  "-\=\<\d*\.\=[0-9_]\>"

syn region sasComment start="*" end=";" contains=sasTodo
" Handle macro comments too.
syn region sasComment start="%*\*" end=";" contains=sasTodo
" /* ... */ style overrides * ... ;
syn region sasComment  start="/\*"  end="\*/" contains=sasTodo

" This line defines macro variables in code.  HiLink at end of file
" defines the color scheme. Begin region with ampersand and end with
" any non-word character offset by -1; put ampersand in the skip list
" just in case it is used to concatenate macro variable values.
if version < 600
  syn region sasMacroVar  start="\&" skip="[_&]" end="\W"he=e-1
else    " for the older Vim's just do it their way ...
  syn region sasMacroVar  start="&"  skip="[_&]" end="\W"he=e-1
endif


" I dont think specific PROCs need to be listed if use this line
syn match sasProc   "^\s*PROC \w\+"
syn keyword sasStep    RUN QUIT DATA


" Base SAS Procs - version 8.1

syn keyword sasConditional DO ELSE END IF THEN UNTIL WHILE

syn keyword sasStatement  ABORT ARRAY ATTRIB BY CALL CARDS CARDS4 CATNAME
syn keyword sasStatement  CONTINUE DATALINES DATALINES4 DELETE DISPLAY
syn keyword sasStatement  DM DROP ENDSAS ERROR FILE FILENAME FOOTNOTE
syn keyword sasStatement  FORMAT GOTO INFILE INFORMAT INPUT KEEP
syn keyword sasStatement  LABEL LEAVE LENGTH LIBNAME LINK LIST LOSTCARD
syn keyword sasStatement  MERGE MISSING MODIFY OPTIONS OUTPUT PAGE
syn keyword sasStatement  PUT REDIRECT REMOVE RENAME REPLACE RETAIN
syn keyword sasStatement  RETURN SELECT SET SKIP STARTSAS STOP TITLE
syn keyword sasStatement  UPDATE WAITSAS WHERE WINDOW X SYSTASK

" Keywords that are used in Proc SQL
" I left them as statements because SAS's enhanced editor highlights
" them the same as normal statements used in data steps (Jim Kidd)

syn keyword sasStatement  ADD AND ALTER AS CASCADE CHECK CREATE
syn keyword sasStatement  DELETE DESCRIBE DISTINCT DROP FOREIGN
syn keyword sasStatement  FROM GROUP HAVING INDEX INSERT INTO IN
syn keyword sasStatement  KEY LIKE MESSAGE MODIFY MSGTYPE NOT
syn keyword sasStatement  NULL ON OR ORDER PRIMARY REFERENCES
syn keyword sasStatement  RESET RESTRICT SELECT SET TABLE
syn keyword sasStatement  UNIQUE UPDATE VALIDATE VIEW WHERE

syn match sasStatement  "FOOTNOTE\d"
syn match sasStatement  "TITLE\d"

syn match sasMacro  /%\w*/

" SAS Functions

syn keyword sasFunction ABS ADDR AIRY ARCOS ARSIN ATAN ATTRC ATTRN
syn keyword sasFunction BAND BETAINV BLSHIFT BNOT BOR BRSHIFT BXOR
syn keyword sasFunction BYTE CDF CEIL CEXIST CINV CLOSE CNONCT COLLATE
syn keyword sasFunction COMPBL COMPOUND COMPRESS COS COSH CSS CUROBS
syn keyword sasFunction CV DACCDB DACCDBSL DACCSL DACCSYD DACCTAB
syn keyword sasFunction DAIRY DATE DATEJUL DATEPART DATETIME DAY
syn keyword sasFunction DCLOSE DEPDB DEPDBSL DEPDBSL DEPSL DEPSL
syn keyword sasFunction DEPSYD DEPSYD DEPTAB DEPTAB DEQUOTE DHMS
syn keyword sasFunction DIF DIGAMMA DIM DINFO DNUM DOPEN DOPTNAME
syn keyword sasFunction DOPTNUM DREAD DROPNOTE DSNAME ERF ERFC EXIST
syn keyword sasFunction EXP FAPPEND FCLOSE FCOL FDELETE FETCH FETCHOBS
syn keyword sasFunction FEXIST FGET FILEEXIST FILENAME FILEREF FINFO
syn keyword sasFunction FINV FIPNAME FIPNAMEL FIPSTATE FLOOR FNONCT
syn keyword sasFunction FNOTE FOPEN FOPTNAME FOPTNUM FPOINT FPOS
syn keyword sasFunction FPUT FREAD FREWIND FRLEN FSEP FUZZ FWRITE
syn keyword sasFunction GAMINV GAMMA GETOPTION GETVARC GETVARN HBOUND
syn keyword sasFunction HMS HOSTHELP HOUR IBESSEL INDEX INDEXC
syn keyword sasFunction INDEXW INPUT INPUTC INPUTN INT INTCK INTNX
syn keyword sasFunction INTRR IRR JBESSEL JULDATE KURTOSIS LAG LBOUND
syn keyword sasFunction LEFT LENGTH LGAMMA LIBNAME LIBREF LOG LOG10
syn keyword sasFunction LOG2 LOGPDF LOGPMF LOGSDF LOWCASE MAX MDY
syn keyword sasFunction MEAN MIN MINUTE MOD MONTH MOPEN MORT N
syn keyword sasFunction NETPV NMISS NORMAL NOTE NPV OPEN ORDINAL
syn keyword sasFunction PATHNAME PDF PEEK PEEKC PMF POINT POISSON POKE
syn keyword sasFunction PROBBETA PROBBNML PROBCHI PROBF PROBGAM
syn keyword sasFunction PROBHYPR PROBIT PROBNEGB PROBNORM PROBT PUT
syn keyword sasFunction PUTC PUTN QTR QUOTE RANBIN RANCAU RANEXP
syn keyword sasFunction RANGAM RANGE RANK RANNOR RANPOI RANTBL RANTRI
syn keyword sasFunction RANUNI REPEAT RESOLVE REVERSE REWIND RIGHT
syn keyword sasFunction ROUND SAVING SCAN SDF SECOND SIGN SIN SINH
syn keyword sasFunction SKEWNESS SOUNDEX SPEDIS SQRT STD STDERR STFIPS
syn keyword sasFunction STNAME STNAMEL SUBSTR SUM SYMGET SYSGET SYSMSG
syn keyword sasFunction SYSPROD SYSRC SYSTEM TAN TANH TIME TIMEPART
syn keyword sasFunction TINV TNONCT TODAY TRANSLATE TRANWRD TRIGAMMA
syn keyword sasFunction TRIM TRIMN TRUNC UNIFORM UPCASE USS VAR
syn keyword sasFunction VARFMT VARINFMT VARLABEL VARLEN VARNAME
syn keyword sasFunction VARNUM VARRAY VARRAYX VARTYPE VERIFY VFORMAT
syn keyword sasFunction VFORMATD VFORMATDX VFORMATN VFORMATNX VFORMATW
syn keyword sasFunction VFORMATWX VFORMATX VINARRAY VINARRAYX VINFORMAT
syn keyword sasFunction VINFORMATD VINFORMATDX VINFORMATN VINFORMATNX
syn keyword sasFunction VINFORMATW VINFORMATWX VINFORMATX VLABEL
syn keyword sasFunction VLABELX VLENGTH VLENGTHX VNAME VNAMEX VTYPE
syn keyword sasFunction VTYPEX WEEKDAY YEAR YYQ ZIPFIPS ZIPNAME ZIPNAMEL
syn keyword sasFunction ZIPSTATE

" Handy settings for using vim with log files
syn keyword sasLogMsg   NOTE
syn keyword sasWarnMsg  WARNING
syn keyword sasErrMsg   ERROR

" Always contained in a comment
syn keyword sasTodo  TODO TBD FIXME containedin=sasComment

" These don't fit anywhere else
syn keyword sasUnderscore _ALL_ _AUTOMATIC_ _CHARACTER_ _INFILE_ _NAME_
syn keyword sasUnderscore _NULL_ _NUMERIC_ _N_ _USER_ _WEBOUT_

" End of SAS Functions

"  For version 5.7 and earlier: only when not done already
"  For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sas_syntax_inits")
  if version < 508
    let did_sas_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink  sasComment      Comment
  HiLink  sasConditional  Conditional
  HiLink  sasStep         Keyword
  HiLink  sasFunction     Function
  HiLink  sasMacro        Macro
  HiLink  sasMacroVar     Identifier
  HiLink  sasNumber       Number
  HiLink  sasStatement    Keyword
  HiLink  sasString       String
  HiLink  sasProc         Keyword
  HiLink  sasTodo         Todo
  HiLink  sasErrMsg       Error
  HiLink  sasWarnMsg      Todo
  HiLink  sasLogMsg       Debug
  HiLink  sasCards        Type
  HiLink  sasUnderscore   Special

  delcommand HiLink
endif
