# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

$number_of_tests = 50;

BEGIN { $| = 1; print "1..$number_of_tests\n"; }
END {print "not ok 1\n" unless $loaded;}

use Unix::Syslog qw(:macros :subs);

$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):


# print result from last eval expression
sub print_result($) {
  if (shift) { print " not ok"; return 1 }
  else { print " ok"; return 0 }
}

my $n = 2;
my $failures = 0;

print "Testing priorities:\n";
printf "%-20s", 'LOG_EMERG';   eval { LOG_EMERG() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_ALERT';   eval { LOG_ALERT() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_CRIT';    eval { LOG_CRIT() };    $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_ERR';     eval { LOG_ERR() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_WARNING'; eval { LOG_WARNING() }; $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_NOTICE';  eval { LOG_NOTICE() };  $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_INFO';    eval { LOG_INFO() };    $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_DEBUG';   eval { LOG_DEBUG() };   $failures += print_result($@); print " $n\n"; $n++;

print "\nTesting facilities\n";
$fac = 0;
printf "%-20s", 'LOG_KERN';   eval { LOG_KERN() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_USER';   eval { LOG_USER() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_MAIL';   eval { LOG_MAIL() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_DAEMON'; eval { LOG_DAEMON() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_AUTH';   eval { LOG_AUTH() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_SYSLOG'; eval { LOG_SYSLOG() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LPR';    eval { LOG_LPR() };      $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_NEWS';   eval { LOG_NEWS() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_UUCP';   eval { LOG_UUCP() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_CRON';   eval { LOG_CRON() };     $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL0'; eval { LOG_LOCAL0() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL1'; eval { LOG_LOCAL1() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL2'; eval { LOG_LOCAL2() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL3'; eval { LOG_LOCAL3() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL4'; eval { LOG_LOCAL4() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL5'; eval { LOG_LOCAL5() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL6'; eval { LOG_LOCAL6() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_LOCAL7'; eval { LOG_LOCAL7() };   $failures += print_result($@); print " $n\n"; $n++;

print "\nThese facilities are not defined on all systems:\n";
printf "%-20s", 'LOG_AUTHPRIV'; eval { LOG_AUTHPRIV() }; $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_FTP';      eval { LOG_FTP() };      $failures += print_result($@); print " $n\n"; $n++;

print "\nThe number of available facilities is:\n";
printf "%-20s", 'LOG_NFACILITIES '; eval { LOG_NFACILITIES() }; $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_FACMASK';      eval { LOG_FACMASK };       $failures += print_result($@); print " $n\n"; $n++;

print "\nTesting options\n";
printf "%-20s", 'LOG_PID';    eval { LOG_PID() };    $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_CONS';   eval { LOG_CONS() };   $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_ODELAY'; eval { LOG_ODELAY() }; $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_NDELAY'; eval { LOG_NDELAY() }; $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_NOWAIT'; eval { LOG_NOWAIT() }; $failures += print_result($@); print " $n\n"; $n++;

print "\nThese options are not defined on all systems:\n";
printf "%-20s", 'LOG_PERROR'; eval{ LOG_PERROR() };  $failures += print_result($@); print " $n\n"; $n++;

print "\nTesting macros for setlogmask()\n";
printf "%-20s", 'LOG_MASK'; eval { LOG_MASK(1) };    $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_UPTO'; eval { LOG_UPTO(1) };    $failures += print_result($@); print " $n\n"; $n++;

print "\nThese macros are not defined on all systems:\n";
printf "%-20s", 'LOG_PRI';     eval { LOG_PRI(1) };       $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_MAKEPRI'; eval { LOG_MAKEPRI(1,1) }; $failures += print_result($@); print " $n\n"; $n++;
printf "%-20s", 'LOG_FAC';     eval { LOG_FAC(1) };       $failures += print_result($@); print " $n\n"; $n++;

print "\nTesting setlogmask:\n";
print "Setting mask to ", LOG_MASK(LOG_INFO), "\n";
$oldmask = setlogmask(LOG_MASK(LOG_INFO));
$newmask = setlogmask($oldmask);
print "New mask is     $newmask  ";
  $failures += print_result($newmask!=LOG_MASK(LOG_INFO)); print " $n\n"; $n++;

if ($failures == 0) {
  print "\n*** Congratulations! All tests passed.\n\n";
}
else {
  print "\n*** Test results: ", $n-1-$failures, " tests of ", $n-1, " passed!\n\n";
}

print <<EOM;
Testing functions

As the functions `openlog', `closelog' and `syslog' do not return any
value that indicates success or failure, please have a look at the log
file generated by syslogd(8).  The following tests print a message of
the facility `local7' and the priority `info'.

EOM

print "openlog\n";
openlog("Unix::Syslog testsuite", LOG_PID, LOG_LOCAL7);

print "syslog\n";
syslog(LOG_INFO, "Test %d", $n++);
syslog(LOG_INFO, "This message prints a format string: %m (Test %d)", $n++);
syslog(LOG_INFO, "This message prints a percent sign followed by the character \`m\': %%m (Test %d)", $n++);
syslog(LOG_INFO, "This message prints a percent sign followed by a format string: %%%m (Test %d)", $n++);

syslog(LOG_INFO, "This message prints a percent sign followed by the character \`m\': %s (Test %d)", '%m', $n++);
syslog(LOG_INFO, "This message prints two percent signs followed by the character \`m\': %s (Test %d)", '%%m', $n++);
syslog(LOG_INFO, "This message prints three percent signs followed by the character \`m\': %s (Test %d)", '%%%m', $n++);

print "closelog\n\n";
closelog;
