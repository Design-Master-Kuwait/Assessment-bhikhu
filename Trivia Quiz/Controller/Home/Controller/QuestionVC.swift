//
//  QuestionVC.swift
//  Trivia Quiz
//
//  Created by Hetu on 30/10/23.
//

import UIKit
import SRCountdownTimer

/// Question VC hold all the  logic and view of question with option and caluclation of wrong and correct option
class QuestionVC: BaseViewController , StoryboardSceneBased {
    
    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.home.rawValue, bundle: nil)
    
    // MARK: - IBOutlet
    @IBOutlet weak var btnNext: BaseButton!
    @IBOutlet weak var lblAvalableGameLife: AppBaseLabel!
    @IBOutlet weak var lblCurrentQuestion: AppBaseLabel!
    @IBOutlet weak var collectionOptions: UICollectionView!
    @IBOutlet weak var viewCounter: SRCountdownTimer!
    
    var arrQuestion: [ResultModel]?
    private var questionNumber: Int = 0
    private var intScore = 0 /// for handle all score in will increase when correct andswer and seelct anser match
    private var isFinishGame = false // inittialy game start with false once all questio filled or game life close then it goes to  true
    private var intGameLife = 3 // totan number  of life in game 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Private Methods
    private func configureOnViewDidLoad() {
        setupQuestionArray()
        self.collectionOptions.register(cellType: QuestionCell.self)
        self.delay(0.2) {
            self.collectionOptions.questionLayoutUI()
        }
        viewCounter.labelFont = UIFont.quicksandBold(size: FontSize.boldarge.rawValue)
        viewCounter.labelTextColor = UIColor.white
        viewCounter.timerFinishingText = "0"
        viewCounter.lineWidth = 4
        viewCounter.delegate = self
        resetTimer()
        setGamelife()
    }
    
    private func resetTimer(){
        viewCounter.reset()
        viewCounter.start(beginingValue: 30, interval: 1)
        lblCurrentQuestion.text = "\(questionNumber + 1)/\(arrQuestion?.count ?? 0)"
    }
    
    /// for showing game life UI
    private func setGamelife(){
        lblAvalableGameLife.text = String(intGameLife)
    }
    /// setup question array we are gettign only 3 question in incorrect answer array so we need to append correct answer in random form
   private func setupQuestionArray()  {
       for i in 0..<(arrQuestion?.count ?? 0) {
           var incorrectAnswers = arrQuestion?[i].incorrectAnswers
           incorrectAnswers?.append(arrQuestion?[i].correctAnswer ?? "")
           let arrincorrectAnswers = incorrectAnswers?.shuffled()
           let indexOfA = arrincorrectAnswers?.firstIndex(of: arrQuestion?[i].correctAnswer ?? "") // 0
           arrQuestion?[i].correctAnswerIndex = indexOfA ?? 0
           arrQuestion?[i].incorrectAnswers = arrincorrectAnswers
       }
       collectionOptions.reloadData()
    }
    
    // MARK: IBActiond
    // action method on Next button click
    /// - Parameter sender: object of button
    @IBAction func btnNextTapped(_ sender: Any) {
        nextQuestionUI()
    }
    
    ///  next Questions UI setup
    func nextQuestionUI() {
        if isFinishGame{ // refirect to end game screen with score
            let controller = EndGameVC.instantiate()
            controller.intSvore = intScore
            self.pushVC(controller: controller)
        } else {
            if questionNumber < (arrQuestion?.count ?? 0)  - 1{
                questionNumber += 1
                collectionOptions.scrollToItem(at:IndexPath(item: questionNumber, section: 0), at: .right, animated: false)
                resetTimer()
            } else { /// game finish
                gameOversetup()
            }
        }
    }
    
    /// Game Life Caluculcation
    private func gameLifeCount(){
        self.intGameLife -= 1
        if self.intGameLife == 0 {
            gameOversetup() 
        }
        self.setGamelife()
    }
    private func gameOversetup(){
        btnNext.setTitle(Localizable.Title.btnFinish, for: .normal)
        self.isFinishGame = true
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension QuestionVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrQuestion?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let aQuestionCell: QuestionCell = collectionOptions.dequeueReusableCell(for: indexPath)
        if var objQuestion = arrQuestion?[indexPath.row] {
            aQuestionCell.cellConfig(with: objQuestion)
            aQuestionCell.btnAnswerTapped = { (selectdAnswer, selectedOption) in
                if !(self.arrQuestion?[indexPath.row].isAnswered ?? false){
                    objQuestion.isAnswered = true
                    objQuestion.givenAnswer = selectdAnswer
                    objQuestion.selectedOption = selectedOption
                    self.arrQuestion?[indexPath.row] = objQuestion
                    if objQuestion.correctAnswer == selectdAnswer {
                        self.intScore += 1
                    } else {
                        self.gameLifeCount()
                    }
                    self.collectionOptions.reloadItems(at: [indexPath])
                }
            }
        }
        return aQuestionCell
    }
  
}
// MARK: - SRCountdownTimerDelegate
extension QuestionVC: SRCountdownTimerDelegate{
    func timerDidEnd(sender: SRCountdownTimer, elapsedTime: TimeInterval) {
        self.nextQuestionUI()
    }
}
