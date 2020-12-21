# A simple library to validate strings in the V language
The main purpose of this library is to validate the user input in the web applications.
Due to the nature of the input in the web (it's almost always strings), the main focus is on validating **strings**.

## Installation and Usage
<!-- Install the library with `v install endeveit.validate` -->
The library provides a number of validators and sanitizers

### Validators
Here's the full list of the currently available validators:

Validator             | Description
----------------------|------------
is_bool               | Checks if the string is a bool
is_eq                 | Checks if the string is equal to another int, float or string value
is_ne                 | Checks if the string is not equal to another int, float or string value
is_in                 | Checks if the string is in an array of allowed values
is_gt                 | Checks if the string is greater than another int, float or string value
is_ge                 | Checks if the string is greater or equal to another int, float or string value
is_lt                 | Checks if the string is less than another int, float or string value
is_le                 | Checks if the string is less or equal to another int, float or string value
is_email              | Checks if the string is a valid email address
is_fqdn               | Checks if the string is a Fully Qualified Domain Name
is_float              | Checks if the string is a float
is_int                | Checks if the string is an integer
is_ip                 | Checks if the string is an IP address (v4 or v6)
is_ipv4               | Checks if the string is an IPv4 address
is_ipv6               | Checks if the string is an IPv6 address
is_regex_match        | Checks if the string matches the regular expression
is_regex_valid        | Checks if regular expression syntax is correct
is_uuid               | Checks if the string is a valid UUID
is_uuid_v3            | Checks if the string is a valid UUID v3
is_uuid_v4            | Checks if the string is a valid UUID v4
is_uuid_v5            | Checks if the string is a valid UUID v5

### Validation chain
All validators listed above can be used within a validation chain.

Here's the list of additional functions and methods:

Sanitizer             | Description
----------------------|------------
new_chain             | Returns the new validation chain
 .bail                | Stops running validations if any of the previous ones have failed
 .validate            | Runs the validation chain against the provided value
 .get_errors           | Returns list of the validation errors


Example usage of the chain:

```v
mut ch := new_chain()
ch.is_gt(dst: 'a')
ch.is_le(dst: 'c')
ch.bail()
ch.is_int({}) # this won't be reached ever

assert ch.validate('z') == false
```

### Sanitizers
Here's the full list of the currently available sanitizers:

Sanitizer             | Description
----------------------|------------
to_bool               | Converts the string to a boolean value
to_float              | Converts the string to a float value
to_int                | Converts the string to an integer value
