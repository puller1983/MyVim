#####
ctags
#####

Introduction
============

Ctags generates an index (or tag) file of language objects found in source files that allows these items to be quickly and easily located by a text editor or other utility. [#f_org]_

Capability
==========

It is capable of generating tags for all types of C/C++ language tags, including all of the following: [#f_org]_

* class names
* macro definitions
* enumeration names
* enumerators
* function definitions
* function prototypes/declarations
* class, interface, struct, and union data members
* structure names
* typedefs
* union names
* variables (definitions and external declarations) 

Pre-requirment
==============

* Generating tags file
  
  The tags file is always called "tags". Generating tags file in working directory [#f_org]_ [#f_vimer]_:

  .. code:: bash

     ctags -R --c++-kinds=+px --fields=+iaS --extra=+q --links=no .
  
  + -R

    Equivalent to −−recurse, recurse into directories encountered in the list of supplied files. If the list of supplied files is empty and no file list is specified with the −L option, then the current directory (i.e. ".") is assumed.

  + --c++-kinds=+px

    ctags記錄c++文件中的函數聲明和各種外部和前向聲明

  + --fields=+ias

    ctags要求描述的信息，其中i表示如果有繼承，則標識出父類；a表示如果元素是類成員的話，要標明其調用權限（即是public還是private）；S表示如果是函數，則標識函數的signature

  + --extra=+q

    強制要求ctags做如下操作—如果某個語法元素是類的一個成員，ctags默認會給其記錄一行，可以要求ctags對同一個語法元素再記一行，這樣可以保證在VIM中多個同名函數可以通過路徑不同來區分

* Link generated tags file [#f_vim]_

  Vim would automatically import tags file in the working directory.To show the recent working directory, using:

  .. code:: vim

     :pwd

  To change the working directory, using:

  .. code:: vim

     :cd <directory>

  If there is many tags in different directories, one can set like:

  .. code:: vim

    :set tags=./tags,./../tags,./*/tags

  Above one can find the tags in working directory, parent directory and all child directory.
  This is quite a number of tags files, but it may still not be enough.  For example, when editing a file in "~/proj/src", you will not find the tags file "~/proj/sub/tags".  For this situation Vim offers to search a whole directory tree for tags files.  Example:

  .. code:: vim

	:set tags=~/proj/**/tags

  .. Note::
      
      it's better to spend time to generate one big tags file.

Usage
=====

* Using ``CTRL-]`` and ``CTRL-T``

  The ``CTRL-]`` command jumps to the tag of the word that is under the cursor.The ``CTRL-T`` command goes to the preceding tag.

* Using ``:tag tagname``
  
  Sometime the word is not under the cursor or there is some mark of the word.One can explicitly use ``tag`` command to jump to the tag.

* Using ``:stag tagname`` and ``CTRL-W ]``
  
  Split the current window and jump to the tag.

Reference
=========

.. [#f_org] http://ctags.sourceforge.net/
.. [#f_vimer] http://www.vimer.cn/2009/10/%E5%9C%A8vim%E4%B8%AD%E4%BD%BF%E7%94%A8ctags.html
.. [#f_vim] http://vimcdoc.sourceforge.net/doc/usr_29.html#usr_29.txt

.. todo::

    * TODO figure out why I cannot use <C-]> in my archlinux gvim(ok in vim).
