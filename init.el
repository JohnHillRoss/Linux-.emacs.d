(package-initialize)
;;关闭工具栏
(tool-bar-mode -1)

;;关闭滑动控件
(scroll-bar-mode -1)

;;显示行号
(global-linum-mode 1)

;;更改光标样式
(setq-default cursor-type 'bar)

;;关闭启动帮助画面
(setq inhibit-splash-screen -1)

;;更改显示字体大小
(set-face-attribute 'default nil :height 160)

;;开启全局Company补全
(global-company-mode 1)

;;关闭自动备份
(setq make-backup-files nil)

;;org语句块文本高亮
(require 'org)
(setq org-src-fontify-natively 1)

;;打开最近打开过的文件的图形化界面
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;用快捷键绑定打开最近打开过的文件的图形界面
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;光标选中输入代替原文本
(delete-selection-mode 1)

;;全屏开启
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;自动匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;显示当前行
(global-hl-line-mode 1)

;;扩展package
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://melpa.org/packages/"))))

(require 'cl)
;;add whatever packages you want here
(defvar RossLewis/packages '(
			     ;; --- Auto-completion ---
			     company
			     ;; --- Better-Editor ---
			     hungry-delete
			     swiper
			     counsel
			     smartparens
			     ;; --- Themes ---
			     darkokai-theme
			     
			     ) "Default packages")

(setq package-selected-packages RossLewis/packages)

(defun RossLewis/packages-installed-p ()
  (loop for pkg in RossLewis/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return 1)))

(unless (RossLewis/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg RossLewis/packages)
	  (when (not (package-installed-p pkg))
	    (package-install pkg))))

;;加载主题
(load-theme 'darkokai 1)

;;快捷删除空格
(require 'hungry-delete)
(global-hungry-delete-mode 1)

;;设置swiper和counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers 1)
(setq enable-recursive-minibuffers 1)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;设置smartparens
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode 1)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;代做事项org
;;*号后面加空格再加题目
;;<s Tab 新建语句块
;;C-c ' 打开语句块内容
;;C-c C-t 添加TODO
;;C-c C-s 事项开始时间
;;C-c C-d 事项结束时间
;;C-c C-a org-agenda
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c C-a") 'org-agenda)

;;快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;将函数open-init-file绑定在<f1>键上
(global-set-key (kbd "<f1>") 'open-init-file)

;;M-x customize-group 定制package
;;M-x package-list-packages
;;M-x package-auto-remove 删除package
;;C-s 搜索
;;i 安装
;;u 取消安装
;;Cap-Lock u 更新
