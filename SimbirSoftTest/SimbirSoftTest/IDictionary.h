//
//  IDictionary.h
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>

// Интерфейс для чтения данных из словаря
@protocol IDictionary <NSObject>

// Словарь в формате текстового массива
- (NSArray*) dictionary;
@end
