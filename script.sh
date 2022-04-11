#!/bin/bash
now='date'

# Edit to ignore the folders 
# Format: dir1|dir2...
opt_out=''

# Edit to cd to your where your git repos are
repo_path='/home/koanguyn/workspace/Github/'

# Edit to change default commit message
commit_msg=''

# Edit to change default branch
branh='origin master'

# Change dir
cd $repo_path

# List of folders in repo path
if [ -z "$opt_out" ]
then 
    folders=($(ls -d */))
else
    folders=($(ls -d */ | egrep -v "$opt_out"))
fi

for f in ${folders[@]}; 
do
    cd $f
    if [ -d ".git" ]
    then 
        git pull origin
        git add .
        git commit -m "auto-git-push-$commit_msg-$now"
        git push ${branch}
    fi
    cd ..
done