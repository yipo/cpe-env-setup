
pack.7z: pack
	cd $< && 7za a ..\$@ *

pack: pack/setup.bat pack/runas.vbs


clean:
	-del pack.7z
