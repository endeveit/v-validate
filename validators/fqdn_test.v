module validators

fn test_is_fqdn() {
	valid := [
		'a.domain.co',
		'dom.plato',
		'domain.com',
		'foo--bar.com',
		'example.test',
		'xn--froschgrn-x9a.com',
	]
	invalid := [
		'_.com',
		'*.some.com',
		'/more.com',
		'256.0.0.0',
		'abc',
		'domain.com/',
		'domain.com©',
		'domain.com�',
		's!ome.com',
	]
	for domain in valid {
		assert is_fqdn(domain) == true
	}
	for domain in invalid {
		assert is_fqdn(domain) == false
	}
}
