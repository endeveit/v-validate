/**
 * The regular expression validate the local part of the email (everything before @)
 * is based on this comment at stackoverflow - https://stackoverflow.com/a/201378
 * The author of the comment is bortzmeyer <https://stackoverflow.com/users/15625/bortzmeyer>
 */
module validators

const (
	re_email_local_part = '^(?:[-a-zA-Z0-9!#$%&.\'*+/=?^_`{|}~]+)|"(?:[-a-zA-Z0-9!#$%&.\'*+/=?^_`{|}~]+)"$'
)

// check if the string is a valid email address
pub fn is_email(email string) bool {
	parts := email.split('@')
	if parts.len != 2 {
		return false
	}

	// let's check the local part
	if !is_regex_match(parts[0], re_email_local_part) {
		return false
	}

	// now it's time to validate the hostname
	if !is_fqdn(parts[1]) && !is_ip(parts[1]) {
		return false
	}

	return true
}
