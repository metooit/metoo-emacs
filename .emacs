;;              .-. 
;;        .-'``(|||) 
;;     ,`\ \    `-`.               88                         88 
;;    /   \ '``-.   `              88                         88 
;;  .-.  ,       `___:    88   88  88,888,  88   88  ,88888, 88888  88   88 
;; (:::) :        ___     88   88  88   88  88   88  88   88  88    88   88 
;;  `-`  `       ,   :    88   88  88   88  88   88  88   88  88    88   88 
;;    \   / ,..-`   ,     88   88  88   88  88   88  88   88  88    88   88 
;;     `./ /    .-.`      '88888'  '88888'  '88888'  88   88  '8888 '88888' 
;;        `-..-(   ) 
;;              `-` 

;;             ,        ,
;;            /(        )`
;;            \ \___   / |
;;            /- _  `-/  '
;;           (/\/ \ \   /\
;;           / /   | `    \
;;           O O   ) /    |
;;           `-^--'`<     '
;;          (_.)  _  )   /
;;           `.___/`    /
;;             `-----' /
;;<----.     __ / __   \
;;<----|====O)))==) \) /====
;;<----'    `--' `.__,' \
;;             |        |
;;              \       /       /\
;;         ______( (_  / \______/
;;       ,'  ,-----'   |
;;       `--{__________) 



;;=====================================================================================
;;-------------------------------------------------------------------------------------
;;   ***                           ****                   ***                     
;;  *   *        *                *                         *          *          
;;  *   * *   * *****  ***        *      ***   * *  ****    *    ***  *****  ***  
;;  ***** *   *  *    *   * ***** *     *   * * * * *   *   *   *   *  *    *   * 
;;  *   * *   *  *    *   *       *     *   * * * * ****    *   *****  *    ***** 
;;  *   * *   *  *    *   *       *     *   * * * * *       *   *      *    *     
;;  *   *  ***    ***  ***         ****  ***  * * * *     *****  ****   ***  **** 
;;------------------------------------------------------------------------------------- 
;;=====================================================================================
(add-to-list 'load-path "~/.emacs.d/Coding/auto-complete")
(require 'auto-complete-config)

(defun ac-yasnippet-candidates()
(with-no-warnings
;;>0.6.0
(apply 'append(mapcar 'ac-yasnippet-candidate-1(yas/get-snippet-tables)))
))

(add-to-list 'ac-dictionary-directories "~/.emacs.d/Coding/auto-complete/ac-dict")
(ac-config-default)
(require 'auto-complete-clang)
(global-auto-complete-mode t)


(setq ac-auto-start 1)
(setq ac-use-quick-help t)
;;显示doc文档信息
(setq ac-quick-help-delay 0.5)
(ac-set-trigger-key "TAB")
;;输入错误时仍能匹配，需手动触发
(setq ac-fuzzy-enable t)
(global-set-key(kbd "M-]") 'auto-complete)
(define-key ac-mode-map [(control tab)] 'auto-complete)
;;为auto-complete弹出菜单配色
(set-face-background 'ac-candidate-face "#657B83")
(set-face-underline 'ac-candidate-face "#657B83")
(set-face-background 'ac-selection-face "#93A1A1")
;;添加需要提示的内容
(setq-default ac-sources '(
    ac-source-yasnippet
    ac-source-filename
    ac-source-words-in-all-buffer
    ac-source-functions
    ac-source-variables
    ac-source-symbols
    ac-source-features
    ac-source-abbrev
    ac-source-words-in-same-mode-buffer
    ac-source-dictionary
))

;;使用增强的popup列表
;;(require 'pos-tip)
;;(setq ac-quick-help-prefer-pos-tip t) ;default is t


(defun my-ac-config ()

    ;;(setq ac-clang-flags  
        ;;(mapcar(lambda (item)(concat "-I" item))  
               ;;(split-string  
                ;;"  
                 ;;/usr/include/c++/4.4  
         ;;/usr/include/c++/4.4/i486-linux-gnu  
         ;;/usr/include/c++/4.4/backward  
         ;;/usr/local/include  
        ;;/usr/lib/gcc/i686-linux-gnu/4.7/include  
        ;;/usr/lib/gcc/i686-linux-gnu/4.7/include-fixed
        ;;/usr/lib/gcc/i686-linux-gnu/4.7.2/include  
        ;;/usr/lib/gcc/i686-linux-gnu/4.7.2/include-fixed  
        ;;/usr/include/i686-linux-gnu  
        ;;/usr/include  
        ;;")))

  (setq ac-clang-flags (split-string "-I../include -I../Include -I../ -I../inc -I../Inc -I../common -I../Common -I../lib -I../Lib"))
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
;; -------------------- end of auto complete --------------------






;;===========================================
;;-------------------------------------------
;;   ****                                     
;;  *                                         
;;  *            ****  ***   **** ****   ***  
;;  *     ***** *     *   * *     *   * *   * 
;;  *            ***  *   * *     ****  ***** 
;;  *               * *   * *     *     *     
;;   ****       ****   ***   **** *      **** 
;;-------------------------------------------
;;===========================================
;; ==================== cscope ====================
;; +----------+--------------------------------------------------+
;; |C-c s a   |设定初始化的目录，一般是你代码的根目录            |
;; +----------+--------------------------------------------------+
;; |C-s s I   |对目录中的相关文件建立列表并进行索引              |
;; +----------+--------------------------------------------------+
;; |C-c s s   |序找符号                                          |
;; +----------+--------------------------------------------------+
;; |C-c s g   |寻找全局的定义                                    |
;; +----------+--------------------------------------------------+
;; |C-c s c   |看看指定函数被哪些函数所调用                      |
;; +----------+--------------------------------------------------+
;; |C-c s C   |看看指定函数调用了哪些函数                        |
;; +----------+--------------------------------------------------+
;; |C-c s e   |寻找正则表达式                                    |
;; +----------+--------------------------------------------------+
;; |C-c s f   |寻找文件                                          |
;; +----------+--------------------------------------------------+
;; |C-c s i   |看看指定的文件被哪些文件include                   |
;; +----------+--------------------------------------------------+
(load-file "~/.emacs.d/Coding/cscope/xcscope.el")
(require 'xcscope)
(add-hook 'c-mode-common-hook
          '(lambda ()
           (require 'xcscope)))



;;==================================================================
;;  ++++       +++                     +++++ +                       
;; +             +                       +   +                       
;; +      +++    +    +++   +++          +   ++++   +++   + +   +++  
;; +     +   +   +   +   + +   + +++++   +   +   + +   + + + + +   + 
;; +     +   +   +   +   + +             +   +   + +++++ + + + +++++ 
;; +     +   +   +   +   + +             +   +   + +     + + + +     
;;  ++++  +++  +++++  +++  +             +   +   +  ++++ + + +  ++++
;;==================================================================
(add-to-list 'load-path "~/.emacs.d/UIDesign/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))
(set-face-font 'menu "7x14")
(set-face-foreground 'menu "white")
;; (load-theme 'solarized-[light|dark] t)

;;==================================================================
;;          +           +                                       
;;                                                              
;;   + +  +++    +++  +++                      + +   +++  ++++  
;;  + + +   +   +   +   +         +++++       + + +     + +   + 
;;  + + +   +   +   +   +                     + + +  ++++ ++++  
;;  + + +   +   +   +   +                     + + + +   + +     
;;  + + + +++++ +   + +++++                   + + +  ++++ +  
;;==================================================================
(add-to-list 'load-path "~/.emacs.d/UIDesign/minimap")
(require 'minimap)


;;==================================================================
;;              +++               
;;                +               
;;  ++++  +   +   +    ++++  +++  
;;  +   + +   +   +   +     +   + 
;;  ++++  +   +   +    +++  +++++ 
;;  +     +   +   +       + +     
;;  +      +++  +++++ ++++   ++++
;;==================================================================
(add-to-list 'load-path "~/.emacs.d/UIDesign/pulse")
(require 'pulse)

(defadvice exchange-point-and-mark-nomark (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p)
		 (> (abs (- (point) (mark))) 400))
	(pulse-momentary-highlight-one-line (point))))
(defadvice switch-to-buffer (after pulse-advice activate)
  "Cause the current line of new buffer to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
	(pulse-momentary-highlight-one-line (point))))
(defadvice ido-switch-buffer (after pulse-advice activate)
  "Cause the current line of new buffer to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
	(pulse-momentary-highlight-one-line (point))))
(defadvice switch-to-other-buffer (after pulse-advice activate)
  "Cause the current line of new buffer to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
	(pulse-momentary-highlight-one-line (point))))
(defadvice visit-.emacs (after pulse-advice activate)
  "Cause the current line of .emacs buffer to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
	(pulse-momentary-highlight-one-line (point))))
(defadvice beginning-of-buffer (after pulse-advice activate)
  "Cause the current line of buffer to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
	(pulse-momentary-highlight-one-line (point))))
(pulse-toggle-integration-advice (if window-system 1 -1))


;;=====================================================================================
;;  +       +         +     +++     +         +                               +   +++   
;;  +                 +       +               +      +           +                  +   
;;  ++++  +++    ++++ ++++    +   +++    ++++ ++++  +++++       +++++  +++  +++     +   
;;  +   +   +   +   + +   +   +     +   +   + +   +  +    +++++  +        +   +     +   
;;  +   +   +    ++++ +   +   +     +    ++++ +   +  +           +     ++++   +     +   
;;  +   +   +       + +   +   +     +       + +   +  +           +    +   +   +     +   
;;  +   + +++++  +++  +   + +++++ +++++  +++  +   +   +++         +++  ++++ +++++ +++++
;;=====================================================================================
(add-to-list 'load-path "~/.emacs.d/UIDesign/highlight-tail")
(require 'highlight-tail)
(highlight-tail-mode)
(setq highlight-tail-colors '(("black" . 0)

                              ("#bc2525" . 25)

                              ("black" . 66)))
(setq highlight-tail-steps 14

      highlight-tail-timer 1)
(setq highlight-tail-posterior-type 'const)



;;==========================================================================================
;;  +   +   +             +                    ++++                     +                     
;;  +   +                 +                   +            +     +                            
;;  + + + +++    +++   ++++  +++  + + +       +      +++  +++++ +++++ +++    +++   ++++  ++++ 
;;  + + +   +   +   + +   + +   + + + + +++++  +++  +   +  +     +      +   +   + +   + +     
;;  + + +   +   +   + +   + +   + + + +           + +++++  +     +      +   +   +  ++++  +++  
;;  + + +   +   +   + +   + +   + + + +           + +      +     +      +   +   +     +     + 
;;   + +  +++++ +   +  ++++  +++   + +        ++++   ++++   +++   +++ +++++ +   +  +++  ++++ 
;;===========================================================================================
;;*****************************************************************************
;;                                    UI  Settings                          
;;*****************************************************************************

;;*****************************************************************************
;;                                    设置<F11>全屏                          
;;*****************************************************************************
    (defun toggle-fullscreen (&optional f)
      (interactive)
      (let ((current-value (frame-parameter nil 'fullscreen)))
           (set-frame-parameter nil 'fullscreen
                                (if (equal 'fullboth current-value)
                                    (if (boundp 'old-fullscreen) old-fullscreen nil)
                                    (progn (setq old-fullscreen current-value)
                                           'fullboth)))))

    (global-set-key [f11] 'toggle-fullscreen)

    ; Make new frames fullscreen by default. Note: this hook doesn't do
    ; anything to the initial frame if it's in your .emacs, since that file is
    ; read _after_ the initial frame is created.
    (add-hook 'after-make-frame-functions 'toggle-fullscreen)

;;*****************************************************************************
;;                                    窗口大小的设置
;;*****************************************************************************
;;启动窗口大小
;;(setq default-frame-alist
;;'((height . 40) (width . 90) (menu-bar-lines . 20) (tool-bar-lines . 0)))
;;*****************************************************************************
;;                                     最大化设置                          
;;*****************************************************************************
;;;该函数用于最大化,状态值为1说明最大化后不会被还原
;;;因为这里有两次最大化 (分别是水平和垂直)
(defun my-maximized ()
 (interactive)
 (x-send-client-message
 nil 0 nil "_NET_WM_STATE" 32
 '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
 (interactive)
 (x-send-client-message
 nil 0 nil "_NET_WM_STATE" 32
 '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;;启动时最大化
(my-maximized)

;;*****************************************************************************
;;                                     显示行号                          
;;*****************************************************************************
;; 调用linum.el(line number)来显示行号：
(require 'linum)
(global-linum-mode t)

;;*****************************************************************************
;;                                     显示列号                                
;;*****************************************************************************
(setq column-number-mode t)

;;*****************************************************************************
;;                                     显示时间                                
;;*****************************************************************************
;;启用时间显示设置
(display-time-mode 1)
 
;;时间使用24小时制
(setq display-time-24hr-format t)
 
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
 
;;时间栏旁边启用邮件设置
;(setq display-time-use-mail-icon t)
 
;;时间的变化频率
(setq display-time-interval 10)

;;显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t) 

;;=================================================================================================
;;  ***     *               ***                 ***                           *                     
;;    *          *     *      *                *                       *                            
;;    *   ***   ***** *****   *    ***        ***** *   *  ***   **** ***** ***    ***   ***   **** 
;;    *     *    *     *      *   *   * *****  *    *   * *   * *      *      *   *   * *   * *     
;;    *     *    *     *      *   *****        *    *   * *   * *      *      *   *   * *   *  ***  
;;    *     *    *     *      *   *            *    *   * *   * *      *      *   *   * *   *     * 
;;  ***** *****   ***   *** *****  ****        *     ***  *   *  ****   *** *****  ***  *   * ****
;;=================================================================================================
;;*****************************************************************************
;;                                 关闭出错时的提示声                          
;;*****************************************************************************
(setq visible-bell t)

;;*****************************************************************************
;;                                  打开一些默认设置                        
;;*****************************************************************************
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;*****************************************************************************
;;                                 关闭启动时开机画面                       
;;*****************************************************************************
;;(setq inhibit-startup-message t)

;;*****************************************************************************
;;                                鼠标中建点击时可以粘贴                      
;;*****************************************************************************
(setq mouse-yank-at-point t)

;;*****************************************************************************
;;                              用很大的kill-ring-max防止误删                
;;*****************************************************************************
(setq kill-ring-max 200)

;;*****************************************************************************
;;                            将fill-column设置为60，使文字好读               
;;*****************************************************************************
(setq default-fill-column 60)

;;*****************************************************************************
;;                          将sentence-end设置为可以识别中文标点              
;;*****************************************************************************
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;*****************************************************************************
;;                                 防止页面滚动时跳动                        
;;*****************************************************************************
(setq scroll-margin 3
      scroll-conservatively 10000)

;;*****************************************************************************
;;                           括号匹配时只显示而不跳至匹配括号               
;;*****************************************************************************
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;*****************************************************************************
;;                        光标靠近鼠标指针时，让鼠标指针自动让开            
;;*****************************************************************************
(mouse-avoidance-mode 'animate)

;;*****************************************************************************
;;                           把默认major mode设置为text mode                  
;;*****************************************************************************
(setq default-major-mode 'text-mode)

;;*****************************************************************************
;;                               在标题栏显示buffer的名字                      
;;*****************************************************************************
(setq frame-title-format '("" buffer-file-name "@emacs" ));

;;*****************************************************************************
;;                            让 Emacs 可以直接打开和显示图片                  
;;*****************************************************************************
(auto-image-file-mode)

;;*****************************************************************************
;;                                   进行语法高亮                            
;;*****************************************************************************
(global-font-lock-mode t)

;;*****************************************************************************
;;                                   设置个人信息                            
;;*****************************************************************************
(setq user-full-name "Prince")
(setq user-mail-address "oliver.lee.me@gmail.com")

;;*****************************************************************************
;;                           让 dired 可以递归的拷贝和删除目录                 
;;*****************************************************************************
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;*****************************************************************************
;;                                    去掉滚动栏             
;;*****************************************************************************
;;(scroll-bar-mode nil)
(scroll-bar-mode -1)

;;*****************************************************************************
;;                                      回车缩进
;;*****************************************************************************
;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)


;;*****************************************************************************
;;                                      最近跳转
;;*****************************************************************************
;; set recent-jump
(add-to-list 'load-path "~/.emacs.d/Coding/recent-jump")
(setq recent-jump-threshold 4)
(setq recent-jump-ring-length 10)
(global-set-key (kbd "C-o") 'recent-jump-jump-backward)
(global-set-key (kbd "M-o") 'recent-jump-jump-forward)
(require 'recent-jump)

;;****************************************************************************
;;                                    显示括号匹配 
;;****************************************************************************
;;(add-to-list 'load-path "~/.emacs.d/Coding/highlight-parentheses")
;;(show-paren-mode t)
;;(setq show-paren-style 'parentheses)
;;(require 'highlight-parentheses)
;;(highlight-parentheses-mode 1)


;;****************************************************************************
;;                                    显示ascii表
;;****************************************************************************
;;(add-to-list 'load-path "~/.emacs.d/Coding/ascii")
;;(require 'ascii)


;;****************************************************************************
;;                                    undo-tree
;;****************************************************************************
(add-to-list 'load-path "~/.emacs.d/Coding/undo-tree")
(require 'undo-tree)




;;*****************************************************************************
;;                                   高亮显示当前行                            
;;*****************************************************************************
;;(require 'hl-line)
;;(hl-line-mode -1)
(global-hl-line-mode 1)
;; for hight line mode
(or (facep 'my-hl-line-face) (make-face 'my-hl-line-face))
(setq hl-line-face 'my-hl-line-face)
(face-spec-set 'my-hl-line-face '((t (
                                      :background "DodgerBlue3"
                                                  :bold
                                                  :weight nil
                                      :inverse-video nil
                                      ))))
(defun wcy-color-theme-adjust-hl-mode-face()
  "interactive"
  (let* ((color  (x-color-values (face-attribute 'default :background))))
    (if (null color)
        (error "not support.")
      (let ((my-color (mapcar
                       (lambda (x)
                         (let ((y (/ #XFFFF 4))
                               (delta #X18FF))
                           (cond
                            ((< x (* y 1))
                             (+ x delta))
                            ((< x (* y 2))
                             (+ x delta))
                            ((< x (* y 3))
                             (- x delta))
                            (t
                             (- x delta)))))
                       color)))
        (message "%S %S" color my-color)
        (set-face-attribute
         'my-hl-line-face nil
         :background
         (concat "#"
                 (mapconcat
                  (lambda (c) (format "%04X" c))
                  my-color
                  "")))))))
(wcy-color-theme-adjust-hl-mode-face)

;;*****************************************************************************
;;                         shell结束之后自动关闭shell buffer                  *
;;*****************************************************************************
(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                            #'wcy-shell-mode-kill-buffer-on-exit)
      )
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

;;*****************************************************************************
;;                     shell mode下自动更改buffer name用于显示当前路径名称       
;;*****************************************************************************
(make-variable-buffer-local 'wcy-shell-mode-directory-changed)
(setq wcy-shell-mode-directory-changed t)

(defun wcy-shell-mode-auto-rename-buffer-output-filter (text)
  (if (and (eq major-mode 'shell-mode)
           wcy-shell-mode-directory-changed)
      (progn
        (let ((bn  (concat "sh:" default-directory)))
          (if (not (string= (buffer-name) bn))
              (rename-buffer bn t)))
        (setq wcy-shell-mode-directory-changed nil))))


(defun wcy-shell-mode-auto-rename-buffer-input-filter (text)
  (if (eq major-mode 'shell-mode)
      (if ( string-match "^[ \t]*cd *" text)
          (setq wcy-shell-mode-directory-changed t))))
(add-hook 'comint-output-filter-functions 'wcy-shell-mode-auto-rename-buffer-output-filter)
(add-hook 'comint-input-filter-functions 'wcy-shell-mode-auto-rename-buffer-input-filter )

;;*****************************************************************************
;;                             （C mode） 括号的自动补全                       
;;*****************************************************************************
;;             C  mode
;;(add-hook 'c-mode-hook 'hs-minor-mode)
;;(defun my-c-mode-auto-pair ()
;;  (interactive)
;;  (make-local-variable 'skeleton-pair-alist)
;;  (setq skeleton-pair-alist  '(
;;    (?` ?` _ "''")
;;    (?\( ?  _ " )")
;;    (?\[ ?  _ " ]")
;;    (?{ \n > _ \n ?} >)))
;;  (setq skeleton-pair t)
;;  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
;;(add-hook 'c-mode-hook 'my-c-mode-auto-pair)

;;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; (add-hook 'c-mode-hook 'my-c-mode-hook)
;; (add-hook 'c++-mode-hook 'my-c-mode-hook)
;; (defun my-come-hook ()
;;     ;;; .... 其他配置功能
;;     (local-set-key (kbd "{") 'skeleton-c-mode-left-brace)
;;     ;;; .... 其他配置功能
;;     )
;; (defun skeleton-c-mode-left-brace (arg)
;;   (interactive "*P")
;;   (if  (c-in-literal (c-most-enclosing-brace (c-parse-state)))
;;       (self-insert-command 1)
;;     ;; auto insert complex things.
;;     (let* ((current-line (delete-and-extract-region (line-beginning-position) (line-end-position)))
;;            (lines (and arg (mark t) (delete-and-extract-region (mark t) (point))))
;;            (after-point (make-marker)))
;;       ;;; delete extra blank begin and after the LINES
;;       (setq lines (and lines
;;                        (with-temp-buffer
;;                          (insert lines)
;;                          (beginning-of-buffer)
;;                          (delete-blank-lines)
;;                          (delete-blank-lines)
;;                          (end-of-buffer)
;;                          (delete-blank-lines)
;;                          (delete-blank-lines)
;;                          (buffer-string))))
;;       (save-excursion
;;         (let* ((old-point (point)))
;;           (insert (if current-line current-line "")  "{\n")
;;           (and lines (insert lines))
;;           (move-marker after-point (point))
;;           (insert "\n}\n")
;;           (indent-region old-point (point) nil)))
;;       (goto-char after-point)
;;       (c-indent-line)
;;       )))

;; 回车缩进
;;(global-set-key "\C-m" 'newline-and-indent)
;;(global-set-key (kbd "C-<return>") 'newline)


;;================================================================================================
;;  *       *         *     ***     *         *                                   *           ***   
;;  *                 *       *               *      *                            *             *   
;;  ****  ***    **** ****    *   ***    **** ****  *****        **** *   *  * *  ****   ***    *   
;;  *   *   *   *   * *   *   *     *   *   * *   *  *    ***** *     *   * * * * *   * *   *   *   
;;  *   *   *    **** *   *   *     *    **** *   *  *           ***   **** * * * *   * *   *   *   
;;  *   *   *       * *   *   *     *       * *   *  *              *     * * * * *   * *   *   *   
;;  *   * *****  ***  *   * ***** *****  ***  *   *   ***       ****   ***  * * * ****   ***  *****
;;=================================================================================================
;;*****************************************************************************
;;                               highlight-symbol-mode                           
;;*****************************************************************************
(add-to-list 'load-path "~/.emacs.d/Coding/highlight-symbol")
(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)


;;===============================================================================================
;;   ****       ***     *                           *   *   *             *             
;;  *             *          *                      *   *                 *             
;;  *     ****    *   ***   *****                   * * * ***    ***   ****  ***  * * * 
;;   ***  *   *   *     *    *          *****       * * *   *   *   * *   * *   * * * * 
;;      * ****    *     *    *                      * * *   *   *   * *   * *   * * * * 
;;      * *       *     *    *                      * * *   *   *   * *   * *   * * * * 
;;  ****  *     ***** *****   ***                    * *  ***** *   *  ****  ***   * *  
;;====================split window ==============================================================

(eval-when-compile (require 'cl))

(winner-mode 1)

; +----------+-----------+
; |          |           |
; |          |           |
; +----------+-----------+
; |          |           |
; |          |           |
; +----------+-----------+

(defun split-window-4()
  "Splite window into 4 sub-window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-vertically)
	     (split-window-horizontally)
	     (other-window 2)
	     (split-window-horizontally)
	     )
    )
  )

(global-set-key (kbd "C-x 4 4") 'split-window-4)

; +----------------+
; |                |
; +----------------+
; |                |
; +----------------+
(defun split-window-up-down()
  "Splite window into 2 up and down window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-vertically -10)
	     (other-window 1)
	     (eshell)
	     )
    ))
(global-set-key (kbd "C-x 4 2") 'split-window-up-down)

; +----------+-----------+
; |          |           |
; |          |           |
; +          +-----------+
; |          |           |
; |          |           |
; +----------+-----------+
(defun split-window-3()
  "Splite window into 3 sub-window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-horizontally)         ;split to left and right
	     (enlarge-window-horizontally 15)	 ;make the main window bigger
	     (other-window 1)		         ;go to the right window
	     (split-window-vertically)	         ;split the right window to two window
	     (eshell)			         ;open shell at left top window
	     (other-window 2) 		         ;go back to origin window
	     )
    )
  )

(global-set-key (kbd "C-x 4 3") 'split-window-3)

;  +----------------------+                 +------------+-----------+
;  |                      |           \     |            |           |
;  |                      |   +-------+\    |            |           |
;  +----------+-----------+   +-------+/    |            +-----------+
;  |          |           |           /     |            |           |
;  |          |           |                 |            |           |
;  +----------+-----------+                 +------------+-----------+
(defun split-v-3 ()
  "Change 3 window style from horizontal to vertical"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList))))))
	  (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)
	  (delete-other-windows)
	  (split-window-horizontally)
	  (set-window-buffer nil 1stBuf)
	  (other-window 1)
	  (set-window-buffer nil 2ndBuf)
	  (split-window-vertically)
	  (set-window-buffer (next-window) 3rdBuf)
	  (select-window (get-largest-window))
	  ))))

;  +------------+-----------+                  +----------------------+
;  |            |           |            \     |                      |
;  |            |           |    +-------+\    |                      |
;  |            +-----------+    +-------+/    +----------+-----------+
;  |            |           |            /     |          |           |
;  |            |           |                  |          |           |
;  +------------+-----------+                  +----------+-----------+

(defun split-h-3 ()
  "Change 3 window style from vertical to horizontal"
  (interactive)

  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList))))))
	  (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)

	  (delete-other-windows)
	  (split-window-vertically)
	  (set-window-buffer nil 1stBuf)
	  (other-window 1)
	  (set-window-buffer nil 2ndBuf)
	  (split-window-horizontally)
	  (set-window-buffer (next-window) 3rdBuf)
	  (select-window (get-largest-window))
	  ))))

;  +------------+-----------+                 +------------+-----------+
;  |            |           |            \    |            |           |
;  |            |           |    +-------+\   |            |           |
;  +------------+-----------+    +-------+/   +------------+           |
;  |                        |            /    |            |           |
;  |                        |                 |            |           |
;  +------------+-----------+                 +------------+-----------+
;  +------------+-----------+                 +------------+-----------+
;  |            |           |            \    |            |           |
;  |            |           |    +-------+\   |            |           |
;  |            +-----------+    +-------+/   +------------+-----------+
;  |            |           |            /    |                        |
;  |            |           |                 |                        |
;  +------------+-----------+                 +------------+-----------+

(defun change-split-type-3 ()
  "Change 3 window style from horizontal to vertical and vice-versa"
  (interactive)

  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList)))))

	      (split-3
	       (lambda(1stBuf 2ndBuf 3rdBuf split-1 split-2)
		 "change 3 window from horizontal to vertical and vice-versa"
		 (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)

		 (delete-other-windows)
		 (funcall split-1)
		 (set-window-buffer nil 2ndBuf)
		 (funcall split-2)
		 (set-window-buffer (next-window) 3rdBuf)
		 (other-window 2)
		 (set-window-buffer nil 1stBuf)))

	      (split-type-1 nil)
	      (split-type-2 nil)
	      )
	  (if (= (window-width) (frame-width))
	      (setq split-type-1 'split-window-horizontally
		    split-type-2 'split-window-vertically)
	    (setq split-type-1 'split-window-vertically
		  split-type-2 'split-window-horizontally))
	  (funcall split-3 1stBuf 2ndBuf 3rdBuf split-type-1 split-type-2)

	  ))))

(global-set-key (kbd "C-x 4 c") (quote change-split-type-3))

;;==================== buffer =====================

;  +------------+-----------+                   +------------+-----------+
;  |            |     C     |            \      |            |     A     |
;  |            |           |    +-------+\     |            |           |
;  |     A      |-----------|    +-------+/     |     B      |-----------|
;  |            |     B     |            /      |            |     C     |
;  |            |           |                   |            |           |
;  +------------+-----------+                   +------------+-----------+
;
;  +------------------------+                   +------------------------+
;  |           A            |           \       |           B            |
;  |                        |   +-------+\      |                        |
;  +------------+-----------+   +-------+/      +------------+-----------+
;  |     B      |     C     |           /       |     C      |     A     |
;  |            |           |                   |            |           |
;  +------------+-----------+                   +------------+-----------+

(defun roll-v-3 (&optional arg)
  "Rolling 3 window buffers (anti-)clockwise"
  (interactive "P")
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stWin (car winList))
	      (2ndWin (car (cdr winList)))
	      (3rdWin (car (last winList))))
	  (let ((1stBuf (window-buffer 1stWin))
		(2ndBuf (window-buffer 2ndWin))
		(3rdBuf (window-buffer 3rdWin)))
	    (if arg (progn
					; anti-clockwise
		      (set-window-buffer 1stWin 3rdBuf)
		      (set-window-buffer 2ndWin 1stBuf)
		      (set-window-buffer 3rdWin 2ndBuf))
	      (progn                                      ; clockwise
		(set-window-buffer 1stWin 2ndBuf)
		(set-window-buffer 2ndWin 3rdBuf)
		(set-window-buffer 3rdWin 1stBuf))
	      ))))))

(global-set-key (kbd "C-x 4 r")  (quote roll-v-3))
;;-------------------- window -------------------

(provide 'window-setting)


;;=====================================
;;-------------------------------------
;;  *****       *     *                 
;;    *         *     *                 
;;    *    ***  ****  ****   ***   ***  
;;    *       * *   * *   *     * *   * 
;;    *    **** *   * *   *  **** *     
;;    *   *   * *   * *   * *   * *     
;;    *    **** ****  ****   **** *     
;;-------------------------------------
;;=====================================
;;tabbar mode 
(add-to-list 'load-path "~/.emacs.d/UIDesign/tabbar")   
    (require 'tabbar)
(tabbar-mode 1)
(setq tabbar-ruler-global-tabbar 't);If you want tabbar
(setq tabbar-ruler-global-ruler 't);If you want a global ruler
;(setq tabbar-ruler-popup-menu 't);If you want a popup menu
;(setq tabbar-ruler-popup-toolbar 't);If you want a popup toolbar
;(require 'tabbar-ruler) 

;**************************************
;设置tabbar外观（方案一）
;**************************************
;;设置默认主题；字体；背景和前景颜色，大小
(set-face-attribute 'tabbar-default nil
                    :family "Vera Sans YuanTi Mono"
                    :background "gray80"
                    :foreground "gray30"
                    :height 1.0
                    )
;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "steelblue")
                    )
;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "DarkGreen"
                    :background "LightGoldenrod"
                    :box '(:line-width 2 :color "DarkGoldenrod")
                    \:overline "black"
                    :underline "black"
                    :weight 'bold
                    )
;; 设置非当前tab外观：外框大小和颜色
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 2 :color "#00B2BF")
                    )



(global-set-key [(meta j)] 'tabbar-backward)  
(global-set-key [(meta k)] 'tabbar-forward)
(global-set-key [(control meta j)] 'tabbar-backward-group)
(global-set-key [(control meta k)] 'tabbar-forward-group)
;;set group strategy
(defun tabbar-buffer-groups ()  
  "tabbar group"  
  (list  
   (cond  
    ((memq major-mode '(shell-mode dired-mode))  
     "shell"  
     )  
    ((memq major-mode '(c-mode c++-mode))  
     "cc"  
     )  
    ((eq major-mode 'python-mode)  
     "python"  
     )  
    ((memq major-mode
	   '(php-mode nxml-mode nxhtml-mode))
     "WebDev"
     )
    ((eq major-mode 'emacs-lisp-mode)
      "Emacs-lisp"
      )
    ((memq major-mode
	   '(tex-mode latex-mode text-mode snippet-mode))
     "Text"
     )
    ((string-equal "*" (substring (buffer-name) 0 1))  
     "emacs"  
     )  
    (t  
     "other"  
     )  
    )))  
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
;;;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
;;(set-face-attribute 'tabbar-default nil
;;                    :family "Vera Sans YuanTi Mono"
;;                    :background "gray80"
;;                    :foreground "gray10"
;;                    :height 1.0
;;                    )
;; 设置左边按钮外观：外框框边大小和颜色
;;(set-face-attribute 'tabbar-button nil
;;                    :inherit 'tabbar-default
;;                    :box '(:line-width 1 :color "gray30")
;;                    )
;; 设置当前tab外观：颜色，字体，外框大小和颜色
;;(set-face-attribute 'tabbar-selected nil
;;                    :inherit 'tabbar-default
;;                    :foreground "DarkGreen"
;;                    :background "LightGoldenrod"
;;                    :box '(:line-width 2 :color "DarkGoldenrod")
;;                    ;; :overline "black"
;;                    ;; :underline "black"
;;                    :weight 'bold
;;                    )
;; 设置非当前tab外观：外框大小和颜色
;;(set-face-attribute 'tabbar-unselected nil
;;                    :inherit 'tabbar-default
;;                    :box '(:line-width 2 :color "gray70")
;;                    )
;; cancel grouping
;;(setq tabbar-buffer-groups-function
;;    (lambda (b) (list “All Buffers”)))
;;(setq tabbar-buffer-list-function
;;    (lambda ()
;;        (remove-if
;;          (lambda(buffer)
;;             (find (aref (buffer-name buffer) 0) ” *”))
;;          (buffer-list))))

;;禁用启动信息
;(setq inhibit-startup-message t)








;;===============================
;;-------------------------------
;;   ****           *             
;;  *               *        *    
;;  *      ***   ****  ***  ***** 
;;  *     *   * *   * *   *  *    
;;  *     ***** *   * *****  *    
;;  *     *     *   * *      *    
;;   ****  ****  ****  ****   *** 
;;-------------------------------
;;===============================
(add-to-list 'load-path "~/.emacs.d/Coding/cedet-1.1/common")
(add-to-list 'load-path "~/.emacs.d/Coding/cedet-1.1/semantic")

(require 'cedet)
(require 'semantic-ia)

;; Enable EDE (Project Managment) features
(global-ede-mode 1)


;;Enable SRecode (Template Management) minor-mode
(global-srecode-minor-mode 1)

;; ==================== semantic ====================
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)


;;-------------------- cedet --------------------

;; code folding
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))


;; jump to definition
(global-set-key [f12] 'semantic-ia-fast-jump)

;; go back
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;;(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol)
;; -------------------- semantic --------------------

;; ==================== gud ====================

(gud-tooltip-mode 1)
(add-hook 'gdb-mode-hook '(lambda ()
                            (define-key c-mode-base-map [(f11)] 'gud-step) ; step in
                            (define-key c-mode-base-map [(f10)] 'gud-next) ; step out
                            (define-key c-mode-base-map [(f5)] 'gud-go)
                            (define-key c-mode-base-map [(shift f5)] 'gud-cont)
                            (define-key c-mode-base-map [(control f5)] 'gud-until) ; run to here
                            (define-key c-mode-base-map [(f9)] 'gud-break) ; set break point
                            (define-key c-mode-base-map [(control f9)] 'gud-remove) ; remove break point
                            (define-key c-mode-base-map [(shitf f11)] 'gud-finish) ; jump out of the function
	  )) 

(global-set-key [f10] 'gud-next)

;; -------------------- gud --------------------


;; compile
(setq compilation-read-command nil)	;don't prompt to press ENTER
(global-set-key [(f7)] (lambda()
			 (interactive)
			 (save-some-buffers t)	   ;save all buffers
			 (compile compile-command) ;compile
			 ))

(global-set-key [f4] 'eshell)
(global-set-key [(shift f4)] 'shell)

;;自定义的代码风格
(defconst my-c-style
  '("stroustrup" ;;基于现有的代码风格进行修改。
    (c-offsets-alist . (;(access-label . -)
			(inclass . ++)
			(inline-open . 0)
			;(case-label . +)
			(statement-case-intro . +))))
  "My Programming Style")
;; 将自定义的代码风格加入到列表中
(c-add-style "my" my-c-style)

;; microsoft style
(c-add-style "microsoft"
              '("stroustrup"
                (c-offsets-alist
                 (innamespace . -)
                 (inline-open . 0)
                 (inher-cont . c-lineup-multi-inher)
                 (arglist-cont-nonempty . +)
                 (template-args-cont . +))))
;(setq c-default-style "microsoft")

;定制C/C++缩进风格
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
	     (setq c-basic-offset 4)
	     (setq tab-width 4)
	     (setq-default indent-tabs-mode nil)
	     ;(setq indent-tabs-mode nil)
	     ))
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "microsoft")
	     (set (make-local-variable 'ac-auto-start) nil) ;; shut down ac-auto-start in c++-mode
	     ))



(setq tab-width 4)
;; 设置缩进字符数
(setq c-basic-offset 4)
;(setq-default indent-tabs-mode nil)

(global-set-key [(f5)] 'speedbar)






;;================================================================================
;;--------------------------------------------------------------------------------
;;  *   *                     *                           
;;  *   *                                            *    
;;   * *   ***   ****  ***  ***   ****  ****   ***  ***** 
;;    *       * *     *   *   *   *   * *   * *   *  *    
;;    *    ****  ***  *   *   *   ****  ****  *****  *    
;;    *   *   *     * *   *   *   *     *     *      *    
;;    *    **** ****  *   * ***** *     *      ****   *** 
;;-------------------------------------------------------------------------------- 
;;================================================================================
(add-to-list 'load-path "~/.emacs.d/Coding/yasnippet")
    (require 'yasnippet)
    (yas/initialize)
    (yas/load-directory "~/.emacs.d/Coding/yasnippet/snippets")
    (setq yas/trigger-key(kbd "M-["))
;;-------------------- yasnippt --------------------
(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")
 
(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white")))
  "Face for the yasnippet selected candidate.")
 
(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face))
  "Source for Yasnippet.") 





;;============================================================
;;------------------------------------------------------------
;;  *****   *                                                   
;;    *                                  *                      
;;    *   ***    * *   ***         **** *****  ***   * *  ****  
;;    *     *   * * * *   * ***** *      *        * * * * *   * 
;;    *     *   * * * *****        ***   *     **** * * * ****  
;;    *     *   * * * *               *  *    *   * * * * *     
;;    *   ***** * * *  ****       ****    ***  **** * * * *     
;;-------------------------------------------------------------
;;=============================================================
;;打开time-stamp功能，将time-stamp加入write-file-hooks，就能在每次保存
;;文件时自动更新time-stamp
(add-hook 'write-file-hooks 'time-stamp)
;;设置time-stamp格式
;;说明：
;; %:u，更新时用登录Linux的用户名替换
;; %04y-%02m-%02d，更新时以“YYYY-MM-DD”的格式显示年月日
;; %02H:%02M:%02S，更新时以“HH:MM:SS”的格式显示时分秒
(setq time-stamp-format
     "由 %:u修改 时间：%04y-%02m-%02d %02H:%02M:%02S"
     time-stamp-active t
     time-stamp-warn-inactive t)
;;更改时间戳标识符Time-stamp
;;(setq time-stamp-start "time-stamp:[     ]+\\\\?")
;;                (setq time-stamp-end: "\n")




;;==================== doxymacs ====================
;;--------------------------------------------------
;;  ****                                      
;;  *   *                                     
;;  *   *  ***  *   * *   *  * *   ***  *   * 
;;  *   * *   *  * *  *   * * * *     *  * *  
;;  *   * *   *   *    **** * * *  ****   *   
;;  *   * *   *  * *      * * * * *   *  * *  
;;  ****   ***  *   *  ***  * * *  **** *   * 
;;--------------------------------------------------
;;      +------------+            +------------+          +------------+
;;      |  coding    |----------->| commenting |--------->| generating |
;;      |            |            |            |          | documents  |
;;      +------------+            +------------+          +------------+
;; +---------+----------------------------------------------------------------------+
;; |C-c d ?  |从符号表中查找当前光标所在内容的文档（需要指定doxymacs-doxygen-dirs） |
;; +---------+----------------------------------------------------------------------+
;; |C-c d r  |重新扫描 Doxygen 的 tags 文件                                         |
;; +---------+----------------------------------------------------------------------+
;; |C-c d f  |为所在位置之后的那个函数插入注释（注意是在当前光标处插入，最好在函数  |
;; |         |上方的空行处使用，插入前先对好齐）                                    |
;; |         |                                                                      |
;; +---------+----------------------------------------------------------------------+
;; |C-c d i  |为当前文件插入注释（内容包括文件名、作者、日期和简介）                |
;; |         |                                                                      |
;; +---------+----------------------------------------------------------------------+
;; |C-c d ;  |为当前行的成员变量插入注释（类似M-;，但是格式不同）                   |
;; +---------+----------------------------------------------------------------------+
;; |C-c d m  |插入空白的多行注释，这个就在单纯是想要注释的时候用了                  |
;; +---------+----------------------------------------------------------------------+
;; |C-c d s  |插入空白的单行注释，和上面那个差不多                                  |
;; +---------+----------------------------------------------------------------------+
;; |C-c d @  |插入分组注释。所谓分组注释就是将某个范围内的代码看作一组，生成文档时  |
;; |         |会单独归在一个组下。使用时要先选中想分组的那部分代码                  |
;; +---------+----------------------------------------------------------------------+
(add-to-list 'load-path "~/.emacs.d/Coding/doxymacs-1.8.0/lisp")
(require 'doxymacs)
;;命令doxymacs-mode就可以启动，让doxymacs-mode随着c/c++ mode自动启动
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(defconst doxymacs-C++-file-comment-template
 '(
   "/******************************************************************************" > n
   "*" > n
   "* " "FILE NAME   :"
   (if (buffer-file-name)
	   (file-name-nondirectory (buffer-file-name))
	 "") > n
   "*" > n
   "*" " DESCRIPTION :"> n
   "*" > n
   "*" "	"> n
   "*" > n
   "*" " HISTORY	 :"> n
   "*" > n
   "*" "	See Log at end of file"> n
   "*" > n
   "*" "Copyright (c) 2012, Prince.me, oliver.lee.me@gmail.com."> n
   "*" "******************************************************************************/"> n)
 "Default C++-style template for file documentation.")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doxymacs-doxygen-style "C++"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;;power-line settings
(add-to-list 'load-path "~/.emacs.d/Coding/powerline")
(require 'powerline)

;; el-get settings
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

;; calfw calendar
(require 'calfw)

;; zencoding settings
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
