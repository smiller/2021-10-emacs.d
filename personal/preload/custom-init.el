;;change highlight colour
;; http://pragmaticemacs.com/installing-and-setting-up-emacs/
(set-face-attribute 'region t :background "#164040")

(global-visual-line-mode t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'hydra)
(require 'hydra)

;; https://thewanderingcoder.com/2015/03/automating-boilerplate-in-org-mode-journalling/
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Parsing.html
(defun my/insert-line ()
  "insert line"
  (interactive)
  (end-of-line)
  (newline)
  )

(defun my/date-header ()
  "insert date-header"
  (my/insert-line)
  (insert "### " (format-time-string "%A %-e %B %Y")  " ###\n\n")
  )

(defun my/timestamp ()
  "insert timestamp"
  (my/insert-line)
  (insert "" (format-time-string "%-k.%M")  " ~ ")
  )

(defun my/date-and-time ()
  "insert date-header and timestamp"
  (my/date-header)
  (forward-line -1)
  (my/timestamp)
  )

(global-set-key
 (kbd "C-c m")
 (defhydra hydra-meta-journal (:color blue)
   "meta-journal"
   ("b" (my/date-and-time) "date-header with timestamp")
   ("d" (my/date-header) "date-header")
   ("t" (my/timestamp) "timestamp")))

;; ripgrep and rg needed for projectile
(straight-use-package 'ripgrep)
(require 'ripgrep)

(straight-use-package 'rg)
(require 'rg)

(global-set-key
 (kbd "C-c q")
 (defhydra hydra-quotatons (:color blue)
   "quotations"
   ("do" (insert "°") "°")
   ("j" (insert "«") "«")
   ("k" (insert "»") "»")
   ("go" (insert "„") "„")
   ("gc" (insert "“") "“")
   ("ms" (insert "♯") "♯")
   ("mf" (insert "♭") "♭")
   ("mn" (insert "♮") "♮")
   ("dh" (insert "ð") "ð")
   ("dm" (insert " — ") " — ")
   ("ns" (insert "'") "nonsmart '")
   ("nd" (insert "\"") "nonsmart \"")
   ("." (insert "…") "…")
   ("y" (insert "ʓ") "ʓ")
   ("ea" (insert "é") "é")
   ("Ea" (insert "É") "É")
   ("eg" (insert "è") "è")
   ("em" (insert "ē") "ē")
   ("-" (insert "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ") "- - - line")
   ("fb" (find-file "~/Dropbox/m/books.md") "books")
   ("fe" (find-file "~/.emacs.d/personal/preload/custom-init.el") "emacs")
   ("fo" (find-file "~/2021.emacs.d/init.el") "old-emacs")
   ("fh" (find-file "~/Dropbox/m/gesta/2022/2022.md") "hodie")
   ("fj" (find-file "~/Dropbox/m/gesta/2020/japanese.md") "japanese")
   ("fs" (find-file "~/Dropbox/m/seans_books.md") "seans_books")
   ("fz" (find-file "~/.zshrc") ".zshrc")
   ("ig" (insert "ì") "ì")
   ("oe" (insert "œ") "œ")
   ("th" (insert "þ") "þ")
   ("ug" (insert "ù") "ù")
   ))

(add-hook 'text-mode-hook 'turn-on-smart-quotes)
