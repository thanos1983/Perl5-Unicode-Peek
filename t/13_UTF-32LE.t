#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 5;
BEGIN { use_ok('Unicode::Peek', qw( :all )) };

#########################

ok( ascii2hexEncode('UTF-32LE', '這是一個測試') eq
    '199000002f660000004e00000b5000002c6e0000668a0000',
    'Ascii too Hex UTF-32LE' );

ok( hex2ascciiDecode('UTF-32LE',
		     '199000002f660000004e00000b5000002c6e0000668a0000') eq
    '這是一個測試',
    'Hex to Ascii UTF-32LE' );

my @hexOutput = ( '19 90 00 00 2f 66 00 00 00 4e',
		  '00 00 0b 50 00 00 2c 6e 00 00',
		  '66 8a 00 00' );

is_deeply( hexDumperOutput('UTF-32LE', '這是一個測試' ), \@hexOutput );

ok( hexDumperInput('UTF-32LE', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii UTF-32LE hexDumperInput');