//
//  main.m
//  SimbirSoftTest
//
//  Created by Олег on 31.12.13.
//  Copyright (c) 2013 Олег. All rights reserved.
//
// Моя первая программа на Objective-C, которая
// подсчитывает, сколько раз в файле_с_текстом встретилось
// каждое из уникальных слов из файла_словаря, и выводит
// итоги подстчетов в выходной_файл

#import <Foundation/Foundation.h>

#import "FileReaderFactory.h"
#import "IWordCounter.h"
#import "WordCounterFactory.h"
#import "StaticticTextOutputer.h"

// Точка входа в программу
int main(int argc, const char * argv[])
{


    @autoreleasepool {
		NSArray *argumentsArray = [[NSProcessInfo processInfo] arguments];
		if ([argumentsArray count] < 4) {
			printf("Вызов: SimbirSoftTest dictionaryFileName textFileName outputFileName\n");
			return 1;
		}

		id<IWordCounter> wordCounter = [WordCounterFactory getWordCounterByDictionaryFileName:argumentsArray[1]];
		if (!wordCounter) {
			return 2;
		}
        id<IFileReader> fileReader = [FileReaderFactory createFileReader:argumentsArray[2]];
		if (!fileReader) {
			return 3;
		}
		[[StaticticTextOutputer instance] saveData:argumentsArray[3] :[wordCounter checkWord:fileReader]];
   }
    return 0;
}

