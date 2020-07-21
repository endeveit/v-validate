module validators

import regex

const (
	// Labels must be 63 characters or less (https://tools.ietf.org/html/rfc1035)
	max_label_length = 63
)

// check if the string is a Fully Qualified Domain Name
pub fn is_fqdn(hostname string) bool {
	parts := hostname.split('.')

	for part in parts {
		if part.len > max_label_length {
			return false
		}
	}

	// validate the TLD
	if parts.len == 1 {
		return false
	}

	tld := parts.last()

	mut re_fqdn_tld, _, _ := regex.regex(r'^([a-z]{2,}|xn[-a-z0-9]{2,})$')
	start, _ := re_fqdn_tld.match_string(tld)
	if start < 0 {
		return false
	}

	// disallow spaces in the TLD
	mut re_fqdn_space, _, _ := regex.regex(r'[\s]')
	start_spaces, _ := re_fqdn_space.match_string(tld)
	if start_spaces > 0 {
		return false
	}

	// check the rest of the string
	mut re_fqdn_base, _, _ := regex.regex(r'^[-a-z0-9]+$')
	mut start_base := 0

	for part in parts {
		start_base, _ = re_fqdn_base.match_string(part)
		if start_base < 0 {
			return false
		}

		// check the string neither starts nor ends with a dash
		if part[0] == `-` || part[part.len - 1] == `-` {
			return false
		}
	}

	return true
}