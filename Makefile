.PHONY: link clean

link:
	-@ln -s $(PWD)/.emacs ~/.emacs
	-@ln -s $(PWD)/.emacs.rc ~/.emacs.rc
	-@ln -s $(PWD)/.emacs.sc ~/.emacs.sc

clean:
	-@rm ~/.emacs
	-@rm ~/.emacs.rc
	-@rm ~/.emacs.sc
