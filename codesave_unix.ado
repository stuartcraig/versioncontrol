/*------------------------------------------------------------------codesave.ado
Creates a preserved copy of all do-files in a dated subdirectory: E3 version

Stuart Craig
20180228
*/

// preserve the current directory
cap prog drop codesave
prog define codesave

	loc curr="`c(pwd)'"
	timestamp
	cap mkdir ~/ecrimerge/ecri3/statacode/archive/preserved_`r(stamp)'
	cd ~/ecrimerge/ecri3/statacode
	! cp * ~/ecrimerge/ecri3/statacode/archive/preserved_`r(stamp)' 
	cd `curr'
	
end

exit
