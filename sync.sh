echo "Creating backups"
mv hypr ./hypr.bak
mv ./nvim ./nvim.bak
mv ./omarchy ./omarchy.bak
mv ./walker ./walker.bak
mv ./waybar ./waybar.bak
mv ./fonts ./fonts.bak
mv ./zshrc ./zshrc.bak
echo "Copying new config"
cp ~/.config/hypr ./ -r
cp ~/.config/nvim ./ -r
cp ~/.config/omarchy ./ -r
cp ~/.config/walker ./ -r
cp ~/.config/waybar ./ -r
cp ~/.local/share/fonts ./ -r
cp ~/.zshrc ./zshrc
echo "Deleting other git repos"
find ./omarchy -type d -name ".git" -exec rm -rf {} +
