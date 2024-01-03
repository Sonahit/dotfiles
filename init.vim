if has('nvim')


call plug#begin('/home/sonahit/.config/nvim/plugged')

"""Git
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"""Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"""Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"""NerdTree
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'

"""FileTypes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'

"""ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

"""Elixir
Plug 'elixir-editors/vim-elixir'

"""JS

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

"""Formatters
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'editorconfig/editorconfig-vim'



"""Debug
"Plug 'puremourning/vimspector'

""UI
Plug 'sainnhe/sonokai'
Plug 'dag/vim-fish'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'luochen1990/rainbow'
Plug 'dstein64/nvim-scrollview'
Plug 'Xuyuanp/scrollbar.nvim'
Plug 'preservim/nerdcommenter'
"Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'TysonAndre/php-vim-syntax'

call plug#end()

endif

"Add the following syntax highlighting related configuration to your ~/.config/nvim/init.vim file:
" The ^[ here is one character that you can type with control-v ESC.

if has('nvim')
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
  let g:sonokai_style = 'shusia'
  let g:sonokai_enable_italic = 1
  let g:sonokai_disable_italic_comment = 1
  let g:airline_theme = 'sonokai'
  let g:lightline = {'colorscheme' : 'sonokai'}

  colorscheme sonokai
endif

syntax on
" Recommended, but optionally add:

" Set tag file if REPOBASE is set. This assumes you set the environment
" variable REPOBASE to reflect the base directory of your current project
" and generated your ctags file as $REPOBASE-objdir/tags.
if $REPOBASE != ""
  set tags=$REPOBASE-objdir/tags
endif


"COCINIT====================
" Bind <F10> to a function that shows the syntax highlighting group under thecursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
\       '> trans<' . synIDattr(synID(line("."),col("."),0),"name") .
\       "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Highlight trailing spaces.
let c_space_errors=1
" Don't highlight the Next match while typing a regular expression search.
set noincsearch



" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
"
"
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')



" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"set statusline^=%{coc#status()}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"COCEXIT========================

filetype plugin indent on


"USER========================

"" Indentation
set shiftwidth=2  " Number of spaces to use for each step of (auto)indent.
set shiftround    " Round indent to multiple of 'shiftwidth'.
set softtabstop=2 " Number of spaces that a <Tab> counts for while performing editing operations.
set expandtab     " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set tabstop=4     " Number of spaces that a <Tab> in the file counts for.
set autoindent    " Copy indent from the current line when starting a new line.
set smarttab      " When on, a <Tab> in front of a line inserts blanks according to shiftwidth.
set smartindent   " Do smart autoindenting when starting a new line.

"" AutoFix

autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.ex,*.eex,*exs,*.rs :Format

"startify=====start

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_bookmarks = ['~/git/', '~/git/mds', '~/git/biotech']

nnoremap <leader>st :tabnew<cr>:Startify<cr>


"startify=====end

"""languages

let g:javascript_plugin_jsdoc = 1

"""


"""
let g:rainbow_active = 1

"""options
set relativenumber
set mouse=a

"set listchars=tab:-->,space:.
"set list

set nofoldenable
set foldmethod=marker
set foldmarker=do{,}end
""" Line Wrapping
"set nowrap
set linebreak

"""
"""fzf

" ProjectFiles tries to locate files relative to the git root contained in
" NerdTree, falling back to the current NerdTree dir if not available
" see https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
function! s:find_project_root()
  let nerd_root = g:NERDTree.ForCurrentTab().getRoot().path.str()
  "let git_root = system('git -C '.shellescape(nerd_root).' rev-parse --show-toplevel 2> /dev/null')[:-2]
  "if strlen(git_root)
    "return git_root
  "endif
  return nerd_root
endfunction

command! ProjectFiles execute 'Files' s:find_project_root()


"""
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"let g:vimspector_base_dir=expand('$HOME/.config/nvim/vim-spector')


let g:NERDTreeChDirMode = 2
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:typescript_conceal_function = "fn"
let g:javascript_conceal_function = "fn"

"""autocmd

augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

"remove all trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufReadPost *
     \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
     \ |   exe "normal! g`\""
     \ | endif

"""
"""coc

autocmd FileType javascript,typescript,javascriptreact,typescriptreact let b:coc_root_patterns = ['.git', '.env', 'tsconfig.json']

"""

let mapleader = "\\"
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" leader is \
set autochdir
set autoread
set clipboard=unnamedplus


""keybindings===================================
map <S-Del> d1d

"window
nnoremap <leader>wd <C-W>10<
nnoremap <leader>wa <C-W>10>
nnoremap <C-W>d :q<cr>

"files
nnoremap <C-F> :Format<cr>
cnoremap nvim :tabnew $MYVIMRC<cr>

"terminal
nnoremap <leader>term :split<cr>:terminal<cr><C-W>J:resize 4<cr>
tnoremap <leader>c <C-\><C-N><C-W><C-P>

"tabs
nnoremap <leader>tw :tabnew<cr>
nnoremap <leader>tb :tabprev<cr>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnext<cr>

"""Doesnt work on kitty :/
"nnoremap <C-S-Right> :tabnext<cr>
"nnoremap <C-S-Left> :tabprev<cr>
"inoremap <C-S-Right> <esc>:tabnext<cr>i
"inoremap <C-S-Left> <esc>:tabprev<cr>i

nnoremap <expr> t ':tabnext ' . v:count . '<cr>'

"tree
nnoremap <leader><Tab> :NERDTreeToggle<cr>

"history
nnoremap <leader>b :ls<cr>:b<space>
nnoremap <leader>i <C-I><Tab>
nnoremap <leader>o <C-O>
nnoremap <leader>ju :jumps<cr>
nnoremap <leader>cju :clearjumps<cr>

"line-actions
map <A-Down> :move .+1<cr>
map <A-Up> :move .-2<cr>
imap <A-Down> <Esc><A-Down>i
vmap <A-Down> <Esc><A-Down>v

nnoremap <silent> <C-_> :call NERDComment("0", "toggle")<cr>
vnoremap <silent> <C-_> V:call NERDComment("x", "toggle")<cr>v
inoremap <silent> <C-_> <esc>V:call NERDComment("0", "toggle")<cr>i


nnoremap <S-Left> vB
nnoremap <S-Right> vE
vnoremap <S-Left> B
vnoremap <S-Right> E
"vnoremap <C-C> y !xclip -i -sel c<cr><cr>
vnoremap <C-C> y

vmap <A-Up> <Esc><A-Up>v
imap <A-Up> <Esc><A-Up>i

vnoremap / y/<C-R>=escape(@",'/\')<cr>
nnoremap <F3> :noh<cr>

nnoremap <C-Space> za


"other
nnoremap <silent> <C-Z> u
inoremap <silent> <C-Z> <esc>ui
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>es <C-W>K:e $MYVIMRC<cr>
nnoremap <silent> <C-S> :w<cr>
vnoremap <silent> <C-S> <esc><C-S>v
inoremap <silent> <C-S> <esc><C-S>i

nnoremap <silent> <C-{> <c-w><c-p>

"fzf#install
nnoremap <silent><C-P> :ProjectFiles<cr>



"coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <C-LeftMouse> <Plug>(coc-implementation)
nnoremap <silent> <C-o> :call CocAction('doHover')<cr>
inoremap <silent> <C-o> <esc>:call CocAction('doHover')<cr>

nnoremap <silent> cd :CocDiagnostics<cr>
nnoremap <silent> cf :CocFix<cr>

nmap <S-O> :call CocAction('runCommand', 'tsserver.organizexe vimscripteImports')<cr>
