module validators

import regex

const (
	re_number = r'^[0-9]+$'
)

// check if the string is a number
pub fn is_number(val string) bool {
	if val.len == 0 {
		return false
	}

	mut re, _, _ := regex.regex(re_number)
	start, _ := re.match_string(val)
	if start == regex.no_match_found {
		return false
	}

	return true
}
