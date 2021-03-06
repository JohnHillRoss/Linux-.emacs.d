;;关闭声音
(setq ring-bell-function 'ignore)

;;自动加载文件
(global-auto-revert-mode 1)

;;关闭自动备份
(setq make-backup-files nil)
(setq auto-save-default nil)

;;打开最近打开过的文件的图形化界面
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;显示匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;光标选中输入代替原文本
(delete-selection-mode 1)

;;自定义缩写,加非26字母
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("8jhr" "JohnHillRoss")
					    ))

;;自动缩进
(defun indent-buffer ()
  ;;Indent the currently visited buffer
  (interactive)
  (indent-rSpacemacsegin (point-min) (point-max)))

(defun indent-region-or-buffer ()
  ;;Indent a region if selected, otherwise the whole buffer
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

;;完善自动补全
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;;优化输入yes,no
(fset 'yes-or-no-p 'y-or-n-p)

;;优化Dired,不用询问
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;优化Dired
(put 'dired-find-alternate-file 'disabled nil)

;;优化打开当前文件Dired
(require 'dired-x)

;;优化跨路径Dired
(setq dired-dwim-target 1)

(provide 'init-better-defaults)
