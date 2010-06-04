use strict;
use warnings;
use vars qw($VERSION %IRSSI);
use Irssi 20020324;

$VERSION = "0.01";
%IRSSI = (
  name        => "bottom.pl",
  description => "makes text in new windows appear at the bottom instead of the top",
  url         => "http://explodingferret.com/linux/irssi/bottom.pl",
  authors     => "ferret",
  contact     => "ferret tA xelam teNtoD",
  licence     => "Public Domain",
  changed     => "2007-10-10",
  changes     => "",
  modules     => "",
  commands    => "",
);

Irssi::signal_add_last 'window created' => sub {
  my ( $winrec ) = @_;
  for ( 1..( $winrec->{height} ) ) {
    $winrec->print( '', MSGLEVEL_NEVER )
  }

}
