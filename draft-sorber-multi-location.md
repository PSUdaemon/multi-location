% title = "Multi-Location Redirect for HTTP"
% abbrev = "multilocation"
% category = "std"
% docName = "draft-sorber-multi-location-00"
% ipr = "trust200902"
% area = ""
% workgroup = ""
% keyword = ["HTTP", "redirect", "location", "header", "JSON"]
%
% date = 2017-02-22T00:00:00Z
%
% [[author]]
% initials="P."
% surname="Sorber"
% fullname="Phil Sorber"
% role="editor"
% organization = "Comcast Cable Communications"
%   [author.address]
%   email = "phillip_sorber@comcast.com"
%   phone = "+1 720 502 3785"
%     [author.address.postal]
%     street = "1401 Wynkoop Street, Suite 300"
%     city = "Denver"
%     region = "CO"
%     code = "80202"
%     country = "United States"

.# Abstract

This document specifies a new redirection scheme for the Hyper Text
Transfer Protocol (HTTP) allowing for multiple locations to be
specified.

{mainmatter}

# Introduction

HTTP redirects (302 Found) are often used to forward a client to a closer server
that has content the client is looking for using a `Location` header. The `Location`
header may contain a single value of a new URI for the client to retrieve. If the
server hosting the redirected URI is not able to serve it, the client must decide what
to do next, perhaps going back to the origninal URI or retrying the redirect URI. It
would be more helpful if the original server could provide multiple ordered URI
options for the client to try before failing.

This document defines a payload syntax that can exist in a 302 resposne to provide
alternate URI sources as well as operate as a traditional 302 redirect with a `Location`
header to maintain backward compatibility.

## Conventions and Terminology

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**",
"**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this
document are to be interpreted as described in RFC 2119 [@!RFC2119].

This document uses terminology defined in RFC 7231 [@!RFC7231].

# Multi-Location Redirect

This document extends the 302 response code in Section 6.4.3 of RFC 7231 [RFC7231].

## Request

This specification utilizes a standard request format. No modifications are needed.

## Response

The response is designed to be backward compatible with a traditional 302 Found response.
The response code is still 302 and still utilizes a `Location` header. The differences are
a `Content-Type` header and a payload.

### Reponse Code

The server **MUST** use a 302 response code.

### Location Header

The server **SHOULD** add a `Location` header with the primary redirect URI.

### Content-Type Header

The server **MUST** add a `Content-Type` header with the value "application/json" as
specified in RFC 7159 [@RFC7159].

### Payload

The payload **MUST** be JSON formatted [RFC7159]. The only data element **MUST** be a string array
named "locations" that contains the ordered set of URIs for the client to use.

## Example

F> ~~~ ascii-art
F> GET /test HTTP/1.1
F> Host: www.example.com
F> Accept: */*
F> ~~~
F> Figure: Example Request
F>
F> ~~~ ascii-art
F> HTTP/1.1 302 Found
F> Date: Wed, 22 Feb 2017 14:18:32 GMT
F> Location: https://www1.example.com/test
F> Content-Type: application/json
F> Content-Length: 98
F>
F> {
F>   "locations": [
F>     "https://www1.example.com/test",
F>     "https://www2.example.com/test"
F>   ]
F> }
F> ~~~
F> Figure: Example Response

# Security Considerations

None.

# IANA Considerations

None.

# Related Work

Out-of-Band Encoding I-D [@I-D.reschke-http-oob-encoding] for blind caching.

{backmatter}

# Acknowledgements

The author would like to thank the following people for their
contributions in reviewing this document and providing feedback: Matthew Miller, Jan van Doorn,
and Jeff Elsloo.
