use strict;
use warnings;
use Data::Dumper;
use feature 'say';

use Cwd qw();
use lib (Cwd::cwd() . '/lib/');

use Unicode::Peek ':all';

say Dumper hexDumperOutput('Thanos', 'Test');
