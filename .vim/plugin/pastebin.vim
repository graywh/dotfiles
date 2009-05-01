" paster.vim - send text to a web "pastebin".

" Copyright (c) 2009, Eugene Ciurana (pr3d4t0r)
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:
"     * Redistributions of source code must retain the above copyright
"       notice, this list of conditions, the URL http://eugeneciurana.com/paster.vim,
"       and the following disclaimer.
"     * Redistributions in binary form must reproduce the above copyright
"       notice, this list of conditions, the URL http://eugeneciurana.com/paster.vim,
"       and the following disclaimer in the documentation and/or other materials
"       provided with the distribution.
"     * Neither the name Eugene Ciurana, nor pr3d4t0r, nor the
"       names of its contributors may be used to endorse or promote products
"       derived from this software without specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY EUGENE CIURANA ''AS IS'' AND ANY
" EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
" DISCLAIMED. IN NO EVENT SHALL EUGENE CIURANA BE LIABLE FOR ANY
" DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
" (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
" ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
" (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
" SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"
"
" CONTRIBUTOR           EMAIL                         IRC /NICK
" ----------            -----                         ---------
" Eugene Ciurana        http://ciurana.eu/contact     pr3d4t0r
" Andrew Lombardi       http://www.mysticcoders.com   kinabalu
" Matt Wozniski         mjw@drexel.edu                godlygeek
" Will Gray             graywh@gmail.com              graywh
"
" Special thanks to stepnem, iamjay_, jerbear, and other denizens of the
" #vim channel (irc://irc.freenode.net/#vim)


" *** Configuration *** {{{1

" *************** Begin default configuration ****************** {{{2

" Default pastebin configuration for http://eugeneciurana.com/pastebin/ and 
" http://ciurana.eu/pastebin/ - these are the ##java channel default pastebin
" sites:

" let s:PASTE_COMMAND         = 'curl'
" let s:PASTE_CONTROL         = '-isv'
" let s:PASTE_FIXED_ARGUMENTS = '-d "parentID=&paste=Send&remember=0&expiry=d"'
" let s:PASTE_FORMAT          = '-d "format=textFormat"'
" let s:PASTE_NICK            = '-d "poster=nickID"'
" let s:PASTE_PAYLOAD         = '-d "@-"'

" PASTE_RESPONSE_FLAG is a regular expression used for identifying
" which line in a list of output lines from the PASTE_COMMAND contains
" the URL of the successful paste operation.  The response varies
" from one server to the next and must be implemented for each
" pastebin.
"
" Given a response like:
"
" 1. Congratulations - your paste succeded!
" 2. Location: http://servername.tld/path/to/pastebin/locator
" 3. Have a nice day
"
" PASTE_RESPONSE_FLAG must contain a regex that detects only the
" second line.

" let s:PASTE_RESPONSE_FLAG   = "^Location"

"                                 " vim-filetype   pastebin-format
" let s:PASTE_SYNTAX_OPTIONS  = {   'awk':         'awk',
"                                 \ 'sh':          'bash',
"                                 \ 'c':           'c',
"                                 \ 'cpp':         'cpp',
"                                 \ 'html':        'html4strict',
"                                 \ 'java':        'java',
"                                 \ 'javascript':  'javascript',
"                                 \ 'perl':        'perl',
"                                 \ 'php':         'php',
"                                 \ 'python':      'python',
"                                 \ 'ruby':        'ruby',
"                                 \
"                                 \ 'default':     'text' }

" let s:PASTE_TEXT_AREA       = 'code2'
" let s:PASTE_URI             = 'http://eugeneciurana.com/pastebin/'

" The ParseLocationFrom() function is system dependent because every
" pastebin returns this information in a sliglhtly different format
" from others.
"
" The function accepts a string containing the URL of the successful
" paste operation, and extracts the URL itself from it.
"
" The function MUST return a string of the form:
" 
" Location: http://servername.tld/path/to/pastebin/locator
"
" The subcomponent that copies the contents to the GUI clipboard
" expects the response string in that format.

" function! s:ParseLocationFrom(line)
"   return substitute(a:line, '[[:space:]\r\n]\+$', '', '')
" endfunction

" *************** End default configuration ******************** }}}2


" *************** Begin pastey.net configuration *************** {{{2

