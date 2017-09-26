#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 10;
BEGIN { use_ok('Test::Exception') };
BEGIN { use_ok('Unicode::Peek', qw( :all )) };

#########################

throws_ok { hexDumperOutput('Test', '這是一個測試') }
	  qr/Unknown encoding format 'Test'/,
	  'Check encoding formats hexDumperOutput';

throws_ok { hexDumperInput('Test', '這是一個測試') }
	  qr/Unknown encoding format 'Test'/,
	  'Check encoding formats hexDumperInput';

throws_ok { ascii2hexEncode('Test', '這是一個測試') }
	  qr/Unknown encoding format 'Test'/,
	  'Check encoding formats ascii2hexEncode';

throws_ok { hex2ascciiDecode('Test', '這是一個測試') }
	  qr/Unknown encoding format 'Test'/,
	  'Check encoding formats hex2ascciiDecode';

ok( ascii2hexEncode('UTF-7', '這是一個測試') eq
    '2b6b426c6d4c303441554174754c49706d2d',
    'Ascii too Hex UTF-7' );

ok( hex2ascciiDecode('UTF-7', '2b6b426c6d4c303441554174754c49706d2d') eq
    '這是一個測試',
    'Hex to Ascii UTF-7' );

my @hexOutput = ( '2b 6b 42 6c 6d 4c 30 34 41 55',
		  '41 74 75 4c 49 70 6d 2d' );

is_deeply( hexDumperOutput('UTF-7', '這是一個測試' ), \@hexOutput );

ok( hexDumperInput('UTF-7', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii UTF-7 hexDumperInput');