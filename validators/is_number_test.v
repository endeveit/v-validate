module validators

fn test_is_number() {
	valid := [
		'0',
		'123',
	]

	invalid := [
		'',
		'-123',
	]

	for v in valid {
		assert is_number(v) == true
	}

	for v in invalid {
		assert is_number(v) == false
	}
}
