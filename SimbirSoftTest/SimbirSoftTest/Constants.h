//
//  Constants.h
//  SimbirSoftTest
//
//  Created by Олег on 06.01.14.
//  Copyright (c) 2014 Олег. All rights reserved.
//

#ifndef SimbirSoftTest_Constants_h
#define SimbirSoftTest_Constants_h


#ifdef DEBUG
//Выводит отладочные сообщения. Пример: DLog("Любой текст");
#define DLog(...) NSLog(@"%@::%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __VA_ARGS__)
#else
#define DLog(...) /* */
#endif
#define ALog(...) NSLog(__VA_ARGS__)


#endif
