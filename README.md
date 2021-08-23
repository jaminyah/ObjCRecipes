# Objective - C Recipies

## References:
1. Programming in Objective-C, 6th Edition
2. https://www.journaldev.com/10182/nsarray-nsmutablearray-objective-c-array
3. https://code.tutsplus.com/tutorials/understanding-objective-c-blocks--mobile-14319
4. https://www.techotopia.com/index.php/An_iOS_7_Graphics_Tutorial_using_Core_Graphics_and_Core_Image
5. https://stackoverflow.com/questions/31693328/draw-multiple-lines-core-graphics
6. https://atozmath.com/example/CONM/Bisection.aspx?he=e&q=nr&ex=2

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

2. Blocks

3. Concurrency
3.1 NSThread
3.2 Thread Pool

4. Memory Management
4.1 Autorelease Pool

5. Core Graphics

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

1.3.2.1 Populate a mutable array with values from 0 - 19. <br/>
Using <code>addObject:@(i)</code>

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

1.3.2.2 Populate a mutable array with values from 0 - 19 <br/>
Using <code>[[NSNumber alloc] initWithInt: i]</code>

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

> typealias asssigns a local name to a type

1.4.1 Convert NSUInteger to integer
```c
typealias distance_t = long;      // Assigns a local name to a type
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


2. Blocks

2.1 General syntax

```bash
block pointer = block literal
```

```objc
return-type (^blockName)(in-params) = ^(in-params) {

    // function body

    return returntype;
}
```

2.2 Block pointer and block literal
```objc
int (^add)(int, int) = ^(int a, int b) {
    return (a + b);
}
```

2.3 Using separate statements for block pointer and block literal.
```objc
#import <Foundation/Foundation.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        double (^g)(double, double);
        g = ^(double m, double n) { return m * n; };
        
        double product = g(2, 5);
        NSLog(@"%.2f", product);
    }
}
```

2.4 Define and use a function block.
```objc
#import <Foundation/Foundation.h>

void blockFunc(void (^)(void));

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // define the block function
        int (^threeMultiply)(int, int, int) = ^(int i, int j, int k) {
            int product = i * j * k;
            return product;
        };
        
        int x = 4, y = 8, z = 3;
        int result = threeMultiply(x, y, z);
        NSLog(@"%d", result);
    }
}
```

2.5 Calling a function that take a block as parameter.
```objc
#import <UIKit/UIKit.h>

void blockFunc(void (^)(void));

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        void (^f)(void) = ^(){ NSLog(@"Hello function f"); };
        blockFunc(f);
    }
}

void blockFunc(void (^g)(void)) {
    NSLog(@"In blockFunc");
    g();
}
```

2.6 Calling with a block literal as parameter
```objc
#import <Foundation/Foundation.h>

void blockFunc(void (^)(void));

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Calling with a block literal
        blockFunc(^{ NSLog(@"Hello, World!");});
    }
    return 0;
}

void blockFunc(void (^f)(void)) {
    NSLog(@"In block function.");
    f();
}
```

2.7 Error - none execution of the block parameter
```objc
#import <Foundation/Foundation.h>

void blockFunc(void (^)(void));

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Calling with a block literal
        blockFunc(^{ NSLog(@"Hello, World!");});
    }
    return 0;
}

void blockFunc(void (^f)(void)) {
    NSLog(@"In block function.");
    // f();                         /* Block param will not be called */
}

```

2.8 Using a block typedef with a block literal.
```objc
#import <Foundation/Foundation.h>

typedef void (^greetBlock)(void);
void blockFunc(greetBlock);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Calling with a block literal
        blockFunc(^{ NSLog(@"Hello, World!");});
    }
    return 0;
}

void blockFunc(void (^f)(void)) {
    NSLog(@"In block function.");
    f();
}
```

2.9 Using a block typedef with a block definition.
```objc
#import <Foundation/Foundation.h>

typedef void (^greet_t)(void);

void blockFunc(greet_t);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Calling with a block definition
        void (^helloWorld)(void) = ^{NSLog(@"Hello, Blocks World!");};
        blockFunc(helloWorld);
    }
    return 0;
}

void blockFunc(void (^f)(void)) {
    NSLog(@"In block function.");
    f();
}
```

2.10 Using a block typedef with a helloWorld literal
```objc
#import <Foundation/Foundation.h>

typedef void (^greet_t)(void);

void blockFunc(greet_t);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Using a block typedef
        greet_t helloWorld = ^{NSLog(@"Hello, Blocks World!");};
        blockFunc(helloWorld);
    }
    return 0;
}

