/**
* This program computes the factorial of a number
*/
public class Factorial {                   // Define a class
  public static void main(String[] args) { // The program starts here
    int input = Integer.parseInt(args[0]); // Get the user's input
    int result = factorial(input);      // Compute the factorial
    System.out.printf("Answer: %d\n", result);            // Print out the result
  }                                        // The main() method ends here

  public static int factorial(int x) {  // This method computes x!
    if (x < 0)                             // Check for bad input
      return 0;                          // If bad, return 0
    int fact = 1;                     // Begin with an initial value
    while(x > 1) {                         // Loop until x equals 1
      fact = fact * x;                     // Multiply by x each time
      x = x - 1;                           // And then decrement x
    }                                      // Jump back to start of loop
    return fact;                           // Return the result
  }                                        // factorial() ends here
}                                          // The class ends here
