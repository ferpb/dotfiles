# dotfiles

Estos son mis dotfiles.

Están a la espera de ser ordenados un poco y de hacer un script o utilizar algún programa como Stow que los despliegue automáticamente en una máquina.

Por ahora, se pueden crear enlaces simbólicos a mano con los ficheros necesarios. Por ejemplo, para enlazar `.bashrc`:
```
ln -s ~/dotfiles/.bashrc ~/.basrhc
```

Siéntete libre de coger cualquier trozo de código que te parezca interesante.

## Enlaces simbólicos
No olvidarse de realizar backups antes de enlazar los ficheros.

```
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.inputrc ~/.inputrc

ln -s ~/dotfiles/.gitconfig ~/.gitconfig  # Cuidado

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotifles/.vim ~/.vim

ln -s ~/dotfiles/.emacs.d ~/.emacs.d

ln -s ~/dotfiles/.config/karabiner ~/.config/karabiner

ln -s ~/dotfiles/Internacional-adaptado.bundle ~/Library/Keyboard\ Layouts/Internacional-adaptado.bundle
