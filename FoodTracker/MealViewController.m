//
//  ViewController.m
//  FoodTracker
//
//  Created by zwpdbh on 2018/7/6.
//  Copyright © 2018 Otago. All rights reserved.
//

#import "MealViewController.h"
#import "RatingControlView.h"

@interface MealViewController () <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControlView *ratingControlView;

@end



@implementation MealViewController

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender
{
    // Hide the keyboard.
    [self.nameTextFiled resignFirstResponder];
    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    UIImagePickerController *impc = [[UIImagePickerController alloc] init];
    // Only allow photos to be picked, not taken.
    [impc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    // Make sure ViewController is notified when the user picks an image.
    impc.delegate = self;
    [self presentViewController:impc animated:YES completion:NULL];
}

#pragma mark UIImagePickerControllerDelegate methods
/**gets called when a user taps the image picker’s Cancel button.
 This method gives you a chance to dismiss the UIImagePickerController (and optionally, do any necessary cleanup).*/
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

/**gets called when a user selects a photo. This method gives you a chance to do something
 with the image or images that a user selected from the picker.*/
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    if ([[info objectForKey:UIImagePickerControllerOriginalImage] isKindOfClass:[UIImage class]]) {
        UIImage *pickedImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
        self.photoImageView.image = pickedImage;
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        NSLog(@"Expected a dictionary containing an image, but was provided the following: %@", info);
    }
}


#pragma mark UITextFieldDelegate methods
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.nameTextFiled.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
