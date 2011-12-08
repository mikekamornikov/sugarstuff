git checkout -f master
git branch -D `git branch | awk  '{ if ($0 !~ /master/) printf "%s", $0 }'`
