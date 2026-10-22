{
  enable = true;
  defaultEditor = true;
  package = pkgs.vim-full;
  extraConfig = ''
    syntax on
    set autoindent expandtab tabstop=4 shiftwidth=4
    set backspace=2
    set number relativenumber
    set ruler
    set timeout timeoutlen=100
    set cc=80

    augroup netrw_mapping
        autocmd!
        autocmd filetype netrw call NetrwMapping()
    augroup END

    function! NetrwMapping()
        nmap <buffer> l <cr>
        nmap <buffer> h -^
    endfunction
  '';
}
