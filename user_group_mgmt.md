## 1. User Management
- Check current user:
  ```bash
  whoami```
  id```
  groups```

- Add new user:
  ```bash
  sudo adduser alice```

- Modify user (add to group):
  ```bash
  sudo usermod -aG devteam alice```

- View user info:
  ```bash
  getent passwd alice```
  id alice```

- Delete user:
sudo deluser alice
sudo deluser --remove-home alice   # remove home dir as well

## Group Management
- Create new group:
sudo groupadd devteam

- Check group details:
getent group devteam

- Add user to group:
sudo usermod -aG devteam alice

- Remove user from group:
sudo deluser alice devteam

- Delete group:
sudo groupdel devteam

## Shared Directory with SGID
- Create shared dir for group:
sudo mkdir /devteam-share
sudo chown :devteam /devteam-share
sudo chmod 770 /devteam-share

- Enable SGID (new files inherit group):
sudo chmod g+s /devteam-share
ls -ld /devteam-share

## Sticky Bit
- Create shared folder (like /tmp):
sudo mkdir /shared
sudo chmod 1777 /shared

- Result:
All users can create files, but only the file owner or root can delete them.

## Summary
adduser, usermod, deluser → manage users.

groupadd, groupdel, usermod -aG → manage groups.

SGID → ensures group consistency inside shared folders.

Sticky Bit → protects files in shared directories.
