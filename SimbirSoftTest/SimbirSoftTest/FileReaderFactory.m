//
//  FileReaderFactory.m
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import "FileReaderFactory.h"
#import "FileReader.h"

@implementation FileReaderFactory
+(id<IFileReader>) createFileReader:(NSString*)textFileName {
    FileReader* textFile = [[FileReader alloc] init];
    BOOL result = [textFile setTextFile:textFileName];
    return result ? textFile : NULL;
}
@end
