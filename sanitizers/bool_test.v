module sanitizers

fn test_to_bool() {
	valid_true := [
		' 1',
		'ON',
		't',
		'TRUE',
		'y',
		'yEs',
	]

	invalid_true := [
		'right',
		'valid',
		'123'
	]

	valid_false := [
		'0 ',
		'F',
		'false',
		'n',
		'No',
		'OFF',
	]

	invalid_false := [
		'none',
		'incorrect',
		'0321'
	]

	for v in valid_true {
		b := to_bool(v) or {
			return
		}

		assert b == true
	}

	for v in invalid_true {
		if _ := to_bool(v) {
			assert false
		} else {
			assert err == 'Unable to convert "$v" to bool'
		}
	}

	for v in valid_false {
		b := to_bool(v) or {
			return
		}

		assert b == false
	}

	for v in invalid_false {
		if _ := to_bool(v) {
			assert false
		} else {
			assert err == 'Unable to convert "$v" to bool'
		}
	}
}
