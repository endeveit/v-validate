module sanitizers

import validators { is_float, is_int }

// converts the string to a float value
pub fn to_float(val string) ?f64 {
	v := val.trim_space().to_lower()

	if !is_float(v) {
		return error('Unable to convert "$val" to float')
	}

	return v.f64()
}

// converts the string to an integer value
pub fn to_int(val string) ?int {
	v := val.trim_space().to_lower()

	if !is_int(v) {
		return error('Unable to convert "$val" to int')
	}

	return v.int()
}
