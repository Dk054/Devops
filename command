# git config --global user.name "dk"
git fetch
find .git/objects -size 0 -delete

#добавить текущего пользователя в специальную группу docker
sudo usermod -aG docker dk54
#reboot
newgrp docker














