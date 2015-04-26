;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; >>> Package manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Chargement de el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-dir "~/.emacs.d/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; Liste des paquets a installer
(setq my:el-get-packages
      '(
        magit
        auto-complete
        yasnippet
        ;;pymacs
        rope
        ropemode
        ropemacs
        flymake
        flymake-cursor
        python-pep8
        ;;nxhtml
        color-theme
        color-theme-solarized
        graphviz-dot-mode
        pkgbuild-mode
        smex
        projectile
        ))				

;; Mise a jours des paquets
(el-get 'sync my:el-get-packages)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; >>> Options globales
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Pas d'ecran de demarage
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; backups des fichiers temporaires
(setq backup-directory-alist '(("." . "~/.emacs_backups")))

;; Pas de menu & toolbar 
(tool-bar-mode -1) 
;;(menu-bar-mode -1)

;; Numerotation des lignes
(global-linum-mode t);; Numerotation des lignes à gauche du code
(line-number-mode t);; Numerotation des lignes
(column-number-mode t) ;; Numerotation des colonnes

;; Mise en forme du code
(setq-default fill-column 79) ;; largeur de la zone
(global-font-lock-mode t) ;; Syntax highlighting
(color-theme-solarized-dark) ;; Theme Solarizd

;; Encodage
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; Amelioration de la selection
(cua-mode t) ;; Activation des racourcis couper/copier/coller
(transient-mark-mode t) ;; Active/Affiche la selection, pour commenter du code avec M-;

(yas-global-mode t)  ;; Active le mode yasnippet
(ido-mode t) ;; Ameliore la recherche buffer, fichier, repertoire

(show-paren-mode t) ;; Affiche les parentheses


;; Completion du code
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; Indentation
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; >>> Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Pymacs (python 2.7)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;; Rope
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; Flymake
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "/usr/local/bin/pycheckers"  (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
(flymake-cursor-mode t)

;; Python options
(add-hook 'python-mode-hook 'flymake-mode)
(add-hook 'python-mode-hook 'flymake-cursor-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; >>> org.mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(setq org-agenda-files (list "~/documents/task.org"
                             "~/documents/work.org"
                             "~/documents/project.org"
                             "~/documents/summary.org"
                             ))
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Smex, remplace le lanceur de commande (M-x)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; flymake, Redefinition des touches
(global-set-key [f8] 'flymake-goto-next-error) ;; Touche multimedia >>|
(global-set-key [f6] 'flymake-goto-prev-error) ;; Touche multimedia |<<
(global-set-key [ (control c) (control g) ] 'goto-line);; Aller a la ligne / C-c C-g

;; Divers
(global-set-key [f10] 'menu-bar-open) ;; 
(global-set-key [f11] 'menu-bar-mode) ;; Affiche ou désactive Touche multimedia >>|
