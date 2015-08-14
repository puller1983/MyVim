########
My Habit
########

General
=======

* Using ``<C-[>`` instead of ``<ESC>``

Moving
======

* ``gg``, ``G``

  Move to specified line

* ``^``, ``$``, ``0``

  Move to head/end of the line

* ``w``, ``W``, ``e``, ``E``

  Move to the head/end of the next word

* ``b``, ``B``, ``ge``, ``gE``

  Move to the head/end of the backwarding word

* ``f``, ``F``, ``t``, ``T``, ``;``, ``,``

  Search forward/backward in the line for the single character.
  ``;`` and ``,`` repeat four commands in the same/reverse direction.
  The cursor is never moved to another line.

* ``%``

  Move to the matched parenthesis.It's more powerful with the plugin *matchit*.
  Also it can be used with a count to move to a line in the file. For example, ``50%`` moves you to the halfway the file.

* ``<C-U>``, ``<C-D>``

  Move the viewing window up/down half a screen.

* ``zz``, ``zt``, ``zb``

  "puts the cursor line at the middle, top and bottom respectively.

* ``<C-o>``, ``<C-i>`` 

  Generally, every time you do a command that can move the cursor further than within the same line, this is called a jump.
  The ``<C-o>`` command jumps to older positions (Hint: O for older).  ``<C-i>`` then jumps back to newer positions. Also you can use jump jistory, ``:jumps``, with ``<C-o>`` and ``<C-i>``. Note that the plugin *riv* does map <C-i>, I prefer to ignore this map.

* ``m``, ````` 

  Use ``m`` command to name a mark, and users can place 26 marks (a through z). To go to a mark, use ````` command. 
  ``''`` takes you to the position where the cursor was when you left the file.
  ``.`` is the position where you made the last change.
  There are also marks with an uppercase letter, which are global.
  Use ``:marks`` to get a list of marks.

* easymotion

* ``<S-tab>``, ``<C-g>g``
  
  Jump over one/contiguous delimiters and/or quotes. Power by plugin *delimitMate*.

* ``g;``, ``g,``, ``:changes``

  Use ``:changes`` to print the change list.
  Use ``g;`` and ``g,`` to jump to older/newer position in change list.

Searching
=========

* ``/``, ``?``

  Use ``\c`` to ignore case for one specific search. 
  For further tips and pattern, refer to manual ch.27 and ``:h pattern``.

* ``*``, ``#``

  Search forward/backward for the [count]'th occurrence of the word nearest to the cursor, like the command ``/\<keyword\>``.

* ``n``, ``N``
  
  Repeat the latest ``/`` or ``?`` [count] times.

Editing
=======

* ``c``, ``d``
  
  Usage: ``["x]c{motion}``, ``["x]d{motion}``
  Change/Delete text that ``{motion}`` moves over [into register x].
  Use ``ciw`` and ``diw`` to change/delete the word under the cursor.
  Use ``C`` and ``D`` to change/delete to the end of the line.
  Use ``cc`` and ``dd`` to change/delete the whole line.

* ``x``, ``s``, ``r``

  ``x``: delete a character with [count].
  ``s``: delete a character and change to insert mode, same as ``xi``.
  ``r``: change a character with [count] and keep in normal mode.

* ``.``

  repeat the last change.

* ``J``

  Join [count] lines, with a minimum of two lines. Remove the indent and insert up to two spaces.

* Visual Mode and Operator

  Use visual mode to select content: ``v``, ``V``, ``<C-q>``. Use ``gv`` to selece last selection. Use ``o`` and ``O`` to move when selecting.
  Use operator to modify content:

  + ``c``, ``d``, ``y``, ``r``

  + ``g~``, ``gu``, ``gU``

    swap case, make lowercase and make uppercase.

  + ``=``, ``>``, ``<``

    indent, shift right and shift left
  
  + ``I``, ``A`` when ``<C-q>``

* Yank, Paste

  + ``y`` to yank, ``p`` to paste and ``"`` to call register.

  + ``yy`` to yank whole line

  + ``*`` and ``+`` is the register for clipboard for Windows and Linux respectively.
    
  + ``"`` is the default register.
    
  + ``0`` is the default register for yank.
    
    So users can use ``yy`` to yank a line, move to another line, ``d`` to delete original content and ``"0p`` to paste the copying content.

  + Use ``<C-r> + register`` to yank the content when in insert mode.

  + Use ``:reg`` to list all registers.


Window
======

* ``<C-W> p``

  Go to previous window.

* ``<C-W> h/j/k/l``

  Move cursor to left/down/up/right window.

* ``<C-W> s/v``

  Split current window horizontally/vertically.

* ``<C-W> |/_``

  Set window width/height to N columns/rows.

* ``<C-W> </>/+/-``

  Increase/Decrease current window width/height N lines.

* ``<C-W> H/J/K/L``

  Move current window to the far left/bottom/top/right.

* ``<C-W> c``

  Close current window.


Buffer
======
 
* ``:b [N]/{bufname}/#``
  
  Edit buffer from the buffer list.
  Can load buffer by buffer number or buffer name.
  If use buffer name, can use buffer name completion, ``<TAB>``.
  # is previous buffer. Also can use ``<C-6>`` instead.

* ``:ls``, ``:buffers``

  List buffers.

* ``:bd [N]/#``

  Unload buffer and delete it from buffer list.


