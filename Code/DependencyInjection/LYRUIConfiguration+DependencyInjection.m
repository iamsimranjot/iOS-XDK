//
//  LYRUIConfiguration+DependencyInjection.m
//  Layer-UI-iOS
//
//  Created by Łukasz Przytuła on 14.12.2017.
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

#import "LYRUIConfiguration+DependencyInjection.h"
#import <objc/runtime.h>
#import "LYRUIConfigurable.h"
#import "NSCache+LYRUIImageCaching.h"

static void *LYRUIConfigurationModuleKey = &LYRUIConfigurationModuleKey;
static void *LYRUIConfigurationImagesCacheKey = &LYRUIConfigurationImagesCacheKey;

@implementation LYRUIConfiguration (DependencyInjection)

#pragma mark - LYRUIDependencyInjection

- (id)themeForViewClass:(Class)viewClass {
    LYRUIDependencyProviding provider = self.module.defaultThemes[NSStringFromClass(viewClass)];
    return provider(self);
}

- (id)alternativeThemeForViewClass:(Class)viewClass {
    LYRUIDependencyProviding provider = self.module.defaultAlternativeThemes[NSStringFromClass(viewClass)];
    return provider(self);
}

- (id)configurationForViewClass:(Class)viewClass {
    LYRUIDependencyProviding provider = self.module.defaultConfigurations[NSStringFromClass(viewClass)];
    return provider(self);
}

- (id)layoutForViewClass:(Class)viewClass {
    LYRUIDependencyProviding provider = self.module.defaultLayouts[NSStringFromClass(viewClass)];
    return provider(self);
}

- (id)protocolImplementation:(Protocol *)protocol forClass:(Class)class {
    LYRUIDependencyProviding provider = self.module.defaultProtocolImplementations[NSStringFromClass(class)][NSStringFromProtocol(protocol)];
    if (provider == nil) {
        provider = self.module.defaultProtocolImplementations[@"defaults"][NSStringFromProtocol(protocol)];
    }
    return provider(self);
}

- (id)objectOfType:(Class)type {
    LYRUIDependencyProviding provider = self.module.defaultObjects[NSStringFromClass(type)];
    if (provider) {
        return provider(self);
    }
    if ([type conformsToProtocol:@protocol(LYRUIConfigurable)]) {
        return [[type alloc] initWithConfiguration:self];
    }
    return [[type alloc] init];
}

#pragma mark - Properties

- (id<LYRUIDependencyInjectionModule>)module {
    return objc_getAssociatedObject(self, LYRUIConfigurationModuleKey);
}

- (void)setModule:(id<LYRUIDependencyInjectionModule>)module {
    objc_setAssociatedObject(self, LYRUIConfigurationModuleKey, module, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<LYRUIImageCaching>)imagesCache {
    id<LYRUIImageCaching> imagesCache = objc_getAssociatedObject(self, LYRUIConfigurationImagesCacheKey);
    if (imagesCache == nil) {
        imagesCache = [[NSCache<NSURL *, UIImage *> alloc] init];
        objc_setAssociatedObject(self, LYRUIConfigurationImagesCacheKey, imagesCache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return imagesCache;
}

@end
