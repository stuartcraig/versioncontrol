/*-----------------------------------------------------------------timestamp.ado
Creates timestamp in YYYYMMDD format
--optionally could create a daily output folder

Stuart Craig
20160810
*/

cap prog drop timestamp
prog define timestamp, rclass
	syntax [anything] [, output]
	
	// Grab the basics
	loc year 	= substr("`c(current_date)'",-4,4)
	loc mon		= substr("`c(current_date)'",-8,3)
	loc day		= substr("`c(current_date)'",1,2)
	
	// Clean the month
	loc c=0
	foreach m in `c(Mons)' {
		loc ++c
		if "`mon'"=="`m'" {
			loc mon=`c'
			continue, break
		}
	}
	
	loc mon=trim("`mon'")
	loc day=trim("`day'")
	if length("`mon'")==1 loc mon="0"+"`mon'"
	if length("`day'")==1 loc day="0"+"`day'"
	
	loc date="`year'`mon'`day'"

	loc time=subinstr("`c(current_time)'"," ","_",.)
	loc time=subinstr("`time'",":","_",.)
	loc dt = "`date'_`time'"

	if "`output'"=="output" {
		cap mkdir ${oE3}/`date'
		cd ${oE3}/`date'
	}
	
	return local date = "`date'"
	return local stamp="`dt'"
	
	
end

exit
