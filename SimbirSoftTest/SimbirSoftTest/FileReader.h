//
//  FileReader.h
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import "File.h"
#import "IFileReader.h"

// Класс для чтения текстовых файлов, реализует интерфейс IFileReader
@interface FileReader : File <IFileReader> {
    NSFileHandle *fileHandle;
    
    NSString* remainsString;
    NSArray* stringArrayBuffer;
    NSInteger currentPositionInStringArrayBuffer;
	
// Количество байт, считываемых за раз из текстового файла, инициализируется в конструкторе
	long readBufferSize;
    
}

@property long readBufferSize;

// Устанавливает текстовый файл, из которого будет производиться чтение
// fileName - Имя файла
// return - true если файл спешно открыт на чтение
- (BOOL)setTextFile:(NSString*)fileName;

// Получает следующий текстовый фрагмент
- (void)getNextWordList;

@end
