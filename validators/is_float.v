module validators

import regex

const (
	re_float = r'^(?:[-+]?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][-+]?(?:[0-9]+))?$'
)

// check if the string is a float
pub fn is_float(val string) bool {
	if val.len == 0 {
		return false
	}

	mut re, _, _ := regex.regex(re_float)
	start, _ := re.match_string(val)
	if start == regex.no_match_found {
		return false
	}

	return true
}
