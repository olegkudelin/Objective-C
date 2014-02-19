//
//  IWordCounter.h
//  SimbirSoftTest
//
//  Created by Олег on 07.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDictionary.h"
#import "IFileReader.h"

// Интерфес, подсчитывает, сколько раз в файле_с_текстом (IDictionary) встретилось каждое из уникальных слов из файла_словаря (IFileReader)
@protocol IWordCounter <NSObject>

// Устанавливает словарь
// IDictionary - словарь
// возвращает true, если словарь успешно установлен
- (BOOL)setDictionary:(id<IDictionary>)dictionary;

// Проверка числа вхождений слов в текстовом файле по установленному ранее словарю
// textFile - тектовый файл
// return словарь в формате "слово (key - NSString) - число вхождений (value - NSNumber)"
-(NSDictionary*)checkWord:(id<IFileReader>)textFile;

@end
