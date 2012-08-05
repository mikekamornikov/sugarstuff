remote_mango='sugareps'

tag=`git tag | sort -r | head -1 | cut -c 4-`
let tag=$tag+1
read -p "Next tag: $tag [yY/nN]" -n 1 -r
if [[ !$REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "\nUpdating tag"
git tag -a "ibm$tag" -m "build $tag"
git push $remote_mango "ibm$tag"
