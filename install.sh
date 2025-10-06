echo "Creating backups..."

cp ~/.config/nvim ./nvim.bak -r
cp ~/.zshrc ./.zshrc.bak -r
cp ~/.config/omarchy ./omarchy.bak -r
cp ~/.config/walker ./walker.bak -r
cp ~/.config/waybar ./waybar.bak -r

echo "Deleting old config..."

rm ~/.config/nvim ~/.config/omarchy ~/.config/walker/config.toml ~/.config/waybar/config.jsonc -r

echo "Applying new config..."

cp ./nvim ~/.config/ -r
cp ./.zshrc ~/.zshrc -r 
cp ./omarchy ~/.config/ -r
cp ./walker ~/.config/ -r 
cp ./waybar ~/.config/ -r

echo "Everything is done!"
