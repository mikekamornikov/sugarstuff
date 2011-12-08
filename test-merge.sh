remote_mango='sugareps'
remote_committer='sugareps'
committer_branch='ibmf_custom'
test_branch='ibm_current'

usage="Usage: $0 COMMITTER_REMOTE:COMMITTER_BRANCH"

if [ ! -z "$1" -a "$1" == "-h" ]
then
echo -e "$usage" ;
exit ;
fi

if [ ! -z "$1" ]
then
remote_committer=`echo "$1" | cut -d: -f1`
committer_branch=`echo "$1" | cut -d: -f2`
fi

echo 'Cleaning up ...'
git reset --hard
echo '-----------'

echo 'Fetching remotes ...'
git fetch $remote_mango
git fetch $remote_committer
git checkout $test_branch
echo '-----------'

echo 'Updating local branch ...'
git pull $remote_mango $test_branch
echo '-----------'

echo "Performing test merge ($remote_committer/$committer_branch) ..."
git merge --no-commit --no-ff $remote_committer/$committer_branch
echo '-----------'

echo 'Changes to commit:'
git status -s

