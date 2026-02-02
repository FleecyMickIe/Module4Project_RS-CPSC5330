//
//  ViewController.swift
//  Module4Project
//
//  Created by Ryan Smith on 1/28/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var savedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        moodSlider.minimumValue = 0
        moodSlider.maximumValue = 100
        moodSlider.value = 50

        savedLabel.text = ""
        updateMoodLabel(for: Int(moodSlider.value))
    }

   
    @IBAction func moodSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value.rounded())
        sender.value = Float(value)
        updateMoodLabel(for: value)
    }



    @IBAction func saveMoodTapped(_ sender: UIButton) {
        let value = Int(moodSlider.value)
        let mood = moodFor(value)

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"   
        let dateString = formatter.string(from: datePicker.date)

        savedLabel.text = "On \(dateString), you felt \(mood.emoji)"
    }

    private func moodFor(_ value: Int) -> (description: String, emoji: String) {
        switch value {
        case 0...20:   return ("Very Sad", "😢")
        case 21...40:  return ("Sad", "🙁")
        case 41...60:  return ("Neutral", "😐")
        case 61...80:  return ("Happy", "🙂")
        case 81...100: return ("Very Happy", "😄")
        default:       return ("Neutral", "😐")
        }
    }

    private func updateMoodLabel(for value: Int) {
        let mood = moodFor(value)
        moodLabel.text = "\(mood.description) \(mood.emoji) (\(value))"
    }
}


