#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 3;
BEGIN { use_ok('Test::Exception') };
BEGIN { use_ok('Unicode::Peek', qw( :all )) };

#########################

throws_ok { hexDumperOutput('Test', '這是一個測試') }
	  qr/Unknown encoding format 'Test'/,
	  'Check encoding formats hexDumperOutput';

__END__

$ perl t/test.t
1..3
ok 1 - use Test::Exception;
ok 2 - use Unicode::Peek;
ok 3 - Check encoding formats hexDumperOutput
