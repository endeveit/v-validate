module sanitizers

fn test_to_float() {
	valid := {
		' 2': 2.0,
		'2.': 2.0,
		' -2.5': -2.5,
		'.5123': 0.5123,
		'3.4e+16': 3.4e+16,
		'1.5e-40': 1.5e-40,
	}

	invalid := [
		'foo',
		'true'
	]

	for v, exp in valid {
		if b := to_float(v) {
			assert b == exp
		} else {
			assert false
		}
	}

	for v in invalid {
		if _ := to_float(v) {
			assert false
		} else {
			assert err == 'Unable to convert "$v" to float'
		}
	}
}
