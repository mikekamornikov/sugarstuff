echo 'Switching to "master" ...'
git checkout -f master
echo '-----------'

echo 'Deleting all branches except "master" ...'
git branch -D `git branch | awk  '{ if ($0 !~ /master/) printf "%s", $0 }'`
