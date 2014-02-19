//
//  StaticticTextOutputer.h
//  SimbirSoftTest
//
//  Created by Олег on 03.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>

// Сохраняет результаты расчета в заданный файл, выполненные IWordCounter
@interface StaticticTextOutputer : NSObject

+ (StaticticTextOutputer *)instance;

// Сохраняет данные
// fileName Имя файла для сохранения данных
// dictionary - результаты расчета в формате "слово (key - NSString) - число вхождений (value - NSNumber)"
// return true в случае успеха

- (BOOL)saveData:(NSString*)fileName :(NSDictionary*)dictionary;

@end
