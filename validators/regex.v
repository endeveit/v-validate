module validators

import regex

// Checks if regular expression syntax is correct
pub fn is_regex_valid(re_query string) bool {
	mut re := regex.new_regex()
	re_err, _ := re.compile(re_query)

	return re_err == regex.compile_ok
}

// Checks if the string matches the regular expression
pub fn is_regex_match(val string, re_query CommonType) bool {
	mut re, _, _ := regex.regex(re_query.str())
	start, _ := re.match_string(val)

	return start != regex.no_match_found
}
