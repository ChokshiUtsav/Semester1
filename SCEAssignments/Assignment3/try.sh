x=2
echo $x
ls | ( while read
do
	x=3
done
echo $x )

( x=4 ) #subshell
echo $x