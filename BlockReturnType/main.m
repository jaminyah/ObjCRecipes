//  main.m
//
//  Created on 8/19/21.
//  Copyright © 2021 jaminya. All rights reserved.

#import <Foundation/Foundation.h>

typedef NSArray* (^sort_t)(NSMutableArray *);

sort_t algoStrategy(NSString *);
sort_t quickSort(void);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // Sorting strategy pattern using block returning a block
        NSMutableArray *unsorted = [NSMutableArray arrayWithObjects:@(9), @(3), @(11), @(8), nil];
        NSString *algoString = @"quickSort";
        sort_t qSort = algoStrategy(algoString);
        NSArray *sorted = qSort(unsorted);

        // Display new contents
        for (int i = 0; i < [sorted count]; i++) {
            NSLog(@"%@", sorted[i]);                // type of numArray is id
        }
    }
    return 0;
}

sort_t algoStrategy(NSString *algo) {
    
    sort_t algorith;
    
    if ([algo isEqualToString:@"quickSort"]) {
        NSLog(@"Algorith = quickSort");
        algorith = quickSort();
    } else if ([algo isEqualToString:@"mergeSort"]){
        // TODO - Implement merge sort.
    } else {
        algorith = ^(NSMutableArray *arr) {
            NSArray *unsorted = arr;
            return unsorted;
        };
    }
    return algorith;
}

sort_t quickSort(void) {
    return ^(NSMutableArray *input) {

        // TODO - Add Quick sort algorithm
        NSArray *out = input;
        return out;
    };
}
