module sanitizers

const (
	vals_true = [
		'1',
		'on',
		't',
		'true',
		'y',
		'yes',
	]
	vals_false = [
		'0',
		'f',
		'false',
		'n',
		'no',
		'off',
	]
)

// converts the string to a boolean value
pub fn to_bool(val string) ?bool {
	v := val.trim_space().to_lower()

	if v in vals_true {
		return true
	}

	if v in vals_false {
		return false
	}

	return error('Unable to convert "$val" to bool')
}
