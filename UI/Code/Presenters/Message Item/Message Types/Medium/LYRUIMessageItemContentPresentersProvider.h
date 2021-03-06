//
//  LYRUIMessageItemContentPresentersProvider.h
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 02.10.2017.
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
#import "LYRUIConfigurable.h"
#import "LYRUIMessageItemContentPresenting.h"
#import "LYRUIMessageItemContentContainerPresenting.h"
#import "LYRUIDependencyInjection.h"

@class LYRUIMessageType;
@class LYRUIReusableViewsQueue;
@protocol LYRUIMessageListActionHandlingDelegate;

extern LYRUIMessageSizeVariant LYRUIMessageSizeVariantMedium;

NS_ASSUME_NONNULL_BEGIN     // {
@interface LYRUIMessageItemContentPresentersProvider : NSObject <LYRUIConfigurable>

@property (nonatomic, strong, nullable) id<LYRUIMessageItemContentPresenting> defaultPresenter;

- (nullable id<LYRUIMessageItemContentPresenting>)contentPresenterForMessageClass:(Class)messageClass;

- (nullable id<LYRUIMessageItemContentContainerPresenting>)containerPresenterForMessageClass:(Class)messageClass;

- (nullable id<LYRUIMessageItemContentPresenting>)presenterForMessageClass:(Class)messageClass;

/**
 @abstract An overridable class method that returns a size variant represented by a string.
 @return Return a string representing the message size variant the provider supports.
 */
+ (LYRUIMessageSizeVariant)messageSizeVariant;

@end
NS_ASSUME_NONNULL_END       // }

