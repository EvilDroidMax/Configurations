""" Status Line Config

" Define all the different modes

" Automatically change the statusline color depending on mode
function! ChangeStatusline() "{{{
    if &columns >= 130
	let g:windowsize = 2
	let g:currentmode={
		    \ 'n'  : 'Normal',
		    \ 'no' : 'N·Operator Pending',
		    \ 'v'  : 'Visual',
		    \ 'V'  : 'V·Line',
		    \ '' : 'V·Block',
		    \ 's'  : 'Select',
		    \ 'S'  : 'S·Line',
		    \ '' : 'S·Block',
		    \ 'i'  : 'Insert',
		    \ 'R'  : 'Replace',
		    \ 'Rv' : 'V·Replace',
		    \ 'c'  : 'Command',
		    \ 'cv' : 'Vim Ex',
		    \ 'ce' : 'Ex',
		    \ 'r'  : 'Prompt',
		    \ 'rm' : 'More',
		    \ 'r?' : 'Confirm',
		    \ '!'  : 'Shell',
		    \}
    elseif &columns >= 100
	let g:currentmode={
		    \ 'n'  : 'Normal',
		    \ 'no' : 'N·Operator Pending',
		    \ 'v'  : 'Visual',
		    \ 'V'  : 'V·Line',
		    \ '' : 'V·Block',
		    \ 's'  : 'Select',
		    \ 'S'  : 'S·Line',
		    \ '' : 'S·Block',
		    \ 'i'  : 'Insert',
		    \ 'R'  : 'Replace',
		    \ 'Rv' : 'V·Replace',
		    \ 'c'  : 'Command',
		    \ 'cv' : 'Vim Ex',
		    \ 'ce' : 'Ex',
		    \ 'r'  : 'Prompt',
		    \ 'rm' : 'More',
		    \ 'r?' : 'Confirm',
		    \ '!'  : 'Shell',
		    \}

	let g:windowsize = 1
    else
	let g:currentmode={
		    \ 'n'  : 'N',
		    \ 'no' : 'N·Operator Pending',
		    \ 'v'  : 'V',
		    \ 'V'  : 'V',
		    \ '' : 'V.B',
		    \ 's'  : 'S',
		    \ 'S'  : 'S·L',
		    \ '' : 'S·B',
		    \ 'i'  : 'I',
		    \ 'R'  : 'R',
		    \ 'Rv' : 'V·R',
		    \ 'c'  : 'C',
		    \ 'cv' : 'Vim Ex',
		    \ 'ce' : 'Ex',
		    \ 'r'  : 'P',
		    \ 'rm' : 'More',
		    \ 'r?' : 'Confirm',
		    \ '!'  : 'Shell',
		    \}
	let g:windowsize = 0
    endif


    " Check For Mode Change and Color the statusbar


    return ''
endfunction "}}}

" Visual Mode Function
function! VisualModeColor()
    hi User1 guifg=#000000 guibg=#a3a3c2 gui=bold
    return ''
endfunction

" Normal Mode Function
function! NormalModeColor()
    hi User1 guifg=#d0d0d0 guibg=#444444 gui=NONE
    return ''
endfunction

" Update Color In Visual Mode
vnoremap <expr> <SID>VisualModeColor VisualModeColor()
nnoremap <script> v v<SID>VisualModeColor<left><right>
nnoremap <script> V V<SID>VisualModeColor<left><right>
nnoremap <script> <C-v> <C-v><SID>VisualModeColor<left><right>

" Update Colro In Normal Mode
nnoremap <expr> <SID>NormalModeColor NormalModeColor()
vnoremap <script> <esc> <esc><SID>NormalModeColor<left><right>

" Shorten a given filename by truncating path segments.
" https://github.com/blueyed/dotfiles/blob/master/vimrc#L396
function! ShortenFilename(bufname, maxlen) "{{{
    if getbufvar(bufnr(a:bufname), '&filetype') == 'help'
	return fnamemodify(a:bufname, ':t')
    endif

    let maxlen_of_parts = 7 " including slash/dot
    let maxlen_of_subparts = 5 " split at dot/hypen/underscore; including split

    let s:PS = exists('+shellslash') ? (&shellslash ? '/' : '\') : "/"
    let parts = split(a:bufname, '\ze['.escape(s:PS, '\').']')
    let i = 0
    let n = len(parts)
    let wholepath = '' " used for symlink check
    while i < n
	let wholepath .= parts[i]
	" Shorten part, if necessary:
	if i<n-1 && len(a:bufname) > a:maxlen && len(parts[i]) > maxlen_of_parts
	    " Let's see if there are dots or hyphens to truncate at, e.g.
	    " 'vim-pkg-debian' => 'v-p-d…'
	    let w = split(parts[i], '\ze[._-]')
	    if len(w) > 1
		let parts[i] = ''
		for j in w
		    if len(j) > maxlen_of_subparts-1
			let parts[i] .= j[0:maxlen_of_subparts-2]."…"
		    else
			let parts[i] .= j
		    endif
		endfor
	    else
		let parts[i] = parts[i][0:maxlen_of_parts-2].'…'
	    endif
	endif
	" add indicator if this part of the filename is a symlink
	if getftype(wholepath) == 'link'
	    if parts[i][0] == s:PS
		let parts[i] = parts[i][0] . '↬ ' . parts[i][1:]
	    else
		let parts[i] = '↬ ' . parts[i]
	    endif
	endif
	let i += 1
    endwhile
    let r = join(parts, '')
    return r
endfunction "}}}

" Find out current buffer's size and output it.
function! FileSize() "{{{
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
	let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
	let mbytes = kbytes / 1000
    endif

    if bytes <= 0
	return 'null'
    endif

    if (exists('mbytes'))
	return mbytes . 'MB'
    elseif (exists('kbytes'))
	return kbytes . 'KB'
    else
	return bytes . 'B'
    endif
endfunction "}}}


" Statusline {{{
function! SetActiveStatusLine()
    let &stl=''        " Clear statusline for when vimrc is loaded
    let &l:stl.='%1*'      " Change color
    let &l:stl.='%{ChangeStatusline()}'
    let &l:stl.=' %0.9{toupper(g:currentmode[mode()])}  '
    let &l:stl.='%2*'      " Change color
    let &l:stl.='  %<'     " Truncate from here on
    let &l:stl.='%t'     " Current buffer's file name
    let &l:stl.='  %{FileSize()}' " Output buffer's file size
    let &l:stl.='  '      " So there's a space between both sides
    let &l:stl.='%3*'      " Change color
    let &l:stl.=' %M'     " Show modified status of buffer
    let &l:stl.=' %R'     " Show if file is read-only: RO
    let &l:stl.=' %W'     " Show if buffer is a preview item?: PRV
    let &l:stl.=' %H'     " Show if buffer is a help file: HLP
    let &l:stl.='%3*'      " Change Color
    let &l:stl.=' %='     " Right side of statusline
    let &l:stl.=' '      " So there's a space between both sides
    let &l:stl.='  '      " So there's a space between both sides
    let &l:stl.='%2*'      " Change Color
    let &l:stl.='  '      " So there's a space between both sides
    let &l:stl.='%p%%  ' " Percentage through file in lines, as in <c-g>
    let &l:stl.='%l'   " Cursor's current line
    let &l:stl.=':'      " separator between line and column info
    let &l:stl.='%c  '    " Current column
    let &l:stl.='%1*'      " Change Color
    let &l:stl.='  %{&ft!=#""?&ft:"Null"}  '
endfunction
function! SetInactiveStatusLine()
    let &l:stl=''        " Clear statusline for when vimrc is loaded
    let &l:stl.='%2* %<'     " Truncate from here on
    let &l:stl.='%t  '     " Current buffer's file name
    let &l:stl.='%8*'      " separator between line and column info
    let &l:stl.=' %M'     " Show modified status of buffer
    let &l:stl.=' %R'     " Show if file is read-only: RO
    let &l:stl.=' %W'     " Show if buffer is a preview item?: PRV
    let &l:stl.=' %H'     " Show if buffer is a help file: HLP
    let &l:stl.='%8* %='     " Right side of statusline
    let &l:stl.=' '
    let &l:stl.='%p%%  ' " percentage through file in lines, as in <c-g>
    let &l:stl.='%2*  %l'   " Cursor's current line
    let &l:stl.=':'      " separator between line and column info
    let &l:stl.=' %c  '    " Current column
    let &l:stl.='8*  %{&ft!=#""?&ft:"Null"}  '
endfunction
function! StatusbarColors()

    hi User1 guifg=#d0d0d0 guibg=#444444
    hi User2 guifg=#000000  guibg=#F5F5F5
    hi User3 guifg=#d0d0d0 guibg=#557777
    hi User6 guifg=#d0d0d0  guibg=#344b4b
    hi User5 guifg=#000000  guibg=#46a2c2
    hi User4 guifg=#000000  guibg=#46abc2
    hi User8 guifg=#d0d0d0 guibg=#444444
    hi User9 guifg=#000000  guibg=#810085
    hi User0 guifg=#000000  guibg=#094afe

endfunction

call StatusbarColors()
augroup statusline
    autocmd!
    autocmd BufEnter,WinEnter * call SetActiveStatusLine()
    autocmd BufLeave,WinLeave * call SetInactiveStatusLine()
    autocmd InsertEnter * execute 'hi User1 guifg=#1c1c1c guibg=#90aed5 gui=bold'
    autocmd InsertLeave * execute 'hi User1 guifg=#d0d0d0 guibg=#444444 gui=NONE'
augroup END
