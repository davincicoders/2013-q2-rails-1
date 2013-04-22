for BRANCH in `git branch -l | grep -v master`; do
  echo $BRANCH
  git checkout $BRANCH
  git rebase master
done
