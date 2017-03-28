if &compatible
	set nocompatible
endif

let s:dein_dir = expand('/home/bdula/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" check if dein repo exists
if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim'
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#add(s:dein_repo_dir)
	call dein#add('Shougo/denite.nvim')
        call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
        call dein#add('Shougo/unite.vim')
        call dein#add('Shougo/vimfiler.vim')

	" Beautify NVIM
	call dein#add('flazz/vim-colorschemes')
	call dein#add('penicolas/vim-thematic')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
        call dein#add('vim-scripts/Calm-Breeze')
        call dein#add('rakr/vim-one')
        call dein#add('sonph/onehalf', {'rtp' : 'vim/'})

        " Life Helping Plugins
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('farmergreg/vim-lastplace')
  	call dein#add('Two-Finger/hardmode')
        call dein#add('mhinz/vim-startify')
        call dein#add('tpope/vim-commentary')

        " coding helper plugins
        call dein#add('slohj/vim-fugitive')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

set number

set expandtab
set shiftwidth=8
set tabstop=8
set mouse=a

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" Visual settings
let g:thematic#defaults = {
                        \ 'laststatus' : 2,
                        \ 'ruler' : 1,
                        \ }

let g:thematic#themes = {
                        \ 'coding' : {
                        \ 'colorscheme' : 'kalisi',
                        \ 'airline-theme' : 'one',
                        \ 'background'  : 'dark',
                        \ },
                        \ 'cool' : {
                        \ 'colorscheme' : 'onehalflight',
                        \ 'airline-theme' : 'silver',
                        \ }
                        \ }

let g:thematic#theme_name ='coding'

map <F9> :ThematicNext <CR>

" Airline settings
let g:airline#extensions#tabline#enabled = 1

" Hard Mode Settings
let g:hardmode = 1

" Vimfiler settings
let g:vimfiler_as_default_explorer = 1 
call vimfiler#custom#profile('default', 'context' , {'direction' : 'rightbelow'})
nnoremap <F6> :VimFilerExplorer <CR>
