/**
 * Although, using regular expressions like that https://stackoverflow.com/a/319293 would make
 * code look much clear, it's better to rely on the  good old "inet_pton" function from C.
*/
module validators

#include <arpa/inet.h>

struct C.in_addr {}
struct C.in6_addr {}

fn C.inet_pton(int af, src charptr, dst voidptr) int

const (
	sizeof_v4_address = sizeof(C.in_addr)
	sizeof_v6_address = sizeof(C.in6_addr)
)

// check if the string is an IP address (v4 or v6)
pub fn is_ip(ip string) bool {
	return is_ipv4(ip) || is_ipv6(ip)
}

// check if the string is an IPv4 address
pub fn is_ipv4(ip string) bool {
	buf := byteptr(sizeof_v4_address)

	return 1 == C.inet_pton(C.AF_INET, ip.str, &buf)
}

// check if the string is an IPv6 address
pub fn is_ipv6(ip string) bool {
	buf := byteptr(sizeof_v6_address)

	return 1 == C.inet_pton(C.AF_INET6, ip.str, &buf)
}
