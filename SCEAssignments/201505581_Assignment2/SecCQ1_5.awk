BEGIN {total=0; credits=0;}
{
if($2=="A")
{
total=total+$3;
credits=credits+$3*10;
}
else if($2=="A-")
{
total=total+$3;
credits=credits+$3*9;
}
else if($2=="B")
{
total=total+$3;
credits=credits+$3*8;
}
}
END {gpa=credits/total; print gpa;}

