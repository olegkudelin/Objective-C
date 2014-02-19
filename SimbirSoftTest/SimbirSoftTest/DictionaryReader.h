//
//  DictionaryReader.h
//  SimbirSoftTest
//
//  Created by Олег on 01.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "File.h"
#import "IDictionary.h"

//Класс для чтения словаря, реализует IDictionary
@interface DictionaryReader : File <IDictionary> {
    NSArray *dictionary;
}

@property (readonly) NSArray* dictionary;

- (BOOL)setDictionaryFile:(NSString*)fileName;

@end
