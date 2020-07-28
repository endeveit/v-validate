module validators

pub type CommonType = i8 | i16 | int | i64 | u16 | u32 | u64 | f32 | f64 | string

// Converts the common type to the string
fn (c CommonType) str() string {
	match c {
		string {
			return (*c)
		}
		else {
			return (*c).str()
		}
	}
}

// Checks if the string is equal to another int, float or string value
pub fn is_eq(val string, dst CommonType) bool {
	// FIXME: stop using references after this bug is fixed https://github.com/vlang/v/issues/5948
	match dst {
		i8 {
			return val.i8() == *dst
		}
		i16 {
			return val.i16() == *dst
		}
		int {
			return val.int() == *dst
		}
		i64 {
			return val.i64() == *dst
		}
		u16 {
			return val.u16() == *dst
		}
		u32 {
			return val.u32() == *dst
		}
		u64 {
			return val.u64() == *dst
		}
		f32 {
			return val.f32() == *dst
		}
		f64 {
			return val.f64() == *dst
		}
		string {
			return val == *dst
		}
	}
}

// Checks if the string is not equal to another int, float or string value
pub fn is_ne(val string, dst CommonType) bool {
	return !is_eq(val, dst)
}

// Checks if the string is greater than another int, float or string value
pub fn is_gt(val string, dst CommonType) bool {
	// FIXME: stop using references after this bug is fixed https://github.com/vlang/v/issues/5948
	match dst {
		i8 {
			return val.i8() > *dst
		}
		i16 {
			return val.i16() > *dst
		}
		int {
			return val.int() > *dst
		}
		i64 {
			return val.i64() > *dst
		}
		u16 {
			return val.u16() > *dst
		}
		u32 {
			return val.u32() > *dst
		}
		u64 {
			return val.u64() > *dst
		}
		f32 {
			return val.f32() > *dst
		}
		f64 {
			return val.f64() > *dst
		}
		string {
			return val > *dst
		}
	}
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
