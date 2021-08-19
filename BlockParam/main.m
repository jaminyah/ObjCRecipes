//
//  main.m
//  FunBlocks
//  Passing a block as parameter to a function.

#import <Foundation/Foundation.h>

void blockFunc(void (^)(void));

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // block pointer = block literal
        void (^f)(void) = ^(){ NSLog(@"Hello function f"); };
        blockFunc(f);
    }
}

void blockFunc(void (^g)(void)) {
    NSLog(@"In blockFunc");
    g();
}