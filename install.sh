echo "Creating backups"
cp ~/.config/hypr ~/.config/hypr.bak -r
cp ~/.config/nvim ~/.config/nvim.bak -r
cp ~/.config/omarchy ~/.config/omarchy.bak -r
cp ~/.config/walker ~/.config/walker.bak -r
cp ~/.config/waybar ~/.config/waybar.bak -r
cp ~/.zshrc ~/.zshrc.bak
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
cp ./fonts/* ~/.local/share/fonts/
echo "Launching full system update"
sudo pacman -Syu --noconfirm
echo "Installing needed packages"
sudo pacman -S --noconfirm zsh cava cmatrix fzf thefuck eza zoxide walker waybar neovim elephant python npm nodejs lua figlet btop networkmanager rust proton-vpn-gtk-app telegram-desktop tlpui
echo "Installing AUR packages"
yay -S --noconfirm tenki gazelle-tui
echo "Setting zsh as main terminal"
sudo chsh --shell /usr/bin/zsh $USER
echo "Switching from iwd to network manager"
sudo systemctl disable iwd.service
sudo systemctl enable NetworkManager-initrd.service
sudo systemctl enable NetworkManager.service
echo "All done!"
echo "Reboot pc to confirm changes" 