void blockFunc(void (^f)(void)) {
    NSLog(@"In block function.");
    f();
}
``` 

2.11 Declaring a block type <br/>

Type name - sum_t <br/>
In params - (int, int) <br/>
Return type - int <br/>

```objc
typedef int (^sum_t)(int, int);
```

2.12 Declaring a block-type variable
```objc
int (^sum_t)(int, int) sum;
```

2.13 Using a block-type variable
```objc
int (^sum)(int, int);
sum = ^(int x, int y) { return (x + y); };
        
NSLog(@"Sum: %d", sum(7, 11));
```

2.10 Passing in a block pointer with parameters
```objc
#import <Foundation/Foundation.h>

typedef int (^add_t)(int, int);

int blockFunc(add_t);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Create block pointer and block literal
        int (^sumInts)(int, int) = ^(int x, int y) { return (x + y); };
        
        // Passing block pointer as paramater
        int result = blockFunc(sumInts);
        NSLog(@"result: %d", result);
    }
    return 0;
}

int blockFunc(add_t add) {
    NSLog(@"In block function.");
    
    int a = 2, b = 7;
    int output = add(a, b);
    
    return output;
}
```

2.11 Passing in a block literal as parameter
```objc
#import <Foundation/Foundation.h>

typedef int (^add_t)(int, int);

int blockFunc(add_t);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Passing block literal as paramater
        int result = blockFunc(^(int x, int y) { return (x + y);});
        NSLog(@"result: %d", result);
    }
    return 0;
}

int blockFunc(add_t add) {
    NSLog(@"In block function.");
    
    int a = 2, b = 7;
    int output = add(a, b);
    
    return output;
}
```
2.12 Returning a block syntax
```objc
return-type (^block-name)(block-in-params)) (return-block-in-params);
```

2.13 Return basic math functions using blocks
```objc

#import <Foundation/Foundation.h>

typedef int (^math_t)(int, int);

math_t mathOperation(NSString *mathFunc);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        math_t mathOp = mathOperation(@"Add");
        int sum = mathOp(6, 9);

        mathOp = mathOperation(@"Mul");
        int mul = mathOp(9, 6);
        
        NSLog(@"mathOp(6, 9): %d", sum);
        NSLog(@"mathOp(9, 6): %d", mul);
    }
}

math_t mathOperation(NSString *mathFunc) {
    
    if ([mathFunc isEqualToString:@"Add"]) {
        return ^(int a, int b) {
            return (a + b);
        };
    } else if ([mathFunc isEqualToString:@"Sub"]) {
        return ^(int a, int b) {
            return (a - b);
        };
    } else if ([mathFunc isEqualToString:@"Mul"]) {
        return ^(int a, int b) {
            return (a * b);
        };
    } else if ([mathFunc isEqualToString:@"Div"]) {
        return ^(int a, int b) {
            if (b == 0) {
                return -999;
            } else {
                return (a / b);
            }
        };
    } else {
        return ^(int a, int b) {
            return -999;
        };
    }
}
```

2.14 Refractoring the previous code to use enums
```objc
#import <Foundation/Foundation.h>

typedef int (^math_t)(int, int);
typedef NS_ENUM(NSUInteger, MathFunc) {
    ADD,
    SUB,
    MUL,
    DIV
};

math_t mathOperation(MathFunc mathFunc);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        math_t mathOp = mathOperation(ADD);
        int sum = mathOp(6, 9);

        mathOp = mathOperation(MUL);
        int mul = mathOp(9, 6);
        
        NSLog(@"mathOp(6, 9): %d", sum);
        NSLog(@"mathOp(9, 6): %d", mul);
    }
}

math_t mathOperation(MathFunc mathFunc) {
    
    switch (mathFunc) {
        case ADD:
            NSLog(@"ADD");
            return ^(int a, int b) {
                return (a + b);
            };
            break;
        case SUB:
            NSLog(@"SUB");
            return ^(int a, int b) {
                return (a - b);
            };
            break;
        case MUL:
            NSLog(@"MUL");
            return ^(int a, int b) {
                return (a * b);
            };
            break;
        case DIV:
            NSLog(@"DIV");
            return ^(int a, int b) {
                if (b == 0) {
                    return -999;
                } else {
                    return (a / b);
                }
            };
            break;
        default:
            break;
    }
}
```

2.15 Pass a block into a function
```objc
#import <Foundation/Foundation.h>
#include <math.h>

typedef int (^calc_t)(int);

void mathFunc(int numArray[], int size, calc_t calc);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int nums[] = { 4, 9, 2, 7, 3};
        int len = 5;
        
        mathFunc(nums, len, ^(int a) {return (int)pow(a, 2.0);});
        
        // display result array
        for (int j = 0; j < len; j++) {
            NSLog(@"%d", nums[j]);
        }
    }
}

