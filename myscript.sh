#!/bin/bash

echo "Savina Ulyana"
echo "Program name: Working with the file"
echo "By selecting the type of operation, you can create, move or delete a file"

while true; do
  echo "Select the type of operation on the file"
  echo "1: Create"
  echo "2: Remove"
  echo "3: Move"
  
  read -p " Operation number " operation
  
  case $operation in
   1) # Создание файла
     read -p "Enter the name of the new file:" filename
     
     if [ -f "$filename" ]; then 
        echo " The file with the name $filename already exists"
        continue
     fi
     touch "$filename"
     echo "A new file has been created: $filename"
     ;;
     
   2) # Удаление файла
      read -p "Enter the name of the file to delete:" filename
      
      if [ ! -f "$filename" ]; then
         echo "There is no file with this name"
         continue
      fi
      
      rm "$filename"
      echo "Successful file deletion $filename"
      ;;
      
    3) # Перемещение файла
       read -p "Enter the file name to move:" filename
       
       if [ ! -f "$filename" ]; then
         echo "There is no file with this name"
         continue
       fi
       
       read -p "Enter the path to the directory:" directory
       
       if [ ! -d "$directory" ]; then
         echo "Directory not found"
         continue 
       fi
       
       mv "$filename" "$directory"/"$filename"
       echo "File moved"
       ;;
    *) echo "There is no such operation number"
       exit 1
       ;;
   esac     
      
   read -p "Repeat(y/n)? " -n 1
   echo
   if [ “$REPLY” == “n” ]; then
   exit
   fi
   done

