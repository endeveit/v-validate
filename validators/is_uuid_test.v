module validators

fn test_is_uuid_v3() {
	valid := [
		'a987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'A987FBC9-4BED-3078-CF07-9141BA07C9F3',
	]

	invalid := [
		'',
		'934859',
		'a987fbc9-4bed-4078-8f07-9141ba07c9f3',
		'A987FBC9-4BED-4078-8F07-9141BA07C9F3',
		'a987fbc9-4bed-5078-af07-9141ba07c9f3',
		'A987FBC9-4BED-5078-AF07-9141BA07C9F3',
		'aaaaaaaa-1111-1111-aaag-111111111111',
		'AAAAAAAA-1111-1111-AAAG-111111111111',
		'xxxa987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'xxxA987FBC9-4BED-3078-CF07-9141BA07C9F3',
	]

	for uuid in valid {
		assert is_uuid_v3(uuid) == true
	}

	for uuid in invalid {
		assert is_uuid_v3(uuid) == false
	}
}

fn test_is_uuid_v4() {
	valid := [
		'57b73598-8764-4ad0-a76a-679bb6640eb1',
		'57B73598-8764-4AD0-A76A-679BB6640EB1',
		'625e63f3-58f5-40b7-83a1-a72ad31acffb',
		'625E63F3-58F5-40B7-83A1-A72AD31ACFFB',
		'713ae7e3-cb32-45f9-adcb-7c4fa86b90c1',
		'713AE7E3-CB32-45F9-ADCB-7C4FA86B90C1',
		'9c858901-8a57-4791-81fe-4c455b099bc9',
		'9C858901-8A57-4791-81FE-4C455B099BC9',
	]

	invalid := [
		'',
		'934859',
		'a987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'A987FBC9-4BED-3078-CF07-9141BA07C9F3',
		'a987fbc9-4bed-5078-af07-9141ba07c9f3',
		'A987FBC9-4BED-5078-AF07-9141BA07C9F3',
		'aaaaaaaa-1111-1111-aaag-111111111111',
		'AAAAAAAA-1111-1111-AAAG-111111111111',
		'xxxa987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'xxxA987FBC9-4BED-3078-CF07-9141BA07C9F3',
	]

	for uuid in valid {
		assert is_uuid_v4(uuid) == true
	}

	for uuid in invalid {
		assert is_uuid_v4(uuid) == false
	}
}

fn test_is_uuid_v5() {
	valid := [
		'987fbc97-4bed-5078-8f07-9141ba07c9f3',
		'987FBC97-4BED-5078-8F07-9141BA07C9F3',
		'987fbc97-4bed-5078-9f07-9141ba07c9f3',
		'987FBC97-4BED-5078-9F07-9141BA07C9F3',
		'987fbc97-4bed-5078-af07-9141ba07c9f3',
		'987FBC97-4BED-5078-AF07-9141BA07C9F3',
		'987fbc97-4bed-5078-bf07-9141ba07c9f3',
		'987FBC97-4BED-5078-BF07-9141BA07C9F3',
	]

	invalid := [
		'',
		'934859',
		'9c858901-8a57-4791-81fe-4c455b099bc9',
		'9c858901-8a57-4791-81fe-4c455b099bc9',
		'a987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'A987FBC9-4BED-3078-CF07-9141BA07C9F3',
		'aaaaaaaa-1111-1111-aaag-111111111111',
		'AAAAAAAA-1111-1111-AAAG-111111111111',
		'xxxa987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'xxxA987FBC9-4BED-3078-CF07-9141BA07C9F3',
	]

	for uuid in valid {
		assert is_uuid_v5(uuid) == true
	}

	for uuid in invalid {
		assert is_uuid_v5(uuid) == false
	}
}

fn test_is_uuid() {
	valid := [
		'a987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'A987FBC9-4BED-3078-CF07-9141BA07C9F3',
		'a987fbc9-4bed-4078-8f07-9141ba07c9f3',
		'A987FBC9-4BED-4078-8F07-9141BA07C9F3',
		'a987fbc9-4bed-5078-af07-9141ba07c9f3',
		'A987FBC9-4BED-5078-AF07-9141BA07C9F3',
	]

	invalid := [
		'',
		'934859',
		'987fbc9-4bed-3078-cf07a-9141ba07c9f3',
		'987FBC9-4BED-3078-CF07A-9141BA07C9F3',
		'a987fbc9-4bed-3078-cf07-9141ba07c9f3xxx',
		'A987FBC9-4BED-3078-CF07-9141BA07C9F3xxx',
		'a987fbc94bed3078cf079141ba07c9f3',
		'A987FBC94BED3078CF079141BA07C9F3',
		'aaaaaaaa-1111-1111-aaag-111111111111',
		'AAAAAAAA-1111-1111-AAAG-111111111111',
		'xxxa987fbc9-4bed-3078-cf07-9141ba07c9f3',
		'xxxA987FBC9-4BED-3078-CF07-9141BA07C9F3',
	]

	for uuid in valid {
		assert is_uuid(uuid) == true
	}

	for uuid in invalid {
		assert is_uuid(uuid) == false
	}
}