void mathFunc(int numArray[], int size, calc_t calc) {
    
    for (int i = 0; i < size; i++) {
        numArray[i] = calc(numArray[i]);
    }
}
```
2.16 Use Newton-Raphson method to find square root

```objc
/* Find square root using Newton-Raphson method
 * g0 - initial guess of the square root
 * g1 - Newton-Raphson improvement
 * f(0) - Function with initial guess
 * f'(0) - Derivative of function with initial guess
 * g1 = g0 - f(0)/ f'(0)
 * 
 * Example: Find the square root of 10.
 *
 * let x = initial guess.
 * then x = square_root(10) is the problem to solve.
 * square both sides of the equation.
 * x^2 = 10
 * x^2 - 10 = 0
 * let f(x) = x^2 - 10
 * derivative f(x) = f'(x) = 2x
 * Newton-Raphson formula:
 * let x1 = new guess
 * x1 = x - f(x)/ f'(x)
 * giving, x1 = x - (x^2 - 10) / 2x
 * then, x1 = 2x/2 - (x - 10/x)/2 = (x + 10/x)/2
 * let n = input number 
 * so in general, g1 = (g0 + n/g0)/2
 */

#import <Foundation/Foundation.h>
#include <math.h>

double sqrt(double n);
double absVal(double n);

int main(int argc, const char* argv[]) {
    double number = 10.0;
    double root = sqrt(number);
    NSLog(@"root: %.4f\n", root);
}

double sqrt(double n) {
    
    double g = n / 2.0;          // start with a guess of the sqrt
    double error = 0.00001;
    
    while (absVal(n - g*g) > error)
    {
        g = (g + n/g) / 2.0;    // Newton-Raphson sqrt formula
    }
    return g;
}

double absVal(double n) {
    double val = (n < 0) ? -1 * n : n;
    return val;
}
```

2.17 Newton-Raphson implementaton with blocks
```objc
#import <Foundation/Foundation.h>
#include <math.h>

typedef double(^sqrt_t)(double);
double absVal(double n);

int main(int argc, const char* argv[]) {
    
    double number = 12.0;
    sqrt_t sqrt = ^(double n){
        double g = n / 2.0;          // start with a guess of the sqrt
        double error = 0.00001;
        
        while (absVal(n - g*g) > error) {
            g = (g + n/g) / 2.0;    // Newton-Raphson sqrt formula
        }
        return g;
    };
    
    double root = sqrt(number);
    NSLog(@"root: %.4f\n", root);
}

double absVal(double n) {
    double val = (n < 0) ? -1 * n : n;
    return val;
}
```


2.18 Use blocks to return a sort function. <br/>
Return type - NSArray (^)(NSMutableArray) <br/>
Block name - sortAlgo <br/>
Block input param - NSString * <br/>

```objc
NSArray* (^sortAlgo(NSString *)) (NSMutableArray *);
```

Using a block as return-type
```objc
typdef NSArray* (^algo_t)(NSMutableArray *);
```

3. Concurrency
3.1 NSThread
3.2 Thread Pool

3.3 Grand Central Dispatch (GCD)

4. Memory Management

```objc
- (void) setName: (NSString *) name {
    [_name release];
    _name = name;
    [_name retain];
}
```

4.1 Autoreleasepool Context

The autoreleasepool is a mechanism that allows the system to efficiently manage the memory your application uses as it creates new objects. Ownership of data is temporarily transferred to the run loop, for data that can be disposed at the end of the run loop cycle or should be claimed before the end of the loop cycle.

5. Core Graphics
 
 UIKit Core Graphics framework has Quartz 2D has its graphics drawing engine. Application developers interact with the Core Graphics framework using C based function calls. Drawing in a UIView is performed by the drawRect: method. 
* setNeedDisplay - is used to force a redraw of the screen when the drawRect: method is not called automatically.
* CGPoint - (width: CGFloat, height: CGFloat);

5.1 Draw a line - using color space reference
* Create a Cocoa Touch class named Draw2D and make it a subclass of UIView
* Set the storyboard view to be of class Draw2D.

Draw2D.h Header file
```objc
// Draw2D.h

#import <UIKit/UIKit.h>

@interface Draw2D : UIView

@end
```

Draw2D.m Implementation file
```objc
#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    // get context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set line width
    CGContextSetLineWidth(context, 2.0);
    
    // create a color reference
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // opaque red
    CGFloat components[] = {1.0, 0.0, 0.0, 1.0};
    CGColorRef color = CGColorCreate(colorSpace, components);
    
    // use color space ref and context
    CGContextSetStrokeColorWithColor(context, color);
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midPoint = screenSize.width / 2.0;
    
    // move to the start point to be drawn
    CGContextMoveToPoint(context, midPoint, 0);
    
    // set end point
    CGContextAddLineToPoint(context, midPoint, screenSize.height);
    
    // draw the line
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorSpace);
    CGColorRelease(color);
}

