//
//  WordCounter.m
//  SimbirSoftTest
//
//  Created by Олег on 31.12.13.
//  Copyright (c) 2013 Олег. All rights reserved.
//

#import "WordCounter.h"
#import "Constants.h"

@implementation WordCounter

-(NSDictionary*)checkWord:(id<IFileReader>)textFile {

    if (!textFile) {
        DLog(@"Передан пустой указатель на \"textFile\"");
        return NULL;
    }
    
    NSMutableDictionary* map = [self getMutableDictionaryMap];
    if (map) {
        return [self findDictionaryWordInTextFile:map :textFile];
    }
    return NULL;
}

-(NSMutableDictionary*)getMutableDictionaryMap {
    if (!dictionaryObject) {
        DLog(@"Передан пустой указатель на \"dictionaryObject\"");
        return nil;
    }
	NSMutableDictionary *mutDic = [[NSMutableDictionary alloc] init];
	[mutDic addEntriesFromDictionary:dictionaryMap];
	 return mutDic;
}

- (BOOL)setDictionary:(id<IDictionary>)dictionary {
	
	if (!dictionary) {
		DLog(@"Передан пустой указатель на \"dictionary\"");
        return false;
	}
	
	if (dictionaryObject == dictionary) {
		return true;
	}
	
    NSArray *array = [dictionary dictionary];
    if (!array) {
        ALog(NSLocalizedString(@"Error reading dictionary", @""));
        return false;
    }
	
	dictionaryObject = dictionary;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    for (NSString *arrayElement in array) {
        [dic setValue:[NSNumber numberWithInt:0] forKey:arrayElement];
    }
	dictionaryMap = dic;
    return true;
}

-(NSMutableDictionary*)findDictionaryWordInTextFile:(NSMutableDictionary*)mapDictionary :(id<IFileReader>)textFileReader {
    if (!mapDictionary) {
        DLog(@"Передан пустой указатель на \"mapDictionary\"");
        return NULL;
    }
    if (!textFileReader) {
        DLog(@"Передан пустой указатель на \"textFileReader\"");
        return NULL;
    }
    
    NSString *tecWord = [textFileReader getNextTextLine];
    while (tecWord) {
        NSNumber *numberWord = [mapDictionary objectForKey:tecWord];
        if (numberWord) {
            [mapDictionary setValue:[NSNumber numberWithInt:[numberWord intValue] + 1] forKey:tecWord];
        }
        tecWord = [textFileReader getNextTextLine];
    }
    return mapDictionary;
}

@end
