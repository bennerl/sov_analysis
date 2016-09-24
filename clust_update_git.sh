#this is to commit git changes quickly to cluster scripts
#-c is to commit unique comment
if [[ $1 == "-c" ]]
then
	COMMENT=`echo $@ | sed 's|-c ||'`
	git add *
	git commit -m "$COMMENT"
	git push
else
	git add *
	git commit -m "quick change to cluster script"
	git push
fi