@end
```
5.2 Draw a line - using UIColor

```objc
#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    // get context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set line width
    CGContextSetLineWidth(context, 2.0);
       
    // use uicolor
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midPoint = screenSize.width / 2.0;
    
    // move to the start point
    CGContextMoveToPoint(context, midPoint, 0);
    
    // set end point
    CGContextAddLineToPoint(context, midPoint, screenSize.height);
    
    // draw the line
    CGContextStrokePath(context);
}
@end
```

5.3 Draw a vertical line using UIBezierPath
```objc
#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    // name several screen dimensions
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midPointX = screenSize.width / 2.0;
    CGFloat endPointY = screenSize.height;
    
    // draw red line vertically centered
    UIBezierPath *redline = [UIBezierPath bezierPath];
    [redline moveToPoint:CGPointMake(midPointX, 0)];
    [redline addLineToPoint:CGPointMake(midPointX, endPointY)];
    [[UIColor redColor] set]; //Set color to red
    [redline stroke];
}

@end
```

5.4 Draw horizontal and vertical lines using UIBezierPath
```objc
#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    // name several screen dimensions
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midPointX = screenSize.width / 2.0;
    CGFloat midPointY = screenSize.height / 2.0;
    CGFloat endPointY = screenSize.height;
    
    // draw red line vertically centered
    UIBezierPath *redline = [UIBezierPath bezierPath];
    [redline moveToPoint:CGPointMake(midPointX, 0)];
    [redline addLineToPoint:CGPointMake(midPointX, endPointY)];
    [[UIColor redColor] set]; //Set color to red
    [redline stroke];
    
    // draw blue line horizontally centered
    UIBezierPath *blueline = [UIBezierPath bezierPath];
    [blueline moveToPoint:CGPointMake(0, midPointY)];
    [blueline addLineToPoint:CGPointMake(screenSize.width, midPointY)];
    [[UIColor blueColor] set]; //Change color to blue
    [blueline stroke];
}
@end
```
5.5 Draw lines from left-side center across screen top

```objc
#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    // name several screen dimensions
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midPointY = screenSize.height / 2.0;

    // draw from left top-center
    for (int i = 0; i <= screenSize.width; i += (screenSize.width/10)) {
        UIBezierPath *redline = [UIBezierPath bezierPath];
        [redline moveToPoint:CGPointMake(0, midPointY)];
        [redline addLineToPoint:CGPointMake(i, 0)];
        [[UIColor redColor] set]; //Set color to red
        [redline stroke];
    }
}
@end
```
5.6 Draw lines from left and right-size center across screen top
```objc
#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    // name several screen dimensions
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midPointY = screenSize.height / 2.0;

    // draw from left top-center
    for (int i = 0; i <= screenSize.width; i += (screenSize.width/10)) {
        UIBezierPath *redline = [UIBezierPath bezierPath];
        [redline moveToPoint:CGPointMake(0, midPointY)];
        [redline addLineToPoint:CGPointMake(i, 0)];
        [[UIColor redColor] set]; //Set color to red
        [redline stroke];
    }
    
    // draw from right top-center
    for (int i = 0; i <= screenSize.width; i += (screenSize.width/10)) {
        UIBezierPath *blueline = [UIBezierPath bezierPath];
        [blueline moveToPoint:CGPointMake(screenSize.width, midPointY)];
        [blueline addLineToPoint:CGPointMake(i, 0)];
        [[UIColor blueColor] set]; //Set color to red
        [blueline stroke];
    }
}
@end
```

5.7 Draw a closed path with UIBezierPath <br/>
5.7.1 - Trapezoidal
```objc
#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midX = screenSize.width / 2.0;
    CGFloat midY = screenSize.height / 2.0;
    CGFloat len = 200.0;                                      // longest side
    
    UIBezierPath *tapezoid = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    [tapezoid moveToPoint:CGPointMake(midX, (midY - len/2.0))];
    
    // line to point 2
    [tapezoid addLineToPoint:CGPointMake((midX + len/2.0), (midY - len/4.0))];
    // line to point 3
    [tapezoid addLineToPoint:CGPointMake((midX + len/2.0), (midY + len/4.0))];
    // line to point 4
    [tapezoid addLineToPoint:CGPointMake((midX - len/2.0), (midY + len/4.0))];
    // line to point 5
    [tapezoid addLineToPoint:CGPointMake(midX - len/2.0, (midY - len/4.0))];
    
    [tapezoid closePath];
    
    [[UIColor redColor] set];
    [tapezoid stroke];
}
@end
```