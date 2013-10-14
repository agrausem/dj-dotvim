
let mapleader = ','
nnoremap <Leader><Leader> :bnext<CR>
nnoremap ;; :bprevious<CR>

" Chargement de Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Activation de l'indentation automatique
set autoindent

" Redéfinition des tabulations
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set scrolloff=999
set wildmenu

" Activation de la détection automatique du type de fichier
filetype on
filetype plugin indent on

" Longueur maximale des lignes
" Pour Python
autocmd Filetype python set textwidth=79
autocmd Filetype python set cc=+1
" Pour html
autocmd Filetype html set textwidth=

" Activation de la coloration syntaxique
syntax on
set t_Co=256
let g:airline_powerline_fonts=1
let g:loaded_autocomplete=1
colorscheme elflord

" Activation de la complétion 
" pour les fichiers python
au Filetype python set omnifunc=pythoncomplete#Complete
" pour les fichiers javascript
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" pour les fichiers html
au FileType html set omnifunc=htmlcomplete#CompleteTags
" pour les fichiers css
au FileType css set omnifunc=csscomplete#CompleteCSS

" Définition du type de complétion de SuperTab
" let g:SuperTabDefaultCompletionType = "context"

" Activation de la visualisation de la documentation
set completeopt=menuone,longest,preview

" Activation de la complétion pour Django
function! SetAutoDjangoCompletion()
    let l:tmpPath = split($PWD, '/')
    let l:djangoVar = tmpPath[len(tmpPath)-1].'.settings'
    let $DJANGO_SETTINGS_MODULE=djangoVar
    echo 'Activation de la complétion Django avec : '.djangoVar
    return 1
endfunction

" Activation de la complétion pour les librairies installées dans un virtualenv
py << EOF
import os.path
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Exécution des tests unitaires
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>

" Activation de la barre de statut de fugitive
set laststatus=2
" set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff}\ %{fugitive#statusline()}

" Fonction d'affichage d'un message en inverse vidéo
function! s:DisplayStatus(msg)
    echohl Todo
    echo a:msg
    echohl None
endfunction

" Variable d'enregistrement de l'état de la gestion de la souris
let s:mouseActivation = 1

" Fonction permettant l'activation/désactivation de la gestion de la souris
function! ToggleMouseActivation()
    if (s:mouseActivation)
        let s:mouseActivation = 0
        set mouse=n
        set paste
        call s:DisplayStatus('Désactivation de la gestion de la souris (mode collage)')
    else
        let s:mouseActivation = 1
        set mouse=a
        set nopaste
        call s:DisplayStatus('Activation de la gestion de la souris (mode normal)')
    endif
endfunction

" Activation par défaut au démarrage de la gestion de la souris
set mouse=a
set nopaste

" Fonction de nettoyage d'un fichier :
"   - remplacement des tabulations par des espaces
"   - suppresion des caractères ^M en fin de ligne
function! CleanCode()
    %retab
    %s/^M//g
    call s:DisplayStatus('Code nettoyé')
endfunction

" Affichage des numéros de ligne
set number
" highlight LineNr ctermbg=blue ctermfg=gray

" Surligne la colonne du dernier caractère autorisé par textwidth
set cc=+1
highlight colorcolumn ctermbg=darkblue

" Amélioration de la recherche avant et arrière avec surlignement du pattern
map * <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '/' . expand('<cWORD>') . '/'<CR>
map ù <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '?' . expand('<cWORD>') . '?'<CR>
