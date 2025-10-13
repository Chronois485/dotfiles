# instalation script for my config

echo "Making backups..."

cp ~/.config/hypr ./hypr.bakup
cp ~/.config/nvim ./nvim.bakup
cp ~/.config/omarchy ./omarchy.bakup
cp ~/.config/walker ./walker.bakup
cp ~/.config/waybar ./waybar.bakup
cp ~/.zshrc ./zshrc.bakup

echo "Deleting old config..."

rm ~/.config/hypr
rm ~/.config/nvim
rm ~/.config/omarchy
rm ~/.config/walker
rm ~/.config/waybar
rm ~/.zshrc

echo "Replacing it with new config..."

cp ./hypr ~/.config/hypr
cp ./nvim ~/.config/nvim
cp ./omarchy ~/.config/omarchy
cp ./walker ~/.config/walker
cp ./waybar ~/.config/waybar
cp ./zshrc ~/.zshrc

echo "Changing your shell to zsh..."

chsh $USER -s /bin/zsh

echo "Done!"

echo "Please reboot your pc to complete changes"
