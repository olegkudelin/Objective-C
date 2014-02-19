//
//  DictionaryReader.m
//  SimbirSoftTest
//
//  Created by Олег on 01.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import "DictionaryReader.h"
#import "Constants.h"

@implementation DictionaryReader 

@synthesize dictionary;

- (BOOL)setDictionaryFile:(NSString*)fileName {
    if ([self setFile:fileName]) {
        [self loadDictionaryFromFile:fileName];
        return true;
    } else {
        return false;
    }
}

- (void)loadDictionaryFromFile:(NSString*)fileName {
    NSError *error = NULL;
    NSString *wordsString = [NSString stringWithContentsOfFile:fileName
                                                      encoding:NSUTF8StringEncoding
                                                         error:&error];
    if (error) {
        ALog(@"Error reading file: %@", [error localizedDescription]);
        return;
    }
    wordsString = [wordsString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    wordsString = [wordsString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    self->dictionary = [wordsString componentsSeparatedByString:@"\n"];

}


@end
