//
//  DictionaryFactory.h
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDictionary.h"

// Создает и возвращает объект для работы со словарем
@interface DictionaryFactory : NSObject

// textFileName - имя текстового файла
// return словарь или nil, если была ошибка при открытиии файла
+(id<IDictionary>) createDictionary:(NSString*)dictionaryFileName;
@end
