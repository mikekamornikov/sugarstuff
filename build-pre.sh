remote_mango='sugareps'
main_branch='ibm_current'
merge_branch='ibm'

echo 'Preparing'
git fetch $remote_mango
git branch -D $main_branch
git checkout -b $main_branch $remote_mango/$main_branch
git checkout $merge_branch
git rebase $remote_mango/$merge_branch

echo 'Launching automerge'
cd ibm/automerge && ./run_auto_merge.sh -a -r $remote_mango
