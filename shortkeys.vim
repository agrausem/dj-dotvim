" Affichage et masquage de la fenêtre Taglist
map <F8> <Esc>:TlistToggle<CR> 

" Activation de la complétion Django
map <F10> <Esc>:call SetAutoDjangoCompletion()<CR>

" Activation de l'historique des modifications
map <C-h> <Esc>:GundoToggle<CR>

" Appel de la fonction d'activation/désactivation de la souris
map <F4> <Esc>:call ToggleMouseActivation()<CR>

" Appel de la fonction de nettoyage d'un fichier (enlève les ^M parasites en
" fin de ligne
map <F3> <Esc>:call CleanCode()<CR>
imap <F3> <Esc>:call CleanCode()<CR>i
