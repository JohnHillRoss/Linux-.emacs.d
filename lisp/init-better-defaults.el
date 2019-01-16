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

(provide 'init-better-defaults)
