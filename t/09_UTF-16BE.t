#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 9;
BEGIN { use_ok('Unicode::Peek', qw( :all )) };

#########################

$@ = '';
eval { hexDumperOutput('Test', '這是一個測試') };
like( $@, qr/Unknown encoding format 'Test'/,
      'Check encoding formats hexDumperOutput UTF-16BE' );

$@ = '';
eval { hexDumperInput('Test', '這是一個測試') };
like( $@, qr/Unknown encoding format 'Test'/,
      'Check encoding formats hexDumperInput UTF-16BE' );

$@ = '';
eval { ascii2hexEncode('Test', '這是一個測試') };
like( $@, qr/Unknown encoding format 'Test'/,
      'Check encoding formats ascii2hexEncode UTF-16BE' );

$@ = '';
eval { hex2ascciiDecode('Test', '這是一個測試') };
like( $@, qr/Unknown encoding format 'Test'/,
      'Check encoding formats hex2ascciiDecode UTF-16BE' );

ok( ascii2hexEncode('UTF-16BE', '這是一個測試') eq
    '9019662f4e00500b6e2c8a66',
    'Ascii too Hex UTF-16BE' );

ok( hex2ascciiDecode('UTF-16BE', '9019662f4e00500b6e2c8a66') eq
    '這是一個測試',
    'Hex to Ascii UTF-16BE' );

my @hexOutput = ( '90 19 66 2f 4e 00 50 0b 6e 2c',
		  '8a 66' );

is_deeply( hexDumperOutput('UTF-16BE', '這是一個測試' ), \@hexOutput );

ok( hexDumperInput('UTF-16BE', \@hexOutput ) eq
    '這是一個測試',
    'Hex to Ascii UTF-16BE hexDumperInput');