let s:PASTE_COMMAND         = 'curl'
let s:PASTE_CONTROL         = '-isv'
let s:PASTE_FIXED_ARGUMENTS = ''
let s:PASTE_FORMAT          = '-d "language=textFormat"'
let s:PASTE_NICK            = '-d "author=nickID"'
let s:PASTE_TITLE           = '-d "subject=titleString"'
let s:PASTE_PAYLOAD         = '-d "@-"'
let s:PASTE_RESPONSE_FLAG   = "Your new pastey.net link is:"

                                " vim-filetype    pastebin-format {{{3
let s:PASTE_SYNTAX_OPTIONS  = {   'a65':          'a65',
                                \ 'aap':          'aap',
                                \ 'abaqus':       'abaqus',
                                \ 'abc':          'abc',
                                \ 'abel':         'abel',
                                \ 'acedb':        'acedb',
                                \ 'ada':          'ada',
                                \ 'aflex':        'aflex',
                                \ 'ahdl':         'ahdl',
                                \ 'amiga':        'amiga',
                                \ 'aml':          'aml',
                                \ 'ampl':         'ampl',
                                \ 'ant':          'ant',
                                \ 'antlr':        'antlr',
                                \ 'apache':       'apache',
                                \ 'apachestyle':  'apachestyle',
                                \ 'arch':         'arch',
                                \ 'art':          'art',
                                \ 'asm':          'asm',
                                \ 'asm68k':       'asm68k',
                                \ 'asmh8300':     'asmh8300',
                                \ 'asn':          'asn',
                                \ 'aspperl':      'aspperl',
                                \ 'aspvbs':       'aspvbs',
                                \ 'asterisk':     'asterisk',
                                \ 'atlas':        'atlas',
                                \ 'automake':     'automake',
                                \ 'ave':          'ave',
                                \ 'awk':          'awk',
                                \ 'ayacc':        'ayacc',
                                \ 'b':            'b',
                                \ 'baan':         'baan',
                                \ 'basic':        'basic',
                                \ 'bc':           'bc',
                                \ 'bdf':          'bdf',
                                \ 'bib':          'bib',
                                \ 'bindzone':     'bindzone',
                                \ 'blank':        'blank',
                                \ 'btm':          'btm',
                                \ 'c':            'c',
                                \ 'calendar':     'calendar',
                                \ 'catalog':      'catalog',
                                \ 'cdl':          'cdl',
                                \ 'cf':           'cf',
                                \ 'cfg':          'cfg',
                                \ 'ch':           'ch',
                                \ 'change':       'change',
                                \ 'changelog':    'changelog',
                                \ 'chaskell':     'chaskell',
                                \ 'cheetah':      'cheetah',
                                \ 'chill':        'chill',
                                \ 'cl':           'cl',
                                \ 'clean':        'clean',
                                \ 'clipper':      'clipper',
                                \ 'cobol':        'cobol',
                                \ 'conf':         'conf',
                                \ 'config':       'config',
                                \ 'cpp':          'cpp',
                                \ 'crm':          'crm',
                                \ 'crontab':      'crontab',
                                \ 'cs':           'cs',
                                \ 'csc':          'csc',
                                \ 'csh':          'csh',
                                \ 'csp':          'csp',
                                \ 'css':          'css',
                                \ 'cterm':        'cterm',
                                \ 'ctrlh':        'ctrlh',
                                \ 'cupl':         'cupl',
                                \ 'cuplsim':      'cuplsim',
                                \ 'cvs':          'cvs',
                                \ 'cvsrc':        'cvsrc',
                                \ 'cweb':         'cweb',
                                \ 'cynlib':       'cynlib',
                                \ 'cynpp':        'cynpp',
                                \ 'd':            'd',
                                \ 'dcd':          'dcd',
                                \ 'dcl':          'dcl',
                                \ 'debchangelog': 'debchangelog',
                                \ 'debcontrol':   'debcontrol',
                                \ 'def':          'def',
                                \ 'desc':         'desc',
                                \ 'desktop':      'desktop',
                                \ 'diff':         'diff',
                                \ 'dircolors':    'dircolors',
                                \ 'diva':         'diva',
                                \ 'dns':          'dns',
                                \ 'docbk':        'docbk',
                                \ 'docbksgml':    'docbksgml',
                                \ 'docbkxml':     'docbkxml',
                                \ 'dosbatch':     'dosbatch',
                                \ 'dosini':       'dosini',
                                \ 'dot':          'dot',
                                \ 'dracula':      'dracula',
                                \ 'dsl':          'dsl',
                                \ 'dtd':          'dtd',
                                \ 'dtml':         'dtml',
                                \ 'dylan':        'dylan',
                                \ 'dylanintr':    'dylanintr',
                                \ 'dylanlid':     'dylanlid',
                                \ 'ecd':          'ecd',
                                \ 'edif':         'edif',
                                \ 'eiffel':       'eiffel',
                                \ 'elf':          'elf',
                                \ 'elinks':       'elinks',
                                \ 'elmfilt':      'elmfilt',
                                \ 'erlang':       'erlang',
                                \ 'esqlc':        'esqlc',
                                \ 'eterm':        'eterm',
                                \ 'euphoria':     'euphoria',
                                \ 'exim':         'exim',
                                \ 'expect':       'expect',
                                \ 'exports':      'exports',
                                \ 'fasm':         'fasm',
                                \ 'fdcc':         'fdcc',
                                \ 'fetchmail':    'fetchmail',
                                \ 'fgl':          'fgl',
                                \ 'focexec':      'focexec',
                                \ 'form':         'form',
                                \ 'forth':        'forth',
                                \ 'fortran':      'fortran',
                                \ 'foxpro':       'foxpro',
                                \ 'fstab':        'fstab',
                                \ 'fvwm1':        'fvwm1',
                                \ 'fvwm2':        'fvwm2',
                                \ 'fvwm2m4':      'fvwm2m4',
                                \ 'gdb':          'gdb',
                                \ 'gdmo':         'gdmo',
                                \ 'gedcom':       'gedcom',
                                \ 'gkrellmrc':    'gkrellmrc',
                                \ 'gnuplot':      'gnuplot',
                                \ 'gp':           'gp',
                                \ 'gpg':          'gpg',
                                \ 'grads':        'grads',
                                \ 'groff':        'groff',
                                \ 'grub':         'grub',
                                \ 'gsp':          'gsp',
                                \ 'gtkrc':        'gtkrc',
                                \ 'haskell':      'haskell',
                                \ 'hb':           'hb',
                                \ 'help':         'help',
                                \ 'hercules':     'hercules',
                                \ 'hex':          'hex',
                                \ 'hog':          'hog',
                                \ 'html':         'html',
                                \ 'htmlcheetah':  'htmlcheetah',
                                \ 'htmlm4':       'htmlm4',
                                \ 'htmlos':       'htmlos',
                                \ 'ia64':         'ia64',
                                \ 'icemenu':      'icemenu',
                                \ 'icon':         'icon',
                                \ 'idl':          'idl',
                                \ 'idlang':       'idlang',
                                \ 'indent':       'indent',
                                \ 'inform':       'inform',
                                \ 'inittab':      'inittab',
                                \ 'ipfilter':     'ipfilter',
                                \ 'ishd':         'ishd',
                                \ 'iss':          'iss',
                                \ 'ist':          'ist',
                                \ 'jal':          'jal',
                                \ 'jam':          'jam',
                                \ 'jargon':       'jargon',
                                \ 'java':         'java',
                                \ 'javacc':       'javacc',
                                \ 'javascript':   'javascript',
                                \ 'jess':         'jess',
                                \ 'jgraph':       'jgraph',
                                \ 'jproperties':  'jproperties',
                                \ 'jsp':          'jsp',
                                \ 'kix':          'kix',
                                \ 'kscript':      'kscript',
                                \ 'kwt':          'kwt',
                                \ 'lace':         'lace',
                                \ 'latte':        'latte',
                                \ 'ldif':         'ldif',
                                \ 'lex':          'lex',
                                \ 'lftp':         'lftp',
                                \ 'lhaskell':     'lhaskell',
                                \ 'libao':        'libao',
                                \ 'lifelines':    'lifelines',
                                \ 'lilo':         'lilo',
                                \ 'lisp':         'lisp',
                                \ 'lite':         'lite',
                                \ 'logtalk':      'logtalk',
                                \ 'lotos':        'lotos',
                                \ 'lout':         'lout',
                                \ 'lpc':          'lpc',
                                \ 'lprolog':      'lprolog',
                                \ 'lscript':      'lscript',
                                \ 'lss':          'lss',
                                \ 'lua':          'lua',
                                \ 'lynx':         'lynx',
                                \ 'm4':           'm4',
                                \ 'mail':         'mail',
                                \ 'mailcap':      'mailcap',
                                \ 'make':         'make',
                                \ 'man':          'man',
                                \ 'maple':        'maple',
                                \ 'masm':         'masm',
                                \ 'mason':        'mason',
                                \ 'master':       'master',
                                \ 'matlab':       'matlab',
                                \ 'mel':          'mel',
                                \ 'mf':           'mf',
                                \ 'mgp':          'mgp',
                                \ 'mib':          'mib',
                                \ 'mma':          'mma',
                                \ 'mmix':         'mmix',
                                \ 'modconf':      'modconf',
                                \ 'model':        'model',
                                \ 'modsim3':      'modsim3',
                                \ 'modula2':      'modula2',
                                \ 'modula3':      'modula3',
                                \ 'monk':         'monk',
                                \ 'moo':          'moo',
                                \ 'mp':           'mp',
                                \ 'mplayerconf':  'mplayerconf',
                                \ 'msidl':        'msidl',
                                \ 'msql':         'msql',
                                \ 'mush':         'mush',
                                \ 'muttrc':       'muttrc',
                                \ 'mysql':        'mysql',
                                \ 'named':        'named',
                                \ 'nasm':         'nasm',
                                \ 'nastran':      'nastran',
                                \ 'natural':      'natural',
                                \ 'ncf':          'ncf',
                                \ 'nqc':          'nqc',
                                \ 'nroff':        'nroff',
                                \ 'nsis':         'nsis',
                                \ 'objc':         'objc',
                                \ 'objcpp':       'objcpp',
                                \ 'ocaml':        'ocaml',
                                \ 'occam':        'occam',
                                \ 'omnimark':     'omnimark',
                                \ 'openroad':     'openroad',
                                \ 'opl':          'opl',
                                \ 'ora':          'ora',
                                \ 'papp':         'papp',
                                \ 'pascal':       'pascal',
                                \ 'pasm':         'pasm',
                                \ 'pcap':         'pcap',
                                \ 'pccts':        'pccts',
                                \ 'perl':         'perl',
                                \ 'pf':           'pf',
                                \ 'pfmain':       'pfmain',
                                \ 'php':          'php',
                                \ 'phtml':        'phtml',
                                \ 'pic':          'pic',
                                \ 'pike':         'pike',
                                \ 'pilrc':        'pilrc',
                                \ 'pine':         'pine',
                                \ 'pinfo':        'pinfo',
                                \ 'pir':          'pir',
                                \ 'plm':          'plm',
                                \ 'plp':          'plp',
                                \ 'plsql':        'plsql',
                                \ 'pmc':          'pmc',
                                \ 'po':           'po',
                                \ 'pod':          'pod',
                                \ 'postscr':      'postscr',
                                \ 'pov':          'pov',
                                \ 'povini':       'povini',
                                \ 'ppd':          'ppd',
                                \ 'ppwiz':        'ppwiz',
                                \ 'procmail':     'procmail',
                                \ 'progress':     'progress',
                                \ 'prolog':       'prolog',
                                \ 'psf':          'psf',
                                \ 'ptcap':        'ptcap',
                                \ 'purifylog':    'purifylog',
                                \ 'pyrex':        'pyrex',
                                \ 'python':       'python',
                                \ 'qf':           'qf',
                                \ 'quake':        'quake',
                                \ 'r':            'r',
                                \ 'radiance':     'radiance',
                                \ 'ratpoison':    'ratpoison',
                                \ 'rc':           'rc',
                                \ 'rcs':          'rcs',
                                \ 'rcslog':       'rcslog',
                                \ 'readline':     'readline',
                                \ 'rebol':        'rebol',
                                \ 'registry':     'registry',
                                \ 'remind':       'remind',
                                \ 'resolv':       'resolv',
                                \ 'rexx':         'rexx',
                                \ 'rib':          'rib',
                                \ 'rnc':          'rnc',
                                \ 'robots':       'robots',
                                \ 'rpcgen':       'rpcgen',
                                \ 'rpl':          'rpl',
                                \ 'rst':          'rst',
                                \ 'rtf':          'rtf',
                                \ 'ruby':         'ruby',
                                \ 'samba':        'samba',
                                \ 'sas':          'sas',
                                \ 'sather':       'sather',
                                \ 'scheme':       'scheme',
                                \ 'scilab':       'scilab',
                                \ 'screen':       'screen',
                                \ 'sdl':          'sdl',
                                \ 'sed':          'sed',
                                \ 'sendpr':       'sendpr',
                                \ 'sgml':         'sgml',
                                \ 'sgmldecl':     'sgmldecl',
                                \ 'sgmllnx':      'sgmllnx',
                                \ 'sh':           'sh',
                                \ 'sicad':        'sicad',
                                \ 'simula':       'simula',
                                \ 'sinda':        'sinda',
                                \ 'sindacmp':     'sindacmp',
                                \ 'sindaout':     'sindaout',
                                \ 'skill':        'skill',
                                \ 'sl':           'sl',
                                \ 'slang':        'slang',
                                \ 'slice':        'slice',
                                \ 'slrnrc':       'slrnrc',
                                \ 'slrnsc':       'slrnsc',
                                \ 'sm':           'sm',
                                \ 'smarty':       'smarty',
                                \ 'smil':         'smil',
                                \ 'smith':        'smith',
                                \ 'sml':          'sml',
                                \ 'snnsnet':      'snnsnet',
                                \ 'snnspat':      'snnspat',
                                \ 'snnsres':      'snnsres',
                                \ 'snobol4':      'snobol4',
                                \ 'spec':         'spec',
                                \ 'specman':      'specman',
                                \ 'spice':        'spice',
                                \ 'splint':       'splint',
                                \ 'spup':         'spup',
                                \ 'spyce':        'spyce',
                                \ 'sql':          'sql',
                                \ 'sqlforms':     'sqlforms',
                                \ 'sqlj':         'sqlj',
                                \ 'sqr':          'sqr',
                                \ 'squid':        'squid',
                                \ 'sshconfig':    'sshconfig',
                                \ 'sshdconfig':   'sshdconfig',
                                \ 'st':           'st',
                                \ 'stp':          'stp',
                                \ 'strace':       'strace',
                                \ 'svn':          'svn',
                                \ 'tads':         'tads',
                                \ 'tags':         'tags',
                                \ 'tak':          'tak',
                                \ 'takcmp':       'takcmp',
                                \ 'takout':       'takout',
                                \ 'tasm':         'tasm',
                                \ 'tcl':          'tcl',
                                \ 'tcsh':         'tcsh',
                                \ 'terminfo':     'terminfo',
                                \ 'tex':          'tex',
                                \ 'texinfo':      'texinfo',
                                \ 'texmf':        'texmf',
                                \ 'text':         'null',
                                \ 'txt':          'null',
                                \ 'tf':           'tf',
                                \ 'tidy':         'tidy',
                                \ 'tilde':        'tilde',
                                \ 'tli':          'tli',
                                \ 'trasys':       'trasys',
                                \ 'tsalt':        'tsalt',
                                \ 'tsscl':        'tsscl',
                                \ 'tssgm':        'tssgm',
                                \ 'tssop':        'tssop',
                                \ 'uc':           'uc',
                                \ 'uil':          'uil',
                                \ 'valgrind':     'valgrind',
                                \ 'vb':           'vb',
                                \ 'verilog':      'verilog',
                                \ 'vgrindefs':    'vgrindefs',
                                \ 'vhdl':         'vhdl',
                                \ 'vim':          'vim',
                                \ 'viminfo':      'viminfo',
                                \ 'virata':       'virata',
                                \ 'vmasm':        'vmasm',
                                \ 'vrml':         'vrml',
                                \ 'vsejcl':       'vsejcl',
                                \ 'wdiff':        'wdiff',
                                \ 'web':          'web',
                                \ 'webmacro':     'webmacro',
                                \ 'wget':         'wget',
                                \ 'whitespace':   'whitespace',
                                \ 'winbatch':     'winbatch',
                                \ 'wml':          'wml',
                                \ 'wsh':          'wsh',
                                \ 'wvdial':       'wvdial',
                                \ 'xdefaults':    'xdefaults',
                                \ 'xf86conf':     'xf86conf',
                                \ 'xhtml':        'xhtml',
                                \ 'xkb':          'xkb',
                                \ 'xmath':        'xmath',
                                \ 'xml':          'xml',
                                \ 'xmodmap':      'xmodmap',
                                \ 'xpm':          'xpm',
                                \ 'xpm2':         'xpm2',
                                \ 'xs':           'xs',
                                \ 'xsd':          'xsd',
                                \ 'xslt':         'xslt',
                                \ 'xxd':          'xxd',
                                \ 'yacc':         'yacc',
                                \ 'yaml':         'yaml',
                                \ 'z8a':          'z8a',
                                \ 'zsh':          'zsh',
                                \
                                \ 'default':      'null' }
