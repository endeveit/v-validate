module validators

fn test_is_regex_valid() {
	assert is_regex_valid(r'^[a-z0-9]$') == true
	assert is_regex_valid(r'^[a-z0-9$') == false
}

fn test_is_regex_match() {
	assert is_regex_match('123', r'^[a-z0-9]+$') == true
	assert is_regex_match('123.456', r'^[a-z0-9]+$') == false
}
