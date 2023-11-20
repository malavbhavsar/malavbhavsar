#! /bin/bash
# Author: kleber_germano@outlook.com
# This is a script used to automatically deploy a Jekyll website/blog with third party plugins to GitHub Pages.

BUILD_FOLDER="_site";
PUSH_FOLDER="_site_ghpages"; 
COMMIT_MESSAGE=$1

#Remove all the content from the "PUSH_FOLDER".
function removeAllContentFromPushFolder(){
    rm -r $PUSH_FOLDER/*;
}

#Create the folder "PUSH_FOLDER".
function createFolderToPush(){
    mkdir $PUSH_FOLDER
}

#Copy all the content from the folder _site to PUSH_FOLDER.
function copySiteToFolder(){
    cp -r $BUILD_FOLDER/. $PUSH_FOLDER
}

#Clone only the branch "gh-pages" to the folder "PUSH_FOLDER". 
function cloneGhpages(){
    git clone --branch gh-pages `git config remote.origin.url` $PUSH_FOLDER
}

function prepareThePushFolder(){
    if [[ -d ./$PUSH_FOLDER ]]
    then
        #Remove all the content from the folder "PUSH_FOLDER".
        removeAllContentFromPushFolder
    else
        #Create the folder "PUSH_FOLDER" if it doesn't exist.
        createFolderToPush
        #Call the function that clone the branch "gh-pages" to the folder "PUSH_FOLDER". 
        cloneGhpages
        #Remove any prevous content from the folder "PUSH_FOLDER".
        removeAllContentFromPushFolder

    fi
    #Call the function that copy all the content from the folder _site to "PUSH_FOLDER".
    copySiteToFolder
}

function changeDirectoryToGhpages(){
    cd $PUSH_FOLDER
}

function setMessageCommit(){
    if ! [ "$COMMIT_MESSAGE" ]
    then
      COMMIT_MESSAGE='Automatic Commit'
    fi
}

function pushBranchGhpages(){
    git add .
    git commit -m "$COMMIT_MESSAGE"
    git push
}

function changeDirectoryBack(){
   cd ..
}

prepareThePushFolder
changeDirectoryToGhpages
setMessageCommit
pushBranchGhpages
changeDirectoryBack