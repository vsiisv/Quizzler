//
//  ViewController.swift
//  Quizzler
//
//  Created by VASILY IKONNIKOV on 09.04.2023.
//

import UIKit

class ViewController: UIViewController {

	let quiz = [
		Question(q: "A slug's blood is green.", a: "True"),
		Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
		Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
		Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
		Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
		Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
		Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
		Question(q: "Google was originally called 'Backrub'.", a: "True"),
		Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
		Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
		Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
		Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
	]
	//
	var questionNumber = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(red: 48/255, green: 58/255, blue: 92/255, alpha: 1)
		updateUI()
		addSubviews()
		setBackgroundBubblesConstraints()
		setStackViewConstraints()
		setButtonConstraints()
		setProgressBarConstraints()
	}

	@objc func anserButtonPressed(_ sender: UIButton) {
		let userAnswer = sender.currentTitle
		let actualAnswer = quiz[questionNumber].answer
		
		if userAnswer == actualAnswer {
			sender.backgroundColor = .green
		} else {
			sender.backgroundColor = .red
		}
		
		if questionNumber < quiz.count - 1 {
			questionNumber += 1
		} else {
			questionNumber = 0
		}
		
		Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
	}
	
	@objc func updateUI() {
		questionText.text = quiz[questionNumber].text
		trueButton.backgroundColor = .clear
		falseButton.backgroundColor = .clear
		progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
	}
	
	//MARK: - views
	
	lazy var trueButton = createButton(title: "True")
	lazy var falseButton = createButton(title: "False")
	
	lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.spacing = 10
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fillProportionally
		stackView.contentMode = .scaleToFill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var backgroundBubbles: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "Background-Bubbles")
		imageView.image = image
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var questionText: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	lazy var progressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.progressViewStyle = .bar
		progressBar.progressTintColor = UIColor(red: 247/255, green: 117/255, blue: 168/255, alpha: 1)
		progressBar.trackTintColor = .white
		return progressBar
	}()
	
	func createButton(title: String) -> UIButton {
		let button = UIButton()
		let image = UIImage(named: "Rectangle")
		button.setTitle(title, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
		button.setBackgroundImage(image, for: .normal)
		button.layer.cornerRadius = 20
		button.addTarget(
			self,
			action: #selector(anserButtonPressed),
			for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}
	
	// MARK: - Add view to subview
	func addSubviews() {
		view.addSubview(backgroundBubbles)
		view.addSubview(stackView)
		stackView.addArrangedSubview(questionText)
		stackView.addArrangedSubview(trueButton)
		stackView.addArrangedSubview(falseButton)
		stackView.addArrangedSubview(progressBar)
	}
	
	// MARK: - Constraints
	func setBackgroundBubblesConstraints() {
		NSLayoutConstraint.activate([
			backgroundBubbles.heightAnchor.constraint(equalToConstant: 102),
			backgroundBubbles.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundBubbles.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundBubbles.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func setStackViewConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	func setButtonConstraints() {
		NSLayoutConstraint.activate([
			trueButton.heightAnchor.constraint(equalToConstant: 80),
			falseButton.heightAnchor.constraint(equalToConstant: 80)
		])
	}
	
	func setProgressBarConstraints() {
		NSLayoutConstraint.activate([
			progressBar.heightAnchor.constraint(equalToConstant: 10)
		])
	}
	
}

