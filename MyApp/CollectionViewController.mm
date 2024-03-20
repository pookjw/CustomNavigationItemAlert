//
//  CollectionViewController.m
//  MyApp
//
//  Created by Jinwoo Kim on 3/20/24.
//

#import "CollectionViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface ActivityIndicatorViewController : UIViewController
@end
@implementation ActivityIndicatorViewController
- (void)loadView {
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    [activityIndicatorView startAnimating];
    self.view = activityIndicatorView;
    [activityIndicatorView release];
}
@end

@interface CollectionViewController () <UINavigationItemRenameDelegate>
@property (retain, readonly, nonatomic) UICollectionViewCellRegistration *cellRegistration;
@end

@implementation CollectionViewController
@synthesize cellRegistration = _cellRegistration;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    UICollectionLayoutListConfiguration *listConfiguration = [[UICollectionLayoutListConfiguration alloc] initWithAppearance:UICollectionLayoutListAppearanceInsetGrouped];
    UICollectionViewCompositionalLayout *collectionViewLayout = [UICollectionViewCompositionalLayout layoutWithListConfiguration:listConfiguration];
    [listConfiguration release];
    self = [super initWithCollectionViewLayout:collectionViewLayout];;
    
    return self;
}

- (void)dealloc {
    [_cellRegistration release];
    [super dealloc];
}

