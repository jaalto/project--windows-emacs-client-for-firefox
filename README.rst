Using Windows Emacs to edit forms in Firefox
============================================

Windows Firefox can be configured to use Emacs to edit a text input
area in a Web page. Want to edit Wikipedia article in Emacs? It's
much more convenient when you can use supporting modes like
`wikipedia.el <http://www.emacswiki.org/emacs/WikipediaMode>`_.
Howabout writing We page's contact feedback form using Emacs
editor? Compose a Web based bug reporting form in Emacs? It's all
possible.

Project Homepage: <https://github.com/jaalto/project--windows-emacs-client-for-firefox>

Requirements
------------

* `Native Emacs for Windows <https://pinboard.in/u:jariaalto/t:emacs/t:software>`_.
* `Cygwin for Windows <http://cygwin.com>`_.
  Install gcc, make and other build tools
* `Firefox for Windows <http://firefox.com>`_.
* `It's All Text <https://addons.mozilla.org/en-US/firefox/addon/4125>`_
  Firefox extension.

Installation
------------

0. Configure Emacs to be on "server mode". See
   `Emacs Wiki <http://www.emacswiki.org/emacs/EmacsClient>`_
   for more information. Basicly add this to ``~/.emacs`` ::

    (server-start)

1. Copy the *.bat file in this project to Emacs installation directory
   in Windows that is named ``bin/``.

2. Start Cygwin shell.

3. Compile and install the helper which the Firefox extension
   *It's all text* will be calling ::

    make ROOT="C:/path/to/emacs-NN.N/bin" server all install

4. In Firefox menu *Add-ons*, select "options" for extension "It's all text"
   and point it to compiled **eclient.exe**

.. image:: https://github.com/jaalto/project--windows-emacs-client-for-firefox/raw/master/pic/firefox--its-all-text--emacs.jpg

That's it. Have Emacs running (and M-x server-edit), visit any web
page (try wikipedia + edit button) and you should be able to edit
the page by clicking the blue "edit" icon that appears on mouse
hover near the lower right corner of the text input area.

.. image:: https://github.com/jaalto/project--windows-emacs-client-for-firefox/raw/master/pic/firefox--its-all-text.jpg
