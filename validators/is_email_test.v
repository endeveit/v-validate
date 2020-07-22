module validators

import strings

fn test_is_email() {
	a64 := strings.repeat_string('a', 64)
	a63 := strings.repeat_string('a', 63)
	a31 := strings.repeat_string('a', 31)

	valid := [
		'foo@bar.com',
		'x@x.au',
		'foo@bar.com.au',
		'foo+bar@bar.com',
		'test123+ext@gmail.com',
		'some.name.midd.leNa.me+extension@GoogleMail.com',
		'"foobar"@example.com',
		'${a64}@${a63}.com',
		'${a31}@gmail.com',
		'test@gmail.com',
		'test.1@gmail.com',
	]

	invalid := [
		' example @example .com ',
		' example@example.com ',
		' example@example.com',
		'@example.com',
		'example',
		'example@ ',
		'example@',
		'example@-example.com',
		'example@.',
		'example@.fr',
		'example@example.',
		'example@example.co..uk',
		'example@example.com;example@example.com',
		'example@localhost',
		'foo@example.com bar',
		// there's a limited support for the unicode characters in the regex module
		// and they can't be validated properly
		'm端ller@example.com',
		'"  foo  m端ller "@example.com',
	]

	for email in valid {
		assert is_email(email) == true
	}

	for email in invalid {
		assert is_email(email) == false
	}
}
