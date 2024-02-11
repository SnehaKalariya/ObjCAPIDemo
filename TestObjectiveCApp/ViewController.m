//
//  ViewController.m
//  TestObjectiveCApp
//
//  Created by Sneha Kalariya on 2024-02-11.
//

#import "ViewController.h"
#import "APICall.h"
#import "TableViewCell.h"
#import "ModelData.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property(nonatomic,strong) NSMutableArray *arr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController{
    NSString *s1;
    UIActivityIndicatorView *indicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.backgroundColor = UIColor.redColor;
    self.arr = [[NSMutableArray alloc]init];
    [self.arr addObject:@"SSS"];
    [self.arr addObject:@"66"];
    [self.arr removeObjectAtIndex:0];
    int n[10];
    int i;
    for(NSString *s in self.arr){
        s1 = @"3errs";
        NSLog(@"s is %@", s);
    }
    for(i=0;i<10;i++){
        n[i] = 100 * i;

    }
    NSLog(@"%d",n[1]);
    NSLog(@"%@",self.arr);
    [self createProgreeView];

    [self.tableView reloadData];
}

-(void)createProgreeView{
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    indicator.hidesWhenStopped = YES;
    indicator.frame = CGRectMake(self.view.frame.size.width/2 - 40, self.view.frame.size.height/2 - 40, 30, 30);
    [self.view addSubview:indicator];
}
- (IBAction)buttonClicked:(id)sender {
    NSLog(@"call Api");
    APICall *obj = [[APICall alloc]init];
    [indicator startAnimating];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        // Perform async operation
        [obj callAPI:@"https://ipapi.co/json/" res:^(ModelData * _Nullable json, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Update UI
                NSLog(@"%@", json);
                [indicator stopAnimating];
            });
        }];
       
    });
  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"Test";


    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
}

@end
