module validators

fn test_is_int() {
	valid := [
		'0',
		'123',
		'-1',
		'+10',
	]

	invalid := [
		'',
		'a12',
		'2.4',
	]

	for v in valid {
		assert is_int(v) == true
	}

	for v in invalid {
		assert is_int(v) == false
	}
}
