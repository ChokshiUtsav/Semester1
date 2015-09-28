#!/bin/bash

function isalpha()
{
	grep "^[a-zA-Z]*$" <<< "$par1" > /dev/null
	echo $? 
}

function isdigit()
{
	grep "^[0-9]*.[0-9]*$" <<< "$par1" >/dev/null
	echo $?
}

function isalnum()
{
	grep "^[0-9a-zA-Z]*$" <<< "$par1" >/dev/null
	echo $?
}

function negate()
{
	ans=`echo $par1 | tr abcdefghijklmnopqrstuvwxyz0123456789 zyxwvutsrqponmlkjihgfedcba9876543210`
	echo $ans
}

function toupper()
{
	ans=`echo $par1 | tr [a-z] [A-Z]`
	echo $ans
}

function tolower()
{
	ans=`echo $par1 | tr [A-Z] [a-z]`
	echo $ans
}

