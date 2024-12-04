use strict;
use warnings;

sub read_file {
    my $filename = shift;
    open my $fh, '<', $filename or die "Can't open file $filename: $!\n";
    my $content = do { local $/; <$fh> };
    close $fh;
    return $content;
}

sub process_instructions {
    my $content = shift;
    my $total = 0;
    my $mul_enabled = 1;  
    
    #grrr...remember the ' in the matching sting...sigh
    while ($content =~ /([a-zA-Z']+?\([^\)]*\))/g) {
        my $instruction = $1;
        print "instruct: $instruction\n";
        
       
        if ($instruction =~ /do\(\)/) {
            $mul_enabled = 1;
            next;  
        }
        
        
        if ($instruction =~ /don't\(\)/) {
            $mul_enabled = 0;
            next;  
        }
        
        if ($mul_enabled && $instruction =~ /mul\((\d{1,3}),\s*(\d{1,3})\)/) {
            my ($num1, $num2) = ($1, $2);
            $total += $num1 * $num2;
        }
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