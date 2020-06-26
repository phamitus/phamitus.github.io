#!/usr/bin/perl -w

open AUTO, "source.txt" or die "Could not open auto.txt";

@auto_contents = <AUTO>;

open FWRITE, ">index.html" or die "Could not open index.html to write";

print FWRITE "<!DOCTYPE html>\n";
print FWRITE "<html>\n";
print FWRITE "<head>\n";
print FWRITE "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">";
print FWRITE "  <link rel=\"stylesheet\" href=\"styles.css\">\n";
print FWRITE "  <title>List of currently open job positions at PTC Inc.</title>";
print FWRITE "</head>\n";
print FWRITE "<body>\n";
print FWRITE "<h2>List of currently open job positions at <a href=\"https:\/\/www.ptc.com\/\" target=\"_blank\">PTC Inc.</a></h2>\n";
print FWRITE "<div style=\"overflow-x:auto\;\">";
print FWRITE "<table>\n";
print FWRITE "  <tr>\n";
print FWRITE "    <th style=\"color:red;\">Job Title (click to check job description & APPLY)</th>\n";
print FWRITE "    <th>Experience</th>\n";
print FWRITE "    <th>Job Location</th>\n";
print FWRITE "  </tr>\n";

foreach $test_line (@auto_contents)
{

	$test_line =~ s/\r|\n//g;  #remove new line/carriage return from line
	
	@s_contents = split(/,/, $test_line);
	
	$job_title = $s_contents[0];
	$experience = $s_contents[1];
	$location = $s_contents[2];
	$apply_url = $s_contents[3];
	
	print FWRITE "<tr>\n";
    print FWRITE "<td><a href=\"$apply_url\" target=\"_blank\">$job_title</a></td>\n";
    print FWRITE "<td>$experience</td>\n";
	print FWRITE "<td>$location</td>\n";
	print FWRITE "</tr>\n";

}

@months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
@days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();

$datetime = localtime();

print FWRITE "</table>\n";
print FWRITE "</div>\n";
#print FWRITE "<br><h4>Last updated: $days[$wday], $mday $months[$mon] $year</h4>\n";
print FWRITE "<br><h4>Last updated: $datetime</h4>\n";
print FWRITE "</body>\n";
print FWRITE "</html>\n";

close FWRITE;

close AUTO;