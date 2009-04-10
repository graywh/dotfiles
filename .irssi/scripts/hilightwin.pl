# Print hilighted messages & private messages to window named "hilight"
# for irssi 0.7.99 by Timo Sirainen
use Irssi;
use vars qw($VERSION %IRSSI);

# Tom <tom@tomaw.net>
# Replace colour codes in text

$VERSION = "0.02";
%IRSSI = (
    authors	=> "Timo \'cras\' Sirainen",
    contact	=> "tss\@iki.fi",
    name	=> "hilightwin",
    description	=> "Print hilighted messages & private messages to window named \"hilight\"",
    license	=> "Public Domain",
    url		=> "http://irssi.org/",
    changed	=> "2006-05-01T00:00+0100"
);

sub sig_printtext {
  my ($dest, $text, $stripped) = @_;

  if (($dest->{level} & MSGLEVEL_HILIGHT) &&
      ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0) {
    $window = Irssi::window_find_name('hilight');

    if ($dest->{level} & MSGLEVEL_PUBLIC) {
      $text = $dest->{target}.": ".$text;
    }
    $text =~ s/\%/%%/g;
    $window->print($text, MSGLEVEL_CLIENTCRAP) if ($window);
  }
}

$window = Irssi::window_find_name('hilight');
Irssi::print("Create a window named 'hilight'") if (!$window);

Irssi::signal_add('print text', 'sig_printtext');
