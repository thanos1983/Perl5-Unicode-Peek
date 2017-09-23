#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 5;
BEGIN { use_ok('Unicode::Peek', qw( :all )) };

#########################

ok( ascii2hexEncode('UTF-16', '這是一個測試') eq
    'feff9019662f4e00500b6e2c8a66',
    'Ascii too Hex UTF-16' );

ok( hex2ascciiDecode('UTF-16', 'feff9019662f4e00500b6e2c8a66') eq
    '這是一個測試',
    'Hex to Ascii UTF-16' );

my @hexOutput = ( 'fe ff 90 19 66 2f 4e 00 50 0b',
		  '6e 2c 8a 66' );

is_deeply( hexDumperOutput('UTF-16', '這是一個測試' ), \@hexOutput );

ok( hexDumperInput('UTF-16', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii UTF-16 hexDumperInput');