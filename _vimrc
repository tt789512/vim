set nocompatible
behave mswin

set nu
syntax on
set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me hen a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Hilight searching
set infercase               " Completion recognizes capitalization
set expandtab               " No tabs
"set encoding=utf8
set nowrap " (no)wrap - ������������ (��)������� ������� �����
set linebreak " ���������� ����� �����
set showcmd " ���������� ������������� ������� � ���������� (�������������� �����)
set browsedir=current
set visualbell " ������ ����� ������� ������ �������� ��� ������� �����
set title " ���������� ��� ������ � ��������� ���������

"set guioptions-=T

"��������� �������
set shiftwidth=4 " ������ �������� (������� �� << ��� >>)
set tabstop=4 " ������ ���������
set softtabstop=4 " ������ '�������' ����
set autoindent " ai - �������� ����������� (���������� ������ ���������� ������)
"set cindent " ci - ������� � ����� �
set expandtab " ������������� ��������� � �������
set smartindent " ����� ������� (��������, ���������� ����� {)
" ��� ��������� ����� ������ ��������� ������ ����� ��������� � ������ ������ �������
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8



function! ChangeBuf(cmd)
    if (&modified && &modifiable)
        execute ":w"
    endif
    execute a:cmd
endfunction
nnoremap <silent> <C-o> :call ChangeBuf(":b#")<CR>
nnoremap <silent> <C-PageUp> :call ChangeBuf(":bn")<CR>
nnoremap <silent> <C-PageDown> :call ChangeBuf(":bp")<CR>
nnoremap <F10> :buffers<CR>:buffer<Space>
"map <C-PageUp> :bp<CR>
"map <C-PageDown> :bn<CR>
"nnoremap <F12> :let @+=expand("%:p")<CR>
"nnoremap <C-S-c> :let @+=expand("%:p")<CR>



" Super fast window movement shortcuts
"nmap <C-j> <C-W>j
"nmap <C-k> <C-W>k
"nmap <C-h> <C-W>h
"nmap <C-l> <C-W>l



"---- �������� ������� ���� ----
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
"setlocal spell spelllang=ru_yo,en_us
set guifont=Courier_New:h12:cRUSSIAN:qDRAFT

"--- ������ � �����������
"<F8> - ����� ���� ������ ��������� 
" ������������ � ���� � ������� Tab 
" ���� ������ ��������� 
set wildmenu 
set wcm=<Tab> 
menu Encoding.koi8-u :e ++enc=8bit-koi8-u<CR> 
menu Encoding.windows-1251 :e ++enc=8bit-cp1251<CR> 
menu Encoding.ibm-866 :e ++enc=8bit-ibm866<CR> 
menu Encoding.utf-8 :e ++enc=2byte-utf-8 <CR> 
map <F8> :emenu Encoding.<TAB>

menu QuiqSyntax.sql :set syntax=sql<CR>
menu QuiqSyntax.plsql :set syntax=plsql<CR>
menu QuiqSyntax.python :set syntax=python<CR>
menu QuiqSyntax.shell :set syntax=sh<CR>
map <F9> :emenu QuiqSyntax.<TAB>

"---��������� ������ ������ � �������� ������
set ignorecase " ics - ����� ��� ����� �������� ��������
set smartcase " - ���� ������� ��������� �������� ������� � ������� �������� - ���� � ������ ��������, ����� - ��� �����
" ��������� ���������: �������� �� ������� ������� Ctrl-F8
nnoremap <C-F3> :hlsearch!<CR
set incsearch " ����� ��������� �� ���� ��� ������
"������������ ��� �����, ������� ��������� �� ������ ��� ��������.
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
" �� ��������� �� ������� �� ��������� ���������, � ������ ����������
nnoremap * *N
" � ���������� ������ �� ������� * ������������ ���������
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR
" copy to clipbaard in visual mode
vnoremap <C-c> "*y

" ����� ����������� ������ (�������� ������ �������� ��� ��� ���������)
vnoremap <silent>* <ESC>:call VisualSearch('/')<CR>/<CR>
vnoremap <silent># <ESC>:call VisualSearch('?')<CR>?<CR>

    function! VisualSearch(dirrection)
        let l:register=@@
        normal! gvy
        let l:search=escape(@@, '$.*/\[]')
        if a:dirrection=='/'
            execute 'normal! /'.l:search
        else
            execute 'normal! ?'.l:search
        endif
        let @/=l:search
        normal! gV
        let @@=l:register
    endfunction


function! CopyFilename()
if has('win32')
  nmap ,cn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,cp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>" This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cn :let @*=expand("%")<CR>
  nmap ,cp :let @*=expand("%:p")<CR>
endif
endfunction


nmap  <silent> <F5> :call PsqlPW()<CR>
nmap  <silent> <C-F8> :call PsqlLine()<CR>
nmap  <silent> <C-CR> :call PsqlLineSilent()<CR>
setlocal foldmethod=marker

let g:ftplugin_sql_omni_key       = '<C-C>'
let g:ftplugin_sql_omni_key_right = '<Right>'
let g:ftplugin_sql_omni_key_left  = '<Left>'


