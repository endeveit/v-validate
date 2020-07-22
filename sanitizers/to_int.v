module sanitizers

import validators { is_int }

// convert the string to an integer value
pub fn to_int(val string) ?int {
	v := val.trim_space().to_lower()

	if !is_int(v) {
		return error('Unable to convert "$val" to int')
	}

	return v.int()
}
