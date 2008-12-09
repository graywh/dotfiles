#!/usr/bin/perl
# ^ to make vim know this is a perl script so I get syntax hilighting.
# $Id: format_identify.pl,v 1.4 2003/05/23 05:02:22 breser Exp $
use strict;
use vars qw($VERSION %IRSSI);
use Irssi qw(signal_stop signal_emit signal_remove
             signal_add signal_add_first
             settings_add_str settings_get_str);
$VERSION = '$Revision: 1.4 $' =~ /\$\w+: (.*?) \$/; 
%IRSSI = (
  authors => 'ResDev (Ben Reser)',
  contact => 'ben@reser.org',
  name  => 'format_identify',
  description => 'Formats msgs and notices when the identify-msg capability is enabled.',
  license => 'GPL2',
  url   => 'http://ben.reser.org/irssi/',
);

# Additional credit to ch for his wash-imsg script which was a starting place
# for this; coekie for pointing me towards the nickcolor script and its technique
# for doing this; Timo Sirainen and Ian Peters for writing nickcolor.

# This script takes advantage of the identify-msg capability of the new dancer ircd.
# The identify-msg capability causes the first character of a msg or notice to be 
# set to a + if the user is identified with nickserve and a - if not.  This script
# removes the tagging and then allows you to configure a modification to the
# formating of the nickname.

# Installation instructions:  Drop this in ~/.irssi/scripts.  Since identify-msg
# is not available on all IRC networks I recommend you add this to your autosendcmd
# on the networks which you intend to run it on:
# /quote capab identify-msg; /script load format_identify
# You can of course put the script in (or symlink it to) the autorun directory
# under the scripts directory.  Just remember the script will not work properly 
# without the identify-msg capability.  If the capability is not enabled it will 
# not tag messages unless someone manually enters a + or - at the beginning of their
# msg or notice.
#
# Configuration:  You can control the formating of the nickname with the
# format_identified_nick, format_unidentified_nick, and format_unknown_nick 
# variables.  The default is to do nothing to identified nicks and unknown nicks.
# while unidentified nicks have a ~ to the beginning of nick.  An unknown nick 
# means anytime a message or notice doesn't start with a + or -, which will occur 
# when identify-msg isn't enabled.  The format_unknown_nick can be really handy to 
# alert you that you don't have identify-msg set, but is set by default
# to do nothing since most servers do not have identify-msg yet.  In these
# variables $0 stands for the nick.  You can use the standard formating codes or 
# just text in it.  See formats.txt for more information on the codes you can use.
# Warning about colors.  Using colors in this formating will likely break other 
# formating scripts and features, in particular the hilight feature of irssi or 
# vice versa.  Remember that %n has a different meaning here as explamined in the 
# default.theme file that comes with irssi.
#
# Some examples:
# 
# Make unidentified nicks have a ? after the nick:
# /set format_unidentified_nick $0?
#
# Make unidentified nicks red and identified nicks green:
# /set format_identified_nick %G$0
# /set format_unidentified_nick %R$0
# Note that the above will not do the tagging if a message gets hilighted.  Since
# a hilight (line or nick) will override the colors.
#
# So I recommend doing something like this:
# /set format_identified_nick %G$0
# /set format_unidentified_nick %R~$0
# 
# Make unidentified nicks be unmodified but add a * before identified nicks:
# /set format_identified_nick *$0
# /set format_unidentified_nick $0
#
# This script works by modifying the formats irssi uses to display various things.
# Therefore it is highly recommended that you do not change any of the following
# format variables except through this script:
# pubmsg pubmsg_channel msg_private msg_private_query pubmsg_hilight
# pubmsg_hilight_channel pubmsg_me pubmsg_me_channel action_private
# action_private_query action_public action_public_channel ctcp_requested
# ctcp_requested_unknown notice_public notice_private ctcp_reply 
# ctcp_reply_channel ctcp_ping reply
#
# To change these formats you need to set the variable (with the set command not
# the format command as usual) of the same name as the format but with _identify
# on the end.  This format has an additional special purpose "abstract" that is
# only used by this script and is parsed and replaced before setting the format
# and giving it to irssi.  It is called format_identify.  Any format you use with
# this script should have a {format_identify $0} in it to replace where the $0
# usually is in the format.  For more examples take a look at the defaults at the
# bottom of this script.
#
# If you wish to disable the module from applying a change to the nickname in 
# a particular place the best way to do it is to simply remove the
# {format_identify $0} from the format that applies.  E.G. to disable the format
# change for a CTCP reply one would do:
# /set ctcp_reply_identify CTCP {hilight $0} reply from {nick $1}: $2
#

