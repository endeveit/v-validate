module validators

const (
	re_float = r'^(?:[-+]?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][-+]?(?:[0-9]+))?$'
	re_int = r'^(?:[-+]?(?:0|[1-9][0-9]*))$'
)

// check if the string is a float
pub fn is_float(val string) bool {
	return is_number_priv(val, re_float)
}

// check if the string is an integer
pub fn is_int(val string) bool {
	return is_number_priv(val, re_int)
}

fn is_number_priv(val string, re_query string) bool {
	if val.len == 0 {
		return false
	}

	if !is_regex_match(val, re_query) {
		return false
	}

	return true
}
