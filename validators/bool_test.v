module validators

fn test_is_bool() {
	valid := [
		'0',
		'1',
		'f',
		'false',
		'n',
		'no',
		'off',
		'on',
		't',
		'true',
		'y',
		'yes',
	]

	invalid := [
		' false',
		' off',
		' on',
		'no ',
		'null',
		'true ',
	]

	for val in valid {
		assert is_bool(val) == true
	}

	for val in invalid {
		assert is_bool(val) == false
	}
}
