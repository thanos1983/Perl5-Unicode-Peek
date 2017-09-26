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

ok( ascii2hexEncode('UCS-2', '這是一個測試') eq
    '9019662f4e00500b6e2c8a66',
    'Ascii too Hex UCS-2' );

ok( hex2ascciiDecode('UCS-2', '9019662f4e00500b6e2c8a66') eq
    '這是一個測試',
    'Hex to Ascii UCS-2' );

my @hexOutput = ( '90 19 66 2f 4e 00 50 0b 6e 2c',
		  '8a 66' );

is_deeply( hexDumperOutput('UCS-2', '這是一個測試' ),
	   \@hexOutput, 'hexDumperOutput' );

ok( hexDumperInput('UCS-2', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii UCS-2 hexDumperInput');