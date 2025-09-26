//
//  QuizViewController.swift
//  Nano02
//
//  Created by Eduardo Bertol on 23/09/25.
//

import UIKit

class QuizViewController: UIViewController {
    
    private let quizView = QuizView()
    private let allQuestions: [Question] = Question.allQuestions
    
    var currentQuestions: [Question] = []
    var currentQuestionIndex: Int = -1 //começa fora do index
    
    var runResults: [Character: Int] = [:]
    
    override func loadView() {
        super.loadView()
        super.view = quizView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        initResults()
        sortQuestions()

        quizView.onOptionOneTapped = optionOneTapped
        quizView.onOptionTwoTapped = optionTwoTapped
        
        //Inicia o app
        nextQuestion()
        
    }
    
    private func animateInitialAppearence(){
        quizView.alpha = 0
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut) {
            self.quizView.alpha = 1
        }
    }
    
    
    
    
    func optionOneTapped(){
        for tag in currentQuestions[currentQuestionIndex].optionOneTag{
            if runResults[tag] != nil {
                runResults[tag]! += 1
            } else { continue }
        }
        
        nextQuestion()
    }
    
    func optionTwoTapped(){
        for tag in currentQuestions[currentQuestionIndex].optionTwoTag{
            if runResults[tag] != nil {
                runResults[tag]! += 1
            } else { continue }
        }
        
        nextQuestion()
    }
    
    
    private func nextQuestion(){
        currentQuestionIndex += 1

        guard currentQuestionIndex < currentQuestions.count else {
            navigateToEndView()
            return
        }
        
        let c = currentQuestions[currentQuestionIndex]
        
        quizView.setupFields(
            questionText: c.question,
            optionOneText: c.optionOne,
            optionTwoText: c.optionTwo,
            optionOneImage: c.imageOne,
            optionTwoImage: c.imageTwo
        )
        quizView.updatePageControl(currentPage: currentQuestionIndex)
        
    }
    
    private func sortQuestions(){
        var tempQuestions: Set<Question> = []
        
        while tempQuestions.count < 10 {
            tempQuestions.insert(allQuestions.randomElement()!) //cuidado com o unwrap?
        }
        
        currentQuestions = Array(tempQuestions)
    }
    
    private func initResults(){
        for c in Character.allCases {
            runResults[c] = 0
        }
    }
    
    private func calculateFinalResult() -> Character {
        var higherResults: [Character] = []
        var higherValue: Int = 0
        
        for (k, v) in runResults {
            if v > higherValue {
                higherValue = v
                higherResults = [k]
            } else if v == higherValue {
                higherResults.append(k)
            }
        }
        
        let result: Character
        if higherResults.count > 1 {
            result = higherResults.randomElement()!
        } else {
            result = higherResults[0]
        }
        
        return result
    }
    
    private func navigateToEndView() {
        
        EndViewController.result = calculateFinalResult()
        
        let destination = EndViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
}

