//
//  WordCounter.h
//  SimbirSoftTest
//
//  Created by Олег on 31.12.13.
//  Copyright (c) 2013 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFileReader.h"
#import "IDictionary.h"
#import "IWordCounter.h"

// Подсчитывает число вхождений слов из словаря в текстовом файле, реализует IWordCounter
// Для этого методом setDictionary необходимо установить словарь IDictionary
// И вызвать checkWord для нужного текстового файла
//

@interface WordCounter : NSObject <IWordCounter> {
	id<IDictionary> dictionaryObject;
	NSDictionary *dictionaryMap;
}

// Устанавливает словарь
- (BOOL)setDictionary:(id<IDictionary>)dictionary;

// Проверка числа вхождений слов в текстовом файле по установленному ранее словарю
// textFile - тектовый файл
// return словарь в формате "слово (key - NSString) - число вхождений (value - NSNumber)"
// Если метод будет вызван до установки словаря, то будет возвращен nil
-(NSDictionary*)checkWord:(id<IFileReader>)textFile;

@end
