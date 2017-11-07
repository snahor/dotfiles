function extract -a file
	if test -f $file
		switch $file
			case '*.tar.*' '*.tgz'
				tar xf $file 
			case '*.rar'
				unrar -x -ad $file
			case '*.zip'
				unzip $file 
			case '*.gz'
				gunzip $file 
			case '*.bz2'
				bunzip2 $file 
			case '*.xz'
				unxz $file 
			case '*'
				echo "Can not extract $file"
		end
	else
		echo 'File does not exist.'
	end
end
