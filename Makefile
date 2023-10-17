.PHONY: link clean

link:
	-@ln -s $(PWD)/.emacs ~/.emacs
	-@ln -s $(PWD)/.emacs.rc ~/.emacs.rc

clean:
	-@rm ~/.emacs
	-@rm ~/.emacs.rc
