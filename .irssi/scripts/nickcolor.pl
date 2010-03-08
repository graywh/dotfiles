use strict;
use Irssi 20020101.0250 ();
use vars qw($VERSION %IRSSI);
$VERSION = "1";
%IRSSI = (
    authors	=> "Timo Sirainen, Ian Peters",
    contact	=> "tss\@iki.fi",
    name	=> "Nick Color",
    description	=> "assign a different color for each nick",
    license	=> "Public Domain",
    url		=> "http://irssi.org/",
    changed	=> "2002-03-04T22:47+0100"
);

# hm.. i should make it possible to use the existing one..
Irssi::theme_register([
    'pubmsg_hilight', '{pubmsghinick $0 $3 $1}$2'
]);

my %saved_colors;
my %session_colors = {};
my @colors = qw/2 3 4 5 6 7 8 9 12 13/;

sub load_colors {
    open COLORS, "$ENV{HOME}/.irssi/saved_colors";

    while (<COLORS>) {
        # I don't know why this is necessary only inside of irssi
        my @lines = split "\n";
        foreach my $line (@lines) {
            next if $line =~ m|^\#|;
            my($nick, $color) = split ":", $line;
            $saved_colors{$nick} = $color;
        }
    }

    close COLORS;
}

sub save_colors {
    open COLORS, ">$ENV{HOME}/.irssi/saved_colors";

    foreach my $nick (keys %saved_colors) {
        print COLORS "$nick:$saved_colors{$nick}\n";
    }

    close COLORS;
}

# If someone we've colored (either through the saved colors, or the hash
# function) changes their nick, we'd like to keep the same color associated
# with them (but only in the session_colors, ie a temporary mapping).

sub sig_nick {
    my ($server, $newnick, $nick, $address) = @_;
    my $color;

    $newnick = substr ($newnick, 1) if ($newnick =~ /^:/);

    if ($color = $saved_colors{$nick}) {
        $session_colors{$newnick} = $color;
    } elsif ($color = $session_colors{$nick}) {
        $session_colors{$newnick} = $color;
    }
}

# This gave reasonable distribution values when run across
# /usr/share/dict/words

sub simple_hash {
    my ($string) = @_;
    chomp $string;
    my @chars = split //, $string;
    my $counter;

    foreach my $char (@chars) {
        $counter += ord $char;
    }

    $counter = $colors[$counter % scalar(@colors)];

    return $counter;
}

# FIXME: breaks /HILIGHT etc.
sub sig_public {
    my ($server, $msg, $nick, $address, $target) = @_;
    my $chanrec = $server->channel_find($target);
    return if not $chanrec;
    my $nickrec = $chanrec->nick_find($nick);
    return if not $nickrec;
    my $nickmode = $nickrec->{op} ? "@" : $nickrec->{voice} ? "+" : "";

    # hack by wu - recognize people better
    my $basenick = $nick;

    # ignore text in {} when matching nick for color
    $basenick =~ s|\{.*\}.*$||;
    # ignore extra underscores in names
    $basenick =~ s|_+$||;
    $basenick =~ s|^_+||;
    # ignore text after pipe - the latest craze?
    $basenick =~ s,\|.*$,,;
    # ignore case
    $basenick = lc( $basenick );

    my $color;

    # Hacked by wu - check the nick, then the basenick, then look for a 'default'
    for my $name ( $nick, $basenick, 'default' ) {
        # Is there a saved color for this nick?
        if ( $saved_colors{ $name } ) {
            $color = $saved_colors{ $name };
            # Has a color been assigned for this nick?
        } elsif ( $session_colors{ $name } ) {
            $color = $session_colors{ $name };
        }

        last if $color;
    }

    unless ( $color ) {
        # If no color found, pick a random new color for this nick
        $color = simple_hash( $nick );
    }

    # Stash the color for this nick
    $session_colors{$nick} = $color;

    $color = "0".$color if ($color < 10);
    $server->command('/^format pubmsg {pubmsgnick $2 {pubnick '.chr(3).$color.'$0}}$1');
}

sub cmd_color {
    my ($data, $server, $witem) = @_;
    my ($op, $nick, $color) = split " ", $data;

    $op = lc $op;

    if (!$op) {
        Irssi::print ("No operation given");
    } elsif ($op eq "save") {
        save_colors;
    } elsif ($op eq "load") {
        load_colors;
    } elsif ($op eq "set") {
        if (!$nick) {
            Irssi::print ("Nick not given");
        } elsif (!$color) {
            Irssi::print ("Color not given");
        } elsif ($color < 1 || $color > 16) {
            Irssi::print ("Color must be between 1 and 16 inclusive");
        } else {
            $saved_colors{$nick} = $color;
        }
    } elsif ($op eq "keep") {
        if (!$nick) {
            Irssi::print ("Nick not given");
        } elsif ($session_colors{$nick} && !$saved_colors{$nick}) {
            $saved_colors{$nick} = $session_colors{$nick}
        }
    } elsif ($op eq "show") {
        if (!$nick) {
            Irssi::print ("Nick not given");
        } else {
            if ($saved_colors{$nick}) {
                Irssi::print (chr(3) . "$saved_colors{$nick}$nick" . chr(3) . "15 ($saved_colors{$nick})");
            } elsif ($session_colors{$nick}) {
                Irssi::print (chr(3) . "$session_colors{$nick}$nick" . chr(3) . "15 ($session_colors{$nick})");
            } else {
                Irssi::print ("No color found");
            }
        }
    } elsif ($op eq "clear") {
        if (!$nick) {
            Irssi::print ("Nick not given");
        } else {
            delete ($saved_colors{$nick});
        }
    } elsif ($op eq "list") {
        Irssi::print ("Saved Colors:");
        foreach my $nick (keys %saved_colors) {
            Irssi::print (chr (3) . "$saved_colors{$nick}$nick" . chr (3) . "15 ($saved_colors{$nick})");
        }
    } elsif ($op eq "preview") {
        Irssi::print ("Available colors:");
        foreach my $i (1..16) {
            Irssi::print (chr (3) . "$i" . "Color #$i " . chr(3) . "15,$i ");
        }
    } elsif ($op eq "help") {
        Irssi::print ("save");
        Irssi::print ("load");
        Irssi::print ("set \$nick \$color");
        Irssi::print ("keep \$nick");
        Irssi::print ("show \$nick");
        Irssi::print ("clear \$nick");
        Irssi::print ("list");
        Irssi::print ("preview");
    }
}

load_colors;

Irssi::command_bind('color', 'cmd_color');

Irssi::signal_add('message public', 'sig_public');
Irssi::signal_add('event nick', 'sig_nick');
