;;代做事项org
;;*号后面加空格再加题目
;;<s Tab 新建语句块
;;C-c ' 打开语句块内容
;;C-c C-t 添加TODO
;;C-c C-s 事项开始时间
;;C-c C-d 事项结束时间
;;C-c C-a org-agenda
(setq org-agenda-files '("~/org"))

;;org语句块文本高亮
(require 'org)
(setq org-src-fontify-natively 1)

(provide 'init-org)
