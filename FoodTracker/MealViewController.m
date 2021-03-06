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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation MealViewController

#pragma mark Navigation methods

- (IBAction)cancel:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        if ([sender isEqual:self.saveButton]) {
            self.meal = [[Meal alloc] initWithName:self.nameTextFiled.text withPhoto:self.photoImageView.image andRating:self.ratingControlView.rating];
        } else {
            NSLog(@"The save button was not pressed, cancelling");
            return;
        }
    }
}



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
-(void) textFieldDidEndEditing:(UITextField *)textField {
    [self updateSaveButtonState];
    self.navigationItem.title = textField.text;
}

-(void) updateSaveButtonState
{
    if (self.nameTextFiled.text == NULL || [self.nameTextFiled.text length] == 0) {
        [self.saveButton setEnabled:NO];
    } else {
        [self.saveButton setEnabled:YES];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.nameTextFiled.delegate = self;
    [self updateSaveButtonState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
