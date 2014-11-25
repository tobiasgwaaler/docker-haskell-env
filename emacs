(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;; Fix for some packages like ace-jump-mode
(require 'cl)
(require 'request)
(require 'json)

; --------------------------------------------------------------------------------
;;; Basic Tooling, General Settings and One Liners

;; Window Movement (Shift+Direction)
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Diable Menu Bar
(menu-bar-mode 0)

;; Enable Line Numbers
(global-linum-mode 1)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; rainbow representations of hex/etc colors
(add-hook 'less-mode-hook 'rainbow-mode)

;;; Make Saves go in another directory
;;; Make more of them
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; no tabs (only spaces)
(setq-default indent-tabs-mode nil)

;; fuck suspending by accidentally pressing C-z
(global-unset-key (kbd "C-z"))

;;; Ace-Jump-Mode
;;Keybinding
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;; YASnippets
(yas-global-mode 1)

;;; smex
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to your recently and most frequently used commands.")
(global-set-key (kbd "M-x") 'smex)

;;; ido / flx-ido
(require 'ido)

;; Improved flex matching
(require 'flx-ido)
(setq ido-everywhere nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-file-extensions-order '(".hs" ".tpl" ".java" ".js" ".el" ".xml")
      ido-use-filename-at-point 'guess
      ido-ignore-extensions t
      ido-use-faces t)
(ido-mode 'buffer)

;; Vertical completion menu
(require 'ido-vertical-mode)
(ido-vertical-mode)

;; IDO support pretty much everwhere, including eclim-java-implement
(require 'ido-ubiquitous)
(ido-ubiquitous)

;;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching nil
      projectile-globally-ignored-directories '("target" ".hsenv" "dist" ".vagrant"))
(global-set-key "\C-cf" 'projectile-find-file)

;;; Ack Frontend
(add-to-list 'load-path "/path/to/full-ack")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

; --------------------------------------------------------------------------------
;;;; Haskell Modes

;;; Haskell Mode
;; Haskell-Mode Indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; C-c C-c compilation shortcut
(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

;;; Stylish-Haskell
(setq haskell-stylish-on-save t)

;;; ghc-mod && haskell flymake
(autoload 'ghc-init "ghc" nil t)
;; (add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;;; structured-haskell-mode
;; (require 'shm)
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; (setq shm-program-name "/Users/chris/Documents/bin/structured-haskell-mode")

; --------------------------------------------------------------------------------
;;; Par Edit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

; --------------------------------------------------------------------------------

; --------------------------------------------------------------------------------
;; File Associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("emacs" . lisp-mode))
(add-to-list 'auto-mode-alist '("zshrc" . shell-script-mode))

; --------------------------------------------------------------------------------

(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
