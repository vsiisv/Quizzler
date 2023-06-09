//
//  ViewController.swift
//  Quizzler
//
//  Created by VASILY IKONNIKOV on 09.04.2023.
//

import UIKit

class ViewController: UIViewController {
	
	var quizBrain = QuizBrain()

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
		guard let userAnswer = sender.currentTitle else { return }
		let userGotItRight = quizBrain.checkAnswer(userAnswer)
		
		if userGotItRight {
			sender.backgroundColor = .green
		} else {
			sender.backgroundColor = .red
		}
		
		quizBrain.nextQuestion()
		
		Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
	}
	
	@objc func updateUI() {
		let answers = quizBrain.getAnswers()
		questionText.text = quizBrain.getQuestionText()
		answerOne.setTitle(answers[0], for: .normal)
		answerTwo.setTitle(answers[1], for: .normal)
		answerThree.setTitle(answers[2], for: .normal)
		answerOne.backgroundColor = .clear
		answerTwo.backgroundColor = .clear
		answerThree.backgroundColor = .clear
		progressBar.progress = quizBrain.getProgress()
		scoreLabel.text = "Score: \(quizBrain.getScore())"
	}
	
	//MARK: - views
	
	lazy var answerOne = createButton()
	lazy var answerTwo = createButton()
	lazy var answerThree = createButton()
	
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
	
	lazy var scoreLabel: UILabel = {
		let label = UILabel()
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
	
	func createButton() -> UIButton {
		let button = UIButton()
		let image = UIImage(named: "Rectangle")
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
		stackView.addArrangedSubview(scoreLabel)
		stackView.addArrangedSubview(questionText)
		stackView.addArrangedSubview(answerOne)
		stackView.addArrangedSubview(answerTwo)
		stackView.addArrangedSubview(answerThree)
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
			answerOne.heightAnchor.constraint(equalToConstant: 80),
			answerTwo.heightAnchor.constraint(equalToConstant: 80),
			answerThree.heightAnchor.constraint(equalToConstant: 80)
		])
	}
	
	func setProgressBarConstraints() {
		NSLayoutConstraint.activate([
			progressBar.heightAnchor.constraint(equalToConstant: 10)
		])
	}
	
}

