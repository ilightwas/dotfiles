
"Line numbers
set number

"Insert lines without entering insert mode
map <Leader>o o<ESC> 
map <Leader>O O<ESC> 

"Jump between buffers 
"map <C-j> :bnext<CR>
"map <C-k> :bprev<CR>

"Jump between tabs 
map <C-j> :tabnext<CR>
map <C-k> :tabprev<CR>

"Copy paste system clipboard
vnoremap <C-c> "+y
map <C-p> "+P

"vnoremap <C-c> "*y :let @+=@*<CR>