" }}}3

let s:PASTE_TEXT_AREA       = 'text'
let s:PASTE_URI             = 'http://pastey.net/submit.php'

function! s:ParseLocationFrom(line)
  return substitute(a:line, '.*href="\([^"]*\)".*', 'Location: \1', '')
endfunction

" *************** End pastey.net configuration ***************** }}}2


" *************** Begin AWK Paste! configuration *************** {{{2

" let s:PASTE_COMMAND         = 'curl'
" let s:PASTE_CONTROL         = '-isv'
" let s:PASTE_FIXED_ARGUMENTS = '-d "description=Pastebin%20plugin%20for%20vim%20post"'
" let s:PASTE_FORMAT          = '-d "format=textFormat"'
" let s:PASTE_NICK            = '-d "name=nickID"'
" let s:PASTE_PAYLOAD         = '-d "@-"'
" let s:PASTE_RESPONSE_FLAG   = "AWK Paste"
"
"                                 " vim-filetype   pastebin-format
" let s:PASTE_SYNTAX_OPTIONS  = {   'awk':         'awk',
"                                 \ 'sh':          'bash',
"                                 \ 'c':           'c',
"                                 \ 'cpp':         'cpp',
"                                 \ 'html':        'html4strict',
"                                 \ 'java':        'java',
"                                 \ 'javascript':  'javascript',
"                                 \ 'perl':        'perl',
"                                 \ 'php':         'php',
"                                 \ 'python':      'python',
"                                 \ 'ruby':        'ruby',
"                                 \ 'default':     'text' }
"
" let s:PASTE_TEXT_AREA       = 'content'
" let s:PASTE_URI             = 'http://awkpaste.blisted.org/cgi/paste.cgi'
"
" function! s:ParseLocationFrom(line)
"   let tokens  = split(a:line, "\"")
"   let locator = "n/a"
"
"   if len(tokens) > 0x00
"     for item in tokens
"       if (match(item, "http:") > -1)
"         let locator = item
"       endif
"     endfor
"   endif
"
"   return "Location: ".locator
" endfunction

