//
//  File.m
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import "File.h"
#import "Constants.h"

@implementation File

- (BOOL)setFile:(NSString*)fileName {
    if ([self checkFileAccess:fileName]) {
        return true;
    } else {
        return false;
    }
}

- (BOOL)checkFileAccess:(NSString*)fileName{
	BOOL isDirectory = false;
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileName isDirectory:&isDirectory]) {
        ALog(NSLocalizedString(@"File %@ does't exist", @"") , fileName);
        return false;
    };
    if (isDirectory) {
        ALog(NSLocalizedString(@"%@ is directory", @""), fileName);
        return false;
	}
    if (![[NSFileManager defaultManager] isReadableFileAtPath:fileName]) {
        ALog(NSLocalizedString(@"File %@ unavailable for read", @""), fileName);
        return false;
    }
    
    return true;
}

@end
