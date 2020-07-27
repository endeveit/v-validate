module chain

import validators

pub fn (mut c Chain) is_bool(config CallbackConfigIsBool) &Chain {
	return c.add_simple(validators.is_bool, config)
}

pub fn (mut c Chain) is_eq(config CallbackConfigComparableIsEq) &Chain {
	return c.add_comparable(validators.is_eq, config)
}

pub fn (mut c Chain) is_ne(config CallbackConfigComparableIsNe) &Chain {
	return c.add_comparable(validators.is_ne, config)
}

pub fn (mut c Chain) is_in(config CallbackConfigComparableArrayIsIn) &Chain {
	return c.add_comparable_array(validators.is_in, config)
}

pub fn (mut c Chain) is_gt(config CallbackConfigComparableIsGt) &Chain {
	return c.add_comparable(validators.is_gt, config)
}

pub fn (mut c Chain) is_ge(config CallbackConfigComparableIsGe) &Chain {
	return c.add_comparable(validators.is_ge, config)
}

pub fn (mut c Chain) is_lt(config CallbackConfigComparableIsLt) &Chain {
	return c.add_comparable(validators.is_lt, config)
}

pub fn (mut c Chain) is_le(config CallbackConfigComparableIsLe) &Chain {
	return c.add_comparable(validators.is_le, config)
}

pub fn (mut c Chain) is_email(config CallbackConfigIsEmail) &Chain {
	return c.add_simple(validators.is_email, config)
}

pub fn (mut c Chain) is_fqdn(config CallbackConfigIsFqdn) &Chain {
	return c.add_simple(validators.is_fqdn, config)
}

pub fn (mut c Chain) is_float(config CallbackConfigIsFloat) &Chain {
	return c.add_simple(validators.is_float, config)
}

pub fn (mut c Chain) is_int(config CallbackConfigIsInt) &Chain {
	return c.add_simple(validators.is_int, config)
}

pub fn (mut c Chain) is_ip(config CallbackConfigIsIp) &Chain {
	return c.add_simple(validators.is_ip, config)
}

pub fn (mut c Chain) is_ip_v4(config CallbackConfigIsIpV4) &Chain {
	return c.add_simple(validators.is_ip_v4, config)
}

pub fn (mut c Chain) is_ip_v6(config CallbackConfigIsIpV6) &Chain {
	return c.add_simple(validators.is_ip_v6, config)
}

pub fn (mut c Chain) is_regex_match(config CallbackConfigComparableIsRegexMatch) &Chain {
	return c.add_comparable(validators.is_regex_match, config)
}

pub fn (mut c Chain) is_regex_valid(config CallbackConfigIsRegexValid) &Chain {
	return c.add_simple(validators.is_regex_valid, config)
}

pub fn (mut c Chain) is_uuid(config CallbackConfigIsUuid) &Chain {
	return c.add_simple(validators.is_uuid, config)
}

pub fn (mut c Chain) is_uuid_v3(config CallbackConfigIsUuidV3) &Chain {
	return c.add_simple(validators.is_uuid_v3, config)
}

pub fn (mut c Chain) is_uuid_v4(config CallbackConfigIsUuidV4) &Chain {
	return c.add_simple(validators.is_uuid_v4, config)
}

pub fn (mut c Chain) is_uuid_v5(config CallbackConfigIsUuidV5) &Chain {
	return c.add_simple(validators.is_uuid_v5, config)
}
