//
//  StaticticTextOutputer.m
//  SimbirSoftTest
//
//  Created by Олег on 03.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import "StaticticTextOutputer.h"
#import "Constants.h"

@implementation StaticticTextOutputer

+ (StaticticTextOutputer *)instance {
	static StaticticTextOutputer* instance = nil;
	static dispatch_once_t predicate;
	dispatch_once( &predicate, ^{
		instance = [[ self alloc ] init];
	} );
	return instance;
}

- (BOOL)saveData:(NSString*)fileName :(NSDictionary*)dictionary {
    
	if (!dictionary) {
		DLog(@"Передан пустой указатель на \"dictionary\"");
		return false;
	}
	if (![self checkFileForSave:fileName]) return false;
	
	NSString* strForSaveWitDataStatistic = [self getStringForSave:dictionary];
	NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager createFileAtPath:fileName contents:[strForSaveWitDataStatistic dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];

    if (!result) {
        ALog(NSLocalizedString(@"Failed to write file %@", @""), fileName);
		return false;
    } else {
		return true;
	}
}

- (BOOL)checkFileForSave:(NSString*)fileName {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	if ([fileManager fileExistsAtPath:fileName] && [fileManager isWritableFileAtPath:fileName]) {
		DLog([NSString stringWithFormat:@"Файл %@ существует и будет переписан", fileName]);
        return true;
    }
	
	if (![fileManager fileExistsAtPath:fileName] && [fileManager createFileAtPath:fileName contents:nil attributes:nil]) {
		NSError *error;
		[fileManager removeItemAtPath:fileName error:&error];
		return true;
	}
	ALog(NSLocalizedString(@"No write permission to the file %@", @""), fileName);
    return false;
}

- (NSString*) getStringForSave:(NSDictionary*)dictionary {
    if (!dictionary) {
        DLog(@"Передан пустой указатель на \"dictionary\"");
        return NULL;
    }
    
    NSMutableString* result = [[NSMutableString alloc] init];
	NSArray *keyArray = [dictionary allKeys];
	keyArray = [keyArray sortedArrayUsingSelector:@selector(localizedCompare:)];
	for (NSString *key in keyArray) {
		[result appendFormat:@"\"%@\":%@\n", key, [dictionary objectForKey:key]];
	}
    return result;
}

@end