- (UICollectionViewCellRegistration *)cellRegistration {
    if (auto cellRegistration = _cellRegistration) return cellRegistration;
    
    UICollectionViewCellRegistration *cellRegistration = [UICollectionViewCellRegistration registrationWithCellClass:UICollectionViewListCell.class configurationHandler:^(__kindof UICollectionViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath, id  _Nonnull item) {
        
    }];
    
    _cellRegistration = [cellRegistration retain];
    return cellRegistration;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cellRegistration];
    
    UINavigationItem *navigationItem = self.navigationItem;
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    navigationItem.searchController = searchController;
    [searchController release];
    
    UIBarButtonItem *barButtonItem_1 = [[UIBarButtonItem alloc] initWithTitle:@"(1)" menu:nil];
    UIBarButtonItem *barButtonItem_2 = [[UIBarButtonItem alloc] initWithTitle:@"(2)" menu:nil];
    UIBarButtonItem *barButtonItem_3 = [[UIBarButtonItem alloc] initWithTitle:@"(3)" menu:nil];
    UIBarButtonItem *barButtonItem_4 = [[UIBarButtonItem alloc] initWithTitle:@"(4)" menu:nil];
    UIBarButtonItem *barButtonItem_5 = [[UIBarButtonItem alloc] initWithTitle:@"(5)" menu:nil];
    UIBarButtonItem *barButtonItem_6 = [[UIBarButtonItem alloc] initWithTitle:@"(6)" menu:nil];
    UIBarButtonItem *barButtonItem_7 = [[UIBarButtonItem alloc] initWithTitle:@"(7)" menu:nil];
    UIBarButtonItem *barButtonItem_8 = [[UIBarButtonItem alloc] initWithTitle:@"(8)" menu:nil];
    UIBarButtonItem *barButtonItem_9 = [[UIBarButtonItem alloc] initWithTitle:@"(9)" menu:nil];
    UIBarButtonItem *barButtonItem_10 = [[UIBarButtonItem alloc] initWithTitle:@"(10)" menu:nil];
    UIBarButtonItem *barButtonItem_11 = [[UIBarButtonItem alloc] initWithTitle:@"(11)" menu:nil];
    UIBarButtonItem *barButtonItem_12 = [[UIBarButtonItem alloc] initWithTitle:@"(12)" menu:nil];
    
    navigationItem.leadingItemGroups = @[
        [UIBarButtonItemGroup optionalGroupWithCustomizationIdentifier:@"id.optional" inDefaultCustomization:YES representativeItem:barButtonItem_1 items:@[barButtonItem_2, barButtonItem_3]]
//        [barButtonItem_1 creatingOptionalGroupWithCustomizationIdentifier:@"1" inDefaultCustomization:YES]
    ];
    
    navigationItem.trailingItemGroups = @[
        [UIBarButtonItemGroup movableGroupWithCustomizationIdentifier:@"id.movable" representativeItem:barButtonItem_4 items:@[barButtonItem_5, barButtonItem_6]]
    ];
    
    navigationItem.centerItemGroups = @[
        [UIBarButtonItemGroup fixedGroupWithRepresentativeItem:barButtonItem_7 items:@[barButtonItem_8, barButtonItem_9]],
        [UIBarButtonItemGroup optionalGroupWithCustomizationIdentifier:@"id.optiona.center" inDefaultCustomization:YES representativeItem:barButtonItem_10 items:@[barButtonItem_11, barButtonItem_12]]
    ];
    
    [barButtonItem_1 release];
    [barButtonItem_2 release];
    [barButtonItem_3 release];
    [barButtonItem_4 release];
    [barButtonItem_5 release];
    [barButtonItem_6 release];
    [barButtonItem_7 release];
    [barButtonItem_8 release];
    [barButtonItem_9 release];
    [barButtonItem_10 release];
    [barButtonItem_11 release];
    [barButtonItem_12 release];
    navigationItem.customizationIdentifier = @"id";
    
    navigationItem.style = UINavigationItemStyleEditor;
    navigationItem.renameDelegate = self;
    navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    navigationItem.title = @"Title (1)\nTwo Line!";
    navigationItem.prompt = @"Prompt";
    ((void (*)(id, SEL, id))objc_msgSend)(navigationItem, sel_registerName("_setWeeTitle:"), @"WeeTitle");
    ((void (*)(id, SEL, BOOL))objc_msgSend)(navigationItem, sel_registerName("_setSupportsTwoLineLargeTitles:"), YES);
    
    UIButtonConfiguration *buttonConfiguration = [UIButtonConfiguration plainButtonConfiguration];
    buttonConfiguration.image = [UIImage systemImageNamed:@"message"];
    __weak CollectionViewController *weakSelf = self;
    UIButton *largeTitleAccessory = [UIButton buttonWithConfiguration:buttonConfiguration primaryAction:[UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        [weakSelf presentAlertController];
    }]];
    ((void (*)(id, SEL, id))objc_msgSend)(navigationItem, sel_registerName("_setLargeTitleAccessoryView:"), largeTitleAccessory);
    
    UILabel *topPaletteLabel = [UILabel new];
    topPaletteLabel.text = @"Top Palette!";
    topPaletteLabel.backgroundColor = UIColor.systemCyanColor;
    topPaletteLabel.textColor = UIColor.systemPinkColor;
    id topPalette = ((id (*)(id, SEL, id))objc_msgSend)([objc_lookUpClass("_UINavigationBarPalette") alloc], sel_registerName("initWithContentView:"), topPaletteLabel);
    [topPaletteLabel release];
    ((void (*)(id, SEL, BOOL))objc_msgSend)(topPalette, sel_registerName("setPinned:"), YES);
    ((void (*)(id, SEL, BOOL))objc_msgSend)(topPalette, sel_registerName("_setDisplaysWhenSearchActive:"), YES);
    ((void (*)(id, SEL, CGFloat))objc_msgSend)(topPalette, sel_registerName("setPreferredHeight:"), 50.f);
    ((void (*)(id, SEL, id))objc_msgSend)(navigationItem, sel_registerName("_setTopPalette:"), topPalette);
    [topPalette release];
    
    UILabel *bottomPaletteLabel = [UILabel new];
    bottomPaletteLabel.text = @"Bottom Palette!";
    bottomPaletteLabel.backgroundColor = UIColor.systemCyanColor;
    bottomPaletteLabel.textColor = UIColor.systemPinkColor;
    id bottomPalette = ((id (*)(id, SEL, id))objc_msgSend)([objc_lookUpClass("_UINavigationBarPalette") alloc], sel_registerName("initWithContentView:"), bottomPaletteLabel);
    [bottomPaletteLabel release];
    ((void (*)(id, SEL, BOOL))objc_msgSend)(bottomPalette, sel_registerName("setPinned:"), YES);
    ((void (*)(id, SEL, BOOL))objc_msgSend)(bottomPalette, sel_registerName("_setDisplaysWhenSearchActive:"), YES);
    ((void (*)(id, SEL, CGFloat))objc_msgSend)(bottomPalette, sel_registerName("setPreferredHeight:"), 50.f);
    ((void (*)(id, SEL, id))objc_msgSend)(navigationItem, sel_registerName("_setBottomPalette:"), bottomPalette);
    [bottomPalette release];
    ((void (*)(id, SEL))objc_msgSend)(navigationItem, sel_registerName("_setBottomPaletteNeedsUpdate"));
}

