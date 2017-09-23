#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use Cwd qw();
use Data::Dumper;
use feature 'say';

=alternative
BEGIN {
    push ( @INC, Cwd::cwd());
}
=cut

use Cwd qw();
use lib (Cwd::cwd() . '/lib/');

use Unicode::Peek ( 'ascii2hexEncode', 'hex2ascciiDecode',
		    'hexDumperOutput', 'hexDumperInput' );

binmode( STDOUT, ':utf8' );

my $lanquage = 'Arabic';

my $str = 'هذا اختبار';

my @flags = ( 'UCS-2',
	      'UCS-2BE',
	      'UCS-2LE',
	      'UCS-4',
	      'UTF-7',
	      'utf8',
	      'UTF-8',
	      'utf-8-strict',
	      'UTF-16',
	      'UTF-16BE',
	      'UTF-16LE',
	      'UTF-32',
	      'UTF-32BE',
	      'UTF-32LE' );

while ( defined ( my $flag = shift @flags ) ) {
	my $hexEncoded = ascii2hexEncode($flag, $str);
	say $lanquage . " " . $flag;
	my $hexDumper = hexDumperOutput($flag, $str);
	print Dumper $hexDumper;
	say hexDumperInput($flag, $hexDumper);
	# say hex2ascciiDecode($flag, $hexEncoded);
	say "";
}

=doc
my @hexArray = ( '06 47 06 30 06 27 00 20 06 27',
		 '06 2e 06 2a 06 28 06 27 06 31' );

my $hexArrayRef = [ '06 47 06 30 06 27 00 20 06 27',
		    '06 2e 06 2a 06 28 06 27 06 31' ];

say hexDumperInput('UCS-2', $hexArrayRef);
=cut

__END__

Chinese UCS-2
$VAR1 = [
          '90 19 66 2f 4e 00 50 0b 6e 2c',
          '8a 66'
        ];

這是一個測試

Chinese UCS-2BE
$VAR1 = [
          '90 19 66 2f 4e 00 50 0b 6e 2c',
          '8a 66'
        ];

這是一個測試

Chinese UCS-2LE
$VAR1 = [
          '19 90 2f 66 00 4e 0b 50 2c 6e',
          '66 8a'
        ];

這是一個測試

Chinese UCS-4
$VAR1 = [
          '00 00 fe ff 00 00 90 19 00 00',
          '66 2f 00 00 4e 00 00 00 50 0b',
          '00 00 6e 2c 00 00 8a 66'
        ];

這是一個測試

Chinese UTF-7
$VAR1 = [
          '2b 6b 42 6c 6d 4c 30 34 41 55',
          '41 74 75 4c 49 70 6d 2d'
        ];

這是一個測試

Chinese utf8
$VAR1 = [
          'e9 80 99 e6 98 af e4 b8 80 e5',
          '80 8b e6 b8 ac e8 a9 a6'
        ];

這是一個測試

Chinese UTF-8
$VAR1 = [
          'e9 80 99 e6 98 af e4 b8 80 e5',
          '80 8b e6 b8 ac e8 a9 a6'
        ];

這是一個測試

Chinese utf-8-strict
$VAR1 = [
          'e9 80 99 e6 98 af e4 b8 80 e5',
          '80 8b e6 b8 ac e8 a9 a6'
        ];

這是一個測試

Chinese UTF-16
$VAR1 = [
          'fe ff 90 19 66 2f 4e 00 50 0b',
          '6e 2c 8a 66'
        ];

這是一個測試

Chinese UTF-16BE
$VAR1 = [
          '90 19 66 2f 4e 00 50 0b 6e 2c',
          '8a 66'
        ];

這是一個測試

Chinese UTF-16LE
$VAR1 = [
          '19 90 2f 66 00 4e 0b 50 2c 6e',
          '66 8a'
        ];

這是一個測試

Chinese UTF-32
$VAR1 = [
          '00 00 fe ff 00 00 90 19 00 00',
          '66 2f 00 00 4e 00 00 00 50 0b',
          '00 00 6e 2c 00 00 8a 66'
        ];

這是一個測試

Chinese UTF-32BE
$VAR1 = [
          '00 00 90 19 00 00 66 2f 00 00',
          '4e 00 00 00 50 0b 00 00 6e 2c',
          '00 00 8a 66'
        ];

這是一個測試

Chinese UTF-32LE
$VAR1 = [
          '19 90 00 00 2f 66 00 00 00 4e',
          '00 00 0b 50 00 00 2c 6e 00 00',
          '66 8a 00 00'
        ];

這是一個測試
