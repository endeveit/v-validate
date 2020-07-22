module validators

import regex

// check if regular expression syntax is correct
pub fn is_regex_valid(re_query string) bool {
	mut re := regex.new_regex()
	re_err, _ := re.compile(re_query)

	return re_err == regex.compile_ok
}

// check if the value matches the regular expression
pub fn is_regex_match(val string, re_query string) bool {
	mut re, _, _ := regex.regex(re_query)
	start, _ := re.match_string(val)

	return start != regex.no_match_found
}
