module validators

const (
	numbers_re_float = r'^(?:[-+]?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][-+]?(?:[0-9]+))?$'
	numbers_re_int = r'^(?:[-+]?(?:0|[1-9][0-9]*))$'
)

// checks if the string is a float
pub fn is_float(val string) bool {
	return is_number_priv(val, numbers_re_float)
}

// checks if the string is an integer
pub fn is_int(val string) bool {
	return is_number_priv(val, numbers_re_int)
}

// private function used by is_float and is_int
fn is_number_priv(val string, re_query string) bool {
	if val.len == 0 {
		return false
	}

	if !is_regex_match(val, re_query) {
		return false
	}

	return true
}
