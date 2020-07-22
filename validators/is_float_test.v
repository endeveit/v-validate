module validators

fn test_is_int() {
	valid := [
		'0',
		'3.14',
		'-1.618033',
		'+2.71',
		'1.401e+38',
		'2.506e-45',
	]

	invalid := [
		'',
		'a1',
		'4,94'
	]

	for v in valid {
		assert is_float(v) == true
	}

	for v in invalid {
		assert is_float(v) == false
	}
}
