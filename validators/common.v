module validators

// The validators here work only with string, any_int, and any_float types.
// n.b.: any_int and any_float are internal intermediate types and could
// be changed in the future.
pub type CommonType = any_int | any_float | string

// checks if the string is equal to another int, float or string value
pub fn is_eq(val string, dst CommonType) bool {
	// FIXME: stop using references after this bug is fixed https://github.com/vlang/v/issues/5948
	match dst {
		any_int {
			return val.int() == *dst
		}
		any_float {
			return val.f64() == *dst
		}
		string {
			return val == *dst
		}
	}
}

// checks if the string is not equal to another int, float or string value
pub fn is_ne(val string, dst CommonType) bool {
	return !is_eq(val, dst)
}

// checks if the string is greater than another int, float or string value
pub fn is_gt(val string, dst CommonType) bool {
	// FIXME: stop using references after this bug is fixed https://github.com/vlang/v/issues/5948
	match dst {
		any_int {
			return val.int() > *dst
		}
		any_float {
			return val.f64() > *dst
		}
		string {
			return val > *dst
		}
	}
}

// checks if the string is greater or equal to another int, float or string value
pub fn is_ge(val string, dst CommonType) bool {
	return is_gt(val, dst) || is_eq(val, dst)
}

// checks if the string is less than another int, float or string value
pub fn is_lt(val string, dst CommonType) bool {
	return !is_ge(val, dst)
}

// checks if the string is less or equal to another int, float or string value
pub fn is_le(val string, dst CommonType) bool {
	return is_lt(val, dst)
}

// checks if the string is in an array of allowed values
pub fn is_in(val string, values []CommonType) bool {
	for v in values {
		if is_eq(val, v) {
			return true
		}
	}

	return false
}
