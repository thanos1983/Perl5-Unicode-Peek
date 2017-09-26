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

ok( ascii2hexEncode('utf-8-strict', '這是一個測試') eq
    'e98099e698afe4b880e5808be6b8ace8a9a6',
    'Ascii too Hex utf-8-strict' );

ok( hex2ascciiDecode('utf-8-strict', 'e98099e698afe4b880e5808be6b8ace8a9a6') eq
    '這是一個測試',
    'Hex to Ascii utf-8-strict' );

my @hexOutput = ( 'e9 80 99 e6 98 af e4 b8 80 e5',
		  '80 8b e6 b8 ac e8 a9 a6' );

is_deeply( hexDumperOutput('utf-8-strict', '這是一個測試' ), \@hexOutput );

ok( hexDumperInput('utf-8-strict', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii utf-8-strict hexDumperInput');