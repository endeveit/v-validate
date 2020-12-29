module validators

import regex

// Checks if regular expression syntax is correct
pub fn is_regex_valid(re_query string) bool {
	regex.regex_opt(re_query) or { return false }
	return true
}

// Checks if the string matches the regular expression
pub fn is_regex_match(val string, re_query CommonType) bool {
	mut re := regex.regex_opt(re_query.str()) or { return false }
	start, _ := re.match_string(val)
	return start != regex.no_match_found
}
