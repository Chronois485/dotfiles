echo "Creating backups"
cp "~/.config/hypr" "~/.config/hypr.bak" -r
cp "~/.config/nvim" "~/.config/nvim.bak" -r
cp "~/.config/omarchy" "~/.config/omarchy.bak" -r
cp "~/.config/walker" "~/.config/walker.bak" -r
cp "~/.config/waybar" "~/.config/waybar.bak" -r
cp "~/.zshrc" "~/.zshrc.bak"
echo "Deleting old config"
rm "~/.config/hypr" -r
rm "~/.config/nvim" -r
rm "~/.config/omarchy" -r
rm "~/.config/walker" -r
rm "~/.config/waybar" -r
rm "~/.zshrc"