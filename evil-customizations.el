(defun evil-space-del (statemap)
  (define-key statemap (kbd "SPC") (lambda ()
				     (interactive)
				     (next-line 10)
				     (evil-scroll-line-down 10))))
(evil-space-del evil-normal-state-map)
(evil-space-del evil-visual-state-map)

; make evil work for org-mode!
(evil-define-key 'normal org-mode-map "O" (lambda ()
                     (interactive)
                     (end-of-line)
                     (org-insert-heading)
                     (evil-append nil)
                     ))

(defun always-insert-item ()
     (interactive)
     (if (not (org-in-item-p))
       (insert "\n- ")
       (org-insert-item)))

(evil-define-key 'normal org-mode-map "O" (lambda ()
                     (interactive)
                     (end-of-line)
                     (org-insert-heading)
                     (evil-append nil)
                     ))
(evil-define-key 'normal org-mode-map "o" (lambda ()
                     (interactive)
                     (end-of-line)
                     (always-insert-item)
                     (evil-append nil)
                     ))
(evil-define-key 'normal org-mode-map "t" (lambda ()
                     (interactive)
                     (end-of-line)
                     (org-insert-todo-heading nil)
                     (evil-append nil)
                     ))
(evil-define-key 'normal org-mode-map (kbd "M-o") (lambda ()
                     (interactive)
                     (end-of-line)
                     (org-insert-heading)
                     (org-metaright)
                     (evil-append nil)
                     ))
(evil-define-key 'normal org-mode-map (kbd "M-t") (lambda ()
                     (interactive)
                     (end-of-line)
                     (org-insert-todo-heading nil)
                     (org-metaright)
                     (evil-append nil)
                     ))
(evil-define-key 'normal org-mode-map "T" 'org-todo) ; mark a TODO item as DONE
(evil-define-key 'normal org-mode-map ";a" 'org-agenda) ; access agenda buffer
(evil-define-key 'normal org-mode-map "-" 'org-cycle-list-bullet) ; change bullet style
(evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle) ; cycle

; allow us to access org-mode keys directly from Evil's Normal mode
(evil-define-key 'normal org-mode-map "L" 'org-shiftright)
(evil-define-key 'normal org-mode-map "H" 'org-shiftleft)
(evil-define-key 'normal org-mode-map "K" 'org-shiftup)
(evil-define-key 'normal org-mode-map "J" 'org-shiftdown)
(evil-define-key 'normal org-mode-map (kbd "M-l") 'org-metaright)
(evil-define-key 'normal org-mode-map (kbd "M-h") 'org-metaleft)
(evil-define-key 'normal org-mode-map (kbd "M-k") 'org-metaup)
(evil-define-key 'normal org-mode-map (kbd "M-j") 'org-metadown)
(evil-define-key 'normal org-mode-map (kbd "M-L") 'org-shiftmetaright)
(evil-define-key 'normal org-mode-map (kbd "M-H") 'org-shiftmetaleft)
(evil-define-key 'normal org-mode-map (kbd "M-K") 'org-shiftmetaup)
(evil-define-key 'normal org-mode-map (kbd "M-J") 'org-shiftmetadown)

;; The following will create a minor mode foo-mode with Normal
;; state bindings for the keys w and e:
;;      (define-minor-mode foo-mode
;;        "Foo mode."
;;        :keymap (make-sparse-keymap))
;;      (evil-define-key ’normal foo-mode-map "w" ’bar)
;;      (evil-define-key ’normal foo-mode-map "e" ’baz)
;; This minor mode can then be enabled in any buffers where the
;; custom bindings are desired:
;;     (add-hook ’text-mode-hook ’foo-mode) ; enable alongside text-mode
;;
;; Define a command with command properties keyword-args.
;;   (evil-define-command command (args. . .) doc keyword-args. . . body. . .)

