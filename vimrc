" Vundle manages plug-ins
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

Bundle 'gmarik/vundle'
"
"
" TEMPORARY
Bundle 'https://github.com/honza/dockerfile.vim.git'
"
"
Bundle 'https://github.com/chase/vim-ansible-yaml.git'
Bundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
Bundle 'https://github.com/jstemmer/gotags.git'
Bundle 'https://github.com/undx/vim-gocode.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'https://github.com/Raimondi/delimitMate.git'
Bundle 'ralph/go.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'rodjek/vim-puppet'
Bundle 'sukima/xmledit'
Bundle 'tomtom/tcomment_vim'
Bundle 'sjbach/lusty'
Bundle 'benmills/vimux'
Bundle 'jamessan/vim-gnupg'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'https://github.com/honza/vim-snippets'
Bundle 'vim-scripts/tlib'
Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
Bundle 'avakhov/vim-yaml'
Bundle 'FredKSchott/CoVim'
Bundle 'tpope/vim-surround'
Bundle 'elzr/vim-json'
Bundle 'lrampa/vim-apib'

set encoding=utf-8
set hlsearch
set t_Co=256
set expandtab
set background=dark
set history=100         " Restore 111 things from viminfo
set autoindent
set shiftround
set viminfo=\"4,'4,/100,:100,h,f0
set laststatus=2

autocmd FileType c,cpp,python,ruby,java,markdown set textwidth=80 autoindent wrap cc=80

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" Python
"Highlight as error when chars go past column 80
autocmd FileType python highlight OverLength ctermbg=red ctermfg=white
autocmd FileType python match OverLength /\%100v.*/
autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4

"  Ruby
autocmd FileType ruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby highlight OverLength ctermbg=red ctermfg=white

" Shell
autocmd FileType sh set expandtab tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType c set expandtab tabstop=8 shiftwidth=8 softtabstop=8

" Used by Lusty Explorer
set hidden

" Leader key is best when most accessible :)
let mapleader=';'
let g:EasyMotion_leader_key = '<Leader><Leader>'

map <Leader>m :VimuxPromptCommand<CR>
map <Leader>t :CommandT<CR>
map <Leader>a :RunAllRubyTests<CR>
map <Leader>c :VimuxCloseRunner<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFocus<CR>
map <Leader>i :set list!<CR>
map <Leader>u :IndentGuidesToggle<CR>
map <Leader>w <ESC><CR>
map <Leader>s hysiw"
map <Leader>b :TagbarToggle<CR>

if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("autocmd")
    filetype plugin indent on
  endif

" solarized options
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1

" Set my color scheme
colorscheme solarized

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.gem$', '\.out']

" Stops conflicts with the Ack.vim plugin's quickfix window
" let g:pyflakes_use_quickfix = 0

set wildignore=*.o,*~,*.pyc,.gems/*,*.out

" Remove trailing white space on save for all filet ypes
autocmd BufWritePre * :%s/\s\+$//e

"Vim ruby tests
let g:vimux_ruby_cmd_unit_test = "nocorrect bundle exec rspec"
let g:vimux_ruby_cmd_all_tests = "nocorrect bundle exec rspec"
let g:vimux_ruby_cmd_context = "nocorrect bundle exec rspec"

" YCM Options
 let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_extra_conf_globlist = ['~/projects/c_prog_lang/','!~/*']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" Snipmate
imap <C-k> <esc>a<Plug>snipMateNextOrTrigger
smap <C-k> <Plug>snipMateNextOrTrigger


" Display punctuation marks for cleaner code
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_library_path = '/usr/lib/'
let g:clang_user_options='|| exit 0'

" Go tags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
