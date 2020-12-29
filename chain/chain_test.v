module chain

import validators

fn test_chain() {
	mut valid := []validators.CommonType{}
	valid << 'y'
	valid << 1
	valid << 'Y'
	mut ch := new_chain()
	ch.is_in(dst: valid)
	ch.is_eq(dst: 'Y')
	ch.is_bool({})
	assert ch.validate('Y') == true
}

fn test_chain_fail() {
	mut ch := new_chain()
	ch.is_gt(dst: 10)
	ch.is_le(dst: 20)
	ch.is_int({})
	assert ch.validate('21') == false
	assert ch.get_errors().len == 1
}

fn test_chain_bail() {
	mut ch := new_chain()
	ch.is_gt(dst: 'a')
	ch.is_le(dst: 'c')
	ch.bail()
	ch.is_int({})
	assert ch.validate('z') == false
	assert ch.get_errors().len == 1
}

fn test_chain_no_bail() {
	mut ch := new_chain()
	ch.is_gt(dst: 'a')
	ch.is_le(dst: 'c')
	ch.is_int({})
	assert ch.validate('z') == false
	assert ch.get_errors().len == 2
}

fn test_chain_custom_message() {
	mut ch := new_chain()
	ch.is_gt(dst: 10, err: 'Should be bigger than "{{compared}}"')
	assert ch.validate('9') == false
	assert ch.get_errors().len == 1
	assert ch.get_errors()[0] == 'Should be bigger than "10"'
}
