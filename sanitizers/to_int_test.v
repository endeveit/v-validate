module sanitizers

fn test_to_int() {
	valid := {
		'2': 2,
		' 3 ': 3,
	}

	invalid := [
		'foo',
		'none',
		'3.14',
	]

	for v, exp in valid {
		if b := to_int(v) {
			assert b == exp
		} else {
			assert false
		}
	}

	for v in invalid {
		if _ := to_int(v) {
			assert false
		} else {
			assert err == 'Unable to convert "$v" to int'
		}
	}
}
