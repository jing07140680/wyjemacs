(setq epg-gpg-program "gpg")  ;; Ensure Emacs uses system gpg

;; ─── Basic UI Tweaks ───────────────────────────────────────────────
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(column-number-mode 1)

;; ─── Package Setup (MELPA only, skip GNU) ──────────────────────────
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("gnu"   . "https://elpa.gnu.org/packages/")))  ;; MELPA only
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; ─── Use-package Setup ─────────────────────────────────────────────
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ─── Ivy + Swiper Setup ────────────────────────────────────────────
(use-package ivy
  :diminish
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t))

(use-package swiper
  :bind (("C-s" . swiper))) ;; Replaces default search with swiper

(use-package counsel
  :after ivy
  :config (counsel-mode 1))

;; ─── Optional Tweaks ───────────────────────────────────────────────
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode 1)
(setq backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

;; ─── Theme (light) ─────────────────────────────────────────────────
(load-theme 'leuven t)

;; ─── rgrep Shortcut ────────────────────────────────────────────────
(global-set-key (kbd "C-c s") 'rgrep)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(counsel swiper ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
