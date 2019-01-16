(require 'cl)

;;扩展package
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://melpa.org/packages/"))))

(require 'cl)
;;add whatever packages you want here
(defvar JohnHillRoss/packages '(
			     ;; --- Auto-completion ---
			     company
			     ;; --- Better-Editor ---
			     hungry-delete
			     swiper
			     counsel
			     smartparens
			     popwin
			     ;; --- Themes ---
			     darkokai-theme
			     ) "Default packages")

(setq package-selected-packages JohnHillRoss/packages)

(defun JohnHillRoss/packages-installed-p ()
  (loop for pkg in JohnHillRoss/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return 1)))

(unless (JohnHillRoss/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg JohnHillRoss/packages)
	  (when (not (package-installed-p pkg))
	    (package-install pkg))))

;;开启全局Company补全
(global-company-mode 1)

;;快捷删除空格
(require 'hungry-delete)
(global-hungry-delete-mode 1)

;;设置swiper和counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers 1)
(setq enable-recursive-minibuffers 1)

;;设置smartparens
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode 1)

;;自动定位光标位置和打开新窗口位置
(require 'popwin)
(popwin-mode 1)

;;加载主题
(load-theme 'darkokai 1)

(provide 'init-packages)
