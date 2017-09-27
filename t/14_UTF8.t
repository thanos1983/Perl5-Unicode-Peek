#########################

use utf8;
use strict;
use warnings;

use Test::More tests => 10;
BEGIN { use_ok('Unicode::Peek', qw( :all )) };
BEGIN { use_ok('Test::Fatal', qw( exception ))};

#########################

like(
  exception { hexDumperOutput('Test', '這是一個測試'); },
  qr/Unknown encoding format 'Test'/,
  'Check encoding formats hexDumperOutput utf8',
);

like(
  exception { hexDumperInput('Test', '這是一個測試'); },
  qr/Unknown encoding format 'Test'/,
  'Check encoding formats hexDumperInput utf8',
);

like(
  exception { ascii2hexEncode('Test', '這是一個測試'); },
  qr/Unknown encoding format 'Test'/,
  'Check encoding formats ascii2hexEncode utf8',
);

like(
  exception { hex2ascciiDecode('Test', '這是一個測試'); },
  qr/Unknown encoding format 'Test'/,
  'Check encoding formats hex2ascciiDecode utf8',
);

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