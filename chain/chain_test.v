module chain

import validators

fn test_chain() {
	mut valid := []validators.CommonType{}
	valid << 'y'
	valid << 1
	valid << 'Y'

	mut ch := new_chain()
	ch.is_in({dst: valid})
	ch.is_eq({dst: 'Y'})
	ch.is_bool({})

	assert ch.validate('Y') == true
}
