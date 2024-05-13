if (&background ==# "dark" && get(g:, "colors_name", "") ==# "zk-yang")
    runtime! colors/zk-yin.vim
    finish
endif

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "zk-yang"

let s:palette = {}

let s:palette.white = [254, '#f7f7f7']
let s:palette.gray15 = [253, '#e4e4e4']
let s:palette.gray14 = [250, '#d0d0d0']
let s:palette.gray13 = [249, '#b2b2b2']
let s:palette.gray12 = [248, '#a8a8a8']
let s:palette.gray11 = [247, '#9e9e9e']
let s:palette.gray10 = [246, '#949494']
let s:palette.gray09 = [245, '#8a8a8a']
let s:palette.gray08 = [244, '#808080']
let s:palette.gray07 = [243, '#767676']
let s:palette.gray06 = [242, '#666666']
let s:palette.gray05 = [241, '#606060']
let s:palette.gray04 = [240, '#585858']
let s:palette.gray03 = [239, '#4e4e4e']
let s:palette.gray02 = [238, '#444444']
let s:palette.gray01 = [235, '#262626']
let s:palette.almostblack = [ 230, '#101010']
let s:palette.black = [233, '#000000']

let s:palette.comment = [244, '#808080']
let s:palette.foreground = [233, '#f1f1f1']
let s:palette.background = [254, '#000000']
let s:palette.highlight = [250, '#b2b2b2']
let s:palette.colour = [125, '#af005f']
let s:palette.cursor_line = [253, '#f1f0f1']

let s:palette.purple = s:palette.foreground 
let s:palette.brown = [130, '#af5f00']
let s:palette.blue = [130, '#004E87']
let s:palette.darkblue = s:palette.blue 
let s:palette.green = [65, '#50956c']
let s:palette.red = [120, '#960F2F']
let s:palette.magenta = [125, '#af005f']

if has("nvim")
    let g:terminal_color_0 = s:palette.gray01[1]
    let g:terminal_color_1 = s:palette.gray06[1]
    let g:terminal_color_2 = s:palette.gray03[1]
    let g:terminal_color_3 = s:palette.gray11[1]
    let g:terminal_color_4 = s:palette.gray02[1]
    let g:terminal_color_5 = s:palette.gray08[1]
    let g:terminal_color_6 = s:palette.gray09[1]
    let g:terminal_color_7 = s:palette.gray13[1]
    let g:terminal_color_8 = s:palette.gray03[1]
    let g:terminal_color_9 = s:palette.gray10[1]
    let g:terminal_color_10 = s:palette.gray07[1]
    let g:terminal_color_11 = s:palette.gray13[1]
    let g:terminal_color_12 = s:palette.gray05[1]
    let g:terminal_color_13 = s:palette.gray12[1]
    let g:terminal_color_14 = s:palette.gray14[1]
    let g:terminal_color_15 = s:palette.white[1]
elseif has("terminal")
    let g:terminal_ansi_colors = [
                \ s:palette.gray01[1],
                \ s:palette.gray06[1],
                \ s:palette.gray03[1],
                \ s:palette.gray11[1],
                \ s:palette.gray02[1],
                \ s:palette.gray08[1],
                \ s:palette.gray09[1],
                \ s:palette.gray13[1],
                \ s:palette.gray03[1],
                \ s:palette.gray10[1],
                \ s:palette.gray07[1],
                \ s:palette.gray13[1],
                \ s:palette.gray05[1],
                \ s:palette.gray12[1],
                \ s:palette.gray14[1],
                \ s:palette.white[1]
                \ ]
endif

function! s:hi(group, fg_color, bg_color, style)
    let highlight_command = ['hi', a:group]
    if !empty(a:fg_color)
        let [ctermfg, guifg] = a:fg_color
        call add(highlight_command, printf('ctermfg=%d guifg=%s', ctermfg, guifg))
    endif
    if !empty(a:bg_color)
        let [ctermbg, guibg] = a:bg_color
        call add(highlight_command, printf('ctermbg=%d guibg=%s', ctermbg, guibg))
    endif
    if !empty(a:style)
        call add(highlight_command, printf('cterm=%s gui=%s', a:style, a:style))
    endif
    execute join(highlight_command, ' ')
endfunction

call s:hi('Normal', s:palette.foreground, s:palette.background, '')
set background=light

call s:hi('Constant', s:palette.foreground, [], '')
call s:hi('String', s:palette.foreground, [], '')
call s:hi('Number', s:palette.foreground, [], '')

call s:hi('Identifier', s:palette.foreground, [], 'none')
call s:hi('Function', s:palette.foreground, [], '')

call s:hi('Statement', s:palette.foreground, [], '')
call s:hi('Operator', s:palette.foreground, [], 'none')
call s:hi('Keyword', s:palette.foreground, [], '')

call s:hi('PreProc', s:palette.foreground, [], 'none')

call s:hi('Type', s:palette.foreground, [], '')

call s:hi('Special', s:palette.foreground, [], '')
call s:hi('SpecialComment', s:palette.foreground, [], '')

call s:hi('Title', s:palette.foreground, [], '')
call s:hi('Todo', s:palette.foreground, [], '')
call s:hi('Comment', s:palette.comment, [], '')

call s:hi('LineNr', s:palette.gray14, s:palette.background, 'none')
call s:hi('FoldColumn', s:palette.gray08, s:palette.background, 'none')
call s:hi('CursorLine', [], s:palette.cursor_line, 'none')
call s:hi('CursorLineNr', s:palette.foreground, s:palette.cursor_line, 'none')

call s:hi('Visual', s:palette.foreground, s:palette.highlight, '')
call s:hi('Search', s:palette.foreground, s:palette.gray14, '')
call s:hi('IncSearch', s:palette.highlight, s:palette.colour, '')

call s:hi('SpellBad', s:palette.red, [], 'undercurl')
call s:hi('SpellCap', s:palette.red, [], 'undercurl')
call s:hi('SpellLocal', s:palette.red, [], 'undercurl')
call s:hi('SpellRare', s:palette.brown, [], 'undercurl')

call s:hi('MatchParen', s:palette.colour, s:palette.white, '')

call s:hi('Cursor', [], s:palette.foreground, '')
call s:hi('Underlined', s:palette.foreground, [], 'underline')
call s:hi('SpecialKey', s:palette.gray13, [], '')
call s:hi('NonText', s:palette.gray13, [], '')
call s:hi('Directory', s:palette.gray07, [], '')

call s:hi('Pmenu', s:palette.foreground, s:palette.gray15, 'none')
call s:hi('PmenuSbar', s:palette.black, s:palette.black, 'none')
call s:hi('PmenuSel', s:palette.foreground, s:palette.gray14, '')
call s:hi('PmenuThumb', s:palette.gray09, s:palette.gray09, 'none')

call s:hi('EndOfBuffer', s:palette.black, s:palette.background, '')

call s:hi('StatusLine', s:palette.gray14, s:palette.black, 'none')
call s:hi('StatusLineNC', s:palette.gray02, s:palette.gray15, 'none')
call s:hi('WildMenu', s:palette.background, s:palette.foreground, '')
call s:hi('VertSplit', [], [], 'none')

call s:hi('Error', s:palette.red, s:palette.background, '')

call s:hi('MsgArea', s:palette.background, s:palette.gray14, 'none')
call s:hi('ErrorMsg', s:palette.red, s:palette.background, '')
call s:hi('WarningMsg', s:palette.brown, s:palette.background, '')
call s:hi('ModeMsg', s:palette.foreground, [], '')
call s:hi('MoreMsg', s:palette.foreground, [], '')

call s:hi('DiffAdd', s:palette.green, s:palette.background, '')
call s:hi('DiffChange', s:palette.blue, s:palette.background, '')
call s:hi('DiffDelete', s:palette.red, s:palette.background, '')
call s:hi('DiffText', s:palette.darkblue, s:palette.background, '')
call s:hi('DiffAdded', s:palette.green, s:palette.background, '')
call s:hi('DiffChanged', s:palette.blue, s:palette.background, '')
call s:hi('DiffRemoved', s:palette.red, s:palette.background, '')

call s:hi('DiagnosticError', s:palette.red, [], '')
call s:hi('DiagnosticWarn', s:palette.brown, [], '')
call s:hi('DiagnosticInfo', s:palette.blue, [], '')
call s:hi('DiagnosticHint', s:palette.gray06, [], '')
call s:hi('DiagnosticUnderlineError', s:palette.red, [], '')
call s:hi('DiagnosticUnderlineWarn', s:palette.brown, [], '')
call s:hi('DiagnosticUnderlineInfo', s:palette.blue, [], '')
call s:hi('DiagnosticUnderlineHint', s:palette.gray06, [], '')

highlight! link Character Constant
highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn FoldColumn
highlight! link ColorColumn FoldColumn
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Exception Statement

highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc

highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type

highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Special
highlight! link Debug Special
highlight! link Question Special
highlight! link FloatBorder Special

highlight! link VisualNOS Visual
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine
