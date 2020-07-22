/**
 * The built-in str.bool() method is limited to only 'true' and 't' strings
 */
module validators

const (
	vals = [
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

// check if the string is a boolean
pub fn is_bool(val string) bool {
	return val.to_lower() in vals
}
