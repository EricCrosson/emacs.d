all:
	emacs --batch --eval '(progn (find-file "init.org") (org-babel-tangle))'

test: all
	emacs --version
	emacs -nw --batch --eval '(let ((debug-on-error t) \
															(url-show-status nil) \
															(user-emacs-directory "~/.emacs.d/") \
															(package-user-dir (expand-file-name (concat "elpa-" emacs-version))) \
															(user-init-file (expand-file-name "~/.emacs.d/init.el")) \
															(load-path (delq default-directory load-path))) \
													 (load-file user-init-file) \
													 (run-hooks (quote after-init-hook)))'
