function extract-email
	grep -Eio "([[:alnum:]_.-\+\-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})" $argv
end
