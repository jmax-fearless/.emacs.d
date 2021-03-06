(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" .        "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" .          "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(async-bytecomp-package-mode t)
 '(auto-package-update-interval 1)
 '(auto-package-update-prompt-before-update t)
 '(compilation-scroll-output t)
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(geiser-implementations-alist
   (quote
    (((regexp "\\.scm$")   chicken)
     ((regexp "\\.meta$")  chicken)
     ((regexp "\\.setup$") chicken)
     ((regexp "\\.page$")  chicken))))
 '(global-linum-mode t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-enable-at-startup nil)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(ruby-insert-encoding-magic-comment nil)
 '(same-window-buffer-names (quote ("*shell*")))
 '(scheme-mit-dialect nil)
 '(scheme-program-name "csi")
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(vc-svn-global-switches nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 143 :width normal)))))

(use-package anaconda-mode
  :ensure t)

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-interval 1)
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-hide-results nil))

(use-package circe
  :ensure t)

(use-package coffee-mode
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package docker
  :ensure t
  :config
  (global-set-key (kbd "C-c d") 'docker))

(use-package docker-api
  :ensure t)

(use-package docker-cli
  :ensure t)

(use-package docker-compose-mode
  :ensure t)

(use-package docker-tramp
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package eyebrowse
  :ensure t
  :config
  (global-set-key (kbd "<M-kp-1>") 'eyebrowse-switch-to-window-config-1)
  (global-set-key (kbd "<M-kp-3>") 'eyebrowse-switch-to-window-config-2)
  (global-set-key (kbd "<M-kp-7>") 'eyebrowse-switch-to-window-config-3)
  (global-set-key (kbd "<M-kp-9>") 'eyebrowse-switch-to-window-config-4)
  (setq eyebrowse-new-workspace t)
  (eyebrowse-mode t))

(use-package feature-mode
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package flycheck-mmark
  :ensure t)

(use-package flymake-haml
  :ensure t)

(use-package flymake-php
  :ensure t)

(use-package flymake-ruby
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))

(use-package flymake-yaml
  :ensure t)

(use-package geiser
  :ensure t
  :config
  (setq geiser-default-implementation 'chicken)
  (setq geiser-mode-smart-tab-p t)
  (setq geiser-mode-start-repl-p t))

(use-package haml-mode
  :ensure t)

(use-package helm-rb
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :demand t)

(use-package markdown-mode
  :ensure t)

(use-package markdown-mode+
  :ensure t)

(use-package markdown-preview-eww
  :ensure t)

(use-package markup
  :ensure t)

(use-package markup-faces
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package projectile-rails
  :ensure t
  :config
  (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
  (projectile-rails-global-mode))

(use-package projectile-speedbar
  :ensure t)

(use-package python-mode
  :ensure t)

(use-package rails-log-mode
  :ensure t)

(use-package restclient
  :ensure t)

(use-package robe
  :ensure t
  :config (add-hook 'ruby-mode-hook 'robe-mode)
          (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
            (rvm-activate-corresponding-ruby)))

(use-package ruby-hash-syntax
  :ensure t)

(use-package rvm
  :ensure t)

(use-package sr-speedbar
  :ensure t
  :config
  (global-set-key [kp-6] 'sr-speedbar-toggle))

(use-package string-inflection
  :ensure t)

(use-package web-mode
  :ensure t
  :mode ("/\\(components\\|containers\\|src\\)/.*\\.js[x]?\\'")
  :config (progn
            (setq
             web-mode-content-types-alist
             '(("jsx" . "/\\(components\\|containers\\|src\\)/.*\\.js[x]?\\'")))))

(use-package yaml-mode
  :ensure t)

(use-package ztree
  :ensure t)

(auto-package-update-maybe)
(put 'narrow-to-region 'disabled nil)
(global-prettify-symbols-mode t)
(add-hook 'compilation-mode-hook
          (lambda ()
            (setq truncate-lines t)))

(add-to-list 'auto-mode-alist '("\\.page\\'" . scheme-mode))
(add-hook 'scheme-mode-hook
          (lambda ()
            (dolist (kw '(describe it before after))
              (put kw 'scheme-indent-function 'defun))
            (font-lock-add-keywords
             nil
             '(("(\\(describe\\) " . font-lock-keyword-face)
               ("(\\(it\\) "       . font-lock-keyword-face)
               ("(\\(before\\) "   . font-lock-keyword-face)
               ("(\\(after\\) "    . font-lock-keyword-face)))))


(add-hook 'before-save-hook
          (lambda ()
            (unless (derived-mode-p 'makefile-mode)
              (untabify (point-min) (point-max)))
            (delete-trailing-whitespace (point-min) (point-max))))

(add-to-list 'load-path "~/.emacs.d/lisp")

(unless (display-graphic-p) (load "./text-mode-customizations.el"))
