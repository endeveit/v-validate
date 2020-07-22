module validators

const (
	// Labels must be 63 characters or less (https://tools.ietf.org/html/rfc1035)
	max_label_length = 63
	re_fqdn_base = r'^[-a-zA-Z0-9]+$'
	re_fqdn_tld = r'^([a-zA-Z]{2,}|xn[-a-zA-Z0-9]{2,})$'
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
	if parts.len < 2 {
		return false
	}

	tld := parts.last()

	if !is_regex_match(tld, re_fqdn_tld) {
		return false
	}

	// check the rest of the string
	for part in parts {
		if !is_regex_match(part, re_fqdn_base) {
			return false
		}

		// check the string neither starts nor ends with a dash
		if part[0] == `-` || part[part.len - 1] == `-` {
			return false
		}
	}

	return true
}
