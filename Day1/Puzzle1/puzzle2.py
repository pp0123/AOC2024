def main():
    # Input file name
    #file_name = input("Enter the file name containing two columns of numbers: ")
    file_name="input.txt"
    try:
        # Open and read the file
        with open(file_name, 'r') as file:
            list1 = []
            list2 = []
            list3 = []

            # Read each line and parse the numbers
            for line in file:
                values = line.strip().split()
                if len(values) == 2:  # Ensure there are exactly two numbers per line
                    num1, num2 = map(float, values)
                    list1.append(num1)
                    list2.append(num2)

        # Sort the lists
        #list1.sort()
        #list2.sort()

        # Compute absolute differences
        #differences = [abs(a - b) for a, b in zip(list1, list2)]

        # Sum the differences
        #total_difference = sum(differences)

        # Print the result
        #print(f"The sum of absolute differences is: {total_difference}")

# Count occurrences of each number in list1 within list2
        for i in range(len (list1)):
            n = list1[i]
            occurs = list2.count(n)
            list3.append(n*occurs)
            print(list3)
            print(sum(list3))

        #occurrences = {num: list2.count(num) for num in list1}
        #print (occurrences)
        # Print the results
        #print(f"The sum of absolute differences is: {total_difference}")
        print("Occurrences of numbers in list1 within list2:")
        #for num, count in occurrences.items():
        #    print(f"Number {num} appears {count} times in list2")

    except FileNotFoundError:
        print(f"Error: The file '{file_name}' was not found.")
    except ValueError:
        print("Error: The file contains invalid data.")

if __name__ == "__main__":
    main()

