# Linux File & Permission Management

## 1. File & Directory Operations
- Create file:  
  ```bash
  touch file1.txt```

- Create directory:  
  ```bash
  mkdir dir1```

- Copy & move:  
  ```bash
  cp file1.txt dir1/```  
  ```bash
  mv file1.txt file2.txt```

- Delete:  
  ```bash
  rm file2.txt```  
  ```bash
  rmdir dir1```

---

## 2. File Viewing & Editing
- View content:  
  ```bash
  cat file1.txt```  
  ```bash
  less file1.txt```  
  ```bash
  head -n 10 file1.txt```  
  ```bash
  tail -f logfile.log```

- Edit:  
  ```bash
  nano file1.txt```  
  ```bash
  vim file1.txt```

---

## 3. File Permissions (rwx)
- View permissions:  
  ```bash
  ls -l```

- Example output:  
  ```bash
  -rw-r--r-- 1 user group 123 Sep 8 10:00 file1.txt```

- Change permission:  
  ```bash
  chmod 755 script.sh```  
  ```bash
  chmod u+x file1.txt```

- Change ownership:  
  ```bash
  sudo chown newuser:newgroup file1.txt```

---

## 4. Special Permissions
- SUID: run with file owner's privileges  
  ```bash
  chmod u+s file```

- SGID: run with group privileges/shared dirs  
  ```bash
  chmod g+s shared_dir```

- Sticky bit: restrict delete to file owner  
  ```bash
  chmod +t /shared```

---

## 5. Access Control Lists (ACL)
- View ACL:  
  ```bash
  getfacl file1.txt```

- Add permissions for another user:  
  ```bash
  setfacl -m u:alice:r file1.txt```

- Remove ACL:  
  ```bash
  setfacl -x u:alice file1.txt```

---

## 6. Search & Find Files
- Find by name:  
  ```bash
  find /home -name "*.txt"```

- Find by size:  
  ```bash
  find /var -size +100M```

- Locate (index-based):  
  ```bash
  locate passwd```

- Search inside files:  
  ```bash
  grep "ERROR" logfile.log```


