# validate - a simple library to validate strings in the V language
The main purpose of this library is to validate the user input in the web applications.
Due to the nature of the input in the web (it's almost always strings), the main focus is on validating **strings**.

## Installation and Usage
<!-- Install the library with `v install endeveit.validate` -->
The library provides a number of validators and sanitizers

### Validators
Here's the full list of the currently available validators

Validator             | Description
----------------------|------------
is_bool               | checks if the string is a bool
is_email              | checks if the string is a valid email address
is_eq                 | checks if the string is equal to another int, float or string value
is_float              | checks if the string is a float
is_fqdn               | checks if the string is a Fully Qualified Domain Name
is_ge                 | checks if the string is greater or equal to another int, float or string value
is_gt                 | checks if the string is greater than another int, float or string value
is_int                | checks if the string is an integer
is_ip                 | checks if the string is an IP address (v4 or v6)
is_ipv4               | checks if the string is an IPv4 address
is_ipv6               | checks if the string is an IPv6 address
is_le                 | checks if the string is less or equal to another int, float or string value
is_lt                 | checks if the string is less than another int, float or string value
is_ne                 | checks if the string is not equal to another int, float or string value
is_regex_match        | checks if the string matches the regular expression
is_regex_valid        | checks if regular expression syntax is correct
is_uuid               | checks if the string is a valid UUID
is_uuid_v3            | checks if the string is a valid UUID v3
is_uuid_v4            | checks if the string is a valid UUID v4
is_uuid_v5            | checks if the string is a valid UUID v5

### Sanitizers
Here's the full list of the currently available sanitizers

Sanitizer             | Description
----------------------|------------
to_bool               | converts the string to a boolean value
to_float              | converts the string to a float value
to_int                | converts the string to an integer value
