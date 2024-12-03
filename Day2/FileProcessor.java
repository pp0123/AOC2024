import java.io.*;
import java.util.*;

// A class to check criteria for increasing or decreasing sequences.
class CriteriaChecker {

    // Method to check if a list meets the criteria.
    public static boolean checkCriteria(List<Integer> numbers) {
        boolean isIncreasing = true;
        boolean isDecreasing = true;

        for (int i = 0; i < numbers.size() - 1; i++) {
            int diff = Math.abs(numbers.get(i) - numbers.get(i + 1));

            if (!(numbers.get(i) < numbers.get(i + 1) && diff >= 1 && diff <= 3)) {
                isIncreasing = false;
            }

            if (!(numbers.get(i) > numbers.get(i + 1) && diff >= 1 && diff <= 3)) {
                isDecreasing = false;
            }
        }

        return isIncreasing || isDecreasing;
    }
}

// Main processing class to handle file operations and validation.
public class FileProcessor {

    // Method to process the file and count valid sequences.
    public int processFile(String filePath) {
        int validCount = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = reader.readLine()) != null) {
                List<Integer> numbers = parseLineToNumbers(line);

                // Check by removing each number in turn.
                for (int i = 0; i < numbers.size(); i++) {
                    List<Integer> modifiedList = new ArrayList<>(numbers);
                    modifiedList.remove(i);

                    if (CriteriaChecker.checkCriteria(modifiedList)) {
                        System.out.printf("Valid list after removing index %d (%d): %s%n", i, numbers.get(i), modifiedList);
                        validCount++;
                        break;
                    }
                }
            }

        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + filePath);
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        } catch (NumberFormatException e) {
            System.out.println("Error: File contains non-numeric data.");
        }

        return validCount;
    }

    // Helper method to parse a line into a list of integers.
    private List<Integer> parseLineToNumbers(String line) {
        List<Integer> numbers = new ArrayList<>();
        String[] parts = line.trim().split("\\s+");

        for (String part : parts) {
            numbers.add(Integer.parseInt(part));
        }

        return numbers;
    }

    // Main method for execution.
    public static void main(String[] args) {
        FileProcessor processor = new FileProcessor();
        String filePath = "./testinput.txt";
        int validCount = processor.processFile(filePath);
        System.out.println("Valid: " + validCount);
    }
}
