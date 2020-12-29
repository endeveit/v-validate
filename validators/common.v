module validators

// This type is being used in validators that compare value against another,
// it's a sum type of the string, any_int, and any_float.
// <br>
// n.b.: any_int and any_float are internal intermediate types and could be changed in the future.
pub type CommonType = any_float | any_int | string

// Converts the common type to the string
fn (c CommonType) str() string {
	match c {
		any_int { return c.str() }
		any_float { return c.str() }
		string { return (c) }
	}
}

// Checks if the string is equal to another int, float or string value
pub fn is_eq(val string, dst CommonType) bool {
	match dst {
		any_int { return val.int() == dst }
		any_float { return val.f64() == dst }
		string { return val == dst }
	}
}

// Checks if the string is greater than another int, float or string value
pub fn is_gt(val string, dst CommonType) bool {
	match dst {
		any_int { return val.int() > dst }
		any_float { return val.f64() > dst }
		string { return val > dst }
	}
}

// Checks if the string is not equal to another int, float or string value
pub fn is_ne(val string, dst CommonType) bool {
	return !is_eq(val, dst)
}

// Checks if the string is greater or equal to another int, float or string value
pub fn is_ge(val string, dst CommonType) bool {
	return is_gt(val, dst) || is_eq(val, dst)
}

// Checks if the string is less than another int, float or string value
pub fn is_lt(val string, dst CommonType) bool {
	return !is_ge(val, dst)
}

// Checks if the string is less or equal to another int, float or string value
pub fn is_le(val string, dst CommonType) bool {
	return is_lt(val, dst)
}

// Checks if the string is in an array of allowed values
pub fn is_in(val string, values []CommonType) bool {
	for v in values {
		if is_eq(val, v) {
			return true
		}
	}
	return false
}
