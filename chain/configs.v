module chain

import validators

interface CallbackConfigSimple {
	err() string
}

interface CallbackConfigComparable {
	err() string
	dst() validators.CommonType
}

interface CallbackConfigComparableArray {
	err() string
	dst() []validators.CommonType
}

struct CallbackConfigIsBool {
	err string = 'The value is not boolean'
}

fn (c CallbackConfigIsBool) err() string {
	return c.err
}

struct CallbackConfigComparableIsEq {
	err string = 'The value should be equal to {{compared}}'
	dst validators.CommonType
}

fn (c CallbackConfigComparableIsEq) err() string {
	return c.err
}

fn (c CallbackConfigComparableIsEq) dst() validators.CommonType {
	return c.dst
}

struct CallbackConfigComparableIsNe {
	err string = 'The value should not be equal to {{compared}}'
	dst validators.CommonType
}

fn (c CallbackConfigComparableIsNe) err() string {
	return c.err
}

fn (c CallbackConfigComparableIsNe) dst() validators.CommonType {
	return c.dst
}

struct CallbackConfigComparableArrayIsIn {
	err string = 'The value should be in the given array'
	dst []validators.CommonType
}

fn (c CallbackConfigComparableArrayIsIn) err() string {
	return c.err
}

fn (c CallbackConfigComparableArrayIsIn) dst() []validators.CommonType {
	return c.dst
}

struct CallbackConfigComparableIsGt {
	err string = 'The value should be greater than {{compared}}'
	dst validators.CommonType
}

fn (c CallbackConfigComparableIsGt) err() string {
	return c.err
}

fn (c CallbackConfigComparableIsGt) dst() validators.CommonType {
	return c.dst
}

struct CallbackConfigComparableIsGe {
	err string = 'The value should be greater than or equal to {{compared}}'
	dst validators.CommonType
}

fn (c CallbackConfigComparableIsGe) err() string {
	return c.err
}

fn (c CallbackConfigComparableIsGe) dst() validators.CommonType {
	return c.dst
}

struct CallbackConfigComparableIsLt {
	err string = 'The value should be less than {{compared}}'
	dst validators.CommonType
}

fn (c CallbackConfigComparableIsLt) err() string {
	return c.err
}

fn (c CallbackConfigComparableIsLt) dst() validators.CommonType {
	return c.dst
}

struct CallbackConfigComparableIsLe {
	err string = 'The value should be less than or equal to {{compared}}'
	dst validators.CommonType
}

fn (c CallbackConfigComparableIsLe) err() string {
	return c.err
}

fn (c CallbackConfigComparableIsLe) dst() validators.CommonType {
	return c.dst
}

struct CallbackConfigIsEmail {
	err string = 'The value is not a valid email address'
}

fn (c CallbackConfigIsEmail) err() string {
	return c.err
}

struct CallbackConfigIsFqdn {
	err string = 'The value is not a valid Fully Qualified Domain Name'
}

fn (c CallbackConfigIsFqdn) err() string {
	return c.err
}

struct CallbackConfigIsFloat {
	err string = 'The value is not a float'
}

fn (c CallbackConfigIsFloat) err() string {
	return c.err
}

struct CallbackConfigIsInt {
	err string = 'The value is not an integer'
}

fn (c CallbackConfigIsInt) err() string {
	return c.err
}

struct CallbackConfigIsIp {
	err string = 'The value is not a valid IP address'
}

fn (c CallbackConfigIsIp) err() string {
	return c.err
}

struct CallbackConfigIsIpV4 {
	err string = 'The value is not a valid IPv4 address'
}

fn (c CallbackConfigIsIpV4) err() string {
	return c.err
}

struct CallbackConfigIsIpV6 {
	err string = 'The value is not a valid IPv6 address'
}

fn (c CallbackConfigIsIpV6) err() string {
	return c.err
}

struct CallbackConfigComparableIsRegexMatch {
	err string = 'The value is not valid'
	dst validators.CommonType
}

fn (c CallbackConfigComparableIsRegexMatch) err() string {
	return c.err
}

fn (c CallbackConfigComparableIsRegexMatch) dst() validators.CommonType {
	return c.dst
}

struct CallbackConfigIsRegexValid {
	err string = 'The regular expression is not valid'
}

fn (c CallbackConfigIsRegexValid) err() string {
	return c.err
}

struct CallbackConfigIsUuid {
	err string = 'The value is not a valid UUID'
}

fn (c CallbackConfigIsUuid) err() string {
	return c.err
}

struct CallbackConfigIsUuidV3 {
	err string = 'The value is not a valid UUIDv3'
}

fn (c CallbackConfigIsUuidV3) err() string {
	return c.err
}

struct CallbackConfigIsUuidV4 {
	err string = 'The value is not a valid UUIDv4'
}

fn (c CallbackConfigIsUuidV4) err() string {
	return c.err
}

struct CallbackConfigIsUuidV5 {
	err string = 'The value is not a valid UUIDv5'
}

fn (c CallbackConfigIsUuidV5) err() string {
	return c.err
}
