package CGI::Untaint::url;

use strict;
use base 'CGI::Untaint::printable';
use URI::Find;

use vars qw/$VERSION/;
$VERSION = '0.01';

sub is_valid {
  my $self = shift;
  my $value = $self->value or die "No value\n";
  my @urls;
  find_uris($value, sub { push @urls, shift });
  return $self->value($urls[0]) if @urls;
  return;
}


=head1 NAME

CGI::Untaint::url - validate a URL

=head1 SYNOPSIS

  use CGI::Untaint;
  my $handler = CGI::Untaint->new($q->Vars);

  my $url = $handler->extract(-as_url => 'web_address');

=head1 DESCRIPTION

This Input Handler verifies that it is dealing with a reasonable
URL. This mostly means that it will find the first thing that looks
like a URL in your input, where by "looks like", we mean anything that
URI::URL thinks is sensible, (with some tweaks, courtesy of URI::Find),
so it will accept any of (for example):

  http://c2.com/cgi/wiki
  www.tmtm.com
  See: http://www.redmeat.com/redmeat/1996-09-30/
  [http://www.angelfire.com/la/carlosmay/Tof.html]
  ftp://ftp.ftp.org/

L<URI::URL> for much more information here.

The resulting date will be a Date::Simple object. 
L<Date::Simple> for more information on this.

=head1 SEE ALSO

L<URI::URL>. L<URI::Find>.

=head1 AUTHOR

Tony Bowden, E<lt>kasei@tmtm.comE<gt>. 

=head1 COPYRIGHT

Copyright (C) 2001 Tony Bowden. All rights reserved.

This module is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
