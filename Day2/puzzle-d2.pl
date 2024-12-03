use strict;
use warnings;

sub check_criteria {
    my ($numbers) = @_;
    
    # Check if the list is strictly increasing
    my $is_increasing = 1;
    for my $i (0 .. @$numbers - 2) {
        if ($numbers->[$i] >= $numbers->[$i + 1] || abs($numbers->[$i] - $numbers->[$i + 1]) > 3) {
            $is_increasing = 0;
            last;
        }
    }

    # Check if the list is strictly decreasing
    my $is_decreasing = 1;
    for my $i (0 .. @$numbers - 2) {
        if ($numbers->[$i] <= $numbers->[$i + 1] || abs($numbers->[$i] - $numbers->[$i + 1]) > 3) {
            $is_decreasing = 0;
            last;
        }
    }

    return $is_increasing || $is_decreasing;
}

sub process_file {
    my ($file_path) = @_;
    my $valid = 0;

    if (open my $file, '<', $file_path) {
        while (my $line = <$file>) {
            chomp $line;

            # Convert the line into a list of integers
            my @numbers = split ' ', $line;
            next unless @numbers;  # Skip empty lines
            
            # Try removing each number and check if the list becomes valid
            for my $i (0 .. $#numbers) {
                my @modified_list = @numbers;
                splice @modified_list, $i, 1;  # Remove the number at index $i

                if (check_criteria(\@modified_list)) {
                    print "Valid list after removing index $i ($numbers[$i]): @modified_list\n";
                    $valid++;
                    last;
                }
            }
        }
        close $file;
    } else {
        print "File not found: $file_path\n";
    }

    return $valid;
}

# Example usage
my $file_path = "input.txt";
print "Valid: ", process_file($file_path), "\n";
