module validators

const (
	// Labels must be 63 characters or less (https://tools.ietf.org/html/rfc1035)
	fqdn_max_label_length = 63
	fqdn_re_base = r'^[-a-zA-Z0-9]+$'
	fqdn_re_tld = r'^([a-zA-Z]{2,}|xn[-a-zA-Z0-9]{2,})$'
)

// Checks if the string is a Fully Qualified Domain Name
pub fn is_fqdn(hostname string) bool {
	parts := hostname.split('.')

	for part in parts {
		if part.len > fqdn_max_label_length {
			return false
		}
	}

	// validate the TLD
	if parts.len < 2 {
		return false
	}

	tld := parts.last()

	if !is_regex_match(tld, fqdn_re_tld) {
		return false
	}

	// check the rest of the string
	for part in parts {
		if !is_regex_match(part, fqdn_re_base) {
			return false
		}

		// check the string neither starts nor ends with a dash
		if part[0] == `-` || part[part.len - 1] == `-` {
			return false
		}
	}

	return true
}
