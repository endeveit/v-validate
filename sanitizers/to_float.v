module sanitizers

import validators { is_float }

// convert the string to a float value
pub fn to_float(val string) ?f64 {
	v := val.trim_space().to_lower()

	if !is_float(v) {
		return error('Unable to convert "$val" to float')
	}

	return v.f64()
}
