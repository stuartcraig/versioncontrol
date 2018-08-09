
cap prog drop codesave
prog define codesave

	timestamp
	global tempdir=subinstr("${scHC}","/","\",.)
	global codesavedate=r(stamp)
	cap mkdir ${tempdir}/codebase_${codesavedate}
	cap mkdir ${tempdir}/codebase_${codesavedate}/ado
	! XCOPY ${tempdir}\*.do ${tempdir}\codebase_${codesavedate} /y /q 
	! XCOPY ${tempdir}\ado ${tempdir}\codebase_${codesavedate}\ado /y /q  

end

exit


