//
//  LYRUIORSet.h
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 22.03.2018.
//  Copyright (c) 2017 Layer. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>
#import "LYRUIOROperation.h"

NS_ASSUME_NONNULL_BEGIN     // {
@interface LYRUIORSet<__covariant ObjectType> : NSObject

@property (nonatomic, strong, readonly) NSString *type;

@property (nonatomic, readonly) NSString *propertyName;

@property (nonatomic, strong, readonly) NSMutableOrderedSet<LYRUIOROperation *> *adds;

@property (nonatomic, strong, readonly) NSMutableOrderedSet<NSString *> *removes;

@property (nonatomic, readonly) NSDictionary *dictionary;

@property (nonatomic, readonly) NSArray *operationsDictionaries;

@property (nonatomic, readonly) NSOrderedSet<ObjectType> *selectedValues;

- (instancetype)initWithPropertyName:(NSString *)propertyName;
- (instancetype)initWithPropertyName:(NSString *)propertyName dictionary:(NSDictionary *)dictionary;

- (nullable NSArray<NSDictionary *> *)addOperation:(LYRUIOROperation *)operation;
- (nullable NSArray<NSDictionary *> *)removeOperationWithID:(NSString *)operationID;
- (void)synchronizeWithSet:(LYRUIORSet *)remoteSet;

- (BOOL)containsOperationWithID:(NSString *)operationID;
- (LYRUIOROperation *)operationWithID:(NSString *)operationID;

@end
NS_ASSUME_NONNULL_END       // }
