echo "Creating backups"
cp "./hypr" "./hypr.bak" -r
cp "./nvim" "./nvim.bak" -r
cp "./omarchy" "./omarchy.bak" -r
cp "./walker" "./walker.bak" -r
cp "./waybar" "./waybar.bak" -r
cp "./zshrc" "./zshrc.bak"
echo "Deleting old config"
rm "./hypr" -r
rm "./nvim" -r
rm "./omarchy" -r
rm "./walker" -r
rm "./waybar" -r
rm "./zshrc"
echo "Copying new config"
cp ~/.config/hypr ./ -r
cp ~/.config/nvim ./ -r
cp ~/.config/omarchy ./ -r
cp ~/.config/walker ./ -r
cp ~/.config/waybar ./ -r
cp ~/.zshrc ./zshrc
echo "Deleting other git repos"
find ./omarchy -type d -name ".git" -exec rm -rf {} +
