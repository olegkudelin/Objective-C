//
//  File.h
//  SimbirSoftTest
//
//  Created by Олег on 02.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#import <Foundation/Foundation.h>

// Класс для проверки доступа на чтение к файлу
@interface File : NSObject {
    @protected NSString *fullFileName;
}

// Устанавливает имя файла, и проверяет его на доступ
// fileName - полное имя файла
// return - true если файл сущетвует и его можно открыть на чтение
- (BOOL)setFile:(NSString*)fileName;

@end
