//
//  FileReaderFactory.h
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFileReader.h"

// Создает и возвращает объект для чтения строк из текстового файла
@interface FileReaderFactory : NSObject

// textFileName - имя текстового файла
// return объект для чтения текстового файла или nil, если была ошибка при открытии

+(id<IFileReader>) createFileReader:(NSString*)textFileName;
@end
