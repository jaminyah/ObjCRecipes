# Objective - C Recipies

## References:
1. Programming in Objective-C, 6th Edition
2. https://www.journaldev.com/10182/nsarray-nsmutablearray-objective-c-array

```bash
1. Compiling and Running
1.1 Hello World Program
1.2 Compilation

1.3 Classes
1.3.1 Interface Section

1.4 Arrays
1.4.1. NSArray
1.4.2. NSMutableArray

1.5 Type Casting
1.5.1 NSUInteger to int

2. Concurrency
2.1 NSThread
2.2 Thread Pool

3. Memory Management
3.1 Autorelease Pool

```

1. Compiling and Running

1.1 Hello World Program

```objc
main.m

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // execute code within the autoreleasepool context
    @autoreleasepool {
        // @ - Makes the string literal a NSString object
        NSLog(@"Hello, World!);
    }
    return 0;
}
```

1.2 Compilation 

At the command line change into the Hello directory
```bash
cd Hello
ls         // main.m
```

Compile main.m with the following command:
```bash
clang -fobjc-arc  -framework Foundation main.m
```

Run with:
```bash
 ./a.out
```
or: 
```bash
clang -fobjc-arc main.m -o main
```
Run with:
```bash
 ./main
 ```

1.3 Classes

```objc
#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
  
        Fraction *fraction;
        
        fraction = [Fraction alloc];

        // *** Terminating app due to uncaught exception 'NSInvalidArgumentException', 
        // reason: '*** +[Fraction<0x1000011d0> init]: cannot init a class object.'
        fraction = [Fraction init];             // Compiler error 
        
        [fraction setNumerator:1];
        [fraction setDenominator:3];
        
        NSLog(@"The fraction is: ");
        [fraction print];
    }
    return 0;
}
```

```objc
// main.m
#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
  
        Fraction *fraction;
        
        fraction = [Fraction alloc];    // fraction = [[Fraction alloc] init];

        // Correction
        fraction = [fraction init];  
        
        [fraction setNumerator:1];
        [fraction setDenominator:3];
        
        NSLog(@"The fraction is: ");
        [fraction print];
    }
    return 0;
}
```

1.3.1 Interface section
The @interface section of the program declares all the methods in the class. 

For example:
```objc
- (void) print;
- (void) setNumerator: (int) n;
- (void) setDenominator: (int) d;
- (int) numerator;                      // Returns the numerator
- (int) denominator;                    // Returns the denominator
```

(-) Indicates that the method is an instance method. That is, an instance of the class has to be created inorder to use the method.
```objc
Fraction *fraction = [[Fraction alloc] init];  // Also Fraction *fraction = [Fraction new];
[fraction setNumerator: 1];
[fraction setDenominator: 3];
[fraction print];
```
(+) Indicates that the method is a class method. 

1.3 Array

1.3.1 NSArray

    TODO - NSARRAY

1.3.2 NSMutableArray

Reference: 
https://stackoverflow.com/questions/22153463/nsmutablearray-with-int-values-from-1-to-100

Technique # 1
1.3.2.1 Populate a mutable array with values from 0 - 19.
```objc
//  main.m
//  Populate a mutable array with values from 0 - 19

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *numArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 20; i++) {
            [numArray addObject:@(i)];
        }
        NSLog(@"%@", numArray);
    }
    return 0;
}
```
Technique # 2
1.3.2.2 Populate a mutable array with values from 0 - 19.
```objc
//  main.m
//  Populate a mutable array with values from 0 - 19

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *numArray = [[NSMutableArray alloc] init];
        NSNumber *numObj;

        for (int i = 0; i < 20; i++) {
            numObj = [[NSNumber alloc] initWithInt: i];
            [numArray addObject: numObj];
        }
        NSLog(@"%@", numArray);
    }
    return 0;
}
```

1.3.2.3 Initialize a NSMutableArray with int values:
```objc
//
//  main.m

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *numArray = [NSMutableArray arrayWithObjects:@(1), @(9), @(6), @(0), @(0), nil];
        NSLog(@"%@", numArray);
    }
    return 0;
}
```

