######
CSCOPE
######

Install
=======

* download cscope for windows from http://code.google.com/p/cscope-win32/
* move binary files to the Vim folder for convenience
* copy http://cscope.sourceforge.net/cscope_maps.vim into $VIM\vimfiles\plugin for keyboard mapping

Usage
=====

* in cmd, using 
  
  .. code:: bat

     dir /b /s *.c,*.cpp,*.h,*.java,*.cs >> cscope.files 
  
  write all needed filename into ``"cscope.files"``.  

* in cmd, using
  
  .. code:: bash
  
     cscope -b -q -k 
     
  to generate cscope database. If there are new files in the project, duplicate above 2 steps.

* using 
  
  .. code:: vim
  
     cs add cscope.out 
     
  to cscope database in this runtime enviroment

Remarks
=======

* you can use 
  
  .. code:: bash
  
     cscope -R
  
  in the project's top-level directory to build your Cscope database. But if there's some code that you wish to exclude, and/or your project contains C++ or Java source code (by default Cscope only parses files with the .c, .h, .y, or .l extensions), you'll need to generate a file called cscope.files, which should contain the name of all files that you wish to have Cscope scan (one file name per line). 

* in Linux, you can use ``"find"`` command instead ``"find /my/project/dir -type f -name '*.java' -o -type f -name '*.cpp' >/my/cscope/dir/cscope.files"``

* cscope cannot handle symbolic links, so don't include synbolic link in cscope.files, that is ``-type f`` function

Vim mapping
===========

* 's': 即 Symbol
  
  以此文字串當識別字，列出專案當中所有參考到此識別字的地方，包含定義和引用

* 'g': 即 Global
  
  以此文字串當作 global 變數或函數的名稱，跳到專案中定義此 global 變數或函數的地方 (這個功能有另一個與 ctags 相同的快速鍵 Ctrl-])

* 'c': 即 Calls
  
  以此文字串當函數名稱，找出所有呼叫到的此函數的函數

* 't': 即 Text
  
  列出專案中所有出現此文字串的地方 (包含註解)

* 'e': 即 Egrep
  
  以此文字串當 regular expression，用 egrep 方式來搜尋

* 'f': 即 File
  
  以此文字串當檔案名稱，開啟此檔案

* 'i': 即 Includes
  
  以此文字串當 header 檔名稱，列出所有 include 此檔案的檔案

* 'd': 即 calleD
  
  以此文字串當函數名稱，列出此函數所呼叫到的函數

CSCOPE parameter
================

* -R
  
  在生成索引文件時，搜索子目錄樹中的代碼，因為我們已經在cscope.files中把所有的文件都打印入了列表中，所以

* -b
  
  只生成索引文件，不進入cscope的界面

* -q
  
  生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度

* -k
  
  在生成索引文件時，不搜索/usr/include目錄

* -i
  
  如果保存文件列表的文件名不是cscope.files時，需要加此選項告訴cscope到哪兒去找源文件列表。可以使用「-」，表示由標準輸入獲得文件列表。

* -I dir
  
  在-I選項指出的目錄中查找頭文件

* -u
  
  掃瞄所有文件，重新生成交叉索引文件

* -C
  
  在搜索時忽略大小寫

* -P path
  
  在以相對路徑表示的文件前加上的path，這樣，你不用切換到你數據庫文件所在的目錄也可以使用它了。

EXample Vim Function
====================

.. code:: vim

    function Do_CsTag()
        if(executable('cscope') && has("cscope") )
            if(g:iswindows!=1)
                silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
            else
                silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
            endif
            silent! execute "!cscope -b"
            if filereadable("cscope.out")
                execute "cs add cscope.out"
            endif
        endif
    endf

Reference
=========

* http://cscope.sourceforge.net/large_projects.html
* http://cscope.sourceforge.net/cscope_vim_tutorial.html
* http://www.vimer.cn/2009/10/%E5%9C%A8vimgvim%E4%B8%AD%E4%BD%BF%E7%94%A8cscope.html
* http://softsmith.blogspot.tw/2009/01/vim-cscope-trace.html
* http://cscope.sourceforge.net/cscope_man_page.html

