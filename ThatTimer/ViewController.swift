//
//  ViewController.swift
//  ThatTimer
//
//  Created by Tige Phillips on 1/29/16.
//  Copyright © 2016 Tige Phillips. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    // Global Values
    let break_options = ["Time for a glass of water?", "Maybe a nice walk around the office?", "Shouldn't you be not at your desk now?", "I think it's time for you to take a break.", "I wish I could go get a glass of water with you.", "See you in a few minutes!", "Is it nice outside?  Maybe you should go look.", "Did someone say Icecream Truck?", "Wow, I could use a break from all that typing.", "Time to go streach the legs and arms and maybe the torso.", "Have a good time away from me and I'll see you in a few mintues.", "Wow, it's brake time already.", "Squirrel!", "Go have a beer?", "Did someone say cocktails?", "Is it beer thirty yet?", "Surfs up! Go take a look.", "I promise I'll be here when you get back.", "Let's lock that screen and take a quick walk.", "Do you feel like walking up and down the stairs a few times?"]
    var timer = Timer()

    
    // Objects
    @IBOutlet weak var time_field: NSTextField!
    @IBOutlet weak var countdown_field: NSTextField!
    @IBOutlet weak var time_slider: NSSlider!

    
    // Actions
    @IBAction func time_slider(_ sender: NSSlider) {
        let x: Double = sender.doubleValue
        time_field.stringValue = String(Int(x))
    }
    @IBAction func accept_button(_ sender: NSButton) {
        reset_timer()
    }
    
    
    // Startup and Shutdown
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        self.view.layer?.backgroundColor = NSColor.lightGray.cgColor
    }
        
    
    // My functions
    func reset_timer() {
        let myTime = Int(time_slider.doubleValue)
        if myTime == 0 {
            timer.invalidate()
            return
        }
        
        
        let time_interval = myTime * 60
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: Double(time_interval), target:self, selector: #selector(ViewController.alert_window), userInfo: nil, repeats: false)
        
//        let update_interval = myTime * 60
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: Double(time_interval), target:self, selector: #selector(ViewController.alert_window), userInfo: nil, repeats: false)
        
        // print ("Starting Timer", String(time_interval))
    }
    
    func alert_window() {
        let random = Int(arc4random_uniform(UInt32(break_options.count)))
        let alert:NSAlert = NSAlert()
        alert.messageText = "Break Time!"
        alert.informativeText = break_options[random]
        // alert.addButtonWithTitle("Stop it!")
        alert.addButton(withTitle: "I'm back from my break.")
        
        // [[NSRunningApplication currentApplication] activateWithOptions:NSApplicationActivateIgnoringOtherApps]
        let app = NSRunningApplication.current()
        app.activate(options: .activateIgnoringOtherApps)
        
        let user_choice = alert.runModal()
        
        switch user_choice {
        case NSAlertFirstButtonReturn:
            reset_timer()
        default:
            reset_timer()
        }
    }

}

