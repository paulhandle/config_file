" =====================
" 环境配置
" =====================
" 中文帮助
set helplang=cn

" 保留历史记录
set history=500

" 行控制
set linebreak " 英文单词在换行时不被截断
set nocompatible " 设置不兼容VI
"set textwidth=80 " 设置每行80个字符自动换行，加上换行符
set wrap " 设置自动折行

" 标签页
set tabpagemax=15 " 最多15个标签
set showtabline=2 " 总是显示标签栏

" 关闭遇到错误时的声音提示
set noerrorbells
set novisualbell
set t_vb= " close visual bell

" 行号和标尺
set ruler " 显示标尺
set number " 行号
set rulerformat=%15(%c%V\ %p%%%)

" 命令行于状态行
set cmdheight=1 " 设置命令行的高度
set laststatus=2 " 始终显示状态行

" 搜索
set hlsearch  " 高亮显示搜索的内容
set noincsearch " 关闭显示查找匹配过程
"set magic     " Set magic on, for regular expressions
"set showmatch " Show matching bracets when text indicator is over them
"set mat=2     " How many tenths of a second to blink

" 制表符(设置所有的tab和缩进为4个空格)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " 使用空格来替换tab
set smarttab

" 状态栏显示目前所执行的指令
set showcmd

" 缩进
set autoindent " 设置自动缩进
set smartindent " 设置智能缩进

" 自动重新读入
"set autoread " 当文件在外部被修改，自动更新该文件

" 设定在任何模式下鼠标都可用
set mouse=a

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 备份和缓存
set nobackup
set nowb
"set noswapfile

" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu " 只在下拉菜单中显示匹配项目，并且会自动插入所有匹配项目的相同文本

" 代码折叠
"set foldmethod=indent

" 带有如下符号的单词不要被换行分割
"set iskeyword+=_,$,@,%,#,-

" 显示tab和空格
"set list
" 设置tab和空格样式
"set listchars=tab:\|\ ,nbsp:%,trail:-

" 设定行首tab为灰色
"highlight LeaderTab guifg=#666666
" 匹配行首tab
"match LeaderTab /\t/

set wildmenu "打开 wildmenu 选项，启动具有菜单项提示的命令行自动完成。
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]

"光标可以定位在没有实际字符的地方
set ve=block

" 启动后自动全屏
"set fullscreen

" 搜索时无视大小写
set ignorecase

if has("gui_running")
    " Turn undofile on
    set undofile
    " Set undofile path
    set undodir=~/tmp/vim/undofile/
endif

" Set hidden to undo buffer
set hidden

"cliboard seting
set clipboard+=unnamed " set clipboard

syntax on
"语法高亮

colorscheme torte
"设置颜色主题

"set transparency=15
"设置透明度

" =====================
"    默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    "language messages zh_CN.utf-8

    if has('win32')
        language english
        let &termencoding=&encoding " 处理consle输出乱码
    endif

    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" =====================
"    设置使用CMD快捷键
" =====================
if has("gui_macvim")
  "取消默认的快捷键
  let macvim_skip_cmd_opt_movement = 1
  let macvim_hig_shift_movement = 1
 
  "设置背景透明度
  set transparency=2
  "隐藏工具条
  set guioptions-=T "egmrt
 
  "绑定自己需要的cmd快捷键
  macm File.Save                              key=<D-s>
  macm File.Save\ As\.\.\.                    key=<D-S>
  macm Edit.Undo                              key=<D-z> action=undo:
  macm Edit.Redo                              key=<D-Z> action=redo:
  macm Edit.Cut                               key=<D-x> action=cut:
  macm Edit.Copy                              key=<D-c> action=copy:
  macm Edit.Paste                             key=<D-v> action=paste:
  macm Edit.Select\ All                       key=<D-A> action=selectAll:
endif

" 关闭VIM的时候保存会话，按F12读取会话
"set sessionoptions=buffers,sesdir,help,tabpages,winsize
"au VimLeave * mks! ~/Session.vim
"nmap <F7> :so ~/Session.vim<CR>

"save and close all files and save global session
nnoremap <leader>q :mksession! ~/Session.vim<CR>:wqa<CR>
  "close all files without saving and save global session
nnoremap <leader>www :mksession! ~/Session.vim<CR>:qa!<CR>

function! RestoreSession()
  if argc() == 0 "vim called without arguments
    execute 'source ~/Session.vim'
  end
endfunction
autocmd VimEnter * call RestoreSession()
