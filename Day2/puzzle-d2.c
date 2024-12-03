#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MAX_LINE_LENGTH 1024

// Function to check if the array satisfies the criteria
int check_criteria(int *numbers, int size) {
    int is_increasing = 1, is_decreasing = 1;

    for (int i = 0; i < size - 1; i++) {
        int diff = abs(numbers[i] - numbers[i + 1]);
        if (!(numbers[i] < numbers[i + 1] && diff >= 1 && diff <= 3)) {
            is_increasing = 0;
        }
        if (!(numbers[i] > numbers[i + 1] && diff >= 1 && diff <= 3)) {
            is_decreasing = 0;
        }
    }

    return is_increasing || is_decreasing;
}

// Function to process the file
int process_file(const char *file_path) {
    FILE *file = fopen(file_path, "r");
    if (!file) {
        printf("File not found: %s\n", file_path);
        return 0;
    }

    char line[MAX_LINE_LENGTH];
    int valid = 0;

    while (fgets(line, sizeof(line), file)) {
        int numbers[MAX_LINE_LENGTH];
        int size = 0;

        // Parse the line into integers
        char *token = strtok(line, " ");
        while (token) {
            numbers[size++] = atoi(token);
            token = strtok(NULL, " ");
        }

        // Check by removing each number
        for (int i = 0; i < size; i++) {
            int modified_list[MAX_LINE_LENGTH];
            int new_size = 0;

            for (int j = 0; j < size; j++) {
                if (j != i) {
                    modified_list[new_size++] = numbers[j];
                }
            }

            if (check_criteria(modified_list, new_size)) {
                printf("Valid list after removing index %d (%d): ", i, numbers[i]);
                for (int k = 0; k < new_size; k++) {
                    printf("%d ", modified_list[k]);
                }
                printf("\n");
                valid++;
                break;
            }
        }
    }

    fclose(file);
    return valid;
}

int main() {
    const char *file_path = "input.txt";
    printf("Valid: %d\n", process_file(file_path));
    return 0;
}
