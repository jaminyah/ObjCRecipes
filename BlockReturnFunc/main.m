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