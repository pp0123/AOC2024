use strict;
use warnings;

# Read the file content
sub read_file {
    my $filename = shift;
    open my $fh, '<', $filename or die "Can't open file $filename: $!\n";
    my $content = do { local $/; <$fh> };
    close $fh;
    return $content;
}

# Extract and process valid mul instructions
sub process_instructions {
    my $content = shift;
    my $total = 0;

    # Match valid mul instructions and process them
    while ($content =~ /mul\((\d{1,3}),\s*(\d{1,3})\)/g) {
        my ($num1, $num2) = ($1, $2);
        $total += $num1 * $num2;
    }

    return $total;
}

sub main {
    my $filename = 'input.txt';  
    my $content = read_file($filename);
    my $result = process_instructions($content);
    print "Total sum of valid mul results: $result\n";
}

main();