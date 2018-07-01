"" Rainbow
let g:rainbow_active = 1


"" Minimap
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mm'


"" Ale
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_max_suggestions = 8
let g:completor_python_binary = '/usr/bin/python3'
let g:jedi#completions_enabled = 0

let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['isort','yapf','remove_trailing_lines','trim_whitespace']}
let g:ale_completion_delay = 20
"let g:SuperTabDefaultCompletionType = "<c-n>"


autocmd VimEnter * wincmd p


"" NERDTree
"autocmd VimEnter * NERDTree
let g:NERDTreeShowBookmarks=0
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 33


"" syntastic
let g:syntastic_python_checkers=['python3', 'flake8']


"" vim-airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


if !exists('g:not_finish_vimplug')
    colorscheme iceberg
endif
