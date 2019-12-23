//
//  AppDelegate.h
//  CollectionViewCellDeleteDemo
//
//  Created by 咖啡糖 on 2019/12/23.
//  Copyright © 2019 咖啡糖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