" *************** Begin AWK Paste! configuration *************** }}}2


" *************** Begin MysticPaste.com configuration ********** {{{2
"
" Author:  Andrew Lombardi (kinabalu) - http://www.mysticcoders.com
"
" let s:PASTE_COMMAND         = 'curl'
" let s:PASTE_CONTROL         = '-isv'
" let s:PASTE_FIXED_ARGUMENTS = '-d "description=Pastebin%20plugin%20for%20vim%20post"'
" let s:PASTE_FORMAT          = '-d "fileExt=textFormat"'
" let s:PASTE_NICK            = '-d "name=nickID"'
" let s:PASTE_PAYLOAD         = '-d "@-"'
" let s:PASTE_RESPONSE_FLAG   = "^X-Paste-Identifier"
"
"                                  " vim-filetype   pastebin-format
" let s:PASTE_SYNTAX_OPTIONS  = {   'awk':         'awk',
"                                 \ 'sh':          'sh',
"                                 \ 'c':           'c',
"                                 \ 'cpp':         'cpp',
"                                 \ 'html':        'html',
"                                 \ 'java':        'java',
"                                 \ 'javascript':  'js',
"                                 \ 'perl':        'pl',
"                                 \ 'php':         'php',
"                                 \ 'python':      'py',
"                                 \ 'ruby':        'rb',
"                                 \ 'default':     'text' }
"
" let s:PASTE_TEXT_AREA       = 'content'
" let s:PASTE_URI             = 'http://mysticpaste.com/servlet/plugin'
"
" function! s:ParseLocationFrom(line)
"   let tokens = split(a:line, "[ \r]")
"
"   return "Location: http://mysticpaste.com/view/" . tokens[0x01]
" endfunction

