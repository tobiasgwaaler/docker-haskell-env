(require 'package)
(package-initialize)

(package-refresh-contents)
(package-install 'company)

(add-to-list 'package-archives 
         '("melpa" . "http://melpa-stable.milkbox.net/packages/"))
(package-refresh-contents)
(package-install 'haskell-mode)
(package-install 'ghc)
(package-install 'company-ghc)
(package-install 'smex)
(package-install 'exec-path-from-shell)