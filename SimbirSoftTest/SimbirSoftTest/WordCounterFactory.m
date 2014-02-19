//
//  WordCounterFactory.m
//  SimbirSoftTest
//
//  Created by Олег on 07.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import "WordCounterFactory.h"
#import "DictionaryFactory.h"
#import "WordCounter.h"
#import "Constants.h"


@implementation WordCounterFactory
+(id<IWordCounter>)getWordCounterByDictionaryFileName:(NSString*)dictionaryFileName {
	id<IDictionary> dictionary = [DictionaryFactory createDictionary:dictionaryFileName];
	if (!dictionary) {
		DLog([NSString stringWithFormat:@"Ошибка создания словаря по имени файла \"%@\"", dictionaryFileName]);
		return nil;
	}
	return [WordCounterFactory getWordCounterByDictionary:dictionary];
}

+(id<IWordCounter>)getWordCounterByDictionary:(id<IDictionary>)dictionary {
	id<IWordCounter> wordCounter = [[WordCounter alloc] init];
	[wordCounter setDictionary:dictionary];
	return wordCounter;
}

@end
