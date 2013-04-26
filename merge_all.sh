for BRANCH in AK DF DS GN HB JH JL JW LA LK LM NS SG SL; do
  git checkout $BRANCH
  git pull
  git merge master
done
git checkout master