- (void)presentAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title!" message:@"Message!" preferredStyle:UIAlertControllerStyleAlert];
    ((void (*)(id, SEL, id))objc_msgSend)(alertController, sel_registerName("setImage:"), [UIImage systemImageNamed:@"faceid"]);
    
    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:@"Attributed Title" attributes:@{
        NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleExtraLargeTitle],
        NSForegroundColorAttributeName: UIColor.systemPinkColor
    }];
    ((void (*)(id, SEL, id))objc_msgSend)(alertController, sel_registerName("_setAttributedTitle:"), attributedTitle);
    [attributedTitle release];
    
    NSAttributedString *attributedMessage = [[NSAttributedString alloc] initWithString:@"AttributedMessage" attributes:@{
        NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleExtraLargeTitle],
        NSForegroundColorAttributeName: UIColor.systemBrownColor
    }];
    ((void (*)(id, SEL, id))objc_msgSend)(alertController, sel_registerName("_setAttributedMessage:"), attributedMessage);
    [attributedMessage release];
    
    NSAttributedString *attributedDetailMessage = [[NSAttributedString alloc] initWithString:@"AttributedDetailMessage" attributes:@{
        NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleExtraLargeTitle],
        NSForegroundColorAttributeName: UIColor.systemPinkColor,
        NSBackgroundColorAttributeName: UIColor.cyanColor
    }];
    ((void (*)(id, SEL, id))objc_msgSend)(alertController, sel_registerName("_setAttributedDetailMessage:"), attributedDetailMessage);
    [attributedDetailMessage release];
    
    ActivityIndicatorViewController *separatedHeaderContentViewController = [ActivityIndicatorViewController new];
    ((void (*)(id, SEL, id))objc_msgSend)(alertController, sel_registerName("_setSeparatedHeaderContentViewController:"), separatedHeaderContentViewController);
    [separatedHeaderContentViewController release];
    
    ActivityIndicatorViewController *headerContentViewController = [ActivityIndicatorViewController new];
    ((void (*)(id, SEL, id))objc_msgSend)(alertController, sel_registerName("_setHeaderContentViewController:"), headerContentViewController);
    [headerContentViewController release];
    
    ActivityIndicatorViewController *contentViewController = [ActivityIndicatorViewController new];
    ((void (*)(id, SEL, id))objc_msgSend)(alertController, sel_registerName("setContentViewController:"), contentViewController);
    [contentViewController release];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    ((void (*)(id, SEL, BOOL))objc_msgSend)(alertController, sel_registerName("setTextFieldsCanBecomeFirstResponder:"), NO);
    
    UIAlertAction *alertAction_1 = [UIAlertAction actionWithTitle:@"Load!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIAlertController *alertController = ((id (*)(id, SEL))objc_msgSend)(action, sel_registerName("_alertController"));
        ((void (*)(id, SEL))objc_msgSend)(alertController, sel_registerName("_removeAllActions"));
        
        UIAlertAction *copiedAction = [action copy];
        ((void (*)(id, SEL, id))objc_msgSend)(copiedAction, sel_registerName("setTitle:"), nil);
        ((void (*)(id, SEL, id))objc_msgSend)(copiedAction, sel_registerName("_setDescriptiveText:"), nil);
        ActivityIndicatorViewController *contentViewController = [ActivityIndicatorViewController new];
        ((void (*)(id, SEL, id))objc_msgSend)(copiedAction, sel_registerName("_setContentViewController:"), contentViewController);
        ((void (*)(id, SEL, id))objc_msgSend)(copiedAction, sel_registerName("setShouldDismissHandler:"), ^BOOL { return YES; });
        [contentViewController release];
        [alertController addAction:copiedAction];
        [copiedAction release];
    }];
    ((void (*)(id, SEL, id))objc_msgSend)(alertAction_1, sel_registerName("setShouldDismissHandler:"), ^BOOL { return NO; });
    ((void (*)(id, SEL, id))objc_msgSend)(alertAction_1, sel_registerName("setImage:"), [UIImage systemImageNamed:@"airtag.radiowaves.forward.fill"]);
    ((void (*)(id, SEL, id))objc_msgSend)(alertAction_1, sel_registerName("_setImageTintColor:"), UIColor.systemPurpleColor);
    ((void (*)(id, SEL, BOOL))objc_msgSend)(alertAction_1, sel_registerName("_setChecked:"), YES);
    ((void (*)(id, SEL, BOOL))objc_msgSend)(alertAction_1, sel_registerName("_setIsPreferred:"), YES);
    ((void (*)(id, SEL, id))objc_msgSend)(alertAction_1, sel_registerName("_setDescriptiveText:"), @"DescriptiveText");
    ((void (*)(id, SEL, id))objc_msgSend)(alertAction_1, sel_registerName("_setTitleTextColor:"), UIColor.systemGreenColor);
    ((void (*)(id, SEL, id, UIKeyModifierFlags))objc_msgSend)(alertAction_1, sel_registerName("_setKeyCommandInput:modifierFlags:"), @"L", 0);
    [alertController addAction:alertAction_1];
    
    UIAlertAction *alertAction_2 = [UIAlertAction actionWithTitle:@"(Disabled)" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    ((void (*)(id, SEL, NSTextAlignment))objc_msgSend)(alertAction_2, sel_registerName("_setTitleTextAlignment:"), NSTextAlignmentRight);
    ((void (*)(id, SEL, BOOL))objc_msgSend)(alertAction_2, sel_registerName("setEnabled:"), NO);
    [alertController addAction:alertAction_2];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueConfiguredReusableCellWithRegistration:self.cellRegistration forIndexPath:indexPath item:[NSNull null]];
    return cell;
}

- (BOOL)navigationItemShouldBeginRenaming:(UINavigationItem *)navigationItem {
    return YES;
}
- (BOOL)navigationItem:(UINavigationItem *)navigationItem shouldEndRenamingWithTitle:(NSString *)title {
    return YES;
}

- (NSString *)navigationItem:(UINavigationItem *)navigationItem willBeginRenamingWithSuggestedTitle:(NSString *)title selectedRange:(inout NSRange *)selectedRange {
    return @"Test";
}

- (void)navigationItem:(UINavigationItem *)navigationItem didEndRenamingWithTitle:(NSString *)title {
    
}

@end
