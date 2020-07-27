module chain

import validators

type CallbackSignatureSimple fn(string) bool
type CallbackSignatureComparable fn(string, validators.CommonType) bool
type CallbackSignatureComparableArray fn(string, []validators.CommonType) bool

struct CallbackSimple {
	config CallbackConfigSimple
	callback CallbackSignatureSimple
}

struct CallbackComparable {
	config CallbackConfigComparable
	callback CallbackSignatureComparable
}

struct CallbackComparableArray {
	config CallbackConfigComparableArray
	callback CallbackSignatureComparableArray
}

type Callback = CallbackSimple | CallbackComparable | CallbackComparableArray

struct Chain {
	mut:
		bails []int
		callbacks []Callback
		errors []Option
}

// returns new validation chain
pub fn new_chain() &Chain {
	return &Chain{}
}

// stops running validations if any of the previous ones have failed
pub fn (mut c Chain) bail() &Chain {
	c.bails << c.callbacks.len - 1

	return c
}

// validates the provided value with all the validators in the chain
pub fn (mut c Chain) validate(val string) bool {
	mut is_valid := true

	for i, cb in c.callbacks {
		mut result := true
		mut err := ''

		if cb is CallbackSimple {
			result = cb.callback(val)
			err = cb.config.err()
		} else if cb is CallbackComparable {
			arg := cb.config.dst()
			result = cb.callback(val, &arg)

			if !result {
				err = cb.config.err().replace('{{compared}}', arg.str())
			}
		} else if cb is CallbackComparableArray {
			result = cb.callback(val, cb.config.dst())
			err = cb.config.err()
		}

		if !result {
			is_valid = false

			c.errors << error(err)

			// check if we need to keep validating the value
			if i in c.bails {
				break
			}
		}
	}

	return is_valid
}

fn (mut c Chain) add_simple(cb CallbackSignatureSimple, cnf CallbackConfigSimple) &Chain {
	c.callbacks << Callback(CallbackSimple{
		callback: cb
		config: cnf
	})

	return c
}

fn (mut c Chain) add_comparable(cb CallbackSignatureComparable, cnf CallbackConfigComparable) &Chain {
	c.callbacks << Callback(CallbackComparable{
		callback: cb
		config: cnf
	})

	return c
}

fn (mut c Chain) add_comparable_array(cb CallbackSignatureComparableArray, cnf CallbackConfigComparableArray) &Chain {
	c.callbacks << Callback(CallbackComparableArray{
		callback: cb
		config: cnf
	})

	return c
}
