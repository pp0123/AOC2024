import re

def process_file(filename):
    try:
        with open(filename, 'r') as file:
            content = file.read()

        # Define a regular expression to match valid mul(X,Y) instructions
        pattern = r"mul\((\d{1,3}),(\d{1,3})\)"

        # Find all matches in the content
        matches = re.findall(pattern, content)

        # Calculate the sum of valid multiplication results
        total_sum = 0
        for match in matches:
            number1, number2 = map(int, match)
            total_sum += number1 * number2

        print(f"The total sum of valid mul instructions is: {total_sum}")

    except FileNotFoundError:
        print(f"Error: The file '{filename}' does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    filename = "testinput.txt"
    process_file(filename)