//
//  FileReader.m
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import "FileReader.h"
#import "Constants.h"

@implementation FileReader

@synthesize readBufferSize;

- (FileReader*)init {
	self = [super init];
	[self setReadBufferSize:500];
	return self;
}

- (BOOL)setTextFile:(NSString*)fileName{
    if ([self setFile:fileName]) {
        fileHandle = [NSFileHandle fileHandleForReadingAtPath:fileName];
        if (fileHandle) {
            return true;
        } else {
            ALog(NSLocalizedString(@"Error opening file %@", @""), fileName);
        }
    }
    return false;
}

- (NSString*)getNextTextLine {
    if ((!stringArrayBuffer)||(!(currentPositionInStringArrayBuffer < [stringArrayBuffer count] - 1))){
        [self getNextWordList];
    }
    if ((stringArrayBuffer)&&(currentPositionInStringArrayBuffer < [stringArrayBuffer count] - 1)){
        return [stringArrayBuffer objectAtIndex:currentPositionInStringArrayBuffer++];
    }
    if (remainsString) {
        NSString *result = remainsString;
        remainsString = NULL;
        return result;
    }
    return NULL;
}

- (void)getNextWordList {
    currentPositionInStringArrayBuffer = 0;
    NSData *data = [fileHandle readDataOfLength:[self readBufferSize]];
    NSMutableString* string = [[NSMutableString alloc] init];
    if (remainsString) {
        [string appendString:remainsString];
    }
    NSString *strFromFile = [[NSString alloc] initWithBytes:[data bytes]
                                                length:[data length]
                                              encoding:NSUTF8StringEncoding];
    
    [string  appendString:[strFromFile stringByReplacingOccurrencesOfString:@"\r" withString:@""]];
    
    stringArrayBuffer = [string componentsSeparatedByString:@"\n"];
	
    if ((stringArrayBuffer)&&([stringArrayBuffer count] == 1)) {
        if ([data length] == [self readBufferSize]) {
            remainsString = [stringArrayBuffer objectAtIndex:0];
            [self getNextWordList];
        }
    }
    if ((stringArrayBuffer)&&([stringArrayBuffer count] > 1)) {
        remainsString = [stringArrayBuffer lastObject];
    }
}

@end
