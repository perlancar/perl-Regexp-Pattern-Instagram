package Regexp::Pattern::Instagram;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our %RE = (
    username => {
        summary => 'Instagram username',
        pat => qr/(?:[A-Za-z0-9_]{1,30}|[A-Za-z0-9_](?:[A-Za-z0-9_]|\.(?!\.)){1,28}[A-Za-z0-9_])/,
        description => <<'MARKDOWN',

Maximum 30 characters. Can contain letters, numbers, underscores, and dots. Dots
cannot appear at the beginning or end, and cannot appear consecutively.

MARKDOWN
        examples => [
            {str=>'perlancar', anchor=>1, matches=>1},
            {str=>'perl ancar', anchor=>1, matches=>0, summary=>"Contains invalid character (space)"},
            {str=>'perl.ancar', anchor=>1, matches=>1},
            {str=>'per.lan.car', anchor=>1, matches=>1},
            {str=>'__perlancar__', anchor=>1, matches=>1},
            {str=>'a234567890b234567890c234567890', anchor=>1, matches=>1},
            {str=>'a234567890b234567890c234567890_', anchor=>1, matches=>0, summary=>"Too long"},
            {str=>'.perlancar', anchor=>1, matches=>0, summary=>"Dot cannot appear at the beginning"},
            {str=>'perlancar.', anchor=>1, matches=>0, summary=>"Dot cannot appear at the end"},
            {str=>'perl..ancar', anchor=>1, matches=>0, summary=>"Dot cannot appear consecutively"},
        ],
    },
);

1;
# ABSTRACT: Regexp patterns related to Instagram

=head1 prepend:SEE ALSO