" *************** End MysticPaste.com configuration ************ }}}2

" }}}1

" Exit early if curl isn't available.

if !executable(s:PASTE_COMMAND)
  finish
endif


" *** Utility functions *** {{{1

let s:reservedCharacters = [ '$', '&', '+', ',', '/', ':', ';', '=', '?', '@' ]
let s:unsafeCharacters   = [ '"', '<', '>', '#', '%', '{', '}', '|', '\', '^', '~', '[', ']', '`' ]


function! s:CharEncodeURL(aSymbol) "{{{2
  let nSymbol = char2nr(a:aSymbol)

  " Non-printable characters first:
  if nSymbol <= 0x20 || nSymbol > 0x7f
    return printf("%%%02X", nSymbol)
  endif

  " Characters with special meaning to URL processors:
  if index(s:reservedCharacters, a:aSymbol) > -1 || index(s:unsafeCharacters, a:aSymbol) > -1
    return printf("%%%02X", nSymbol)
  endif

  return a:aSymbol
endfunction


function! s:StringEncodeURL(text) "{{{2
  let allChars = split(a:text, '\zs')
  let retVal   = ""

  for cSymbol in allChars
    let retVal .= s:CharEncodeURL(cSymbol)
  endfor

  return retVal
endfunction


function! s:BuildCacheFrom(textAsList) "{{{2
  " Experimental - this may not remain here for long.
  let fileName = tempname()

  call writefile(a:textAsList, fileName)

  return fileName
endfunction


function! s:ResolveTextFormat() "{{{2
  return has_key(s:PASTE_SYNTAX_OPTIONS, &filetype)
           \ ? s:PASTE_SYNTAX_OPTIONS[&filetype]
           \ : s:PASTE_SYNTAX_OPTIONS['default']
endfunction


" For OS X users:

function! s:Paste2Clipboard(locator) "{{{2
  if executable("pbcopy") && !has("gui_running")  " OS X
    call system("pbcopy", a:locator)
  endif

  if has("gui_running")
    let @+ = a:locator
  endif
endfunction


function! s:ExecutePaste(title, text) "{{{2
  let command  = s:PASTE_COMMAND
  let command .= " ".s:PASTE_CONTROL
  let command .= " ".s:PASTE_FIXED_ARGUMENTS
  let command .= " ".s:PASTE_PAYLOAD
  let command .= " ".substitute(s:PASTE_NICK, "nickID", g:nickID, "g")
  let command .= " ".substitute(s:PASTE_FORMAT, "textFormat", s:ResolveTextFormat(), "g")
  let command .= " ".substitute(s:PASTE_TITLE, "titleString", title, "g")
  let command .= " ".s:PASTE_URI

  let output   = split(system(command, s:PASTE_TEXT_AREA.'='.a:text), '\n')

  redraw

  for line in output
    let nPtr = match(line, s:PASTE_RESPONSE_FLAG)

    if nPtr != -1
      let location = s:ParseLocationFrom(line)
      echomsg location

      let clipboardURL = split(location, " ")
      call s:Paste2Clipboard(clipboardURL[0x01])

      return
    endif
  endfor

  echohl ErrorMsg
  echomsg "Paste failed!"
  echohl None
endfunction


" *** Main script function *** {{{1

function! Pastebin() range
  if (!exists('g:nickID'))
    let g:nickID = inputdialog("Enter your /nick or ID: ", "Anonymous")
  endif
  let title=inputdialog("Enter a title: ", "Pastebin plugin for Vim post")

  call s:ExecutePaste(s:StringEncodeURL(title), s:StringEncodeURL(join(getline(a:firstline, a:lastline), "\n")))
endfunction


" Command to call the function:

com! -range=% -nargs=0 Pastebin <line1>,<line2>call Pastebin()

