
def check_criteria(numbers):
    is_increasing = all(numbers[i] < numbers[i+1] and 1 <= abs(numbers[i] - numbers[i+1]) <= 3 for i in range(len(numbers) - 1))
    is_decreasing = all(numbers[i] > numbers[i+1] and 1 <= abs(numbers[i] - numbers[i+1]) <= 3 for i in range(len(numbers) - 1))
    return is_increasing or is_decreasing

def process_file(file_path):
    valid = 0
    try:
        with open(file_path, 'r') as file:
            for line in file:
                # Convert the line into a list of integers
                numbers = list(map(int, line.split()))
                
                # Try removing each number and check if the list becomes valid
                for i in range(len(numbers)):
                    modified_list = numbers[:i] + numbers[i+1:]  # Remove the number at index i
                    if check_criteria(modified_list):
                        print(f"Valid list after removing index {i} ({numbers[i]}): {modified_list}")
                        valid += 1
                        break  

                
        return valid
    except FileNotFoundError:
        print(f"File not found: {file_path}")
    except ValueError:
        print("Error: File contains non-numeric data.")

# Example usage
if __name__ == "__main__":
    file_path = "input.txt"
    print ("Valid:",process_file(file_path))