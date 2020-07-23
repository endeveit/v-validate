module validators

const (
	// The built-in str.bool() method is limited to only 'true' and 't' strings
	bool_possible_vals = [
		'0',
		'1',
		'f',
		'false',
		'n',
		'no',
		'off',
		'on',
		't',
		'true',
		'y',
		'yes',
	]
)

// checks if the string is a boolean
pub fn is_bool(val string) bool {
	return val.to_lower() in bool_possible_vals
}
