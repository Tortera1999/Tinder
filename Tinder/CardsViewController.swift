//
//  CardsViewController.swift
//  Tinder
//
//  Created by Nikhil Iyer on 3/3/18.
//  Copyright © 2018 Nikhil Iyer. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "nav_bar.png")
        let imageView = UIImageView(image:logo)
        
        self.navigationItem.titleView = imageView
        self.navigationItem.titleView?.clipsToBounds = true
        
        cardInitialCenter = profilePic.center

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "viewProfileImage", sender: nil)
    }
    @IBAction func didSwipe(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let translation = sender.translation(in: view)
        var b: Bool
        b = true;
        
        if sender.state == UIGestureRecognizerState.began {
            cardInitialCenter = profilePic.center
        }
        else if sender.state == UIGestureRecognizerState.changed{
            profilePic.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y);
            
//            if(translation.x > 50 || translation.x < -50){
//                UIView.animate(withDuration: 0.3, animations: {
//                    if(translation.x > 50){
//                        self.profilePic.center.x += 500
//                    }
//                    else{
//                        self.profilePic.center.x -= 500
//                    }
//                })
//                b = false
//                return
//            }
//            else{
//                self.profilePic.transform = CGAffineTransform.identity
//                self.profilePic.center = cardInitialCenter
//            }
//
//            if(b == true){
            if(location.y > profilePic.center.y){
                if location.x < profilePic.center.x {
                        self.profilePic.transform = CGAffineTransform(rotationAngle: -translation.x/100)
                    
                    
                } else {
                        self.profilePic.transform = CGAffineTransform(rotationAngle: -translation.x/100)
                }
            }
            else{
                if location.x < profilePic.center.x {
                        self.profilePic.transform = CGAffineTransform(rotationAngle: translation.x/100)
                } else {
                        self.profilePic.transform = CGAffineTransform(rotationAngle: translation.x/100)
                }
            }
            
        }
        else if sender.state == UIGestureRecognizerState.ended{
            self.profilePic.center = cardInitialCenter
            self.profilePic.transform = CGAffineTransform.identity
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController {
            if let image = profilePic.image {
                destination.image = image
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
