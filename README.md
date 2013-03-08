voogle.vim
============

A simple small plugin to help you google from vim but not display
the results in a buffer. (it's 2013)

##Install

I recommend using Tim Pope's pathogen and just install it in the `bundle/` dir

You can also just place it in the `plugin/` directory.

##Usage

The shortcut is `gs`
You can google for the word under the cursor in normal mode,

or you can search for selected text in visual mode.

Voogle.vim tries to find an available browser from:

* Chrome/Chromium
* Firefox
* links

##Options

Set the `g:search_engine` variable to your desire for custom searches
if you don't like google

You can disable the plugin by setting `g:loaded_voogle` to 0.

##License

Distributed under the same terms as Vim itself. See `:help license`.
