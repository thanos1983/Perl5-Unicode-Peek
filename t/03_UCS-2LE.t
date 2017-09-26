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

ok( ascii2hexEncode('UCS-2LE', '這是一個測試') eq
    '19902f66004e0b502c6e668a',
    'Ascii too Hex UCS-2LE' );

ok( hex2ascciiDecode('UCS-2LE', '19902f66004e0b502c6e668a') eq
    '這是一個測試',
    'Hex to Ascii UCS-2LE' );

my @hexOutput = ( '19 90 2f 66 00 4e 0b 50 2c 6e',
		  '66 8a' );

is_deeply( hexDumperOutput('UCS-2LE', '這是一個測試' ), \@hexOutput );

ok( hexDumperInput('UCS-2LE', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii UCS-2LE hexDumperInput');