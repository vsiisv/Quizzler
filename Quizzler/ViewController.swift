//
//  ViewController.swift
//  Quizzler
//
//  Created by VASILY IKONNIKOV on 09.04.2023.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(red: 48/255, green: 58/255, blue: 92/255, alpha: 1)
		addSubviews()
		setBackgroundBubblesConstraints()
		setStackViewConstraints()
		setButtonConstraints()
		setProgressBarConstraints()
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
		label.text = "Question text"
		return label
	}()
	
	lazy var progressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.progress = 0.5
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

