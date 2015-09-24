BEGIN {total=0; grade="None"; max=0; min=100; sum =0;
print "***Grade Report for the ABC Course***";
print "Name","\t","Grade";
}
{
total=$3+$4+$5;
if(total>=95 && total<=100)
{
  grade = "A";
}
else if(total>=90 && total<95)
{
  grade = "A-";
}
else if(total>=85 && total<90)
{
  grade = "B";
}
else if(total>=80 && total<85)
{
  grade = "B-";
}
else if(total>=75 && total<80)
{
  grade = "C";
}
else if(total>=70 && total<75)
{
  grade = "C-";
}
else if(total>=60 && total<70)
{
  grade = "D";
}
else
{
 grade = "F"; 	
}
if(total>max && NR!=1)
{
max=total;
}
if(total<min && NR!=1)
{
min=total;
}
sum=sum+total;
if(NR!=1)
{
print $1,"\t",grade;
}
}
END {
avg = sum/NR-1;
print "total number of students:"," ",NR-1;
print "highest marks out of 100:"," ",max;
print "lowest marks out of 100:"," ",min;
print "avg marks out of 100:"," ",avg;
print "***End of Grade Report***";
}


