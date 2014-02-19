//
//  WordCounterFactory.h
//  SimbirSoftTest
//
//  Created by Олег on 07.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWordCounter.h"
#import "IDictionary.h"

// Создает и возвращает IWordCounter
@interface WordCounterFactory : NSObject

// Возвращает IWordCounter по имени файла файла_словаря
+(id<IWordCounter>)getWordCounterByDictionaryFileName:(NSString*)dictionaryFileName;

// Возвращает IWordCounter по IDictionary
+(id<IWordCounter>)getWordCounterByDictionary:(id<IDictionary>)dictionary;

@end
