#!/bin/bash

#Abhinav Jonnada
#b956d578

# This script automates the process of  basic GIT CONTROL i.e., it initializes the repo, adds the files
# to the repository, and pushes it to GITHUB. All this functionality is achieved with use of one command.



#Function definition
#takes a commit from the user

function commit() {
  echo "Make a commit"
  read MESSAGE
  git commit -m "$MESSAGE"
}

function push() {
  git push -u origin master
}



#START OF SCRIPT

FILE_TYPE="." #any kind of file types can be added just .py or .{c,h} either cpp or hpp extension files 

export path=$PWD
echo $path #using environment variable, gives the path of current working directory

if [ -d ".git" ]; then # -d checks to see if there git is initialized

	echo "Directory initialized with git."

else

git init

if (( $? )); then #checks to see if the git init command is excuted properly

  echo "Unable to initialize your directory"

  exit 1
fi

touch readme.md
touch .gitignore

fi

git add "$FILE_TYPE" #git add command, adds the files to the repo

if (( $? )); then # if git add fails displays the message

  echo "Unable to stage files"

  exit 1

fi

commit #a function call is made, which basically makes git commit

if (( $? )); then

  echo "Unable to create the initial commit"

  exit 1

fi

echo " ----- "

echo "The directory was initialized and an initial commit was performed with the files matching the pattern '$FILE_TYPE'"

git remote rm origin #removes remote origin, if already exists
git remote add origin $1 #takes HTTPS address from the user

push #a function call is made, for GIT PUSH

if (( $? )); then

 echo "Push rejected"

 exit 1
fi

exit 0

