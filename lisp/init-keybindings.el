;;设置swiper和counsel快捷键
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;将函数open-init-file绑定在<f1>键上
(global-set-key (kbd "<f1>") 'open-init-file)

;;用快捷键绑定打开最近打开过的文件的图形界面
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;查询变量,函数,命令
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;打开org-agenda快捷键
(global-set-key (kbd "C-c C-a") 'org-agenda)

;;查看git仓库文件
(global-set-key (kbd "C-c C-p C-f") 'counsel-git)

(provide 'init-keybindings)
