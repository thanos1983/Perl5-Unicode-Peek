package Unicode::Peek;

use 5.013002;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Unicode::Peek ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Unicode::Peek - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Unicode::Peek;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Unicode::Peek, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.

=head1 EXAMPLE 1 (hexDumperOutput)
=encoding utf8

This example is for femonstration purposes, randomly choosen Chinese as a testing
 language. We will use the L<Data::Dumper|https://perldoc.perl.org/Data/Dumper.html> module to print the formated hex output. Necessary is also the L<utf8|https://perldoc.perl.org/utf8.html>
 for the stdout (convert the internal representation of a Perl scalar to/from UTF-8.)

  #!/usr/bin/perl
  use utf8;
  use strict;
  use warnings;
  use Data::Dumper;
  use feature 'say';

  use Unicode::Peek qw(ascii2hexEncode hex2ascciiDecode hexDumperOutput);

  my $lanquage = 'Chinese';

  my $str = '這是一個測試';

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
	  print Dumper hexOutput($flag, $str);
	  say hex2ascciiDecode($flag, $hexEncoded);
  };

=head1 EXAMPLE 2 (hexDumperInput)

  #!/usr/bin/perl
  use utf8;
  use strict;
  use warnings;
  use Data::Dumper;
  use feature 'say';

  use Unicode::Peek qw(ascii2hexEncode hexDumperOutput hexDumperInput);

  my $lanquage = 'Chinese';

  my $str = '這是一個測試';

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
  };


DEPENDENCIES

The module is implemented by using utf8 and requires to be installed.


=head1 AUTHOR
Athanasios Garyfalos, E<lt>garyfalos@cpan.org<gt>


=head1 BUGS
Please report any bugs or feature requests to C<bug-net-sntp-client at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-SNTP-Client>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT
You can find documentation for the module with the perldoc command.

    perldoc Unicode::Peek

You can also look for information at:


=over 4

=item * RT: CPAN's request tracker (report bugs here)
L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-SNTP-Client>

=item * AnnoCPAN: Annotated CPAN documentation
L<http://annocpan.org/dist/Net-SNTP-Client>

=item * CPAN Ratings
L<http://cpanratings.perl.org/d/Net-SNTP-Client>

=item * Search CPAN
L<http://search.cpan.org/dist/Net-SNTP-Client/>

=back

=head1 SEE ALSO
perl, L<utf8|https://perldoc.perl.org/utf8.html>, L<UTF-8 vs. utf8 vs. UTF8|https://perldoc.perl.org/Encode.html#UTF-8-vs.-utf8-vs.-UTF8> and L<Data::Peek|http://search.cpan.org/~hmbrand/Data-Peek/Peek.pm>

=head1 REPOSITORY
L<Perl5-String-Encoding-Decoding|https://github.com/thanos1983/Perl5-String-Encoding-Decoding>

This library is free software; you can redistribute it and/or modify it under
 the same terms as Perl itself.


=head1 COPYRIGHT AND LICENSE
Copyright (C) 2017 by Athanasios Garyfalos.

This library is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=head1 CHANGE LOG

$Log: Peek.pm,v $
Revision 0.01  2017/09/21 17:22:21 (UCT) Thanos

=cut
