module validators

import regex

const (
	re_int = r'^(?:[-+]?(?:0|[1-9][0-9]*))$'
)

// check if the string is an integer
pub fn is_int(val string) bool {
	if val.len == 0 {
		return false
	}

	mut re, _, _ := regex.regex(re_int)
	start, _ := re.match_string(val)
	if start == regex.no_match_found {
		return false
	}

	return true
}
