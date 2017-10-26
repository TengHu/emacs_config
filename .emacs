(require 'package) ;; You might already have this line


(add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/"))
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))



(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212121" "#CC5542" "#6aaf50" "#7d7c61" "#5180b3" "#DC8CC3" "#9b55c3" "#bdbdb3"])
 '(custom-safe-themes
   (quote
    ("f03c2a89a4db14707935b16ef950b8d93cb147aa3a0708073807ea5880356e9c" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" default)))
 '(fci-rule-color "#2e2e2e")
 '(package-selected-packages
   (quote
    (helm-projectile eshell-up neotree dumb-jump cyberpunk-theme solarized-theme doom-themes zenburn-theme auto-complete helm helm-ebdb)))
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dd5542")
     (40 . "#CC5542")
     (60 . "#fb8512")
     (80 . "#baba36")
     (100 . "#bdbc61")
     (120 . "#7d7c61")
     (140 . "#6abd50")
     (160 . "#6aaf50")
     (180 . "#6aa350")
     (200 . "#6a9550")
     (220 . "#6a8550")
     (240 . "#6a7550")
     (260 . "#9b55c3")
     (280 . "#6CA0A3")
     (300 . "#528fd1")
     (320 . "#5180b3")
     (340 . "#6380b3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
;(global-set-key (kbd "C-x C-f") #'helm-projectile-find-files)


;; auto-complete
(ac-config-default)

;; theme
(load-theme 'cyberpunk t)

;; indent marker
;(add-to-list 'load-path "~/.emacs.d/indent-guide.el") 
(load "~/.emacs.d/indent-guide.el")
;(require 'indent-guide)
(indent-guide-global-mode)


;; neotree
(require 'neotree)
(global-set-key (kbd "M-a") #'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


;; eshell-up
(require 'eshell-up)
(setq eshell-up-ignore-case nil)
(setq eshell-up-print-parent-dir t)
(defalias 'up 'eshell-up)
(defalias 'peek 'eshell-up-peek)


;;dump-jump
(dumb-jump-mode)
(setq dumb-jump-selector 'helm)
(global-set-key (kbd "C-g") #'dumb-jump-go-other-window)

;; helm-projectile
(require 'helm-projectile)
(helm-projectile-on)


;; helm neotree auto-complete theme-cyberpunk indent-guide dumb-jump helm-projectile


