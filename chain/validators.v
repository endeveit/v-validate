module chain

// the current implementation of interfaces expects configs to be on the heap
// in the generated C code, when config is on the stack, and the caller returns,
// it points to an invalid place, containing wrong data, that soon gets overwritten
// © spytheman https://discordapp.com/channels/592103645835821068/592294828432424960/737689886953570454
import validators

// See `validators.is_bool`
pub fn (mut c Chain) is_bool(config CallbackConfigIsBool) &Chain {
	return c.add_simple(validators.is_bool, &CallbackConfigIsBool{
		err: config.err
	})
}

// See `validators.is_eq`
pub fn (mut c Chain) is_eq(config CallbackConfigComparableIsEq) &Chain {
	return c.add_comparable(validators.is_eq, &CallbackConfigComparableIsEq{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_ne`
pub fn (mut c Chain) is_ne(config CallbackConfigComparableIsNe) &Chain {
	return c.add_comparable(validators.is_ne, &CallbackConfigComparableIsNe{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_in`
pub fn (mut c Chain) is_in(config CallbackConfigComparableArrayIsIn) &Chain {
	return c.add_comparable_array(validators.is_in, &CallbackConfigComparableArrayIsIn{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_gt`
pub fn (mut c Chain) is_gt(config CallbackConfigComparableIsGt) &Chain {
	return c.add_comparable(validators.is_gt, &CallbackConfigComparableIsGt{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_ge`
pub fn (mut c Chain) is_ge(config CallbackConfigComparableIsGe) &Chain {
	return c.add_comparable(validators.is_ge, &CallbackConfigComparableIsGe{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_lt`
pub fn (mut c Chain) is_lt(config CallbackConfigComparableIsLt) &Chain {
	return c.add_comparable(validators.is_lt, &CallbackConfigComparableIsLt{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_le`
pub fn (mut c Chain) is_le(config CallbackConfigComparableIsLe) &Chain {
	return c.add_comparable(validators.is_le, &CallbackConfigComparableIsLe{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_email`
pub fn (mut c Chain) is_email(config CallbackConfigIsEmail) &Chain {
	return c.add_simple(validators.is_email, &CallbackConfigIsEmail{
		err: config.err
	})
}

// See `validators.is_fqdn`
pub fn (mut c Chain) is_fqdn(config CallbackConfigIsFqdn) &Chain {
	return c.add_simple(validators.is_fqdn, &CallbackConfigIsFqdn{
		err: config.err
	})
}

// See `validators.is_float`
pub fn (mut c Chain) is_float(config CallbackConfigIsFloat) &Chain {
	return c.add_simple(validators.is_float, &CallbackConfigIsFloat{
		err: config.err
	})
}

// See `validators.is_int`
pub fn (mut c Chain) is_int(config CallbackConfigIsInt) &Chain {
	return c.add_simple(validators.is_int, &CallbackConfigIsInt{config.err})
}

// See `validators.is_ip`
pub fn (mut c Chain) is_ip(config CallbackConfigIsIp) &Chain {
	return c.add_simple(validators.is_ip, &CallbackConfigIsIp{
		err: config.err
	})
}

// See `validators.is_ip_v4`
pub fn (mut c Chain) is_ip_v4(config CallbackConfigIsIpV4) &Chain {
	return c.add_simple(validators.is_ip_v4, &CallbackConfigIsIpV4{
		err: config.err
	})
}

// See `validators.is_ip_v6`
pub fn (mut c Chain) is_ip_v6(config CallbackConfigIsIpV6) &Chain {
	return c.add_simple(validators.is_ip_v6, &CallbackConfigIsIpV6{
		err: config.err
	})
}

// See `validators.is_regex_match`
pub fn (mut c Chain) is_regex_match(config CallbackConfigComparableIsRegexMatch) &Chain {
	return c.add_comparable(validators.is_regex_match, &CallbackConfigComparableIsRegexMatch{
		err: config.err
		dst: config.dst
	})
}

// See `validators.is_regex_valid`
pub fn (mut c Chain) is_regex_valid(config CallbackConfigIsRegexValid) &Chain {
	return c.add_simple(validators.is_regex_valid, &CallbackConfigIsRegexValid{
		err: config.err
	})
}

// See `validators.is_uuid`
pub fn (mut c Chain) is_uuid(config CallbackConfigIsUuid) &Chain {
	return c.add_simple(validators.is_uuid, &CallbackConfigIsUuid{
		err: config.err
	})
}

// See `validators.is_uuid_v3`
pub fn (mut c Chain) is_uuid_v3(config CallbackConfigIsUuidV3) &Chain {
	return c.add_simple(validators.is_uuid_v3, &CallbackConfigIsUuidV3{
		err: config.err
	})
}

// See `validators.is_uuid_v4`
pub fn (mut c Chain) is_uuid_v4(config CallbackConfigIsUuidV4) &Chain {
	return c.add_simple(validators.is_uuid_v4, &CallbackConfigIsUuidV4{
		err: config.err
	})
}

// See `validators.is_uuid_v5`
pub fn (mut c Chain) is_uuid_v5(config CallbackConfigIsUuidV5) &Chain {
	return c.add_simple(validators.is_uuid_v5, &CallbackConfigIsUuidV5{
		err: config.err
	})
}
