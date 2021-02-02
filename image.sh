#!/bin/bash
#find ./*.jpg
if [[ -z $1 ]]

then
  echo "File selected from current directory."
  for f in *.jpg
  do
    echo $f
    if [[ $f != *"_thumbnail.jpg"* ]]
    then
      convert -quality 90 -resize 320x320 "$f" "./${f%.jpg}_thumbnail.jpg"
      echo "Create file ${f%.jpg}_thumbnail.jpg"
    fi
  done
else
  echo "File selected from file $1"
  while IFS= read -r ff
  do
    echo $ff
    if [[ $ff != *"_thumbnail.jpg"* ]]
    then
      convert -quality 90 -resize 320x320 "$ff" "${ff%.jpg}_thumbnail.jpg"
      echo "Create file ${ff%.jpg}_thumbnail.jpg"
    fi
  done < $1
fi