# TODO
# * Implement DCC formats, which means figuring out which ones are appropriate
# to try and format.  
# * Implement a system for determining if the identify-msg is on.  The easy way
# would be to send a /quote capab when starting up and then capture the response.
# But then if the user changes it after it's difficult to determine if it's changed.
# Try to get the dancer-ircd people to change this so that it will send the capab
# state after any change so that I can just simply watch for that...
# * Allow different formating on the nick for different types of messages.  I'm
# not sure if this is useful...
# 
# It should not be necessary to modify anything in this script.  Everything should
# be able to be modified via the variables it exports as described above.
# 

my(@format_identify_message_formats) = qw(pubmsg pubmsg_channel msg_private
                                          msg_private_query pubmsg_hilight
                                          pubmsg_hilight_channel action_private
                                          action_private_query action_public
                                          action_public_channel ctcp_requested
                                          ctcp_requested_unknown pubmsg_me
                                          pubmsg_me_channel
                                         );

my(@format_identify_notice_formats) = qw(notice_public notice_private ctcp_reply
                                         ctcp_reply_channel ctcp_ping_reply);

# Replace the {format_identify $0} place holder with
# whatever the user has setup for their nick formats...
sub replace_format_identify {
  my ($format, $entry) = @_;

  $format =~ s/{\s*format_identify\s+?\$0\s*}/$entry/g;
  return $format;
}

# rewrite the message now that we've updated the formats
sub format_identify_rewrite {
  my $signal = shift;
  my $proc = shift;
  
  signal_stop();
  signal_remove($signal,$proc);
  signal_emit($signal, @_);
  signal_add($signal,$proc);
}

  
# Issue the format update after generating the new format.
sub update_format_identify {
  my ($server,$entry,$nick) = @_;

  my $identify_format = settings_get_str("${entry}_identify");
  my $replaced_format = replace_format_identify($identify_format,$nick);
  $server->command("/^format $entry " . $replaced_format);
}

# catches the signal for a message removes the + or -, updates the 
# formats and then resends the message event.
sub format_identify_message {
  my ($server, $data, $nick, $address) = @_;
  my ($channel, $msg) = split(/ :/, $data,2);
  my $identified_nick = settings_get_str('format_identified_nick');
  if(($msg =~ /^\+(.*)/)){
    my $newdata = "$channel :$1";
    my $identified_nick = settings_get_str('format_identified_nick');
    foreach my $format (@format_identify_message_formats) {
      update_format_identify($server,$format,$identified_nick);
    }
    format_identify_rewrite('event privmsg','format_identify_message',
                            $server,$newdata,$nick,$address);
  } elsif(($msg =~ /^-(.*)/)){
    my $newdata = "$channel :$1";
    my $unidentified_nick = settings_get_str('format_unidentified_nick');
    foreach my $format (@format_identify_message_formats) {
      update_format_identify($server,$format,$unidentified_nick);
    } 
    format_identify_rewrite('event privmsg','format_identify_message',
                            $server,$newdata,$nick,$address);
  } else {
    my $unknown_nick = settings_get_str('format_unknown_nick');
    foreach my $format (@format_identify_message_formats) {
      update_format_identify($server,$format,$unknown_nick);
    }
  }

}

# catches the signal for a notice removes the + or -, updates the
# formats and resends the notice event.
sub format_identify_notice {
  my ($server, $data, $nick, $address) = @_;
  my ($channel, $msg) = split(/ :/, $data,2);
  if(($msg =~ /^\+(.*)/)){
    my $newdata = "$channel :$1";
    my $identified_nick = settings_get_str('format_identified_nick');
    foreach my $format (@format_identify_notice_formats) {
      update_format_identify($server,$format,$identified_nick);
    } 
    format_identify_rewrite('event notice','format_identify_notice',
                            $server,$newdata,$nick,$address);
  } elsif(($msg =~ /^-(.*)/)){
    my $newdata = "$channel :$1";
    my $unidentified_nick = settings_get_str('format_unidentified_nick');
    foreach my $format (@format_identify_notice_formats) {
      update_format_identify($server,$format,$unidentified_nick);
    }
    format_identify_rewrite('event notice','format_identify_notice',
                            $server,$newdata,$nick,$address);
  } else {
    my $unknown_nick = settings_get_str('format_unknown_nick');
    foreach my $format (@format_identify_notice_formats) {
      update_format_identify($server,$format,$unknown_nick);
    }
  }
}

