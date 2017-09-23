#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 5;
BEGIN { use_ok('Unicode::Peek', qw( :all )) };

#########################

ok( ascii2hexEncode('utf8', '這是一個測試') eq
    'e98099e698afe4b880e5808be6b8ace8a9a6',
    'Ascii too Hex utf8' );

ok( hex2ascciiDecode('utf8',
		     'e98099e698afe4b880e5808be6b8ace8a9a6') eq
    '這是一個測試',
    'Hex to Ascii utf8' );

my @hexOutput = ( 'e9 80 99 e6 98 af e4 b8 80 e5',
		  '80 8b e6 b8 ac e8 a9 a6' );

is_deeply( hexDumperOutput('utf8', '這是一個測試' ), \@hexOutput );

ok( hexDumperInput('utf8', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii utf8 hexDumperInput');