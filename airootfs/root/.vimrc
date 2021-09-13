set fileencodings=utf8,cp932

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,mac,dos

" show line number
set number

" show cursor at current
set cursorline

" highlight search
set hlsearch

" increment search
set incsearch

" smart indent
set smartindent

set autoindent " Auto indent

" share with os clipboard
set clipboard+=unnamed

" completion in commandline mode
set wildmenu

" <Leader>というプレフィックスキーにスペースを使用する
let g:mapleader = "\<Space>"

" スペース + wでファイル保存
nnoremap <Leader>w :w<CR>

" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" jをgjにmap
nnoremap j gj

" kをgkにmap
nnoremap k gk

" Hで行頭
noremap H ^

" Lで行末
noremap L g_

set helpheight=999 " ヘルプを画面いっぱいに開く

set list           " 不可視文字を表示

" 不可視文字の表示記号指定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

set autoread "外部でファイルに変更がされた場合は読みなおす

set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る

set expandtab     " タブ入力を複数の空白入力に置き換える

set ignorecase "大文字と小文字を区別しない

set smartcase "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

set t_Co=256 " using 256 colors

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" jk to escape
imap jk <Esc>

" Ctrl-a: Go to begin of line
inoremap <C-a> <Home>

" Ctrl-e: Go to end of line
inoremap <C-e> <End>

" Ctrl-[bf]: Move cursor left/right
inoremap <C-b> <Left>
inoremap <C-f> <Right>
