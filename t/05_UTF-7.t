#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 5;
BEGIN { use_ok('Unicode::Peek', qw( :all )) };

#########################

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