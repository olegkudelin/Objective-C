//
//  IFileReader.h
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>

// Интерфейс построчного чтения данных из текстого файла
@protocol IFileReader <NSObject>

// Читает и возвращает строку из тектого файла или nil, если все прочитано
- (NSString*)getNextTextLine;
@end