1.3.2.4 Initialize a NSMutableArray with string values:
```objc
//
//  main.m

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *numArray = [NSMutableArray arrayWithObjects:@("MacBook Pro"), @("iPad")), @("iPhone"), @("iPod"), @("Mac Pro"), nil];
        NSLog(@"%@", numArray);
    }
    return 0;
}
```

1.3.2.5 Iterate over NSMutableArray
1.3.2.5.1 Array of integers
```objc
//  main.m

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
 
        NSMutableArray *numArray = [NSMutableArray arrayWithObjects:@(5), @(9), @(3), @(0), @(7), @(1), @(0), @(4), nil];
        
        for (int i = 0; i < [numArray count]; i++) {
            NSLog(@"%@", numArray[i]);
        }
    }
    return 0;
}
```

1.3.2.5.2 Iterate over array of string values - For loop

```objc
NSArray *computers = @[@"MacPro", @"MacBook Pro", @"Mac Air", @"iPhone", @"iPad", @"iPod"];

for (int i = 0; i < [computers count]; i++) {
    NSLog(@"%@", computers[i]);
}
```

1.3.2.5.2 Iterate over array of string values - For-in loop

```objc
NSArray *devices = @[@"MacPro", @"MacBook Pro", @"Mac Air", @"iPhone", @"iPad", @"iPod"];

for (NSString *device in devices) {
    NSLog(@"%@", device);
}
```

1.3.2.6 Contained in Array
```objc
NSArray *devices = @[@"MacPro", @"MacBook Pro", @"Mac Air", @"iPhone", @"iPad", @"iPod"];
BOOL found = NO;

if ([devices containsObject: @"iPhone 6"]) {
    found = YES;
}
```

1.3.2.7 Not Contained at index
```objc
NSArray *devices = @[@"MacPro", @"MacBook Pro", @"Mac Air", @"iPhone", @"iPad", @"iPod"];
NSUInteger location = [devices indexOfObject: @"iPhone 6"];
BOOL found = NO;

if (location != NSNotFound) {
    found = YES;
}
```

1.3.2.8 Examples 
* Move zeros to front of array

1.3.2.8.1 Move all zeros to the front of an array

```objc
//  ViewController.m
//  MoveZeros

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *numArray = [NSMutableArray arrayWithObjects:@(0), @(5), @(9), @(3), @(0), @(7), @(1), @(0), @(4), nil];
    numArray = moveZeros(numArray);
    
    // Display new contents
    for (int i = 0; i < [numArray count]; i++) {
        NSLog(@"%@", numArray[i]);      // type of numArray is id
    }
}

NSMutableArray* moveZeros(NSMutableArray *array) {
    
    int size = (int)[array count];
    int i = 0;
    int j = size - 1;
    
    while (i < j) {
        
        // value at i is already zero
        id obj1 = [array objectAtIndex:i];
        if ([obj1 isEqualToValue:@(0)]) {
            i = i + 1;
            continue;
        }
        
        // decrement j until value zero is found
        id obj2 = [array objectAtIndex:j];
        if ([obj2 isEqualToValue:@(0)]) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            i = i + 1;
        }
        
        j = j - 1;
    }
    return array;
}
@end
```

1.4 Type Casting

> typedef takes an existing type and renames it with a local identifier

```c
typedef long miles_t;             // Renames type long to miles_t locally
```

> typealias 
1.4.1 Convert NSUInteger to integer
```c
typealias distance_t = long;      // Assigns a local name to be of a certain type
```

Per the Apple documentation, NSUInteger is a typedef of an unsigned long. A 64-bit application treats NSUInteger as a 64-bit unsigned integer.

```objc
typedef unsigned long NSUInteger;
```
NSUInteger returns a 64-bit integer value which becomes truncated on a 32-bit system.

```objc
(NSMutableArray*) moveZeros(NSMutableArray *array) {
    int size = (int)[array count];   // [array count] return type is NSUInteger

    // Useage
    for (int i = 0; i < size; i++) {
        ...
    }
}
```


2. Concurrency


3. Memory Management

3.1 Autoreleasepool Context

The autoreleasepool is a mechanism that allows the system to efficiently manage the memory your application uses as it creates new objects. Ownership of data is temporarily transferred to the run loop, for data that can be disposed at the end of the run loop cycle or should be claimed before the end of the loop cycle.
