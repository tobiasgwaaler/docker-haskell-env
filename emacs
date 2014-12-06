(package-initialize)

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; company-ghc
(add-hook 'haskell-mode-hook 
	(lambda () 
		(add-to-list 'company-backends 'company-ghc)
	)
)

;; keybindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)