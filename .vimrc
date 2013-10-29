execute pathogen#infect()
"避免以前版本的一些Bug和局限。要放在第一行
set nocompatible
"显示行号
set nu
"自动对齐，把当前行的对齐格式应用到下一行
set ai!
"智能选择对齐方式
set smartindent
"自动缩进2空格
set cindent shiftwidth=2
"使用鼠标
set mouse=a
"右下角显示光标位置的状态行
set ruler
"记录历史的行数
set history=700
"设置tab键为2个空格
set tabstop=2
"当行之间交错时，使用4个空格
set shiftwidth=2
"语法高亮
syntax on
"设置无备份文件
set nobackup
"检测文件的类型

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-markdown'
Bundle 'gmarik/vundle'
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'Townk/vim-autoclose'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos

filetype indent plugin on
"自动折叠
"set foldmethod=indent
"设置匹配模式，当输入一个左括号时匹配相应的右括号
set showmatch
"方便查询，会自动找到第一个符合的单词
set incsearch
"修改一个文件后，自动进行备份，备份文件名为原文件名加‘~’后缀
"if has("vms")
"  set nobackup
"else
"  set backup
"endif

"Set mapleader
let mapleader=","

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited , reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"Project setting
nmap <silent> <leader>P <Plug>ToggleProject
let g:proj_window_width=20 "窗口宽度
let g:proj_window_increment=90
let g:proj_flags='i' "当选择打开一个文件时会在命令行显示文件名和当前工作路径
let g:proj_flags='m' "开启|ctrl-W_o| 和 |ctrl-W_ctrl_O| 映射，使得当前缓冲区成为唯一可见的缓冲区
let g:proj_flags='s' "开启语法高亮
let g:proj_flags='t' "用按<space>进行窗口加宽
let g:proj_flags='c' "在项目窗口中打开文件后会自动关闭项目窗口
"let g:proj_flags='F'
let g:proj_flags='L' "自动根据CD设置切换目录
let g:proj_flags='S' "启用排序
let g:proj_flags='T' "子项目的折叠在更新时会紧跟在当前折叠正文显示(而不是其底部)
let g:proj_flags='v' "按 \G 搜索时，用 :vimgrep 取代 ：grep

"Tag list(ctags)
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1 "只显示当前文件的tag
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1 "在右侧窗口中显示taglist窗口
map <silent> <F9> :TlistToggle<cr>
map <silent> <F5>  gg=G<cr>

" netrw setting 
let g:netrw_winsize=30
nmap <silent> <leader>fe :Sexplore!<cr>
nmap <silent> <leader>nt :NERDTreeToggle<cr>

"winManager setting
let g:winManagerWindowLayout="BufExplorer,FileExplorer|TagList"
let g:winManagerWidth=30
let g:defaultExplorer=0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>

"lookupfile setting
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0
if filereadable("./filenametags")
	let g:LookupFile_TagExpr='"./filenametags"'
endif

"映射LookupFile为 ,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为 ,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>

nmap <M-t> :tabnew<cr>

"About cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" matchit.vim
runtime macros/matchit.vim
