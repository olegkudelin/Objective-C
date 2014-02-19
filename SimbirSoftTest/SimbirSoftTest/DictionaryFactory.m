//
//  DictionaryFactory.m
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import "DictionaryFactory.h"
#import "DictionaryReader.h"

@implementation DictionaryFactory
+(id<IDictionary>) createDictionary:(NSString*)dictionaryFileName {
    DictionaryReader* dictionary = [[DictionaryReader alloc] init];
    BOOL result = [dictionary setDictionaryFile:dictionaryFileName];
    return result ? dictionary : NULL;
}
@end
