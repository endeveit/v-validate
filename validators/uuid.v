module validators

const (
	re_uuid_any = r'^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$'
	re_uuid_v3 = r'^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-3[a-fA-F0-9]{3}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$'
	re_uuid_v4 = r'^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-4[a-fA-F0-9]{3}-[89ABab][a-fA-F0-9]{3}-[a-fA-F0-9]{12}$'
	re_uuid_v5 = r'^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-5[a-fA-F0-9]{3}-[89ABab][a-fA-F0-9]{3}-[a-fA-F0-9]{12}$'
	uuid_length = 36
)

// check if the string is ana valid UUID
pub fn is_uuid(uuid string) bool {
	return is_uuid_priv(uuid, re_uuid_any)
}

// check if the string is ana valid UUID v3
pub fn is_uuid_v3(uuid string) bool {
	return is_uuid_priv(uuid, re_uuid_v3)
}

// check if the string is ana valid UUID v4
pub fn is_uuid_v4(uuid string) bool {
	return is_uuid_priv(uuid, re_uuid_v4)
}

// check if the string is ana valid UUID v5
pub fn is_uuid_v5(uuid string) bool {
	return is_uuid_priv(uuid, re_uuid_v5)
}

fn is_uuid_priv(uuid string, re_query string) bool {
	// A UUID is a 128-bit value and to represent 128 bit into
	// the hex string there are 128/4=32 chars (each char is 4bit
	// long). UUID formatted as a string also contains 4 hyphens (-)
	// so we know that UUID string is always 36 chars and if that
	//constraint fails we don't even need to run regular expression
	// over the string
	if uuid.len != uuid_length {
		return false
	}

	return is_regex_match(uuid, re_query)
}
