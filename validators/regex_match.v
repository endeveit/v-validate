module validators

import regex

fn is_regex_match(val string, re_query string) bool {
	mut re, _, _ := regex.regex(re_query)
	start, _ := re.match_string(val)

	return start != regex.no_match_found
}
