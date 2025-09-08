# Linux File & Permission Management

## 1. File & Directory Operations
- Create file:  
  ```bash
  touch file1.txt

- Create directory:
  ```bash
  mkdir dir1

- Copy & move:
  ```bash
  cp file1.txt dir1/
  mv file1.txt file2.txt

- Delete:
  ```bash
  rm file2.txt
  rmdir dir1

## 2. File Viewing & Editing
- View content:
cat file1.txt
less file1.txt
head -n 10 file1.txt
tail -f logfile.log

- Edit:
nano file1.txt
vim file1.txt

## 3. File Permissions (rwx)
- View permissions:
ls -l

Example output:
-rw-r--r-- 1 user group 123 Sep 8 10:00 file1.txt

- Change permission:
chmod 755 script.sh    # numeric mode
chmod u+x file1.txt    # symbolic mode

- Change ownership:
sudo chown newuser:newgroup file1.txt

## Special Permissions
- SUID: run with file owner's privileges
chmod u+s file

- SGID: run with group privileges/shared dirs
chmod g+s shared_dir

- Sticky bit: restrict delete to file owner
chmod +t /shared

## Access Control Lists (ACL)
- View ACL:
getfacl file1.txt

- Add permissions for another user:
setfacl -m u:alice:r file1.txt

- Remove ACL:
setfacl -x u:alice file1.txt

## Search & Find Files
- Find by name:
find /home -name "*.txt"

- Find by size:
find /var -size +100M

- Locate (index-based):
locate passwd

- Search inside files:
grep "ERROR" logfile.log