# If we're getting unloaded reset the formats back to their defaults
# so that it doesn't wrongly show people being unidentifed or vice versa.
sub format_identify_unload {
  my ($script,$server,$witem) = @_;

  if ($script =~ /^format_identify(?:\.pl|\.perl)?$/) {
    foreach my $format (@format_identify_message_formats,
                        @format_identify_notice_formats) {
      $server->command("/^format -reset $format");
    }
  }
}

# signals to handle the events we need to intercept.
signal_add('event privmsg', 'format_identify_message');
signal_add('event notice', 'format_identify_notice');

# signal needed to catch the unload...  Be sure to be the first to
# get it too...
signal_add_first('command script unload', 'format_identify_unload');

# How we format the nick.  $0 is the nick we'll be formating.
settings_add_str('format_identify','format_identified_nick','$0');
settings_add_str('format_identify','format_unidentified_nick','~$0');
settings_add_str('format_identify','format_unknown_nick','$0');

# What we use for the formats...
# Don't modify here, use the /set command or modify in the ~/.irssi/config file.
settings_add_str('format_identify','pubmsg_identify','{pubmsgnick $2 {pubnick {format_identify $0}}}$1');
settings_add_str('format_identify','pubmsg_channel_identify','{pubmsgnick $3 {pubnick {format_identify $0}}{msgchannel $1}}$2');
settings_add_str('format_identify','msg_private_identify','{privmsg {format_identify $0} $1 }$2');
settings_add_str('format_identify','msg_private_query_identify','{privmsgnick {format_identify $0}}$2');
settings_add_str('format_identify','pubmsg_hilight_identify','{pubmsghinick {format_identify $0} $3 $1}$2');
settings_add_str('format_identify','pubmsg_hilight_channel_identify','{pubmsghinick {format_identify $0} $4 $1{msgchannel $2}$3');
settings_add_str('format_identify','action_private_identify','{pvtaction {format_identify $0}}$2');
settings_add_str('format_identify','action_private_query_identify','{pvtaction_query {format_identify $0}}$2');
settings_add_str('format_identify','action_public_identify','{pubaction {format_identify $0}}$1');
settings_add_str('format_identify','action_public_channel_identify', '{pubaction {format_identify $0}{msgchannel $1}}$2');
settings_add_str('format_identify','ctcp_requested_identify','{ctcp {hilight {format_identify $0}} {comment $1} requested CTCP {hilight $2} from {nick $4}}: $3');
settings_add_str('format_identify','ctcp_requested_unknown_identify','{ctcp {hilight {format_identify $0}} {comment $1} requested unknown CTCP {hilight $2} from {nick $4}}: $3');
settings_add_str('format_identify','pubmsg_me_identify','{pubmsgmenick $2 {menick {format_identify $0}}}$1');
settings_add_str('format_identify','pubmsg_me_channel_identify','{pubmsgmenick $3 {menick {format_identify $0}}{msgchannel $1}}$2');
settings_add_str('format_identify','notice_public_identify','{notice {format_identify $0}{pubnotice_channel $1}}$2');
settings_add_str('format_identify','notice_private_identify','{notice {format_identify $0}{pvtnotice_host $1}}$2');
settings_add_str('format_identify','ctcp_reply_identify','CTCP {hilight {format_identify $0}} reply from {nick $1}: $2');
settings_add_str('format_identify','ctcp_reply_channel_identify','CTCP {hilight {format_identify $0}} reply from {nick $1} in channel {channel $3}: $2');
settings_add_str('format_identify','ctcp_ping_reply_identify','CTCP {hilight PING} reply from {nick {format_identify $0}}: $1.$[-3.0]2 seconds');
