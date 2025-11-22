echo "Creating backups"
cp "~/.config/hypr" "~/.config/hypr.bak" -r
cp "~/.config/nvim" "~/.config/nvim.bak" -r
cp "~/.config/omarchy" "~/.config/omarchy.bak" -r
cp "~/.config/walker" "~/.config/walker.bak" -r
cp "~/.config/waybar" "~/.config/waybar.bak" -r
cp "~/.zshrc" "~/.zshrc.bak"
echo "Deleting old config"
rm ~/.config/hypr -r
rm ~/.config/nvim -r
rm ~/.config/omarchy -r
rm ~/.config/walker -r
rm ~/.config/waybar -r
rm ~/.zshrc
echo "Applying new config"
cp ./hypr ~/.config/hypr -r
cp ./nvim ~/.config/nvim -r
cp ./omarchy ~/.config/omarchy -r
cp ./walker ~/.config/walker -r
cp ./waybar ~/.config/waybar -r
cp ./zshrc ~/.zshrc
echo "Launching full system update"
sudo pacman -Syu --noconfirm
echo "Installing needed packages"
sudo pacman -S --noconfirm zsh cava cmatrix fzf thefuck eza zoxide walker waybar neovim elephant python npm nodejs lua figlet btop
echo "Installing AUR packages"
yay -S --noconfirm tenki
echo "Setting zsh as main terminal"
sudo chsh --shell /usr/bin/zsh $USER
echo "All done!"
echo "Reboot pc to confirm changes" 
