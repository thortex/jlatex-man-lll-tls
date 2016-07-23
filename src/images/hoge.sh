#!/bin/sh

for f in `ls *.eps`; do
  if [ -e `basename $f .eps`.pdf ] ; then
      echo "`basename $f .eps`.pdf is already exists.";
  else
     grep "BoundingBox" $f >`basename $f .eps`.bb;
     ps2pdf14 -dNOKANJI -sPAPERSIZE=a4 $f;
  fi
done

exit
