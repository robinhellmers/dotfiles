declare -a files=(.config/nvim/init.vim .vimrc .vim .tmux.conf .inputrc .gitconfig)

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/autoload

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done
