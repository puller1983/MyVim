"set global variable to identify OS
"if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
"else
"    let g:iswindows=0
"endif


" make one click complile
map <C-F5> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
    "check work dir, SourceFileName & filetype
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
        return
    endif
    let SourceFileName=expand("%:t")
    if (SourceFileName=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(SourceFileName,' ','','g')
    if strlen(deletedspacefilename)!=strlen(SourceFileName)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif

    "set makeprg
    if &filetype=="c"
        if g:iswindows==1
            set makeprg=gcc\ -o\ %<.exe\ %
        else
            set makeprg=gcc\ -o\ %<\ %
        endif
    elseif &filetype=="cpp"
        if g:iswindows==1
            set makeprg=g++\ -o\ %<.exe\ %
        else
            set makeprg=g++\ -o\ %<\ %
        endif
        "elseif &filetype=="cs"
        "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
    endif
    
    "set output file name
    if(g:iswindows==1)
        let outfilename=substitute(SourceFileName,'\(\.[^.]*\)' ,'.exe','g')
    else
        let outfilename=substitute(SourceFileName,'\(\.[^.]*\)' ,'','g')
    endif

    "check whether output file can be maked
    if filereadable(outfilename)
        if(g:iswindows==1)
            let outdeletedsuccess=delete(getcwd()."\\".outfilename)
        else
            let outdeletedsuccess=delete("./".outfilename)
        endif
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif

    "do make & reset makeprg
    execute "silent make"
    set makeprg=make
    
    "open quickfix windows
    execute "normal :"
    execute "copen" 

endfunction

"execute exe 
map <C-F6> :call Do_exe()<CR>
function Do_exe()

    let SourceFileName=expand("%:t")
    if(g:iswindows==1)
        let outfilename=substitute(SourceFileName,'\(\.[^.]*\)' ,'.exe','g')
    else
        let outfilename=substitute(SourceFileName,'\(\.[^.]*\)' ,'','g')
    endif
    if filereadable(outfilename)
         if(g:iswindows==1)
             execute "!".outfilename
         else
             execute "!./".outfilename
         endif
      else 
	 echohl WarningMsg | echo "Fail to find the exe file." | echohl None
         return
    endif
endfunction

