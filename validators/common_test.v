module validators

fn test_is_eq() {
	valid, invalid := get_data_eq_ne()
	for val, exp in valid {
		assert is_eq(val, exp) == true
	}
	for val, exp in invalid {
		assert is_eq(val, exp) == false
	}
}

fn test_is_ne() {
	invalid, valid := get_data_eq_ne()
	for val, exp in valid {
		assert is_eq(val, exp) == false
	}
	for val, exp in invalid {
		assert is_eq(val, exp) == true
	}
}

fn test_is_gt() {
	valid, invalid := get_data_gt_lt()
	for val, exp in valid {
		assert is_gt(val, exp) == true
	}
	for val, exp in invalid {
		assert is_gt(val, exp) == false
	}
}

fn test_is_lt() {
	invalid, valid := get_data_gt_lt()
	for val, exp in valid {
		assert is_gt(val, exp) == false
	}
	for val, exp in invalid {
		assert is_gt(val, exp) == true
	}
}

fn test_is_ge() {
	valid, invalid := get_data_ge_le()
	for val, exp in valid {
		assert is_ge(val, exp) == true
	}
	for val, exp in invalid {
		assert is_ge(val, exp) == false
	}
}

fn test_is_le() {
	invalid, valid := get_data_ge_le()
	for val, exp in valid {
		assert is_le(val, exp) == true
	}
	for val, exp in invalid {
		assert is_le(val, exp) == false
	}
}

fn test_is_in() {
	mut valid := []CommonType{}
	valid << 'abc'
	valid << 2
	valid << 0.69
	assert is_in('abc', valid) == true
	assert is_in('2', valid) == true
	assert is_in('0.69', valid) == true
	// this is the edge case and will pass the test because '2.302'
	// will be rounded to 2 after casting to int
	assert is_in('2.302', valid) == true
	invalid := ['ab', '3', '1.4142']
	for val in invalid {
		assert is_in(val, valid) == false
	}
}

fn get_data_eq_ne() (map[string]CommonType, map[string]CommonType) {
	mut valid := map[string]CommonType{}
	valid['string'] = 'string'
	valid['2'] = 2
	valid['3.14'] = 3.14
	mut invalid := map[string]CommonType{}
	invalid['string'] = 'string-2'
	invalid['2'] = 3
	invalid['2.71'] = 3.14
	return valid, invalid
}

fn get_data_gt_lt() (map[string]CommonType, map[string]CommonType) {
	mut valid := map[string]CommonType{}
	valid['ab'] = 'aa'
	valid['3'] = 2
	valid['3.14'] = 1.61
	mut invalid := map[string]CommonType{}
	invalid['aa'] = 'ab'
	invalid['2'] = 3
	invalid['1.61'] = 1.61
	return valid, invalid
}

fn get_data_ge_le() (map[string]CommonType, map[string]CommonType) {
	mut valid := map[string]CommonType{}
	valid['ab'] = 'aa'
	valid['aa'] = 'aa'
	valid['3'] = 2
	valid['2'] = 2
	valid['3.14'] = 1.61
	valid['6.28'] = 6.28
	mut invalid := map[string]CommonType{}
	invalid['aa'] = 'ab'
	invalid['2'] = 3
	invalid['1.41'] = 1.64
	return valid, invalid
}
