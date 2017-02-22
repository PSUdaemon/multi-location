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

Foo.

## Conventions and Terminology

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**",
"**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this
document are to be interpreted as described in RFC 2119 [@!RFC2119].

This document uses terminology defined in RFC 7231 [@!RFC7231].

# Multi-Location Redirect

~~~ ascii-art
{
  "locations": [
    "https://www1.example.com/e06c0d9e-1e7d-4cdc-9a36-86f63553eac7",
    "https://www2.example.com/07d81ae8-c991-46ee-8c66-2fcb7d6ed3c8"
  ]
}
~~~

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
