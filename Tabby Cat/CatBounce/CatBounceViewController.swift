//
//  CatBounceViewController.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 27/08/2023.
//

import UIKit
import UserNotifications
class CatBounceViewController: UIViewController {

    @IBOutlet weak var foxLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    var animator : UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            bounceCat()
    }
    func bounceCat(){
         let collions = UICollisionBehavior(items: [catLabel,foxLabel])
        collions.translatesReferenceBoundsIntoBoundary = true
        
        let dynamics = UIDynamicItemBehavior(items: [catLabel,foxLabel])
        dynamics.elasticity = 0.9
        dynamics.resistance = 0.05
        dynamics.friction = 0
        
        let push = UIPushBehavior(items: [catLabel,foxLabel], mode: .instantaneous)
        push.angle = CGFloat.random(in: 0 ..< .pi * 2)
        push.magnitude = CGFloat(3.0 + .random(in: 0..<1))
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(collions)
        animator.addBehavior(push)
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Feed the cat"
        content.subtitle = "It looks hungry"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
